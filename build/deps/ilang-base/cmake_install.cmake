# Install script for directory: /home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ilang" TYPE FILE FILES
    "/home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/include/ilang/Lexer.hpp"
    "/home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/include/ilang/Location.hpp"
    "/home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/include/ilang/AReal.hpp"
    "/home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/include/ilang/ARatio.hpp"
    "/home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/include/ilang/AInt.hpp"
    "/home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/include/ilang/Type.hpp"
    "/home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/include/ilang/Expr.hpp"
    "/home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/include/ilang/Parser.hpp"
    "/home/keith/Development/Warparty/ilang/ilang-edit/deps/ilang-base/include/ilang/Eval.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/libilang-base.a")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/deps/utfcpp/cmake_install.cmake")
  include("/home/keith/Development/Warparty/ilang/ilang-edit/build/deps/ilang-base/deps/fmt/cmake_install.cmake")

endif()

