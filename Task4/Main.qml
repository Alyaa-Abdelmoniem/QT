import QtQuick
import QtQuick.Controls

import Calculator.Backend 1.0

ApplicationWindow {
    visible: true

    width: 420
    height: 700

    title: "Calculator"
    color: "#15171C"

    property string currentNumber: "0"
    property string firstNumber: ""
    property string operation: ""

    Calculator {
        id: calculator
    }

    function pressNumber(number) {
        if (currentNumber === "0")
            currentNumber = number
        else
            currentNumber += number
    }

    function pressOperation(op) {
        firstNumber = currentNumber
        operation = op
        currentNumber = "0"
    }

    function calculateResult() {
        if (firstNumber === "" || operation === "")
            return

        var a = Number(firstNumber)
        var b = Number(currentNumber)
        var answer = 0

        if (operation === "+")
            answer = calculator.add(a, b)

        else if (operation === "-")
            answer = calculator.subtract(a, b)

        else if (operation === "*")
            answer = calculator.multiply(a, b)

        else if (operation === "/") {
            if (b === 0) {
                currentNumber = "Error"
                return
            }

            answer = calculator.divide(a, b)
        }

        currentNumber = String(answer)
        firstNumber = ""
        operation = ""
    }

    function clearCalculator() {
        currentNumber = "0"
        firstNumber = ""
        operation = ""
    }

    function deleteLast() {
        if (currentNumber.length > 1)
            currentNumber = currentNumber.slice(0, -1)
        else
            currentNumber = "0"
    }

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 12

        Text {
            width: parent.width
            height: 35

            text: "CALCULATOR"

            color: "#FFFFFF"

            font.pixelSize: 20
            font.bold: true

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            width: parent.width
            height: 125

            radius: 18

            color: "#20232A"
            border.color: "#30343D"
            border.width: 1

            Text {
                id: display

                anchors.fill: parent
                anchors.margins: 18

                text: currentNumber

                color: "#FFFFFF"

                font.pixelSize: 40
                font.bold: true

                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter

                elide: Text.ElideLeft
            }
        }

        // First Row
        Row {
            spacing: 10

            Button {
                text: "AC"

                width: 92
                height: 72

                onClicked: clearCalculator()

                background: Rectangle {
                    radius: 16
                    color: "#343943"
                }

                contentItem: Text {
                    text: "AC"

                    color: "#FF6B6B"

                    font.pixelSize: 20
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "⌫"

                width: 92
                height: 72

                onClicked: deleteLast()

                background: Rectangle {
                    radius: 16
                    color: "#343943"
                }

                contentItem: Text {
                    text: "⌫"

                    color: "#FFFFFF"

                    font.pixelSize: 22
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "%"

                width: 92
                height: 72

                onClicked: {
                    currentNumber =
                            String(Number(currentNumber) / 100)
                }

                background: Rectangle {
                    radius: 16
                    color: "#343943"
                }

                contentItem: Text {
                    text: "%"

                    color: "#FFFFFF"

                    font.pixelSize: 22
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "÷"

                width: 92
                height: 72

                onClicked: pressOperation("/")

                background: Rectangle {
                    radius: 16
                    color: "#4F7CFF"
                }

                contentItem: Text {
                    text: "÷"

                    color: "#FFFFFF"

                    font.pixelSize: 25
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        // Second Row
        Row {
            spacing: 10

            Button {
                text: "7"

                width: 92
                height: 72

                onClicked: pressNumber("7")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "7"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "8"

                width: 92
                height: 72

                onClicked: pressNumber("8")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "8"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "9"

                width: 92
                height: 72

                onClicked: pressNumber("9")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "9"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "×"

                width: 92
                height: 72

                onClicked: pressOperation("*")

                background: Rectangle {
                    radius: 16
                    color: "#4F7CFF"
                }

                contentItem: Text {
                    text: "×"

                    color: "#FFFFFF"

                    font.pixelSize: 25
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        // Third Row
        Row {
            spacing: 10

            Button {
                text: "4"

                width: 92
                height: 72

                onClicked: pressNumber("4")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "4"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "5"

                width: 92
                height: 72

                onClicked: pressNumber("5")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "5"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "6"

                width: 92
                height: 72

                onClicked: pressNumber("6")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "6"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "-"

                width: 92
                height: 72

                onClicked: pressOperation("-")

                background: Rectangle {
                    radius: 16
                    color: "#4F7CFF"
                }

                contentItem: Text {
                    text: "-"

                    color: "#FFFFFF"

                    font.pixelSize: 25
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        // Fourth Row
        Row {
            spacing: 10

            Button {
                text: "1"

                width: 92
                height: 72

                onClicked: pressNumber("1")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "1"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "2"

                width: 92
                height: 72

                onClicked: pressNumber("2")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "2"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "3"

                width: 92
                height: 72

                onClicked: pressNumber("3")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "3"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "+"

                width: 92
                height: 72

                onClicked: pressOperation("+")

                background: Rectangle {
                    radius: 16
                    color: "#4F7CFF"
                }

                contentItem: Text {
                    text: "+"

                    color: "#FFFFFF"

                    font.pixelSize: 25
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        // Last Row
        Row {
            spacing: 10

            Button {
                text: "0"

                width: 194
                height: 72

                onClicked: pressNumber("0")

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "0"

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "."

                width: 92
                height: 72

                onClicked: {
                    if (!currentNumber.includes("."))
                        currentNumber += "."
                }

                background: Rectangle {
                    radius: 16
                    color: "#25282F"
                }

                contentItem: Text {
                    text: "."

                    color: "#FFFFFF"

                    font.pixelSize: 23
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "="

                width: 92
                height: 72

                onClicked: calculateResult()

                background: Rectangle {
                    radius: 16
                    color: "#35B87F"
                }

                contentItem: Text {
                    text: "="

                    color: "#FFFFFF"

                    font.pixelSize: 25
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }
}
