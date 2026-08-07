cmake_minimum_required(VERSION 3.16)

project(task1 VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(apptask1
    main.cpp
)

qt_add_qml_module(apptask1
    URI task1
    VERSION 1.0

    QML_FILES
        Main.qml
        SplashScreen.qml
        HomeScreen.qml

    RESOURCES
        images/alyaa_logo.png
)

target_link_libraries(apptask1
    PRIVATE Qt6::Quick
)
