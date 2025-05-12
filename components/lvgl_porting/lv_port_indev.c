/**
 * @file lv_port_indev_templ.c
 *
 */

/*Copy this file as "lv_port_indev.c" and set this value to "1" to enable content*/
#if 1

/*********************
 *      INCLUDES
 *********************/
#include <esp_log.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "lv_port_indev.h"
#include "./driver/gpio.h"
#include "./driver/adc.h"
#include "lvgl_helpers.h"
/*********************
 *      DEFINES
 *********************/
#define TAG "lv_indev"
/**********************
 *      TYPEDEFS
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/

static void touchpad_init(void);
static void touchpad_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data);
static bool touchpad_is_pressed(void);
static void touchpad_get_xy(lv_coord_t * x, lv_coord_t * y);

static void mouse_init(void);
static void mouse_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data);
static bool mouse_is_pressed(void);
static void mouse_get_xy(lv_coord_t * x, lv_coord_t * y);

static void keypad_init(void);
static void keypad_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data);
static uint32_t keypad_get_key(void);

static void encoder_init(void);
static void encoder_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data);
static void encoder_handler(void);

static void button_init(void);
static void button_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data);
static int8_t button_get_pressed_id(void);
static bool button_is_pressed(uint8_t id);

/**********************
 *  STATIC VARIABLES
 **********************/
lv_indev_t * indev_touchpad;
lv_indev_t * indev_mouse;
lv_indev_t * indev_keypad;
lv_indev_t * indev_encoder;
lv_indev_t * indev_button;

static int32_t encoder_diff = 0;
static lv_indev_state_t encoder_state = LV_INDEV_STATE_RELEASED;


/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void lv_port_indev_init(void)
{
    /**
     * Here you will find example implementation of input devices supported by LittelvGL:
     *  - Touchpad
     *  - Mouse (with cursor support)
     *  - Keypad (supports GUI usage only with key)
     *  - Encoder (supports GUI usage only with: left, right, push)
     *  - Button (external buttons to press points on the screen)
     *
     *  The `..._read()` function are only examples.
     *  You should shape them according to your hardware
     */


#if 1
    /*------------------
     * Touchpad
     * -----------------*/
    static lv_indev_drv_t indev_drv;
    /*Initialize your touchpad if you have*/
    touchpad_init();

    /*Register a touchpad input device*/
    lv_indev_drv_init(&indev_drv);
    indev_drv.type = LV_INDEV_TYPE_POINTER;
    indev_drv.read_cb = touchpad_read;
    indev_touchpad = lv_indev_drv_register(&indev_drv);

    lv_indev_set_group(indev_touchpad, lv_group_get_default());
#endif
#if 0
    /*------------------
     * Mouse
     * -----------------*/

    /*Initialize your mouse if you have*/
    mouse_init();

    /*Register a mouse input device*/
    lv_indev_drv_init(&indev_drv);
    indev_drv.type = LV_INDEV_TYPE_POINTER;
    indev_drv.read_cb = mouse_read;
    indev_mouse = lv_indev_drv_register(&indev_drv);

    /*Set cursor. For simplicity set a HOME symbol now.*/
    lv_obj_t * mouse_cursor = lv_img_create(lv_scr_act());
    lv_img_set_src(mouse_cursor, LV_SYMBOL_HOME);
    lv_indev_set_cursor(indev_mouse, mouse_cursor);
#endif
#if 0
    /*------------------
     * Keypad
     * -----------------*/

    /*Initialize your keypad or keyboard if you have*/
    keypad_init();

    /*Register a keypad input device*/
    lv_indev_drv_init(&indev_drv);
    indev_drv.type = LV_INDEV_TYPE_KEYPAD;
    indev_drv.read_cb = keypad_read;
    indev_keypad = lv_indev_drv_register(&indev_drv);

    /*Later you should create group(s) with `lv_group_t * group = lv_group_create()`,
     *add objects to the group with `lv_group_add_obj(group, obj)`
     *and assign this input device to group to navigate in it:
     *`lv_indev_set_group(indev_keypad, group);`*/
    lv_indev_set_group(indev_keypad, lv_group_get_default());
#endif
#if 0
    /*------------------
     * Encoder
     * -----------------*/
    static lv_indev_drv_t encoder_indev_drv;
    /*Initialize your encoder if you have*/
    encoder_init();

    /*Register a encoder input device*/
    lv_indev_drv_init(&encoder_indev_drv);
    encoder_indev_drv.type = LV_INDEV_TYPE_ENCODER;
    encoder_indev_drv.read_cb = encoder_read;
    indev_encoder = lv_indev_drv_register(&encoder_indev_drv);

    /*Later you should create group(s) with `lv_group_t * group = lv_group_create()`,
     *add objects to the group with `lv_group_add_obj(group, obj)`
     *and assign this input device to group to navigate in it:
     *`lv_indev_set_group(indev_encoder, group);`*/
    lv_indev_set_group(indev_encoder, lv_group_get_default());
#endif
#if 0
    /*------------------
     * Button
     * -----------------*/

    /*Initialize your button if you have*/
    button_init();

    /*Register a button input device*/
    lv_indev_drv_init(&indev_drv);
    indev_drv.type = LV_INDEV_TYPE_BUTTON;
    indev_drv.read_cb = button_read;
    indev_button = lv_indev_drv_register(&indev_drv);

    /*Assign buttons to points on the screen*/
    static const lv_point_t btn_points[2] = {
        {10, 10},   /*Button 0 -> x:10; y:10*/
        {40, 100},  /*Button 1 -> x:40; y:100*/
    };
    lv_indev_set_button_points(indev_button, btn_points);
#endif
}

/**********************
 *   STATIC FUNCTIONS
 **********************/

/*------------------
 * Touchpad
 * -----------------*/

/*Initialize your touchpad*/
static void touchpad_init(void)
{
    /*Your code comes here*/
    touch_driver_init();
}

/*Will be called by the library to read the touchpad*/
static void touchpad_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data)
{
    static lv_coord_t last_x = 0;
    static lv_coord_t last_y = 0;

    /*Save the pressed coordinates and the state*/
    if(touchpad_is_pressed()) {
        touch_driver_read(indev_drv,data);
    }
    else {
        data->state = LV_INDEV_STATE_REL;
    }
    /*Set the last pressed coordinates*/
}

/*Return true is the touchpad is pressed*/
static bool touchpad_is_pressed(void)
{
    /*Your code comes here*/
    if(gpio_get_level(INT) == 0)
    {
//        ESP_LOGI(TAG,"touch pressed");
        return true;
    }
    return false;
}

/*Get the x and y coordinates if the touchpad is pressed*/
static void touchpad_get_xy(lv_coord_t * x, lv_coord_t * y)
{
    /*Your code comes here*/
    (*x) = 0;
    (*y) = 0;

}

/*------------------
 * Mouse
 * -----------------*/

/*Initialize your mouse*/
static void mouse_init(void)
{
    /*Your code comes here*/
}

/*Will be called by the library to read the mouse*/
static void mouse_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data)
{
    /*Get the current x and y coordinates*/
    mouse_get_xy(&data->point.x, &data->point.y);

    /*Get whether the mouse button is pressed or released*/
    if(mouse_is_pressed()) {
        data->state = LV_INDEV_STATE_PR;
    }
    else {
        data->state = LV_INDEV_STATE_REL;
    }
}

/*Return true is the mouse button is pressed*/
static bool mouse_is_pressed(void)
{
    /*Your code comes here*/

    return false;
}

/*Get the x and y coordinates if the mouse is pressed*/
static void mouse_get_xy(lv_coord_t * x, lv_coord_t * y)
{
    /*Your code comes here*/

    (*x) = 0;
    (*y) = 0;
}

/*------------------
 * Keypad
 * -----------------*/

/*Initialize your keypad*/
static void keypad_init(void)
{
    gpio_config_t pGPIOConfig =
            {
                    .intr_type      = GPIO_INTR_DISABLE,
                    .mode           = GPIO_MODE_INPUT,
                    .pin_bit_mask   = 1ull << GPIO_NUM_32,
                    .pull_down_en   = GPIO_PULLDOWN_DISABLE,
                    .pull_up_en     = GPIO_PULLUP_ENABLE
            };
    gpio_config(&pGPIOConfig);
//    pGPIOConfig.pin_bit_mask = 1ull << GPIO_NUM_32;
//    gpio_config(&pGPIOConfig);
//    pGPIOConfig.pin_bit_mask = 1ull << GPIO_NUM_33;
//    gpio_config(&pGPIOConfig);
    adc1_config_width(ADC_WIDTH_BIT_12);
    adc1_config_channel_atten(ADC1_CHANNEL_0,ADC_ATTEN_DB_11);
    adc1_config_channel_atten(ADC1_CHANNEL_3,ADC_ATTEN_DB_11);
    /*Your code comes here*/
}

/*Will be called by the library to read the mouse*/
static void keypad_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data)
{
    static uint32_t last_key = 0;


    /*Get whether the a key is pressed and save the pressed key*/
    uint32_t act_key = keypad_get_key();
    if(act_key != 0) {
        data->state = LV_INDEV_STATE_PR;

        /*Translate the keys to LVGL control characters according to your key definitions*/
        switch(act_key) {
            case 1:
                act_key = LV_KEY_NEXT;
                break;
            case 2:
                act_key = LV_KEY_PREV;
                break;
            case 3:
                act_key = LV_KEY_LEFT;
                break;
            case 4:
                act_key = LV_KEY_RIGHT;
                break;
            case 5:
                act_key = LV_KEY_ENTER;
                break;
        }

        last_key = act_key;
    }
    else {
        data->state = LV_INDEV_STATE_REL;
    }

    data->key = last_key;
}
#include "./driver/gpio.h"
/*Get the currently being pressed key.  0 if no key is pressed*/
static uint32_t keypad_get_key(void)
{
    /*Your code comes here*/
    if( gpio_get_level(32) == 0 )
    {
        ESP_LOGI("1","KEY 32");
        return 5;
    }
//    if( gpio_get_level(32) == 0 )
//    {
//        ESP_LOGI("2","KEY 32");
//        return 4;
//    }
//    if( gpio_get_level(33) == 0 )
//    {
//        ESP_LOGI("3","KEY 33");
//        return 5;
//    }
    int adc1_X=adc1_get_raw(ADC1_CHANNEL_0);
    int adc1_Y=adc1_get_raw(ADC1_CHANNEL_3);
//    printf("adcx %d,adcy %d\n",adc1_X,adc1_Y);
    if (adc1_X>3000){ESP_LOGI("adcx","1"); return 1;}
    if (adc1_X<1000){ESP_LOGI("adcx","2"); return 2;}
    if (adc1_Y>3000){ESP_LOGI("adcy","3"); return 3;}
    if (adc1_Y<1000){ESP_LOGI("adcy","4"); return 4;}
    return 0;
}

/*------------------
 * Encoder
 * -----------------*/

#include "driver/gpio.h"
#include "driver/pcnt.h"
#define ENCODER_A_GPIO 38
#define ENCODER_B_GPIO 39
#define ENCODER_PUSH_PIN    40
void init_pcnt(void) {
    pcnt_config_t pcnt_config = {
            .pulse_gpio_num = ENCODER_A_GPIO,   // A相接脉冲输入
            .ctrl_gpio_num = ENCODER_B_GPIO,    // B相接控制信号输入
            .channel = PCNT_CHANNEL_0,
            .unit = PCNT_UNIT_0,
            .pos_mode = PCNT_COUNT_INC,        // 上升沿计数
            .neg_mode = PCNT_COUNT_DEC,        // 下降沿计数
            .lctrl_mode = PCNT_MODE_REVERSE,    // 当B相为低电平时不计数
            .hctrl_mode = PCNT_MODE_DISABLE,    // 当B相为高电平时反转计数方向
            .counter_h_lim = 32767,
            .counter_l_lim = -32768
    };
    // 配置并初始化脉冲计数单元
    pcnt_unit_config(&pcnt_config);
    // 设置过滤器，滤除噪声（可选）
    pcnt_set_filter_value(PCNT_UNIT_0, 100);
    pcnt_filter_enable(PCNT_UNIT_0);
    // 初始化计数器
    pcnt_counter_pause(PCNT_UNIT_0);
    pcnt_counter_clear(PCNT_UNIT_0);
    pcnt_counter_resume(PCNT_UNIT_0);
    gpio_config_t io_conf = {
            .intr_type = GPIO_INTR_DISABLE,
            .pin_bit_mask = (1ULL << ENCODER_PUSH_PIN),
            .mode = GPIO_MODE_INPUT,
            .pull_down_en = 0,                              /* 允许下拉 */
            .pull_up_en = 1,
    };

    gpio_config(&io_conf);
}
static int encoder_push_scan(void)
{
    if(gpio_get_level(ENCODER_PUSH_PIN) == 0)
    {
        vTaskDelay(pdMS_TO_TICKS(20));
        if(gpio_get_level(ENCODER_PUSH_PIN) == 0)
        {
            return 1;
        }
    }

    return 0;
}
/*Initialize your keypad*/
static void encoder_init(void)
{
    /*Your code comes here*/
    init_pcnt();
}

/*Will be called by the library to read the encoder*/
static void encoder_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data)
{
    encoder_handler();
    data->enc_diff = encoder_diff;
    data->state = encoder_state;
    encoder_diff = 0; // 读取后重置
//    ESP_LOGI(TAG, "Count: %d Data->state: %d", data->enc_diff,data->state);
}

/*Call this function in an interrupt to process encoder events (turn, press)*/
static void encoder_handler(void)
{
    static int last_count = 0;
    int16_t now_count;
    pcnt_get_counter_value(PCNT_UNIT_0, &now_count);
    // 处理旋转
    if (now_count != last_count) {
        encoder_diff = now_count - last_count;
        last_count = now_count;
        encoder_state = LV_INDEV_STATE_RELEASED; // 旋转时状态为 RELEASED
    }
    // 处理按下事件
    if (gpio_get_level(ENCODER_PUSH_PIN) == 1) {
        encoder_state = LV_INDEV_STATE_PRESSED;
    } else {
        encoder_state = LV_INDEV_STATE_RELEASED;
    }
}

/*------------------
 * Button
 * -----------------*/

/*Initialize your buttons*/
static void button_init(void)
{
    /*Your code comes here*/
}

/*Will be called by the library to read the button*/
static void button_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data)
{

    static uint8_t last_btn = 0;

    /*Get the pressed button's ID*/
    int8_t btn_act = button_get_pressed_id();

    if(btn_act >= 0) {
        data->state = LV_INDEV_STATE_PR;
        last_btn = btn_act;
    }
    else {
        data->state = LV_INDEV_STATE_REL;
    }

    /*Save the last pressed button's ID*/
    data->btn_id = last_btn;
}

/*Get ID  (0, 1, 2 ..) of the pressed button*/
static int8_t button_get_pressed_id(void)
{
    uint8_t i;

    /*Check to buttons see which is being pressed (assume there are 2 buttons)*/
    for(i = 0; i < 2; i++) {
        /*Return the pressed button's ID*/
        if(button_is_pressed(i)) {
            return i;
        }
    }

    /*No button pressed*/
    return -1;
}

/*Test if `id` button is pressed or not*/
static bool button_is_pressed(uint8_t id)
{

    /*Your code comes here*/

    return false;
}

#else /*Enable this file at the top*/

/*This dummy typedef exists purely to silence -Wpedantic.*/
typedef int keep_pedantic_happy;
#endif
