/*
 * @Author: Jinsc
 * @Date: 2022-11-13 13:47:15
 * @LastEditors: Jinsc
 * @LastEditTime: 2022-11-13 13:58:21
 * @FilePath: /lvgl_sdio_console/components/lvgl_porting/lv_task.c
 * @Description: 
 * Copyright (c) 2022 by jinsc123654@gmail.com All Rights Reserved. 
 */
#include <esp_timer.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "./driver/gpio.h"
#include "lvgl.h"
#include "lv_port_disp.h"
#include "lv_port_indev.h"
#include "lv_demos.h"
#include "lv_task.h"
#include "lv_examples.h"
#include "ui/ui_helpers.h"


#define FATFS_PATH "/spiflash"
/*用定时器给LVGL提供时钟*/
static void lv_tick_task(void *arg)
{
	(void)arg;
	lv_tick_inc(10);
}
void lv_example_gif_1(void)
{
    lv_obj_t * img;
    img = lv_gif_create(ui_MainScreen);
//    lv_gif_set_src(img, &img_bulb_gif);
    lv_gif_set_src(img, FATFS_PATH"/cat.gif");
    lv_obj_align(img, LV_ALIGN_CENTER, 200, 200);
}
void lv_task(void *arg)
{
    lv_init();
    lv_port_disp_init();
    lv_port_indev_init();
    lv_group_set_default(lv_group_create());

    /*  esp_register_freertos_tick_hook(lv_tick_task);
    Create and start a periodic timer interrupt to call lv_tick_inc 
    */
    const esp_timer_create_args_t periodic_timer_args = {
        .callback = &lv_tick_task,
        .name = "periodic_gui"};
    esp_timer_handle_t periodic_timer;
    ESP_ERROR_CHECK(esp_timer_create(&periodic_timer_args, &periodic_timer));
    ESP_ERROR_CHECK(esp_timer_start_periodic(periodic_timer, 10 * 1000));
    ui_init();

//    lv_example_msg_1();
//   lv_demo_widgets();
//     lv_example_gif_1();
    // lv_weather_main();
    while(1)
    {
        lv_task_handler();
        /* lv_tick_inc(10); //12/04bug修改 开定时器后就可以关闭了*/
        vTaskDelay(pdMS_TO_TICKS(10));
    }
}