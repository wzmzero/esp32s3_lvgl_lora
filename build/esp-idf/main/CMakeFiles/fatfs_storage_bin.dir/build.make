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

# Utility rule file for fatfs_storage_bin.

# Include any custom commands dependencies for this target.
include esp-idf/main/CMakeFiles/fatfs_storage_bin.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/main/CMakeFiles/fatfs_storage_bin.dir/progress.make

esp-idf/main/CMakeFiles/fatfs_storage_bin:
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\main && D:\Espressif\python_env\idf5.1_py3.11_env\Scripts\python.exe D:/Espressif/frameworks/esp-idf-v5.1.1/components/fatfs/wl_fatfsgen.py C:/Users/zero/Desktop/esp32s3_lvgl_lora/spiffs_image --long_name_support --use_default_datetime --partition_size 0x200000 --output_file C:/Users/zero/Desktop/esp32s3_lvgl_lora/build/storage.bin --sector_size 4096

fatfs_storage_bin: esp-idf/main/CMakeFiles/fatfs_storage_bin
fatfs_storage_bin: esp-idf/main/CMakeFiles/fatfs_storage_bin.dir/build.make
.PHONY : fatfs_storage_bin

# Rule to build all files generated by this target.
esp-idf/main/CMakeFiles/fatfs_storage_bin.dir/build: fatfs_storage_bin
.PHONY : esp-idf/main/CMakeFiles/fatfs_storage_bin.dir/build

esp-idf/main/CMakeFiles/fatfs_storage_bin.dir/clean:
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\main && $(CMAKE_COMMAND) -P CMakeFiles\fatfs_storage_bin.dir\cmake_clean.cmake
.PHONY : esp-idf/main/CMakeFiles/fatfs_storage_bin.dir/clean

esp-idf/main/CMakeFiles/fatfs_storage_bin.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\zero\Desktop\esp32s3_lvgl_lora C:\Users\zero\Desktop\esp32s3_lvgl_lora\main C:\Users\zero\Desktop\esp32s3_lvgl_lora\build C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\main C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\main\CMakeFiles\fatfs_storage_bin.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/main/CMakeFiles/fatfs_storage_bin.dir/depend

