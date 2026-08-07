import QtQuick
import QtQuick.Window

Window {
    id: window
    width: 500
    height: 620
    visible: true
    title: "Student Info"

    SplashScreen {
        id: splash
        anchors.fill: parent
        visible: true

        onFinished: {
            splash.visible = false
            home.visible = true
        }
    }

    HomeScreen {
        id: home
        anchors.fill: parent
        visible: false
    }
}
