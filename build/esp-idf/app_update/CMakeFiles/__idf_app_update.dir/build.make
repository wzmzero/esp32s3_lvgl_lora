# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = D:\Espressif\tools\cmake\3.24.0\bin\cmake.exe

# The command to remove a file.
RM = D:\Espressif\tools\cmake\3.24.0\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\zero\Desktop\esp32s3_lvgl_lora

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\zero\Desktop\esp32s3_lvgl_lora\build

# Include any dependencies generated for this target.
include esp-idf/app_update/CMakeFiles/__idf_app_update.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/app_update/CMakeFiles/__idf_app_update.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/app_update/CMakeFiles/__idf_app_update.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/app_update/CMakeFiles/__idf_app_update.dir/flags.make

esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.obj: esp-idf/app_update/CMakeFiles/__idf_app_update.dir/flags.make
esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/app_update/esp_ota_ops.c
esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.obj: esp-idf/app_update/CMakeFiles/__idf_app_update.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.obj -MF CMakeFiles\__idf_app_update.dir\esp_ota_ops.c.obj.d -o CMakeFiles\__idf_app_update.dir\esp_ota_ops.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\app_update\esp_ota_ops.c

esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\app_update\esp_ota_ops.c > CMakeFiles\__idf_app_update.dir\esp_ota_ops.c.i

esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\app_update\esp_ota_ops.c -o CMakeFiles\__idf_app_update.dir\esp_ota_ops.c.s

esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.obj: esp-idf/app_update/CMakeFiles/__idf_app_update.dir/flags.make
esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/app_update/esp_ota_app_desc.c
esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.obj: esp-idf/app_update/CMakeFiles/__idf_app_update.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.obj -MF CMakeFiles\__idf_app_update.dir\esp_ota_app_desc.c.obj.d -o CMakeFiles\__idf_app_update.dir\esp_ota_app_desc.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\app_update\esp_ota_app_desc.c

esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\app_update\esp_ota_app_desc.c > CMakeFiles\__idf_app_update.dir\esp_ota_app_desc.c.i

esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\app_update\esp_ota_app_desc.c -o CMakeFiles\__idf_app_update.dir\esp_ota_app_desc.c.s

# Object files for target __idf_app_update
__idf_app_update_OBJECTS = \
"CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.obj" \
"CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.obj"

# External object files for target __idf_app_update
__idf_app_update_EXTERNAL_OBJECTS =

esp-idf/app_update/libapp_update.a: esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_ops.c.obj
esp-idf/app_update/libapp_update.a: esp-idf/app_update/CMakeFiles/__idf_app_update.dir/esp_ota_app_desc.c.obj
esp-idf/app_update/libapp_update.a: esp-idf/app_update/CMakeFiles/__idf_app_update.dir/build.make
esp-idf/app_update/libapp_update.a: esp-idf/app_update/CMakeFiles/__idf_app_update.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C static library libapp_update.a"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update && $(CMAKE_COMMAND) -P CMakeFiles\__idf_app_update.dir\cmake_clean_target.cmake
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\__idf_app_update.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/app_update/CMakeFiles/__idf_app_update.dir/build: esp-idf/app_update/libapp_update.a
.PHONY : esp-idf/app_update/CMakeFiles/__idf_app_update.dir/build

esp-idf/app_update/CMakeFiles/__idf_app_update.dir/clean:
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update && $(CMAKE_COMMAND) -P CMakeFiles\__idf_app_update.dir\cmake_clean.cmake
.PHONY : esp-idf/app_update/CMakeFiles/__idf_app_update.dir/clean

esp-idf/app_update/CMakeFiles/__idf_app_update.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\zero\Desktop\esp32s3_lvgl_lora D:\Espressif\frameworks\esp-idf-v5.1.1\components\app_update C:\Users\zero\Desktop\esp32s3_lvgl_lora\build C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\app_update\CMakeFiles\__idf_app_update.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/app_update/CMakeFiles/__idf_app_update.dir/depend

