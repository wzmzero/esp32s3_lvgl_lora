/*
 * @Descripttion: 文件描述
 * @version: 文件版本
 * @Author: jinsc
 * @Date: 2022-04-01 14:51:03
 * @LastEditors: Jinsc
 * @LastEditTime: 2022-11-24 23:16:41
 * @FilePath: /lvgl_city_weather/components/lvgl_porting/lv_mount_cus_font.c
 */
#include "lvgl_porting/lv_mount_cus_font.h"
 //本文件是用于挂载自定义字体的文件


lv_style_t font_style_DigifaceWide_98;



void lv_mount_cus_font(void)
{
    lv_style_init(&font_style_DigifaceWide_98);
    lv_style_set_text_font(&font_style_DigifaceWide_98, &lv_DigifaceWide_98);

}
