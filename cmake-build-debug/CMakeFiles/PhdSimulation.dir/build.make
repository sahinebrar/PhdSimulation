# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ebrarsahin/Desktop/workspace/PhdSimulation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ebrarsahin/Desktop/workspace/PhdSimulation/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/PhdSimulation.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/PhdSimulation.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/PhdSimulation.dir/flags.make

CMakeFiles/PhdSimulation.dir/main.cpp.o: CMakeFiles/PhdSimulation.dir/flags.make
CMakeFiles/PhdSimulation.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/ebrarsahin/Desktop/workspace/PhdSimulation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/PhdSimulation.dir/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/PhdSimulation.dir/main.cpp.o -c /Users/ebrarsahin/Desktop/workspace/PhdSimulation/main.cpp

CMakeFiles/PhdSimulation.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PhdSimulation.dir/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/ebrarsahin/Desktop/workspace/PhdSimulation/main.cpp > CMakeFiles/PhdSimulation.dir/main.cpp.i

CMakeFiles/PhdSimulation.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PhdSimulation.dir/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/ebrarsahin/Desktop/workspace/PhdSimulation/main.cpp -o CMakeFiles/PhdSimulation.dir/main.cpp.s

# Object files for target PhdSimulation
PhdSimulation_OBJECTS = \
"CMakeFiles/PhdSimulation.dir/main.cpp.o"

# External object files for target PhdSimulation
PhdSimulation_EXTERNAL_OBJECTS =

PhdSimulation: CMakeFiles/PhdSimulation.dir/main.cpp.o
PhdSimulation: CMakeFiles/PhdSimulation.dir/build.make
PhdSimulation: CMakeFiles/PhdSimulation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/ebrarsahin/Desktop/workspace/PhdSimulation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable PhdSimulation"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PhdSimulation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/PhdSimulation.dir/build: PhdSimulation
.PHONY : CMakeFiles/PhdSimulation.dir/build

CMakeFiles/PhdSimulation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/PhdSimulation.dir/cmake_clean.cmake
.PHONY : CMakeFiles/PhdSimulation.dir/clean

CMakeFiles/PhdSimulation.dir/depend:
	cd /Users/ebrarsahin/Desktop/workspace/PhdSimulation/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ebrarsahin/Desktop/workspace/PhdSimulation /Users/ebrarsahin/Desktop/workspace/PhdSimulation /Users/ebrarsahin/Desktop/workspace/PhdSimulation/cmake-build-debug /Users/ebrarsahin/Desktop/workspace/PhdSimulation/cmake-build-debug /Users/ebrarsahin/Desktop/workspace/PhdSimulation/cmake-build-debug/CMakeFiles/PhdSimulation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/PhdSimulation.dir/depend

