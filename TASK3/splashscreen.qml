import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: splash

    signal finished()

    Rectangle {
        anchors.fill: parent
        color: "#F4F6F8"

        Rectangle {
            width: 420
            height: 500
            anchors.centerIn: parent
            radius: 20
            color: "white"
            border.color: "#DDDDDD"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 30
                spacing: 18

                Image {
                    source: "images/logo.png"
                    width: 90
                    height: 90
                    fillMode: Image.PreserveAspectFit
                    Layout.alignment: Qt.AlignHCenter
                }

                Label {
                    text: "Welcome"
                    font.pixelSize: 28
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter
                }

                Label {
                    text: "Please enter your information"
                    font.pixelSize: 15
                    color: "gray"
                    Layout.alignment: Qt.AlignHCenter
                }

                TextField {
                    id: nameField
                    placeholderText: "Full Name"
                    Layout.fillWidth: true
                }

                TextField {
                    id: idField
                    placeholderText: "Student ID"
                    Layout.fillWidth: true
                }

                TextField {
                    id: emailField
                    placeholderText: "Email"
                    Layout.fillWidth: true
                }

                Button {
                    text: "Continue"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 45

                    onClicked: splash.finished()
                }
            }
        }
    }
}
