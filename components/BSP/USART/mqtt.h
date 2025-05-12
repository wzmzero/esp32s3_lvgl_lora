#ifndef MQTT_H
#define MQTT_H
#include <stdio.h>
#include <string.h>
#include <esp_log.h>
#include <esp_event.h>
#include <mqtt_client.h>
#include <esp_system.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "usart.h"

extern int risk_led;
extern SemaphoreHandle_t risk_led_mutex;
#define PRODUCT_KEY         "a1RiH9yWw7w"                                                       /* ProductKey->�����ư䷢�Ĳ�ƷΨһ��ʶ��11λ���ȵ�Ӣ������������ */
#define DEVICE_NAME         "esp32"
#define DEVICE_SECRET       "a7239cee48b5952c3674a7c560f6a262"

#define HOST_NAME           PRODUCT_KEY".iot-as-mqtt.cn-shanghai.aliyuncs.com"                  /* ���������� */
#define HOST_PORT           1883
#define CLIENT_ID           "a1RiH9yWw7w.esp32|securemode=2,signmethod=hmacsha256,timestamp=1716868178599|"  
#define USER_NAME           DEVICE_NAME"&"PRODUCT_KEY                                          
#define PASSWORD            "9751a815eca7e9e485ffba88da030e486d5f2c62f8d2343c9607a6b82d89f9c7"                          /* ��MQTT_Password���߼���ó����������� */

#define DEVICE_PUBLISH      "/"PRODUCT_KEY"/"DEVICE_NAME"/user/update"                        
#define DEVICE_SUBSCRIBE    "/"PRODUCT_KEY"/"DEVICE_NAME"/user/get"
extern QueueHandle_t mqtt_queue; // 声明外部变量
void mqtt_app_start(void);
void mqtt_send_message(const char *message);
#endif // MQTT_H
