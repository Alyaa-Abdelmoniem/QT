import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: dashboardPage
    title: "Smart Home Dashboard"

    property int deviceCount: devicesModel.count

    signal deviceToggled(string deviceName, bool newState)
    onDeviceToggled: console.log("Signal -> Device:", deviceName, "New state:", newState)

    background: Rectangle {
        color: "#F5F7FA"
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 12

            Image {
                source: "images/home.png"
                width: 32
                height: 32
                fillMode: Image.PreserveAspectFit
            }

            Label {
                text: "Dashboard (" + dashboardPage.deviceCount + " devices)"
                font.pixelSize: 18
                font.bold: true
                Layout.fillWidth: true
            }

            Button {
                text: "Settings"
                onClicked: dashboardPage.StackView.view.push("SettingsPage.qml")
            }
        }
    }

    ListModel {
        id: devicesModel

        ListElement { name: "Living Room Light"; image: "images/light.png"; isOn: true; usage: 65 }
        ListElement { name: "Bedroom Light"; image: "images/light.png"; isOn: false; usage: 20 }
        ListElement { name: "Air Conditioner"; image: "images/ac.png"; isOn: true; usage: 80 }
        ListElement { name: "Fan"; image: "images/fan.png"; isOn: false; usage: 10 }
        ListElement { name: "Garage Door"; image: "images/garage.png"; isOn: false; usage: 5 }
    }

    ScrollView {
        anchors.fill: parent
        anchors.margins: 15
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 18

            Repeater {
                model: devicesModel

                delegate: Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 110

                    radius: 12
                    color: "white"
                    border.color: "#DDDDDD"
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 15
                        spacing: 15

                        Image {
                            source: image
                            Layout.preferredWidth: 48
                            Layout.preferredHeight: 48
                            fillMode: Image.PreserveAspectFit
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 5

                            Label {
                                text: name
                                font.pixelSize: 16
                                font.bold: true
                            }

                            ProgressBar {
                                Layout.fillWidth: true
                                from: 0
                                to: 100
                                value: usage
                            }

                            Label {
                                text: "Usage: " + usage + "%"
                                font.pixelSize: 12
                                color: "#666666"
                            }
                        }

                        Switch {
                            checked: isOn

                            onToggled: {
                                devicesModel.setProperty(index, "isOn", checked)
                                dashboardPage.deviceToggled(name, checked)
                            }
                        }
                    }
                }
            }
        }
    }
}
