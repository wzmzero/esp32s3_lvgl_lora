idf_component_register(
        SRC_DIRS "."
        INCLUDE_DIRS "."
)

set(image ../spiffs_image)
fatfs_create_spiflash_image(storage ${image} FLASH_IN_PROJECT)