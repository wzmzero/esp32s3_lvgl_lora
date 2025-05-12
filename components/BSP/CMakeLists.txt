set(src_dirs
            LED
            USART

            )

set(include_dirs
            LED
            USART
            )

set(requires driver mqtt esp_event lvgl json)

idf_component_register(SRC_DIRS ${src_dirs} INCLUDE_DIRS ${include_dirs} REQUIRES ${requires})

component_compile_options(-ffast-math -O3 -Wno-error=format=-Wno-format)