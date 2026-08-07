import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: settingsPage
    title: "Settings"

    background: Rectangle { color: "#F5F7FA" }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            anchors.margins: 8

            Button {
                text: "← Back"
                onClicked: settingsPage.StackView.view.pop()
            }

            Label {
                text: "Settings"
                font.pixelSize: 18
                font.bold: true
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    ScrollView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true

        ColumnLayout {
            width: settingsPage.width - 40
            spacing: 25

            Label { text: "Application Language"; font.bold: true }

            ComboBox {
                id: languageCombo
                Layout.fillWidth: true
                model: ["English", "Arabic", "French", "German"]
                onActivated: console.log("Language changed to:", currentText)
            }

            Label { text: "Screen Brightness"; font.bold: true }

            Slider {
                id: brightnessSlider
                Layout.fillWidth: true
                from: 0
                to: 100
                value: 70
                onValueChanged: console.log("Brightness set to:", Math.round(value), "%")
            }

            Label { text: "Room Temperature"; font.bold: true }

            Dial {
                id: temperatureDial
                Layout.alignment: Qt.AlignHCenter
                width: 150
                height: 150
                from: 16
                to: 30
                value: 22
                onValueChanged: console.log("Temperature set to:", Math.round(value), "°C")
            }

            Label {
                text: Math.round(temperatureDial.value) + " °C"
                Layout.alignment: Qt.AlignHCenter
                color: "#666666"
            }

            CheckBox {
                id: notificationsCheck
                text: "Enable Notifications"
                checked: true
                onToggled: console.log("Notifications", checked ? "enabled" : "disabled")
            }

            Button {
                text: "Save Settings"
                Layout.fillWidth: true
                onClicked: {
                    console.log("Settings saved:")
                    console.log(" Language:", languageCombo.currentText)
                    console.log(" Brightness:", Math.round(brightnessSlider.value))
                    console.log(" Temperature:", Math.round(temperatureDial.value))
                    console.log(" Notifications:", notificationsCheck.checked)
                }
            }
        }
    }
}
