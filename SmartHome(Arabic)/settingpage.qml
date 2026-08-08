import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: settingsPage
    title: Translator.t("settings_title")

    background: Rectangle { color: "#F5F7FA" }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            anchors.margins: 8

            Button {
                text: "← " + Translator.t("back")
                onClicked: settingsPage.StackView.view.pop()
            }

            Label {
                text: Translator.t("settings_title")
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

            Label { text: Translator.t("app_language"); font.bold: true }

            ComboBox {
                id: languageCombo
                Layout.fillWidth: true
                model: [Translator.t("english"), Translator.t("arabic"), Translator.t("french"), Translator.t("german")]

                Component.onCompleted: {
                    currentIndex = (Translator.language === "ar") ? 1 : 0
                }

                onActivated: {
                    console.log("Language changed to:", currentText)
                    if (currentIndex === 0) {
                        Translator.language = "en"
                    } else if (currentIndex === 1) {
                        Translator.language = "ar"
                    }
                }
            }

            Label { text: Translator.t("screen_brightness"); font.bold: true }

            Slider {
                id: brightnessSlider
                Layout.fillWidth: true
                from: 0
                to: 100
                value: 70
                onValueChanged: console.log("Brightness set to:", Math.round(value), "%")
            }

            Label { text: Translator.t("room_temperature"); font.bold: true }

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
                text: Translator.t("enable_notifications")
                checked: true
                onToggled: console.log("Notifications", checked ? "enabled" : "disabled")
            }

            Button {
                text: Translator.t("save_settings")
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
