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
include CMakeFiles/ilang-edit.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ilang-edit.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ilang-edit.dir/flags.make

qrc_qml.cpp: ../src/main.qml
qrc_qml.cpp: ../src/fonts/Monoid-Retina.ttf
qrc_qml.cpp: ../src/Repl.qml
qrc_qml.cpp: ../src/Editor.qml
qrc_qml.cpp: src/qml.qrc.depends
qrc_qml.cpp: ../src/qml.qrc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/keith/Development/Warparty/ilang/ilang-edit/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating qrc_qml.cpp"
	/usr/lib/qt5/bin/rcc --name qml --output /home/keith/Development/Warparty/ilang/ilang-edit/build/qrc_qml.cpp /home/keith/Development/Warparty/ilang/ilang-edit/src/qml.qrc

CMakeFiles/ilang-edit.dir/src/main.cpp.o: CMakeFiles/ilang-edit.dir/flags.make
CMakeFiles/ilang-edit.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/keith/Development/Warparty/ilang/ilang-edit/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/ilang-edit.dir/src/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ilang-edit.dir/src/main.cpp.o -c /home/keith/Development/Warparty/ilang/ilang-edit/src/main.cpp

CMakeFiles/ilang-edit.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ilang-edit.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/keith/Development/Warparty/ilang/ilang-edit/src/main.cpp > CMakeFiles/ilang-edit.dir/src/main.cpp.i

CMakeFiles/ilang-edit.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ilang-edit.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/keith/Development/Warparty/ilang/ilang-edit/src/main.cpp -o CMakeFiles/ilang-edit.dir/src/main.cpp.s

CMakeFiles/ilang-edit.dir/qrc_qml.cpp.o: CMakeFiles/ilang-edit.dir/flags.make
CMakeFiles/ilang-edit.dir/qrc_qml.cpp.o: qrc_qml.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/keith/Development/Warparty/ilang/ilang-edit/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/ilang-edit.dir/qrc_qml.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ilang-edit.dir/qrc_qml.cpp.o -c /home/keith/Development/Warparty/ilang/ilang-edit/build/qrc_qml.cpp

CMakeFiles/ilang-edit.dir/qrc_qml.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ilang-edit.dir/qrc_qml.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/keith/Development/Warparty/ilang/ilang-edit/build/qrc_qml.cpp > CMakeFiles/ilang-edit.dir/qrc_qml.cpp.i

CMakeFiles/ilang-edit.dir/qrc_qml.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ilang-edit.dir/qrc_qml.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/keith/Development/Warparty/ilang/ilang-edit/build/qrc_qml.cpp -o CMakeFiles/ilang-edit.dir/qrc_qml.cpp.s

CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.o: CMakeFiles/ilang-edit.dir/flags.make
CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.o: ilang-edit_autogen/mocs_compilation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/keith/Development/Warparty/ilang/ilang-edit/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.o -c /home/keith/Development/Warparty/ilang/ilang-edit/build/ilang-edit_autogen/mocs_compilation.cpp

CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/keith/Development/Warparty/ilang/ilang-edit/build/ilang-edit_autogen/mocs_compilation.cpp > CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.i

CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/keith/Development/Warparty/ilang/ilang-edit/build/ilang-edit_autogen/mocs_compilation.cpp -o CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.s

# Object files for target ilang-edit
ilang__edit_OBJECTS = \
"CMakeFiles/ilang-edit.dir/src/main.cpp.o" \
"CMakeFiles/ilang-edit.dir/qrc_qml.cpp.o" \
"CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.o"

# External object files for target ilang-edit
ilang__edit_EXTERNAL_OBJECTS =

ilang-edit: CMakeFiles/ilang-edit.dir/src/main.cpp.o
ilang-edit: CMakeFiles/ilang-edit.dir/qrc_qml.cpp.o
ilang-edit: CMakeFiles/ilang-edit.dir/ilang-edit_autogen/mocs_compilation.cpp.o
ilang-edit: CMakeFiles/ilang-edit.dir/build.make
ilang-edit: deps/ilang-base/libilang-base.a
ilang-edit: /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5.12.2
ilang-edit: deps/ilang-base/deps/fmt/libfmtd.a
ilang-edit: /usr/lib/x86_64-linux-gnu/libgmp.so
ilang-edit: /usr/lib/x86_64-linux-gnu/libmpfr.so
ilang-edit: /usr/lib/llvm-8/lib/libLLVMOrcJIT.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMExecutionEngine.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMRuntimeDyld.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMTarget.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMTransformUtils.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMBitWriter.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMAnalysis.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMObject.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMMCParser.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMMC.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMDebugInfoCodeView.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMDebugInfoMSF.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMProfileData.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMIRReader.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMBitReader.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMAsmParser.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMCore.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMBinaryFormat.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMSupport.a
ilang-edit: /usr/lib/llvm-8/lib/libLLVMDemangle.a
ilang-edit: /usr/lib/x86_64-linux-gnu/libQt5Qml.so.5.12.2
ilang-edit: /usr/lib/x86_64-linux-gnu/libQt5Network.so.5.12.2
ilang-edit: /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5.12.2
ilang-edit: /usr/lib/x86_64-linux-gnu/libQt5Core.so.5.12.2
ilang-edit: CMakeFiles/ilang-edit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/keith/Development/Warparty/ilang/ilang-edit/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable ilang-edit"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ilang-edit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ilang-edit.dir/build: ilang-edit

.PHONY : CMakeFiles/ilang-edit.dir/build

CMakeFiles/ilang-edit.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ilang-edit.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ilang-edit.dir/clean

CMakeFiles/ilang-edit.dir/depend: qrc_qml.cpp
	cd /home/keith/Development/Warparty/ilang/ilang-edit/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/keith/Development/Warparty/ilang/ilang-edit /home/keith/Development/Warparty/ilang/ilang-edit /home/keith/Development/Warparty/ilang/ilang-edit/build /home/keith/Development/Warparty/ilang/ilang-edit/build /home/keith/Development/Warparty/ilang/ilang-edit/build/CMakeFiles/ilang-edit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ilang-edit.dir/depend
