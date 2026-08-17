# Calculator

A simple Calculator application built using Qt Quick, QML, and C++.

## Features

- Addition
- Subtraction
- Multiplication
- Division
- Percentage
- Clear button
- Delete button
- Decimal numbers
- Division by zero handling
- Modern dark user interface
- White numbers for better visibility

## Technologies

- C++
- Qt 6
- QML
- Qt Quick
- Qt Quick Controls
- CMake

## Project Structure

Calculator/
- CMakeLists.txt
- main.cpp
- Main.qml
- Calculator.h
- Calculator.cpp

## Communication Between QML and C++

The calculator operations are implemented in C++ and accessed from QML using a registered QML Element.

The project does not use Context Property or setContextProperty().

The Calculator class provides the following operations:

- add()
- subtract()
- multiply()
- divide()

## How to Run

1. Open the project in Qt Creator.
2. Select a Qt 6 kit.
3. Build the project.
4. Run the application.

## Example

2 * 5 = 10

## Interface

The application has a modern dark design with white numbers, blue operation buttons, a green equals button, and a red clear button.

## Author

Qt Calculator Project
