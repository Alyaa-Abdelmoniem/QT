import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: appWindow
    visible: true
    width: 520
    height: 620
    title: "E-Commerce"

    property bool splashVisible: true

    Timer {
        interval: 3000
        running: true
        repeat: false
        onTriggered: splashVisible = false
    }

    Rectangle {
        anchors.fill: parent
        color: "#f5f5f5"

        Column {
            anchors.centerIn: parent
            spacing: 15

            Text {
                text: "Welcome"
                font.pixelSize: 30
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                text: "Online Shopping"
                font.pixelSize: 18
                color: "#555555"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                text: "Start Shopping"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Rectangle {
        visible: splashVisible
        anchors.fill: parent
        color: "#2E86DE"
        z: 100

        Column {
            anchors.centerIn: parent
            spacing: 20

            Rectangle {
                width: 150
                height: 150
                radius: 75
                color: "white"

                Image {
                    anchors.fill: parent
                    anchors.margins: 15
                    fillMode: Image.PreserveAspectFit
                    source: "https://picsum.photos/220"
                }
            }

            BusyIndicator {
                running: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                text: "Loading..."
                color: "white"
                font.pixelSize: 20
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
