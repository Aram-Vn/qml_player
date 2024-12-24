cmake_minimum_required(VERSION 3.16)

project(media_player VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Multimedia)

set(RESOURCE_FILE resources.qrc)
qt_add_resources(RESOURCES ${RESOURCE_FILE})

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appmedia_player
    main.cpp
    ${RESOURCES}
)

qt_add_qml_module(appmedia_player
    URI media_player
    VERSION 1.0
    RESOURCE_PREFIX /qml
    QML_FILES
        qml/Main.qml
        qml/AudioInfoBox.qml
        qml/ImageButton.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appmedia_player PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appmedia_player
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appmedia_player
    PRIVATE
        Qt6::Quick
        Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appmedia_player
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
