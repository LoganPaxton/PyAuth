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
CMAKE_BINARY_DIR = /workspaces/PyAuth/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/parse_examples.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/parse_examples.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/parse_examples.dir/flags.make

tests/CMakeFiles/parse_examples.dir/parse_examples.c.o: tests/CMakeFiles/parse_examples.dir/flags.make
tests/CMakeFiles/parse_examples.dir/parse_examples.c.o: /workspaces/PyAuth/cJSON/tests/parse_examples.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspaces/PyAuth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/parse_examples.dir/parse_examples.c.o"
	cd /workspaces/PyAuth/build/tests && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/parse_examples.dir/parse_examples.c.o   -c /workspaces/PyAuth/cJSON/tests/parse_examples.c

tests/CMakeFiles/parse_examples.dir/parse_examples.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/parse_examples.dir/parse_examples.c.i"
	cd /workspaces/PyAuth/build/tests && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /workspaces/PyAuth/cJSON/tests/parse_examples.c > CMakeFiles/parse_examples.dir/parse_examples.c.i

tests/CMakeFiles/parse_examples.dir/parse_examples.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/parse_examples.dir/parse_examples.c.s"
	cd /workspaces/PyAuth/build/tests && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /workspaces/PyAuth/cJSON/tests/parse_examples.c -o CMakeFiles/parse_examples.dir/parse_examples.c.s

# Object files for target parse_examples
parse_examples_OBJECTS = \
"CMakeFiles/parse_examples.dir/parse_examples.c.o"

# External object files for target parse_examples
parse_examples_EXTERNAL_OBJECTS =

tests/parse_examples: tests/CMakeFiles/parse_examples.dir/parse_examples.c.o
tests/parse_examples: tests/CMakeFiles/parse_examples.dir/build.make
tests/parse_examples: libcjson.so.1.7.18
tests/parse_examples: tests/libunity.a
tests/parse_examples: tests/CMakeFiles/parse_examples.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspaces/PyAuth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable parse_examples"
	cd /workspaces/PyAuth/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parse_examples.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/parse_examples.dir/build: tests/parse_examples

.PHONY : tests/CMakeFiles/parse_examples.dir/build

tests/CMakeFiles/parse_examples.dir/clean:
	cd /workspaces/PyAuth/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/parse_examples.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/parse_examples.dir/clean

tests/CMakeFiles/parse_examples.dir/depend:
	cd /workspaces/PyAuth/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/PyAuth/cJSON /workspaces/PyAuth/cJSON/tests /workspaces/PyAuth/build /workspaces/PyAuth/build/tests /workspaces/PyAuth/build/tests/CMakeFiles/parse_examples.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/parse_examples.dir/depend

