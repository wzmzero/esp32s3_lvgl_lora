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

# Utility rule file for partition-table.

# Include any custom commands dependencies for this target.
include esp-idf/partition_table/CMakeFiles/partition-table.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/partition_table/CMakeFiles/partition-table.dir/progress.make

esp-idf/partition_table/CMakeFiles/partition-table:
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\partition_table && D:\Espressif\tools\cmake\3.24.0\bin\cmake.exe -E echo "Partition table binary generated. Contents:"
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\partition_table && D:\Espressif\tools\cmake\3.24.0\bin\cmake.exe -E echo *******************************************************************************
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\partition_table && D:\Espressif\python_env\idf5.1_py3.11_env\Scripts\python.exe D:/Espressif/frameworks/esp-idf-v5.1.1/components/partition_table/gen_esp32part.py -q --offset 0x8000 --flash-size 8MB -- C:/Users/zero/Desktop/esp32s3_lvgl_lora/build/partition_table/partition-table.bin
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\partition_table && D:\Espressif\tools\cmake\3.24.0\bin\cmake.exe -E echo *******************************************************************************

partition-table: esp-idf/partition_table/CMakeFiles/partition-table
partition-table: esp-idf/partition_table/CMakeFiles/partition-table.dir/build.make
.PHONY : partition-table

# Rule to build all files generated by this target.
esp-idf/partition_table/CMakeFiles/partition-table.dir/build: partition-table
.PHONY : esp-idf/partition_table/CMakeFiles/partition-table.dir/build

esp-idf/partition_table/CMakeFiles/partition-table.dir/clean:
	cd /d C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\partition_table && $(CMAKE_COMMAND) -P CMakeFiles\partition-table.dir\cmake_clean.cmake
.PHONY : esp-idf/partition_table/CMakeFiles/partition-table.dir/clean

esp-idf/partition_table/CMakeFiles/partition-table.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\zero\Desktop\esp32s3_lvgl_lora D:\Espressif\frameworks\esp-idf-v5.1.1\components\partition_table C:\Users\zero\Desktop\esp32s3_lvgl_lora\build C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\partition_table C:\Users\zero\Desktop\esp32s3_lvgl_lora\build\esp-idf\partition_table\CMakeFiles\partition-table.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/partition_table/CMakeFiles/partition-table.dir/depend

