import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: window
    width: 420
    height: 720
    visible: true
    title: "Smart Home Dashboard"

    LayoutMirroring.enabled: Translator.isRtl
    LayoutMirroring.childrenInherit: true

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: LoginPage {}
    }
}
