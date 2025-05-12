#include "usart.h"

static QueueHandle_t uart_queue;
static const char *TAG = "UART_COMPONENT";


static void parse_and_send_json(const char *json_str) {
    cJSON *json = cJSON_Parse(json_str);
    if (json == NULL) {
        ESP_LOGE(TAG, "JSON Parse Error");
        return;
    }
    cJSON *pt100 = cJSON_GetObjectItemCaseSensitive(json, "pt100");
    cJSON *temper = cJSON_GetObjectItemCaseSensitive(json, "temper");
    cJSON *hum = cJSON_GetObjectItemCaseSensitive(json, "hum");
    cJSON *co = cJSON_GetObjectItemCaseSensitive(json, "co");
    cJSON *swi = cJSON_GetObjectItemCaseSensitive(json, "swi");

    if (cJSON_IsString(pt100) && cJSON_IsString(temper) && cJSON_IsString(hum) && cJSON_IsString(co) && cJSON_IsBool(swi)) {
        int temp_value = atoi(temper->valuestring);
        int humi_value = atoi(hum->valuestring);
        int pt100_value = atoi(pt100->valuestring);
        int co_value = atoi(co->valuestring);
        lv_chart_set_next_value(ui_Chart1, series1, temp_value);
        lv_chart_set_next_value(ui_Chart1, series2, humi_value);
        lv_chart_set_next_value(ui_Chart1, series3, pt100_value);
        lv_chart_set_next_value(ui_Chart1, series4, co_value);
        lv_msg_send(LORA_DATA_TEMP, &temp_value);
        lv_msg_send(LORA_DATA_HUMI, &humi_value);
        lv_msg_send(LORA_DATA_PT100, &pt100_value);
        lv_msg_send(LORA_DATA_CO, &co_value);
    } else {
        ESP_LOGE(TAG, "Invalid JSON format");
    }

    cJSON_Delete(json);
}

static void uart_event_task(void *pvParameters) {
    uart_event_t event;
    uint8_t data[BUF_SIZE];
    uint8_t *dtmp = (uint8_t *) malloc(RD_BUF_SIZE);
    for (;;) {
        if (xQueueReceive(uart_queue, (void *)&event, (TickType_t)portMAX_DELAY)) {
            bzero(dtmp, RD_BUF_SIZE);
            switch (event.type) {
                case UART_DATA:
                    uart_read_bytes(EX_UART_NUM, dtmp, event.size, portMAX_DELAY);
                    dtmp[event.size] = '\0';
                    ESP_LOGI(TAG, "Received: %s", dtmp);
                    parse_and_send_json((const char *)dtmp);
                    // 将接收的数据发送到队列中
                    if (xQueueSend(mqtt_queue, dtmp, 0) != pdTRUE) {
                        xQueueReceive(mqtt_queue, data, 0);
                    }
                    break;
                case UART_FIFO_OVF:
                    ESP_LOGI(TAG, "hw fifo overflow");
                    uart_flush_input(EX_UART_NUM);
                    xQueueReset(uart_queue);
                    break;
                case UART_BUFFER_FULL:
                    ESP_LOGI(TAG, "ring buffer full");
                    uart_flush_input(EX_UART_NUM);
                    xQueueReset(uart_queue);
                    break;
                case UART_PARITY_ERR:
                    ESP_LOGI(TAG, "uart parity error");
                    break;
                case UART_FRAME_ERR:
                    ESP_LOGI(TAG, "uart frame error");
                    break;
                default:
                    ESP_LOGI(TAG, "uart event type: %d", event.type);
                    break;
            }
        }
    }
    free(dtmp);
    vTaskDelete(NULL);
}

void uart_init(void) {
    const uart_config_t uart_config = {
            .baud_rate = 9600,
            .data_bits = UART_DATA_8_BITS,
            .parity = UART_PARITY_DISABLE,
            .stop_bits = UART_STOP_BITS_1,
            .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
    };

    uart_param_config(EX_UART_NUM, &uart_config);
    uart_set_pin(EX_UART_NUM, USART_TX_GPIO_PIN, USART_RX_GPIO_PIN, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);
    uart_driver_install(EX_UART_NUM, BUF_SIZE * 2, BUF_SIZE * 2, 20, &uart_queue, 0);
    xTaskCreate(uart_event_task, "uart_event_task", 10240, NULL, 12, NULL);
}
