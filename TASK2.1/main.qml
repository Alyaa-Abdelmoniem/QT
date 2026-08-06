import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 500
    height: 600
    title: "Splash Demo"

    property bool showSplash: true

    Timer {
        interval: 3000
        running: true
        repeat: false
        onTriggered: showSplash = false
    }

    Rectangle {
        anchors.fill: parent
        color: "#eef5ff"

        Text {
            anchors.centerIn: parent
            text: "Home Screen"
            font.pixelSize: 28
            font.bold: true
            color: "#1f3b73"
        }
    }

    Rectangle {
        anchors.fill: parent
        visible: showSplash
        color: "#2f80ed"

        Column {
            anchors.centerIn: parent
            spacing: 20

            Image {
                width: 170
                height: 170
                fillMode: Image.PreserveAspectFit
                source: "https://picsum.photos/200"
            }

            BusyIndicator {
                anchors.horizontalCenter: parent.horizontalCenter
                running: true
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Loading..."
                color: "white"
                font.pixelSize: 20
                font.bold: true
            }
        }
    }
}
