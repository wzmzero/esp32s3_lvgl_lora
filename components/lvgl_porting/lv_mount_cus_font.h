/*
 * @Descripttion: 文件描述
 * @version: 文件版本
 * @Author: jinsc
 * @Date: 2022-04-01 14:51:03
 * @LastEditors: Jinsc
 * @LastEditTime: 2022-11-24 23:11:56
 * @FilePath: /lvgl_city_weather/components/lvgl_porting/lv_mount_cus_font.h
 */
#ifndef LV_MOUNT_CUS_FONT_DEF_H
#define LV_MOUNT_CUS_FONT_DEF_H
 /* clang-format off */

#ifdef __cplusplus
extern "C" {
#endif

#ifdef LV_LVGL_H_INCLUDE_SIMPLE
#include "lvgl.h"
#else
#include "lvgl/lvgl.h"
#endif
#include "esp_vfs_fat.h"

#ifndef malloc_ram //在内部申请ram
#ifdef CONFIG_ESP32S3_SPIRAM_SUPPORT //只有支持了spram才能使用
#define malloc_ram(x) heap_caps_malloc((x), MALLOC_CAP_INTERNAL)
#else
#define malloc_ram(x) malloc((x))
#endif
#endif

#ifndef malloc_pram //在外部申请ram
#ifdef CONFIG_ESP32S3_SPIRAM_SUPPORT //只有支持了psram才能使用
#define malloc_pram(x) heap_caps_malloc((x), MALLOC_CAP_SPIRAM)
#else
#define malloc_pram(x) malloc((x))
#endif
#endif

#ifndef ft_open   //自定义 FATFS打开文件使用， ftopen(fd, path, FA_READ)
#define ft_open(fd, path, mode) (fd = malloc_pram(sizeof(FIL)), (f_open(fd, (path), mode)==0)?(0):(free(fd),-1) )//自带申请一个内存 并且打开失败时自动释放内存
#endif
#ifndef ft_close  //自定义 FATFS关闭文件使用，ftclose(fd)
#define ft_close(fd) (f_close(fd), free(fd) )//自带释放一个内存
#endif
#define LVGL_PATH "/spiflash"

//本文件是用于挂载自定义字体的文件
void lv_mount_cus_font(void);


extern lv_style_t font_style_DigifaceWide_98;
extern lv_style_t font_style_test_font;
LV_FONT_DECLARE(lv_DigifaceWide_98)	//挂载字体
LV_FONT_DECLARE(lv_DigifaceWide_82)	//挂载字体
LV_FONT_DECLARE(lv_siyuanheiti_23)	//挂载字体
LV_FONT_DECLARE(myFont)

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /*LV_MOUNT_CUS_FONT_DEF_H*/
