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

# Utility rule file for size-files.

# Include any custom commands dependencies for this target.
include CMakeFiles/size-files.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/size-files.dir/progress.make

CMakeFiles/size-files: esp32s3_lvgl_lora.map
	D:\Espressif\tools\cmake\3.24.0\bin\cmake.exe -D IDF_SIZE_TOOL=D:/Espressif/python_env/idf5.1_py3.11_env/Scripts/python.exe;-m;esp_idf_size -D IDF_SIZE_MODE=--files -D MAP_FILE=C:/Users/zero/Desktop/esp32s3_lvgl_lora/build/esp32s3_lvgl_lora.map -D OUTPUT_JSON= -P D:/Espressif/frameworks/esp-idf-v5.1.1/tools/cmake/run_size_tool.cmake

size-files: CMakeFiles/size-files
size-files: CMakeFiles/size-files.dir/build.make
.PHONY : size-files

# Rule to build all files generated by this target.
CMakeFiles/size-files.dir/build: size-files
.PHONY : CMakeFiles/size-files.dir/build

CMakeFiles/size-files.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\size-files.dir\cmake_clean.cmake
.PHONY : CMakeFiles/size-files.dir/clean

CMakeFiles/size-files.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\zero\Desktop\esp32s3_lvgl_lora C:\Users\zero\Desktop\esp32s3_lvgl_lora C:\Users\zero\Desktop\esp32s3_lvgl_lora\build C:\Users\zero\Desktop\esp32s3_lvgl_lora\build C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\CMakeFiles\size-files.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/size-files.dir/depend

