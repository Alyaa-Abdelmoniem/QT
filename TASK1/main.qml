import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 500
    height: 620
    title: "Student Profile"

    property string studentName: "Alyaa Abdelmoniem"
    property string major: "Computer Engineering"
    property string university: "MSA University"
    property string city: "Giza"
    property string email: "alyaa.abdelmoniem@gmail.com"

    Column {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            width: 420
            height: 150
            radius: 12
            color: "#E8F5E9"

            border.color: "#2E7D32"
            border.width: 2

            Column {
                anchors.centerIn: parent
                spacing: 8

                Text {
                    text: "Welcome " + studentName
                    font.pixelSize: 22
                    font.bold: true
                }

                Text {
                    text: "Major: " + major
                    font.pixelSize: 16
                }

                Text {
                    text: "University: " + university
                    font.pixelSize: 16
                }
            }
        }

        Rectangle {
            width: 420
            height: 230
            radius: 12
            color: "white"

            border.color: "#1976D2"
            border.width: 2

            Column {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 10

                Text {
                    text: "Student Information"
                    font.pixelSize: 20
                    font.bold: true
                }

                Text { text: "Name: " + studentName }
                Text { text: "Major: " + major }
                Text { text: "University: " + university }
                Text { text: "City: " + city }
                Text { text: "Email: " + email }
            }
        }
    }
}
