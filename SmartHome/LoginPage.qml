import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: loginPage

    background: Rectangle { color: "#F5F7FA" }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20
        width: parent.width * 0.8

        Image {
            source: "images/user.png"
            width: 120
            height: 120
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: "Smart Home Login"
            font.pixelSize: 24
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: usernameField
            placeholderText: "Username"
            Layout.fillWidth: true
        }

        TextField {
            id: passwordField
            placeholderText: "Password"
            echoMode: TextInput.Password
            Layout.fillWidth: true
        }

        Label {
            id: errorLabel
            color: "red"
            visible: false
            text: "Please enter both username and password"
            Layout.alignment: Qt.AlignHCenter
        }

        BusyIndicator {
            id: busyIndicator
            running: false
            visible: running
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            id: loginButton
            text: "Login"
            Layout.fillWidth: true
            enabled: !busyIndicator.running

            onClicked: {
                if (usernameField.text.trim() === "" || passwordField.text.trim() === "") {
                    errorLabel.visible = true
                } else {
                    errorLabel.visible = false
                    busyIndicator.running = true
                    loginTimer.start()
                }
            }
        }
    }

    Timer {
        id: loginTimer
        interval: 2000
        repeat: false
        onTriggered: {
            busyIndicator.running = false
            console.log("Login successful for user:", usernameField.text)
            loginPage.StackView.view.push("DashboardPage.qml")
        }
    }
}
