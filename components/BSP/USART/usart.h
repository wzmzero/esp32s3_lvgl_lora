 #ifndef USART_H
#define USART_H
#include <stdio.h>
#include <string.h>
#include <esp_log.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <freertos/queue.h>
#include <driver/uart.h>
#include "driver/uart_select.h"
#include "driver/gpio.h"
#include "mqtt.h"
#include "cJSON.h"
#include "lvgl.h"
#include "ui/ui_helpers.h"

#define EX_UART_NUM UART_NUM_1
#define BUF_SIZE 1024
#define USART_TX_GPIO_PIN   GPIO_NUM_9
#define USART_RX_GPIO_PIN   GPIO_NUM_10
#define RD_BUF_SIZE (BUF_SIZE)


void uart_init(void);

#endif // USART_H
