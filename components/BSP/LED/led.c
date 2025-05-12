#include <rom/gpio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "esp_log.h"
#include "driver/gpio.h"
#include "driver/ledc.h"
#include "led.h"

#define LED_PIN GPIO_NUM_18  // 这里设置为GPIO18

static const char *TAG = "LED_Control";

// LED控制任务
void led_task(void *pvParameter) {
    ledc_timer_config_t ledc_timer = {
            .speed_mode = LEDC_LOW_SPEED_MODE,
            .timer_num = LEDC_TIMER_1,
            .duty_resolution = LEDC_TIMER_13_BIT,
            .freq_hz = 5000,  // 设置PWM频率
            .clk_cfg = LEDC_AUTO_CLK
    };
    ledc_timer_config(&ledc_timer);

    ledc_channel_config_t ledc_channel = {
            .speed_mode = LEDC_LOW_SPEED_MODE,
            .channel = LEDC_CHANNEL_1,
            .timer_sel = LEDC_TIMER_1,
            .intr_type = LEDC_INTR_FADE_END,
            .gpio_num = LED_PIN,
            .duty = 0,
            .hpoint = 0
    };
    ledc_channel_config(&ledc_channel);

    while (1) {
        xSemaphoreTake(risk_led_mutex, portMAX_DELAY);
        int current_risk_led = risk_led;
        xSemaphoreGive(risk_led_mutex);

        switch (current_risk_led) {
            case 0:
                // 模式0：LED关闭
                ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 0);
                ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
                vTaskDelay(pdMS_TO_TICKS(1000));
                break;
            case 1:
                // 模式1：慢速闪烁，低亮度
                for (int i = 0; i < 2; ++i) {
                    ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 2048);  // 设置占空比为25%
                    ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
                    vTaskDelay(pdMS_TO_TICKS(1000));
                    ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 0);
                    ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
                    vTaskDelay(pdMS_TO_TICKS(1000));
                }
                break;
            case 2:
                // 模式2：快速闪烁，中等亮度
                for (int i = 0; i < 4; ++i) {
                    ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 4096);  // 设置占空比为50%
                    ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
                    vTaskDelay(pdMS_TO_TICKS(500));
                    ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 0);
                    ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
                    vTaskDelay(pdMS_TO_TICKS(500));
                }
                break;
            case 3:
                // 模式3：超快速闪烁，中高亮度
                for (int i = 0; i < 5; ++i) {
                    ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 6144);  // 设置占空比为75%
                    ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
                    vTaskDelay(pdMS_TO_TICKS(250));
                    ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 0);
                    ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
                    vTaskDelay(pdMS_TO_TICKS(250));
                }
                break;
            case 4:
                // 模式4：常亮，最高亮度
                ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 8192);  // 设置占空比为100%
                ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
                vTaskDelay(pdMS_TO_TICKS(1000));
                break;
            default:
                // 未知模式，关闭LED
                ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 8192);
                ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
                vTaskDelay(pdMS_TO_TICKS(1000));
                break;
        }
    }
}

// 初始化LED引脚
void init_led(void) {
    gpio_pad_select_gpio(LED_PIN);
    gpio_set_direction(LED_PIN, GPIO_MODE_OUTPUT);
    risk_led_mutex = xSemaphoreCreateMutex();
    if (risk_led_mutex == NULL) {
        ESP_LOGE(TAG, "Failed to create mutex");
        return;
    }
    xTaskCreate(&led_task, "led_task", 10240, NULL, 5, NULL);
}
