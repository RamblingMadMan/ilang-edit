# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

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
CMAKE_SOURCE_DIR = /home/keith/Development/Warparty/ilang/ilang-edit

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/keith/Development/Warparty/ilang/ilang-edit/build

# Include any dependencies generated for this target.
include deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/depend.make

# Include the progress variables for this target.
include deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/progress.make

# Include the compile flags for this target's objects.
include deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/flags.make

deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/samples/docsample.cpp.o: deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/flags.make
deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/samples/docsample.cpp.o: ../deps/ilang-base/deps/utfcpp/samples/docsample.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/keith/Development/Warparty/ilang/ilang-edit/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/samples/docsample.cpp.o"
	cd /home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/deps/utfcpp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/docsample.dir/samples/docsample.cpp.o -c /home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/deps/utfcpp/samples/docsample.cpp

deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/samples/docsample.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/docsample.dir/samples/docsample.cpp.i"
	cd /home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/deps/utfcpp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/deps/utfcpp/samples/docsample.cpp > CMakeFiles/docsample.dir/samples/docsample.cpp.i

deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/samples/docsample.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/docsample.dir/samples/docsample.cpp.s"
	cd /home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/deps/utfcpp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/deps/utfcpp/samples/docsample.cpp -o CMakeFiles/docsample.dir/samples/docsample.cpp.s

# Object files for target docsample
docsample_OBJECTS = \
"CMakeFiles/docsample.dir/samples/docsample.cpp.o"

# External object files for target docsample
docsample_EXTERNAL_OBJECTS =

deps/ilang-base/deps/utfcpp/docsample: deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/samples/docsample.cpp.o
deps/ilang-base/deps/utfcpp/docsample: deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/build.make
deps/ilang-base/deps/utfcpp/docsample: deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/keith/Development/Warparty/ilang/ilang-edit/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable docsample"
	cd /home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/deps/utfcpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/docsample.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/build: deps/ilang-base/deps/utfcpp/docsample

.PHONY : deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/build

deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/clean:
	cd /home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/deps/utfcpp && $(CMAKE_COMMAND) -P CMakeFiles/docsample.dir/cmake_clean.cmake
.PHONY : deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/clean

deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/depend:
	cd /home/keith/Development/Warparty/ilang/ilang-edit/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/keith/Development/Warparty/ilang/ilang-edit /home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/deps/utfcpp /home/keith/Development/Warparty/ilang/ilang-edit/build /home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/deps/utfcpp /home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : deps/ilang-base/deps/utfcpp/CMakeFiles/docsample.dir/depend

