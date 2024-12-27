cmake_minimum_required(VERSION 3.16)

project(media_player VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(QT_QML_GENERATE_QMLLS_INI ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(TARGET_NAME app_${PROJECT_NAME})

find_package(Qt6 REQUIRED COMPONENTS Quick Multimedia)

set(RESOURCE_FILE resources.qrc)
qt_add_resources(RESOURCES ${RESOURCE_FILE})

qt_standard_project_setup(REQUIRES 6.5)
qt_policy(SET QTP0004 NEW)

file(GLOB_RECURSE SOURCE_FILES
    src/*
)

file(GLOB_RECURSE HEADER_FILES
    include/*
)

file(GLOB_RECURSE FOR_QML_HEADER_FILES 
    include/AudioInfo.h
)

file(GLOB_RECURSE FOR_QML_SOURCE_FILES 
    src/AudioInfo.cpp
)

qt_add_executable(${TARGET_NAME}
    main.cpp
    ${SOURCE_FILES}
    ${HEADER_FILES}
    ${RESOURCES}
)

target_include_directories(${TARGET_NAME} PRIVATE include)

qt_add_qml_module(${TARGET_NAME}
    URI media_player
    VERSION 1.0
    RESOURCE_PREFIX /qml
    QML_FILES
        qml/Main.qml
        qml/AudioInfoBox.qml
        qml/ImageButton.qml
    SOURCES
        ${FOR_QML_SOURCE_FILES}
        ${FOR_QML_HEADER_FILES}
)

set(COMMON_COMPILE_OPTIONS
    -Wall
    -Wextra
    -Wshadow
    -Wswitch
    -pedantic
    -Wformat=2
    -Wnull-dereference
    -Wunused-parameter
    -Wunreachable-code
    -Wimplicit-fallthrough
)

set(COMMON_ERROR_OPTIONS
    -Werror
    -Werror=return-type
    -Werror=uninitialized
    -Werror=unused-result
    -Werror=strict-overflow
)

target_compile_options(${TARGET_NAME} PRIVATE
    ${COMMON_COMPILE_OPTIONS}
    ${COMMON_ERROR_OPTIONS}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${TARGET_NAME} PROPERTIES

    # MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appmedia_player
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${TARGET_NAME}
    PRIVATE
    Qt6::Quick
    Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS ${TARGET_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
