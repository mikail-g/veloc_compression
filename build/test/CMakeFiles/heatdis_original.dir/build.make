# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mikailg/ECE8930/veloc_src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mikailg/ECE8930/veloc_src/build

# Include any dependencies generated for this target.
include test/CMakeFiles/heatdis_original.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/heatdis_original.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/heatdis_original.dir/flags.make

test/CMakeFiles/heatdis_original.dir/heatdis_original.c.o: test/CMakeFiles/heatdis_original.dir/flags.make
test/CMakeFiles/heatdis_original.dir/heatdis_original.c.o: ../test/heatdis_original.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mikailg/ECE8930/veloc_src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object test/CMakeFiles/heatdis_original.dir/heatdis_original.c.o"
	cd /home/mikailg/ECE8930/veloc_src/build/test && /bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/heatdis_original.dir/heatdis_original.c.o -c /home/mikailg/ECE8930/veloc_src/test/heatdis_original.c

test/CMakeFiles/heatdis_original.dir/heatdis_original.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/heatdis_original.dir/heatdis_original.c.i"
	cd /home/mikailg/ECE8930/veloc_src/build/test && /bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mikailg/ECE8930/veloc_src/test/heatdis_original.c > CMakeFiles/heatdis_original.dir/heatdis_original.c.i

test/CMakeFiles/heatdis_original.dir/heatdis_original.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/heatdis_original.dir/heatdis_original.c.s"
	cd /home/mikailg/ECE8930/veloc_src/build/test && /bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mikailg/ECE8930/veloc_src/test/heatdis_original.c -o CMakeFiles/heatdis_original.dir/heatdis_original.c.s

# Object files for target heatdis_original
heatdis_original_OBJECTS = \
"CMakeFiles/heatdis_original.dir/heatdis_original.c.o"

# External object files for target heatdis_original
heatdis_original_EXTERNAL_OBJECTS =

test/heatdis_original: test/CMakeFiles/heatdis_original.dir/heatdis_original.c.o
test/heatdis_original: test/CMakeFiles/heatdis_original.dir/build.make
test/heatdis_original: /software/spackages/linux-centos8-x86_64/gcc-8.4.1/openmpi-3.1.6-vgm2v2kplihuze3q5ozerlxzman3scic/lib/libmpi.so
test/heatdis_original: test/CMakeFiles/heatdis_original.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mikailg/ECE8930/veloc_src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable heatdis_original"
	cd /home/mikailg/ECE8930/veloc_src/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/heatdis_original.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/heatdis_original.dir/build: test/heatdis_original

.PHONY : test/CMakeFiles/heatdis_original.dir/build

test/CMakeFiles/heatdis_original.dir/clean:
	cd /home/mikailg/ECE8930/veloc_src/build/test && $(CMAKE_COMMAND) -P CMakeFiles/heatdis_original.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/heatdis_original.dir/clean

test/CMakeFiles/heatdis_original.dir/depend:
	cd /home/mikailg/ECE8930/veloc_src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mikailg/ECE8930/veloc_src /home/mikailg/ECE8930/veloc_src/test /home/mikailg/ECE8930/veloc_src/build /home/mikailg/ECE8930/veloc_src/build/test /home/mikailg/ECE8930/veloc_src/build/test/CMakeFiles/heatdis_original.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/heatdis_original.dir/depend
