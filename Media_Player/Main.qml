import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtMultimedia
import media_player

ApplicationWindow {
    id: window

    visible: true
    width: 960
    height: 640

    minimumWidth: 760
    minimumHeight: 520

    title: "Media Player"
    color: "#0F1115"

    property var audioFiles: []
    property var videoFiles: []

    property string clockText:
        Qt.formatTime(new Date(), "hh:mm")


    // =========================================================
    // APP ICON
    // =========================================================

    component AppIcon: Canvas {
        id: canvas

        property color iconColor: "#EDEFF3"
        property string iconName: "play"

        onIconColorChanged: requestPaint()
        onIconNameChanged: requestPaint()
        onWidthChanged: requestPaint()
        onHeightChanged: requestPaint()

        onPaint: {
            var ctx = getContext("2d")

            ctx.clearRect(0, 0, width, height)

            ctx.fillStyle = iconColor
            ctx.strokeStyle = iconColor
            ctx.lineWidth = Math.max(1.4, width * 0.09)

            var w = width
            var h = height

            if (iconName === "play") {

                ctx.beginPath()
                ctx.moveTo(w * 0.28, h * 0.18)
                ctx.lineTo(w * 0.28, h * 0.82)
                ctx.lineTo(w * 0.82, h * 0.5)
                ctx.closePath()
                ctx.fill()

            } else if (iconName === "pause") {

                ctx.fillRect(
                    w * 0.26,
                    h * 0.18,
                    w * 0.18,
                    h * 0.64
                )

                ctx.fillRect(
                    w * 0.56,
                    h * 0.18,
                    w * 0.18,
                    h * 0.64
                )

            } else if (iconName === "prev") {

                ctx.beginPath()
                ctx.moveTo(w * 0.72, h * 0.18)
                ctx.lineTo(w * 0.72, h * 0.82)
                ctx.lineTo(w * 0.30, h * 0.5)
                ctx.closePath()
                ctx.fill()

                ctx.fillRect(
                    w * 0.18,
                    h * 0.18,
                    w * 0.08,
                    h * 0.64
                )

            } else if (iconName === "next") {

                ctx.beginPath()
                ctx.moveTo(w * 0.28, h * 0.18)
                ctx.lineTo(w * 0.28, h * 0.82)
                ctx.lineTo(w * 0.70, h * 0.5)
                ctx.closePath()
                ctx.fill()

                ctx.fillRect(
                    w * 0.74,
                    h * 0.18,
                    w * 0.08,
                    h * 0.64
                )

            } else if (iconName === "speaker") {

                ctx.beginPath()
                ctx.moveTo(w * 0.14, h * 0.38)
                ctx.lineTo(w * 0.34, h * 0.38)
                ctx.lineTo(w * 0.54, h * 0.20)
                ctx.lineTo(w * 0.54, h * 0.80)
                ctx.lineTo(w * 0.34, h * 0.62)
                ctx.lineTo(w * 0.14, h * 0.62)
                ctx.closePath()
                ctx.fill()

                ctx.beginPath()
                ctx.arc(
                    w * 0.60,
                    h * 0.5,
                    w * 0.14,
                    -0.6,
                    0.6
                )
                ctx.stroke()

                ctx.beginPath()
                ctx.arc(
                    w * 0.60,
                    h * 0.5,
                    w * 0.24,
                    -0.7,
                    0.7
                )
                ctx.stroke()

            } else if (iconName === "mute") {

                ctx.beginPath()
                ctx.moveTo(w * 0.14, h * 0.38)
                ctx.lineTo(w * 0.34, h * 0.38)
                ctx.lineTo(w * 0.54, h * 0.20)
                ctx.lineTo(w * 0.54, h * 0.80)
                ctx.lineTo(w * 0.34, h * 0.62)
                ctx.lineTo(w * 0.14, h * 0.62)
                ctx.closePath()
                ctx.fill()

                ctx.beginPath()
                ctx.moveTo(w * 0.64, h * 0.36)
                ctx.lineTo(w * 0.84, h * 0.64)
                ctx.moveTo(w * 0.84, h * 0.36)
                ctx.lineTo(w * 0.64, h * 0.64)
                ctx.stroke()

            } else if (iconName === "folder") {

                ctx.beginPath()
                ctx.moveTo(w * 0.14, h * 0.30)
                ctx.lineTo(w * 0.40, h * 0.30)
                ctx.lineTo(w * 0.48, h * 0.40)
                ctx.lineTo(w * 0.86, h * 0.40)
                ctx.lineTo(w * 0.86, h * 0.76)
                ctx.lineTo(w * 0.14, h * 0.76)
                ctx.closePath()
                ctx.fill()

            } else if (iconName === "usb") {

                ctx.fillRect(
                    w * 0.44,
                    h * 0.14,
                    w * 0.12,
                    h * 0.38
                )

                ctx.beginPath()
                ctx.arc(
                    w * 0.5,
                    h * 0.60,
                    w * 0.14,
                    0,
                    Math.PI * 2
                )
                ctx.fill()

                ctx.beginPath()
                ctx.moveTo(w * 0.5, h * 0.60)
                ctx.lineTo(w * 0.24, h * 0.80)
                ctx.moveTo(w * 0.5, h * 0.60)
                ctx.lineTo(w * 0.76, h * 0.80)
                ctx.stroke()

                ctx.beginPath()
                ctx.arc(
                    w * 0.24,
                    h * 0.84,
                    w * 0.05,
                    0,
                    Math.PI * 2
                )
                ctx.fill()

                ctx.beginPath()
                ctx.arc(
                    w * 0.76,
                    h * 0.84,
                    w * 0.05,
                    0,
                    Math.PI * 2
                )
                ctx.fill()

            } else if (iconName === "radio") {

                ctx.beginPath()
                ctx.arc(
                    w * 0.5,
                    h * 0.5,
                    w * 0.10,
                    0,
                    Math.PI * 2
                )
                ctx.fill()

                ctx.beginPath()
                ctx.arc(
                    w * 0.5,
                    h * 0.5,
                    w * 0.24,
                    -0.9,
                    0.9
                )
                ctx.stroke()

                ctx.beginPath()
                ctx.arc(
                    w * 0.5,
                    h * 0.5,
                    w * 0.36,
                    -0.9,
                    0.9
                )
                ctx.stroke()

                ctx.beginPath()
                ctx.arc(
                    w * 0.5,
                    h * 0.5,
                    w * 0.24,
                    Math.PI - 0.9,
                    Math.PI + 0.9
                )
                ctx.stroke()

                ctx.beginPath()
                ctx.arc(
                    w * 0.5,
                    h * 0.5,
                    w * 0.36,
                    Math.PI - 0.9,
                    Math.PI + 0.9
                )
                ctx.stroke()

            } else if (iconName === "bluetooth") {

                ctx.beginPath()

                ctx.moveTo(w * 0.5, h * 0.16)
                ctx.lineTo(w * 0.72, h * 0.34)
                ctx.lineTo(w * 0.5, h * 0.5)
                ctx.lineTo(w * 0.72, h * 0.66)
                ctx.lineTo(w * 0.5, h * 0.84)
                ctx.lineTo(w * 0.5, h * 0.16)

                ctx.moveTo(w * 0.30, h * 0.34)
                ctx.lineTo(w * 0.70, h * 0.66)

                ctx.moveTo(w * 0.30, h * 0.66)
                ctx.lineTo(w * 0.70, h * 0.34)

                ctx.stroke()

            } else if (iconName === "video") {

                ctx.fillRect(
                    w * 0.14,
                    h * 0.28,
                    w * 0.48,
                    h * 0.44
                )

                ctx.beginPath()
                ctx.moveTo(w * 0.66, h * 0.38)
                ctx.lineTo(w * 0.86, h * 0.28)
                ctx.lineTo(w * 0.86, h * 0.72)
                ctx.lineTo(w * 0.66, h * 0.62)
                ctx.closePath()
                ctx.fill()
            }
        }
    }


    // =========================================================
    // APP BUTTON
    // =========================================================

    component AppButton: Rectangle {

        id: btn

        property string iconName: ""
        property string label: ""
        property bool active: false
        property bool primary: false

        signal clicked()

        implicitHeight: 44
        implicitWidth: content.implicitWidth + 28

        radius: height / 2

        color:
            primary
            ? (mouseArea.pressed ? "#279E99" : "#32C7C0")
            : (mouseArea.pressed
               ? "#2E3542"
               : (active ? "#262C37" : "#1B1F27"))

        border.width: 1

        border.color:
            primary
            ? "#1F8F89"
            : (active ? "#32C7C0" : "#2A303C")

        Row {

            id: content

            anchors.centerIn: parent

            spacing: 8

            AppIcon {

                width: 18
                height: 18

                iconName: btn.iconName

                iconColor:
                    btn.primary
                    ? "#0F1115"
                    : (btn.active
                       ? "#32C7C0"
                       : "#EDEFF3")

                visible: btn.iconName !== ""
            }

            Text {

                text: btn.label

                visible: btn.label !== ""

                color:
                    btn.primary
                    ? "#0F1115"
                    : (btn.active
                       ? "#EDEFF3"
                       : "#8A93A3")

                font.pixelSize: 14
                font.weight: Font.DemiBold
            }
        }

        MouseArea {

            id: mouseArea

            anchors.fill: parent

            hoverEnabled: true

            onClicked: {
                btn.clicked()
            }
        }
    }


    // =========================================================
    // ROUND BUTTON
    // =========================================================

    component RoundIconButton: Rectangle {

        id: rbtn

        property string iconName: ""
        property bool primary: false

        signal clicked()

        implicitWidth: primary ? 64 : 46
        implicitHeight: implicitWidth

        radius: width / 2

        color:
            primary
            ? (mArea.pressed ? "#279E99" : "#32C7C0")
            : (mArea.pressed ? "#2E3542" : "#20242D")

        border.width: 1

        border.color:
            primary
            ? "#1F8F89"
            : "#2A303C"

        scale: mArea.pressed ? 0.94 : 1.0

        Behavior on scale {
            NumberAnimation {
                duration: 90
            }
        }

        AppIcon {

            anchors.centerIn: parent

            width: rbtn.primary ? 24 : 18
            height: width

            iconName: rbtn.iconName

            iconColor:
                rbtn.primary
                ? "#0F1115"
                : "#EDEFF3"
        }

        MouseArea {

            id: mArea

            anchors.fill: parent

            onClicked: {
                rbtn.clicked()
            }
        }
    }


    // =========================================================
    // SOURCE TAB
    // =========================================================

    component SourceTab: Item {

        id: tab

        property string iconName: ""
        property string label: ""
        property bool active: false

        signal clicked()

        implicitWidth: 84
        implicitHeight: 60

        Column {

            anchors.centerIn: parent

            spacing: 6

            AppIcon {

                anchors.horizontalCenter:
                    parent.horizontalCenter

                width: 20
                height: 20

                iconName: tab.iconName

                iconColor:
                    tab.active
                    ? "#32C7C0"
                    : "#8A93A3"
            }

            Text {

                anchors.horizontalCenter:
                    parent.horizontalCenter

                text: tab.label

                font.pixelSize: 11
                font.weight: Font.Medium

                color:
                    tab.active
                    ? "#EDEFF3"
                    : "#8A93A3"
            }
        }

        Rectangle {

            anchors.bottom: parent.bottom

            anchors.horizontalCenter:
                parent.horizontalCenter

            width: 28
            height: 3

            radius: 2

            color: "#32C7C0"

            visible: tab.active
        }

        MouseArea {

            anchors.fill: parent

            onClicked: {
                tab.clicked()
            }
        }
    }


    // =========================================================
    // FUNCTIONS
    // =========================================================

    function formatTime(ms) {

        if (!ms || ms < 0)
            ms = 0

        var totalSec = Math.floor(ms / 1000)

        var m = Math.floor(totalSec / 60)
        var s = totalSec % 60

        return (m < 10 ? "0" : "") + m +
               ":" +
               (s < 10 ? "0" : "") + s
    }


    // =========================================================
    // CLOCK
    // =========================================================

    Timer {

        interval: 15000

        running: true
        repeat: true

        onTriggered: {

            window.clockText =
                Qt.formatTime(
                    new Date(),
                    "hh:mm"
                )
        }
    }


    // =========================================================
    // FOLDER DIALOG
    // =========================================================

    FolderDialog {

        id: folderDialog

        title: "Choose Media Folder"

        onAccepted: {

            MediaController.setMediaFolder(
                selectedFolder
            )

            window.audioFiles =
                MediaController.getAudioPlaylist()

            window.videoFiles =
                MediaController.getVideoPlaylist()
        }
    }


    // =========================================================
    // USB DIALOG
    // =========================================================

    FolderDialog {

        id: usbFolderDialog

        title: "Choose USB Drive"

        onAccepted: {

            MediaController.setUsbFolder(
                selectedFolder
            )

            window.audioFiles =
                MediaController.getAudioPlaylist()

            window.videoFiles =
                MediaController.getVideoPlaylist()
        }
    }


    // =========================================================
    // MEDIA CONNECTION
    // =========================================================

    Connections {

        target: MediaController

        function onPlaylistChanged() {

            window.audioFiles =
                MediaController.getAudioPlaylist()

            window.videoFiles =
                MediaController.getVideoPlaylist()
        }

        function onErrorOccurred(message) {

            console.log(
                "Media Error:",
                message
            )
        }
    }


    // =========================================================
    // RADIO CONNECTION
    // =========================================================

    Connections {

        target: RadioController

        function onErrorOccurred(message) {

            console.log(
                "Radio Error:",
                message
            )
        }
    }


    // =========================================================
    // BLUETOOTH CONNECTION
    // =========================================================

    Connections {

        target: BluetoothController

        function onErrorOccurred(message) {

            console.log(
                "Bluetooth Error:",
                message
            )
        }
    }


    // =========================================================
    // BLUETOOTH POPUP
    // =========================================================

    Popup {

        id: bluetoothPopup

        width: 340
        height: 380

        anchors.centerIn: parent

        modal: true
        focus: true

        background: Rectangle {

            color: "#171B22"

            radius: 16

            border.width: 1
            border.color: "#2A303C"
        }

        contentItem: ColumnLayout {

            anchors.fill: parent

            anchors.margins: 18

            spacing: 14

            RowLayout {

                Layout.fillWidth: true

                spacing: 8

                AppIcon {

                    width: 20
                    height: 20

                    iconName: "bluetooth"

                    iconColor: "#32C7C0"
                }

                Text {

                    text: "Bluetooth devices"

                    color: "#EDEFF3"

                    font.pixelSize: 16
                    font.weight: Font.DemiBold

                    Layout.fillWidth: true
                }
            }

            AppButton {

                Layout.fillWidth: true

                label: "Scan for devices"

                iconName: "bluetooth"

                onClicked: {

                    BluetoothController.startScan()
                }
            }

            ListView {

                Layout.fillWidth: true
                Layout.fillHeight: true

                spacing: 6

                clip: true

                model:
                    BluetoothController.availableDevices

                delegate: Rectangle {

                    width:
                        ListView.view.width

                    height: 46

                    radius: 10

                    color: "#20242D"

                    border.width: 1
                    border.color: "#2A303C"

                    RowLayout {

                        anchors.fill: parent

                        anchors.margins: 10

                        spacing: 10

                        AppIcon {

                            width: 16
                            height: 16

                            iconName: "bluetooth"

                            iconColor: "#8A93A3"
                        }

                        Text {

                            text: modelData

                            color: "#EDEFF3"

                            font.pixelSize: 13

                            Layout.fillWidth: true
                        }
                    }

                    MouseArea {

                        anchors.fill: parent

                        onClicked: {

                            BluetoothController
                                .connectToDevice(
                                    modelData
                                )

                            bluetoothPopup.close()
                        }
                    }
                }
            }

            Text {

                visible:
                    BluetoothController.isConnected

                text:
                    "Connected: " +
                    BluetoothController
                        .connectedDeviceName

                color: "#32C7C0"

                font.pixelSize: 12
            }

            AppButton {

                Layout.fillWidth: true

                visible:
                    BluetoothController.isConnected

                label: "Disconnect"

                onClicked: {

                    BluetoothController
                        .disconnectDevice()
                }
            }
        }
    }


    // =========================================================
    // MAIN UI
    // =========================================================

    ColumnLayout {

        anchors.fill: parent

        anchors.margins: 24

        spacing: 16


        // HEADER

        RowLayout {

            Layout.fillWidth: true

            Layout.preferredHeight: 30

            Row {

                spacing: 10

                Rectangle {

                    width: 8
                    height: 8

                    radius: 4

                    color: "#32C7C0"

                    anchors.verticalCenter:
                        parent.verticalCenter
                }

                Text {

                    text: "MEDIA"

                    color: "#EDEFF3"

                    font.pixelSize: 15
                    font.weight: Font.Bold
                    font.letterSpacing: 2

                    anchors.verticalCenter:
                        parent.verticalCenter
                }

                Rectangle {

                    width:
                        iviLabel.implicitWidth + 16

                    height: 20

                    radius: 10

                    color: "transparent"

                    border.width: 1
                    border.color: "#2A303C"

                    anchors.verticalCenter:
                        parent.verticalCenter

                    Text {

                        id: iviLabel

                        anchors.centerIn: parent

                        text: "IVI"

                        color: "#8A93A3"

                        font.pixelSize: 10
                        font.weight: Font.DemiBold
                    }
                }
            }

            Item {

                Layout.fillWidth: true
            }

            Text {

                text: window.clockText

                color: "#8A93A3"

                font.pixelSize: 13
                font.weight: Font.Medium
            }
        }


        Rectangle {

            Layout.fillWidth: true

            height: 1

            color: "#20242D"
        }


        // MEDIA SCREEN

        Rectangle {

            Layout.fillWidth: true
            Layout.fillHeight: true

            radius: 20

            color: "#1B1F27"

            border.width: 1
            border.color: "#242A34"


            // VIDEO AREA

            Rectangle {

                anchors.fill: parent

                anchors.margins: 14

                radius: 14

                color: "#0B0C10"

                border.width: 1
                border.color: "#242A34"

                visible:
                    MediaController.mediaType ===
                    MediaController.Video

                VideoOutput {

                    id: videoOutput

                    anchors.fill: parent

                    Component.onCompleted: {

                        MediaController
                            .setVideoOutput(
                                videoOutput
                            )
                    }
                }

                Rectangle {

                    anchors.fill: parent

                    radius: 14

                    color: "#000000"

                    opacity:
                        MediaController.playing
                        ? 0
                        : 0.55

                    visible:
                        !MediaController.playing
                }

                Column {

                    anchors.centerIn: parent

                    spacing: 10

                    visible:
                        !MediaController.playing

                    AppIcon {

                        anchors.horizontalCenter:
                            parent.horizontalCenter

                        width: 34
                        height: 34

                        iconName: "video"

                        iconColor: "#8A93A3"
                    }

                    Text {

                        anchors.horizontalCenter:
                            parent.horizontalCenter

                        text:
                            window.videoFiles.length > 0
                            ? "Video ready"
                            : "No video selected"

                        color: "#8A93A3"

                        font.pixelSize: 14
                    }
                }
            }


            // AUDIO AREA

            Column {

                anchors.centerIn: parent

                spacing: 18

                visible:
                    MediaController.mediaType ===
                    MediaController.Audio

                Rectangle {

                    anchors.horizontalCenter:
                        parent.horizontalCenter

                    width: 96
                    height: 96

                    radius: 48

                    color: "#20242D"

                    border.width: 1
                    border.color: "#2A303C"

                    AppIcon {

                        anchors.centerIn: parent

                        width: 38
                        height: 38

                        iconName: "folder"

                        iconColor: "#32C7C0"
                    }
                }

                Text {

                    anchors.horizontalCenter:
                        parent.horizontalCenter

                    text:
                        window.audioFiles.length > 0
                        ? "Local audio"
                        : "No audio selected"

                    color: "#EDEFF3"

                    font.pixelSize: 18

                    font.weight:
                        Font.DemiBold
                }

                Text {

                    anchors.horizontalCenter:
                        parent.horizontalCenter

                    text:
                        window.audioFiles.length > 0
                        ? window.audioFiles.length +
                          " tracks"
                        : ""

                    color: "#8A93A3"

                    font.pixelSize: 13
                }
            }


            // RADIO INFO

            Rectangle {

                visible:
                    RadioController.isOn

                anchors.top: parent.top
                anchors.right: parent.right

                anchors.margins: 16

                width:
                    freqCol.implicitWidth + 28

                height: 52

                radius: 10

                color: "#12151B"

                border.width: 1
                border.color: "#2A303C"

                Column {

                    id: freqCol

                    anchors.centerIn: parent

                    spacing: 2

                    Text {

                        text:
                            RadioController.frequency
                                .toFixed(1) +
                            " MHz"

                        color: "#32C7C0"

                        font.pixelSize: 20

                        font.weight:
                            Font.Bold

                        font.letterSpacing: 1
                    }

                    Text {

                        text: "FM RADIO"

                        color: "#8A93A3"

                        font.pixelSize: 9

                        font.letterSpacing: 2
                    }
                }
            }
        }


        // PROGRESS BAR

        RowLayout {

            Layout.fillWidth: true

            spacing: 10

            Text {

                text:
                    window.formatTime(
                        MediaController.position
                    )

                color: "#8A93A3"

                font.pixelSize: 12
            }

            Rectangle {

                Layout.fillWidth: true

                height: 4

                radius: 2

                color: "#242A34"

                Rectangle {

                    height: parent.height

                    radius: 2

                    width:
                        MediaController.duration > 0
                        ? parent.width *
                          (
                              MediaController.position /
                              MediaController.duration
                          )
                        : 0

                    color: "#32C7C0"
                }
            }

            Text {

                text:
                    window.formatTime(
                        MediaController.duration
                    )

                color: "#8A93A3"

                font.pixelSize: 12
            }
        }


        // TRANSPORT BUTTONS

        Rectangle {

            Layout.alignment:
                Qt.AlignHCenter

            width:
                transportRow.implicitWidth + 32

            height: 76

            radius: 38

            color: "#171B22"

            border.width: 1
            border.color: "#242A34"

            Row {

                id: transportRow

                anchors.centerIn: parent

                spacing: 16

                RoundIconButton {

                    iconName: "prev"

                    onClicked: {

                        MediaController.previous()
                    }
                }

                RoundIconButton {

                    iconName:
                        MediaController.playing
                        ? "pause"
                        : "play"

                    primary: true

                    onClicked: {

                        if (MediaController.playing)
                            MediaController.pause()
                        else
                            MediaController.play()
                    }
                }

                RoundIconButton {

                    iconName: "next"

                    onClicked: {

                        MediaController.next()
                    }
                }

                RoundIconButton {

                    iconName:
                        MediaController.muted
                        ? "mute"
                        : "speaker"

                    onClicked: {

                        MediaController.setMuted(
                            !MediaController.muted
                        )
                    }
                }
            }
        }


        // RADIO SEEK

        RowLayout {

            Layout.alignment:
                Qt.AlignHCenter

            spacing: 12

            visible:
                RadioController.isOn

            RoundIconButton {

                iconName: "prev"

                onClicked: {

                    RadioController.seekDown()
                }
            }

            Text {

                text: "SEEK"

                color: "#8A93A3"

                font.pixelSize: 11

                font.letterSpacing: 2

                Layout.alignment:
                    Qt.AlignVCenter
            }

            RoundIconButton {

                iconName: "next"

                onClicked: {

                    RadioController.seekUp()
                }
            }
        }


        // SOURCE TABS

        RowLayout {

            Layout.alignment:
                Qt.AlignHCenter

            spacing: 4

            SourceTab {

                iconName: "folder"

                label: "Local"

                onClicked: {

                    folderDialog.open()
                }
            }

            SourceTab {

                iconName: "usb"

                label: "USB"

                onClicked: {

                    usbFolderDialog.open()
                }
            }

            SourceTab {

                iconName: "radio"

                label: "Radio"

                active:
                    RadioController.isOn

                onClicked: {

                    if (RadioController.isOn)
                        RadioController.turnOff()
                    else
                        RadioController.turnOn()
                }
            }

            SourceTab {

                iconName: "bluetooth"

                label: "Bluetooth"

                active:
                    BluetoothController.isConnected

                onClicked: {

                    if (!BluetoothController.isEnabled)
                        BluetoothController.enable()

                    bluetoothPopup.open()
                }
            }

            SourceTab {

                iconName: "video"

                label: "Video"

                active:
                    MediaController.mediaType ===
                    MediaController.Video

                onClicked: {

                    MediaController.setMediaType(
                        MediaController.Video
                    )

                    window.videoFiles =
                        MediaController
                            .getVideoPlaylist()
                }
            }
        }
    }
}
