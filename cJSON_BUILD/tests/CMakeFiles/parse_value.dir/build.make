# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspaces/PyAuth/cJSON

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspaces/PyAuth/cJSON_BUILD

# Include any dependencies generated for this target.
include tests/CMakeFiles/parse_value.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/parse_value.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/parse_value.dir/flags.make

tests/CMakeFiles/parse_value.dir/parse_value.c.o: tests/CMakeFiles/parse_value.dir/flags.make
tests/CMakeFiles/parse_value.dir/parse_value.c.o: /workspaces/PyAuth/cJSON/tests/parse_value.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspaces/PyAuth/cJSON_BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/parse_value.dir/parse_value.c.o"
	cd /workspaces/PyAuth/cJSON_BUILD/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/parse_value.dir/parse_value.c.o   -c /workspaces/PyAuth/cJSON/tests/parse_value.c

tests/CMakeFiles/parse_value.dir/parse_value.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/parse_value.dir/parse_value.c.i"
	cd /workspaces/PyAuth/cJSON_BUILD/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /workspaces/PyAuth/cJSON/tests/parse_value.c > CMakeFiles/parse_value.dir/parse_value.c.i

tests/CMakeFiles/parse_value.dir/parse_value.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/parse_value.dir/parse_value.c.s"
	cd /workspaces/PyAuth/cJSON_BUILD/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /workspaces/PyAuth/cJSON/tests/parse_value.c -o CMakeFiles/parse_value.dir/parse_value.c.s

# Object files for target parse_value
parse_value_OBJECTS = \
"CMakeFiles/parse_value.dir/parse_value.c.o"

# External object files for target parse_value
parse_value_EXTERNAL_OBJECTS =

tests/parse_value: tests/CMakeFiles/parse_value.dir/parse_value.c.o
tests/parse_value: tests/CMakeFiles/parse_value.dir/build.make
tests/parse_value: libcjson.so.1.7.18
tests/parse_value: tests/libunity.a
tests/parse_value: tests/CMakeFiles/parse_value.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspaces/PyAuth/cJSON_BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable parse_value"
	cd /workspaces/PyAuth/cJSON_BUILD/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parse_value.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/parse_value.dir/build: tests/parse_value

.PHONY : tests/CMakeFiles/parse_value.dir/build

tests/CMakeFiles/parse_value.dir/clean:
	cd /workspaces/PyAuth/cJSON_BUILD/tests && $(CMAKE_COMMAND) -P CMakeFiles/parse_value.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/parse_value.dir/clean

tests/CMakeFiles/parse_value.dir/depend:
	cd /workspaces/PyAuth/cJSON_BUILD && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/PyAuth/cJSON /workspaces/PyAuth/cJSON/tests /workspaces/PyAuth/cJSON_BUILD /workspaces/PyAuth/cJSON_BUILD/tests /workspaces/PyAuth/cJSON_BUILD/tests/CMakeFiles/parse_value.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/parse_value.dir/depend

