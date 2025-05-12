/*
 * @Descripttion: 文件描述
 * @version: 文件版本
 * @Author: jinsc
 * @Date: 2022-09-04 19:24:25
 * @LastEditors: jinsc
 * @LastEditTime: 2022-09-05 21:15:53
 * @FilePath: \lvgl\main\lvgl_main.c
 */
/* Hello World Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include <string.h>
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_log.h"
#include "lv_task.h"
#include "nvs_flash.h"
#include "esp_vfs.h"
#include "esp_vfs_fat.h"
#include "esp_system.h"
#include "ui_helpers.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "nvs_flash.h"
#include "esp_sntp.h"
#include "esp_http_client.h"
#include "cJSON.h"
#include "char_conversion.h"
#include "usart.h"
#include "led.h"

static const char *TAG = "main";
const char *base_path = "/spiflash";
static wl_handle_t s_wl_handle = WL_INVALID_HANDLE;

void initialize_filesystem(void){
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK( ret );

    const esp_vfs_fat_mount_config_t mount_config = {
            .max_files = 4,
            .format_if_mount_failed = false,
            .allocation_unit_size = CONFIG_WL_SECTOR_SIZE
    };
    esp_err_t err;
    err = esp_vfs_fat_spiflash_mount_rw_wl(base_path, "storage", &mount_config, &s_wl_handle);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "Failed to mount FATFS (%s)", esp_err_to_name(err));
        return;
    }
    ESP_LOGI(TAG, "Mounting FAT filesystem");
}

void initialize_sntp(void) {
    ESP_LOGI(TAG, "Initializing SNTP");
    sntp_setoperatingmode(SNTP_OPMODE_POLL);
    sntp_setservername(0, "pool.ntp.org");
    sntp_init();
}

void obtain_time(void *pvParameter) {
    // Initialize SNTP
    initialize_sntp();

    // Set timezone to Beijing Time (UTC+8)
    setenv("TZ", "CST-8", 1);
    tzset();

    char* week[7] = {"周日", "周一", "周二", "周三", "周四", "周五", "周六"};
    time_t now = 0;
    struct tm timeinfo = { 0 };
    int retry = 0;
    const int retry_count = 10; // Number of retries before giving up
    while (timeinfo.tm_year < (2024 - 1900) && ++retry < retry_count) {
        ESP_LOGI(TAG, "Waiting for system time to be set... (%d/%d)", retry, retry_count);
        vTaskDelay(2000 / portTICK_PERIOD_MS);
        time(&now);
        localtime_r(&now, &timeinfo);
    }
    static time_t start_time = 0; // Initial duration is 0
    start_time = now;
    while (1) {
        time_t now = 0;
        struct tm timeinfo = { 0 };
        time(&now);
        localtime_r(&now, &timeinfo);
        static time_t start_time = 0;//初始时长为0
        if (start_time == 0) {start_time = now;}
        char time_str[9]; // 存放格式化后的时间字符串，HH:MM:SS
        char date_str[30]; // 存放格式化后的日期字符串，YYYY-MM-DD
        char week_str[5];
        int total_minute = (now - start_time) / 60; // 计算累计时长（分钟）

        // 检查是否已获得有效时间
        if (timeinfo.tm_year < (2024 - 1900)) {
//            ESP_LOGI(TAG, "Waiting for system time to be set...");
        } else {
//            ESP_LOGI(TAG, "The current date/time in Beijing is: %s", asctime(&timeinfo));
            snprintf(time_str, sizeof(time_str), "%02d:%02d:%02d", timeinfo.tm_hour, timeinfo.tm_min, timeinfo.tm_sec);
            // 将日期格式化为字符串，精确到日
            snprintf(date_str, sizeof(date_str), "%04d/%02d/%02d", timeinfo.tm_year + 1900, timeinfo.tm_mon + 1, timeinfo.tm_mday);
            lv_msg_send(WEATHER_MAIN_TIME, time_str);
            lv_msg_send(WEATHER_MAIN_DATA, date_str);
            lv_msg_send(WEATHER_MAIN_WEEK, week[timeinfo.tm_wday]);
        }
        vTaskDelay(1000 / portTICK_PERIOD_MS);  // 延迟 1 秒
    }
}


esp_err_t _http_event_handler(esp_http_client_event_t *evt)
{
    switch(evt->event_id) {
        case HTTP_EVENT_ERROR:
            ESP_LOGD(TAG, "HTTP_EVENT_ERROR");
            break;
        case HTTP_EVENT_ON_CONNECTED:
            ESP_LOGD(TAG, "HTTP_EVENT_ON_CONNECTED");
            break;
        case HTTP_EVENT_HEADER_SENT:
            ESP_LOGD(TAG, "HTTP_EVENT_HEADER_SENT");
            break;
        case HTTP_EVENT_ON_HEADER:
            ESP_LOGD(TAG, "HTTP_EVENT_ON_HEADER, key=%s, value=%s", evt->header_key, evt->header_value);
            break;
        case HTTP_EVENT_ON_DATA:
            ESP_LOGD(TAG, "HTTP_EVENT_ON_DATA, len=%d", evt->data_len);
            break;
        case HTTP_EVENT_ON_FINISH:
            ESP_LOGD(TAG, "HTTP_EVENT_ON_FINISH");
            break;
        case HTTP_EVENT_DISCONNECTED:
            ESP_LOGI(TAG, "HTTP_EVENT_DISCONNECTED");
            break;
        case HTTP_EVENT_REDIRECT:
            break;
    }
    return ESP_OK;
}
char* city_task(void)
{
    int8_t return_res = 1;
    char* city_buffer = NULL;
    int content_length = 0;

    esp_http_client_config_t config =
            {
                    .event_handler = _http_event_handler,
                    .url = "http://whois.pconline.com.cn/ipJson.jsp?ip=xxx.xxx.xxx.xxx&json=true",
            };
    esp_http_client_handle_t client = esp_http_client_init(&config);

    if( client == NULL )
    {
        return NULL;
    }

    // GET Request
    esp_http_client_set_method(client, HTTP_METHOD_GET);
    esp_err_t err = esp_http_client_open(client, 0);
    if (return_res && err != ESP_OK)
    {
        ESP_LOGE(TAG, "Failed to open HTTP connection: %s", esp_err_to_name(err));
        return_res = 0;
    }
    else
    {
        content_length = esp_http_client_fetch_headers(client);
        if (content_length < 0)
        {
            ESP_LOGE(TAG, "HTTP client fetch headers failed");
            return_res = 0;
        } else
        {
            city_buffer = malloc(300);
            memset(city_buffer, 0, 300);
            if(city_buffer == NULL)
            {
                return_res = 0;
            }
            else
            {
                int data_read = esp_http_client_read_response(client, city_buffer, 300);
                if (data_read >= 0)
                {
                    ESP_LOGI(TAG, "HTTP GET Status = %d, content_length = %lld, data_read = %d",
                             esp_http_client_get_status_code(client),
                             esp_http_client_get_content_length(client),
                             data_read);
                    //ESP_LOG_BUFFER_HEX(TAG, city_buffer, data_read);
                    ESP_LOGI( TAG, "Data %s \r\n",  city_buffer);
                }
                else
                {
                    return_res = 0;
                    ESP_LOGE(TAG, "Failed to read response");
                }
            }
        }
    }
    esp_http_client_close(client);

    if( return_res == 0 )
    {
        free(city_buffer);
        city_buffer = NULL;
    }

    return city_buffer;
}
static char* parse_city_json(char *analysis_buf)
{
    char* city_str = NULL;
    if( analysis_buf == NULL )
    {
        return false;
    }

    cJSON * json_root = cJSON_Parse(analysis_buf);
    if( json_root != NULL )
    {
        ESP_LOGI(TAG, "城市[%d] -> %s\r\n", strlen(cJSON_GetObjectItem(json_root,"city")->valuestring)+1, cJSON_GetObjectItem(json_root,"city")->valuestring );
        city_str = malloc(strlen(cJSON_GetObjectItem(json_root,"city")->valuestring)+1);
        strcpy( city_str,
                cJSON_GetObjectItem(json_root,"city")->valuestring);
        cJSON_Delete(json_root);
        char* utf8_str = malloc(strlen(city_str)*2+1);
        gb2312ToUtf8(utf8_str, strlen(city_str)*2+1, city_str, strlen(city_str));
        free(city_str);
        city_str = utf8_str;
        ESP_LOGI(TAG, "城市[%s]", city_str);
    }
    free(analysis_buf);

    return city_str;
}
char* xinzhi_task(char * city_str)
{
    int8_t return_res = 1;
    char* weather_buffer = NULL;
    int content_length = 0;

    char city_temp[] = {"http://api.seniverse.com/v3/weather/now.json?key=SWaCmu3LmzT_kS21g&location=                                          &language=zh-Hans&unit=c"};
    char *url_str = utf8_url_encode((const char *)city_str);
    free(city_str);
    sprintf( city_temp, "http://api.seniverse.com/v3/weather/now.json?key=SWaCmu3LmzT_kS21g&location=%s&language=zh-Hans&unit=c", url_str);
    free(url_str);
    ESP_LOGI(TAG, "待打开的url  \r\n%s\r\n",  city_temp);
    esp_http_client_config_t config =
            {
                    .event_handler = _http_event_handler,
                    .url = city_temp,
            };
    esp_http_client_handle_t client = esp_http_client_init(&config);

    if( client == NULL )
    {
        return NULL;
    }

    // GET Request
    esp_http_client_set_method(client, HTTP_METHOD_GET);
    esp_err_t err = esp_http_client_open(client, 0);
    if (return_res && err != ESP_OK)
    {
        ESP_LOGE(TAG, "Failed to open HTTP connection: %s", esp_err_to_name(err));
        return_res = 0;
    }
    else
    {
        content_length = esp_http_client_fetch_headers(client);
        if (content_length < 0)
        {
            ESP_LOGE(TAG, "HTTP client fetch headers failed");
            return_res = 0;
        } else
        {
            weather_buffer = malloc(content_length);
            memset(weather_buffer, 0, content_length);
            if( weather_buffer == NULL )
            {
                return_res = 0;
            }
            else
            {
                int data_read = esp_http_client_read_response(client, weather_buffer, content_length);
                if (data_read >= 0)
                {
                    ESP_LOGI(TAG, "HTTP GET Status = %d, content_length = %lld, data_read = %d",
                             esp_http_client_get_status_code(client),
                             esp_http_client_get_content_length(client),
                             data_read);
                    //ESP_LOG_BUFFER_HEX(TAG, weather_buffer, data_read);
                    ESP_LOGI( TAG, "Data %s \r\n",  weather_buffer);
                }
                else
                {
                    ESP_LOGE(TAG, "Failed to read response");
                    return_res = 0;
                }
            }
        }
    }
    esp_http_client_close(client);

    if(!return_res)
    {
        free(weather_buffer);
        weather_buffer = NULL;
    }
    return weather_buffer;
}

static bool parse_weather_json(char *analysis_buf)
{
    if( analysis_buf == NULL )
    {
        return false;
    }
    char temper[10] ={};
    cJSON * json_root = cJSON_Parse(analysis_buf);
    if( json_root != NULL )
    {
        cJSON *cjson_arr = cJSON_GetObjectItem(json_root,"results");
        cJSON *cjson_location = cJSON_GetObjectItem(cJSON_GetArrayItem(cjson_arr, 0),"location");
        ESP_LOGI(TAG, "城市 -> %s\r\n", cJSON_GetObjectItem(cjson_location,"name")->valuestring );
        lv_msg_send(WEATHER_MAIN_CITY, cJSON_GetObjectItem(cjson_location,"name")->valuestring);
        cJSON *cjson_now = cJSON_GetObjectItem(cJSON_GetArrayItem(cjson_arr, 0),"now");
        lv_msg_send(WEATHER_MAIN_AIR, cJSON_GetObjectItem(cjson_now,"text")->valuestring);
        ESP_LOGI(TAG, "天气 -> %s\r\n", cJSON_GetObjectItem(cjson_now,"text")->valuestring );
        ESP_LOGI(TAG, "气温 -> %s\r\n", cJSON_GetObjectItem(cjson_now,"temperature")->valuestring );
        sprintf(temper,"%s度",cJSON_GetObjectItem(cjson_now,"temperature")->valuestring);
        lv_msg_send(WEATHER_MAIN_TEMP, temper);
        cJSON_Delete(json_root);
    }

    free(analysis_buf);

    return true;
}


/* Set the SSID and Password via project configuration, or can set directly here */
#define DEFAULT_SSID "MERCURY_1D6622"
#define DEFAULT_PWD "A103A103"

#if CONFIG_EXAMPLE_WIFI_ALL_CHANNEL_SCAN
#define DEFAULT_SCAN_METHOD WIFI_ALL_CHANNEL_SCAN
#elif CONFIG_EXAMPLE_WIFI_FAST_SCAN
#define DEFAULT_SCAN_METHOD WIFI_FAST_SCAN
#else
#define DEFAULT_SCAN_METHOD WIFI_FAST_SCAN
#endif /*CONFIG_EXAMPLE_SCAN_METHOD*/

#if CONFIG_EXAMPLE_WIFI_CONNECT_AP_BY_SIGNAL
#define DEFAULT_SORT_METHOD WIFI_CONNECT_AP_BY_SIGNAL
#elif CONFIG_EXAMPLE_WIFI_CONNECT_AP_BY_SECURITY
#define DEFAULT_SORT_METHOD WIFI_CONNECT_AP_BY_SECURITY
#else
#define DEFAULT_SORT_METHOD WIFI_CONNECT_AP_BY_SIGNAL
#endif /*CONFIG_EXAMPLE_SORT_METHOD*/

#if CONFIG_EXAMPLE_FAST_SCAN_THRESHOLD
#define DEFAULT_RSSI CONFIG_EXAMPLE_FAST_SCAN_MINIMUM_SIGNAL
#if CONFIG_EXAMPLE_FAST_SCAN_WEAKEST_AUTHMODE_OPEN
#define DEFAULT_AUTHMODE WIFI_AUTH_OPEN
#elif CONFIG_EXAMPLE_FAST_SCAN_WEAKEST_AUTHMODE_WEP
#define DEFAULT_AUTHMODE WIFI_AUTH_WEP
#elif CONFIG_EXAMPLE_FAST_SCAN_WEAKEST_AUTHMODE_WPA
#define DEFAULT_AUTHMODE WIFI_AUTH_WPA_PSK
#elif CONFIG_EXAMPLE_FAST_SCAN_WEAKEST_AUTHMODE_WPA2
#define DEFAULT_AUTHMODE WIFI_AUTH_WPA2_PSK
#else
#define DEFAULT_AUTHMODE WIFI_AUTH_OPEN
#endif
#else
#define DEFAULT_RSSI -127
#define DEFAULT_AUTHMODE WIFI_AUTH_OPEN
#endif /*CONFIG_EXAMPLE_FAST_SCAN_THRESHOLD*/
#define WIFI_CONNECTED_BIT BIT0
#define WIFI_FAIL_BIT      BIT1
static int s_retry_num = 0;
static EventGroupHandle_t s_wifi_event_group;
static bool obtain_time_task_created = false;  // 任务创建标志
static void event_handler(void* arg, esp_event_base_t event_base,
                          int32_t event_id, void* event_data)
{
    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START ) {scanWiFiNetworks();esp_wifi_connect();}
//    else if(event_base == WIFI_EVENT && event_id == WIFI_EVENT_SCAN_DONE ) {}
    else if(event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t* event = (ip_event_got_ip_t*) event_data;
        ESP_LOGI(TAG, "got ip:" IPSTR, IP2STR(&event->ip_info.ip));
        if (!obtain_time_task_created) {
            mqtt_app_start();
            uart_init();
            if (xTaskCreate(obtain_time, "obtain_time_task", 10240, NULL, 5, NULL) == pdPASS) {
                obtain_time_task_created = true;
            } else {
                ESP_LOGE(TAG, "Failed to create obtain_time_task");
            }
        }
//        parse_weather_json(xinzhi_task(parse_city_json(city_task())));

    }
}

/* Initialize Wi-Fi as sta and set scan method */
static void fast_scan(void)
{
    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    ESP_ERROR_CHECK(esp_event_handler_instance_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &event_handler, NULL, NULL));
    ESP_ERROR_CHECK(esp_event_handler_instance_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &event_handler, NULL, NULL));
    // Initialize default station as network interface instance (esp-netif)
    esp_netif_t *sta_netif = esp_netif_create_default_wifi_sta();
    assert(sta_netif);
    // Initialize and start WiFi
    wifi_config_t wifi_config = {
            .sta = {
                    .ssid = DEFAULT_SSID,
                    .password = DEFAULT_PWD,
                    .scan_method = DEFAULT_SCAN_METHOD,
                    .sort_method = DEFAULT_SORT_METHOD,
                    .threshold.rssi = DEFAULT_RSSI,
                    .threshold.authmode = DEFAULT_AUTHMODE,
            },
    };
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());
}

void app_main(void)
{
    initialize_filesystem();   
    fast_scan();   
    init_led();
    xTaskCreate(lv_task, "lv_task",1024*8,NULL,5,NULL);

}
