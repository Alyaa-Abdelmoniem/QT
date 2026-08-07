import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {

    Rectangle {
        anchors.fill: parent
        color: "#F5F5F5"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Image {
            source: "images/banner.png"
            Layout.fillWidth: true
            Layout.preferredHeight: 180
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: "E-Commerce Store"
            font.pixelSize: 28
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            Item {
                width: parent.width
                implicitHeight: grid.implicitHeight

                GridLayout {
                    id: grid
                    columns: 2
                    columnSpacing: 20
                    rowSpacing: 20
                    anchors.horizontalCenter: parent.horizontalCenter

                    Repeater {
                        model: [
                            {title:"Home", image:"images/Home.png"},
                            {title:"Phones", image:"images/Phones.png"},
                            {title:"Computers", image:"images/Computers.png"},
                            {title:"Fashion", image:"images/Fashion.png"},
                            {title:"Shopping", image:"images/Shopping.png"},
                            {title:"Cars", image:"images/Cars.png"}
                        ]

                        delegate: Rectangle {
                            width: 180
                            height: 180
                            radius: 18
                            color: "white"

                            border.color: "#DDDDDD"
                            border.width: 1

                            Column {
                                anchors.centerIn: parent
                                spacing: 10

                                Image {
                                    source: modelData.image
                                    width: 90
                                    height: 90
                                    fillMode: Image.PreserveAspectFit
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                Label {
                                    text: modelData.title
                                    font.pixelSize: 18
                                    font.bold: true
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: console.log(modelData.title)
                            }
                        }
                    }
                }
            }
        }
    }
}
