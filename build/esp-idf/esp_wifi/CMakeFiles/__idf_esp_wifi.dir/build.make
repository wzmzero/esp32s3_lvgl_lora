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
include esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/esp_wifi/src/mesh_event.c
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj -MF CMakeFiles\__idf_esp_wifi.dir\src\mesh_event.c.obj.d -o CMakeFiles\__idf_esp_wifi.dir\src\mesh_event.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\mesh_event.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\mesh_event.c > CMakeFiles\__idf_esp_wifi.dir\src\mesh_event.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\mesh_event.c -o CMakeFiles\__idf_esp_wifi.dir\src\mesh_event.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/esp_wifi/src/smartconfig.c
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj -MF CMakeFiles\__idf_esp_wifi.dir\src\smartconfig.c.obj.d -o CMakeFiles\__idf_esp_wifi.dir\src\smartconfig.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\smartconfig.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\smartconfig.c > CMakeFiles\__idf_esp_wifi.dir\src\smartconfig.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\smartconfig.c -o CMakeFiles\__idf_esp_wifi.dir\src\smartconfig.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/esp_wifi/src/wifi_init.c
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj -MF CMakeFiles\__idf_esp_wifi.dir\src\wifi_init.c.obj.d -o CMakeFiles\__idf_esp_wifi.dir\src\wifi_init.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_init.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_init.c > CMakeFiles\__idf_esp_wifi.dir\src\wifi_init.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_init.c -o CMakeFiles\__idf_esp_wifi.dir\src\wifi_init.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/esp_wifi/src/wifi_default.c
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj -MF CMakeFiles\__idf_esp_wifi.dir\src\wifi_default.c.obj.d -o CMakeFiles\__idf_esp_wifi.dir\src\wifi_default.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_default.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_default.c > CMakeFiles\__idf_esp_wifi.dir\src\wifi_default.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_default.c -o CMakeFiles\__idf_esp_wifi.dir\src\wifi_default.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/esp_wifi/src/wifi_netif.c
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj -MF CMakeFiles\__idf_esp_wifi.dir\src\wifi_netif.c.obj.d -o CMakeFiles\__idf_esp_wifi.dir\src\wifi_netif.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_netif.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_netif.c > CMakeFiles\__idf_esp_wifi.dir\src\wifi_netif.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_netif.c -o CMakeFiles\__idf_esp_wifi.dir\src\wifi_netif.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/esp_wifi/src/wifi_default_ap.c
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.obj -MF CMakeFiles\__idf_esp_wifi.dir\src\wifi_default_ap.c.obj.d -o CMakeFiles\__idf_esp_wifi.dir\src\wifi_default_ap.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_default_ap.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_default_ap.c > CMakeFiles\__idf_esp_wifi.dir\src\wifi_default_ap.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\wifi_default_ap.c -o CMakeFiles\__idf_esp_wifi.dir\src\wifi_default_ap.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/esp_wifi/esp32s3/esp_adapter.c
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.obj -MF CMakeFiles\__idf_esp_wifi.dir\esp32s3\esp_adapter.c.obj.d -o CMakeFiles\__idf_esp_wifi.dir\esp32s3\esp_adapter.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\esp32s3\esp_adapter.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\esp32s3\esp_adapter.c > CMakeFiles\__idf_esp_wifi.dir\esp32s3\esp_adapter.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\esp32s3\esp_adapter.c -o CMakeFiles\__idf_esp_wifi.dir\esp32s3\esp_adapter.c.s

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/flags.make
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj: D:/Espressif/frameworks/esp-idf-v5.1.1/components/esp_wifi/src/smartconfig_ack.c
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj -MF CMakeFiles\__idf_esp_wifi.dir\src\smartconfig_ack.c.obj.d -o CMakeFiles\__idf_esp_wifi.dir\src\smartconfig_ack.c.obj -c D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\smartconfig_ack.c

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.i"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\smartconfig_ack.c > CMakeFiles\__idf_esp_wifi.dir\src\smartconfig_ack.c.i

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.s"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && D:\Espressif\tools\xtensa-esp32s3-elf\esp-12.2.0_20230208\xtensa-esp32s3-elf\bin\xtensa-esp32s3-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi\src\smartconfig_ack.c -o CMakeFiles\__idf_esp_wifi.dir\src\smartconfig_ack.c.s

# Object files for target __idf_esp_wifi
__idf_esp_wifi_OBJECTS = \
"CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.obj" \
"CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj"

# External object files for target __idf_esp_wifi
__idf_esp_wifi_EXTERNAL_OBJECTS =

esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/mesh_event.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_init.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_netif.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/wifi_default_ap.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/esp32s3/esp_adapter.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/src/smartconfig_ack.c.obj
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/build.make
esp-idf/esp_wifi/libesp_wifi.a: esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking C static library libesp_wifi.a"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && $(CMAKE_COMMAND) -P CMakeFiles\__idf_esp_wifi.dir\cmake_clean_target.cmake
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\__idf_esp_wifi.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/build: esp-idf/esp_wifi/libesp_wifi.a
.PHONY : esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/build

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/clean:
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi && $(CMAKE_COMMAND) -P CMakeFiles\__idf_esp_wifi.dir\cmake_clean.cmake
.PHONY : esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/clean

esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\zero\Desktop\esp32s3_lvgl_lora D:\Espressif\frameworks\esp-idf-v5.1.1\components\esp_wifi C:\Users\zero\Desktop\esp32s3_lvgl_lora\build C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\esp_wifi\CMakeFiles\__idf_esp_wifi.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/esp_wifi/CMakeFiles/__idf_esp_wifi.dir/depend

