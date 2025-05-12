SET(SOURCES screens/ui_MainScreen.c
    screens/ui_Charts.c
    screens/ui_Wifi.c
    screens/ui_DataMenu.c
    screens/ui_Other.c
    ui.c
    components/ui_comp_hook.c
    ui_helpers.c
    ui_events.c
    images/ui_img_wifi_1_png.c
    images/ui_img_yituflow_png.c
    images/ui_img_temperature_png.c
    images/ui_img_humidity_png.c
    images/ui_img_wifi_ic_png.c
    fonts/ui_font_Black28.c
    fonts/ui_font_bold24.c)

idf_component_register(SRCS	${SOURCES}
        INCLUDE_DIRS "."
        REQUIRES  lvgl lvgl_esp32_drivers esp_wifi
)
