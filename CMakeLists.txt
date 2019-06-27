cmake_minimum_required(VERSION 3.10.0 FATAL_ERROR) 

project(ilang-edit VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(deps/ilang-base)

find_package(Qt5 REQUIRED Widgets Qml Quick Gui)

qt5_add_resources(qml_QRC src/qml.qrc)

set(
	ILANG_EDIT_SOURCES
	src/Highlighter.hpp
	src/Repl.hpp
	src/ReplOutput.hpp
	src/Editor.hpp
	src/main.cpp

)

add_executable(ilang-edit ${ILANG_EDIT_SOURCES} ${qml_QRC})

set_target_properties(ilang-edit PROPERTIES AUTOMOC TRUE)

target_link_libraries(ilang-edit ilang-base Qt5::Widgets Qt5::Qml Qt5::Quick)
