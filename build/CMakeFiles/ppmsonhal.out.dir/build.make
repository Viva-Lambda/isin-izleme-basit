# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

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
CMAKE_COMMAND = /home/kaan/miniconda3/envs/dev-cpp/bin/cmake

# The command to remove a file.
RM = /home/kaan/miniconda3/envs/dev-cpp/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/kaan/Data7510/GitProjects/raytracing

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/kaan/Data7510/GitProjects/raytracing/build

# Include any dependencies generated for this target.
include CMakeFiles/ppmsonhal.out.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ppmsonhal.out.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ppmsonhal.out.dir/flags.make

CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.o: CMakeFiles/ppmsonhal.out.dir/flags.make
CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.o: ../src/haftasonu/ppmsonhal.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/kaan/Data7510/GitProjects/raytracing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.o -c /media/kaan/Data7510/GitProjects/raytracing/src/haftasonu/ppmsonhal.cpp

CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/kaan/Data7510/GitProjects/raytracing/src/haftasonu/ppmsonhal.cpp > CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.i

CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/kaan/Data7510/GitProjects/raytracing/src/haftasonu/ppmsonhal.cpp -o CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.s

# Object files for target ppmsonhal.out
ppmsonhal_out_OBJECTS = \
"CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.o"

# External object files for target ppmsonhal.out
ppmsonhal_out_EXTERNAL_OBJECTS =

ppmsonhal.out: CMakeFiles/ppmsonhal.out.dir/src/haftasonu/ppmsonhal.cpp.o
ppmsonhal.out: CMakeFiles/ppmsonhal.out.dir/build.make
ppmsonhal.out: CMakeFiles/ppmsonhal.out.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/kaan/Data7510/GitProjects/raytracing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ppmsonhal.out"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ppmsonhal.out.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ppmsonhal.out.dir/build: ppmsonhal.out

.PHONY : CMakeFiles/ppmsonhal.out.dir/build

CMakeFiles/ppmsonhal.out.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ppmsonhal.out.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ppmsonhal.out.dir/clean

CMakeFiles/ppmsonhal.out.dir/depend:
	cd /media/kaan/Data7510/GitProjects/raytracing/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/kaan/Data7510/GitProjects/raytracing /media/kaan/Data7510/GitProjects/raytracing /media/kaan/Data7510/GitProjects/raytracing/build /media/kaan/Data7510/GitProjects/raytracing/build /media/kaan/Data7510/GitProjects/raytracing/build/CMakeFiles/ppmsonhal.out.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ppmsonhal.out.dir/depend

