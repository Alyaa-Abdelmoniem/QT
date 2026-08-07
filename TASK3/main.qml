import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: window

    width: 900
    height: 650
    visible: true
    title: "E-Commerce Store"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: splashComponent
    }

    Component {
        id: splashComponent
        SplashScreen {
            onFinished: stackView.replace(homeComponent)
        }
    }

    Component {
        id: homeComponent
        HomePage {}
    }
}
