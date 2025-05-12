#include "mqtt.h"
SemaphoreHandle_t risk_led_mutex;
static const char *TAG = "MQTT_COMPONENT";
static esp_mqtt_client_handle_t client;
QueueHandle_t mqtt_queue; // 定义变量
int risk_led;
void parse_and_send_json(const char *json_str) {
    cJSON *json = cJSON_Parse(json_str);
    if (json == NULL) {
        ESP_LOGE(TAG, "JSON Parse Error");
        return;
    }
    cJSON *risk_json = cJSON_GetObjectItemCaseSensitive(json, "risk_flag");
    if (cJSON_IsNumber(risk_json)) {
        xSemaphoreTake(risk_led_mutex, portMAX_DELAY);
        risk_led = risk_json->valueint;
        xSemaphoreGive(risk_led_mutex);
    } else {
        ESP_LOGE(TAG, "Invalid JSON format");
    }
    cJSON_Delete(json);
}
static void mqtt_event_handler(void *handler_args, esp_event_base_t base, int32_t event_id, void *event_data) {
    esp_mqtt_event_handle_t event = event_data;
    int msg_id;
    switch ((esp_mqtt_event_id_t)event_id) {
        case MQTT_EVENT_CONNECTED:
            ESP_LOGI(TAG, "MQTT_EVENT_CONNECTED");
            msg_id = esp_mqtt_client_subscribe(client, DEVICE_SUBSCRIBE, 0);
            ESP_LOGI(TAG, "sent subscribe successful, msg_id=%d", msg_id);
            break;
        case MQTT_EVENT_DISCONNECTED:
            ESP_LOGI(TAG, "MQTT_EVENT_DISCONNECTED");
            break;
        case MQTT_EVENT_SUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_SUBSCRIBED, msg_id=%d", event->msg_id);
            break;
        case MQTT_EVENT_UNSUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_UNSUBSCRIBED, msg_id=%d", event->msg_id);
            break;
        case MQTT_EVENT_PUBLISHED:
            ESP_LOGI(TAG, "MQTT_EVENT_PUBLISHED, msg_id=%d", event->msg_id);
            break;
        case MQTT_EVENT_DATA:
            ESP_LOGI(TAG, "MQTT_EVENT_DATA");
            printf("TOPIC=%.*s\r\n", event->topic_len, event->topic);
            printf("DATA=%.*s\r\n", event->data_len, event->data);
            parse_and_send_json(event->data);
            break;
        case MQTT_EVENT_ERROR:
            ESP_LOGI(TAG, "MQTT_EVENT_ERROR");
            break;
        default:
            ESP_LOGI(TAG, "Other event id:%d", event->event_id);
            break;
    }
}

void mqtt_send_message(const char *message) {
    if (client == NULL) {
        ESP_LOGE(TAG, "MQTT client not initialized");
        return;
    }
    int msg_id = esp_mqtt_client_publish(client, DEVICE_PUBLISH, message, 0, 1, 0);
    ESP_LOGI(TAG, "sent publish successful, msg_id=%d", msg_id);
}

static void mqtt_publish_task(void *pvParameters) {
    uint8_t data[BUF_SIZE];
    while (1) {
        // 每3秒从队列中获取最新的数据并发送
        if (xQueueReceive(mqtt_queue, data, (TickType_t)portMAX_DELAY)) {
            mqtt_send_message((const char *)data);
            vTaskDelay(3000 / portTICK_PERIOD_MS);  // 延迟 2 秒
        }
    }
}

void mqtt_app_start(void) {
    const esp_mqtt_client_config_t mqtt_cfg = {
            .broker.address.hostname = HOST_NAME,                   /* MQTT地址 */
            .broker.address.port = HOST_PORT,                       /* MQTT端口号 */
            .broker.address.transport = MQTT_TRANSPORT_OVER_TCP,    /* TCP模式 */
            .credentials.client_id = CLIENT_ID,                     /* 设备名称 */
            .credentials.username = (char*)USER_NAME,               /* 产品ID */
            .credentials.authentication.password = PASSWORD,        /* 计算出来的密码 */
    };

    client = esp_mqtt_client_init(&mqtt_cfg);
    esp_mqtt_client_register_event(client, ESP_EVENT_ANY_ID, mqtt_event_handler, NULL);
    esp_mqtt_client_start(client);

    mqtt_queue = xQueueCreate(10, BUF_SIZE); // 创建队列
    xTaskCreate(mqtt_publish_task, "mqtt_publish_task", 10240, NULL, 5, NULL);
}
