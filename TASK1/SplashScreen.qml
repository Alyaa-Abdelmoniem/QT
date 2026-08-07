import QtQuick
import QtQuick.Controls

Rectangle {
    id: splashScreen

    signal finished()

    width: 500
    height: 620
    color: "white"

    Timer {
        interval: 3000
        running: true
        repeat: false

        onTriggered: {
            splashScreen.finished()
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 25

        Image {
            source: "images/alyaa_logo.png"
            width: 180
            height: 180
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
        }

        BusyIndicator {
            running: true
            width: 50
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Loading..."
            font.pixelSize: 18
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
