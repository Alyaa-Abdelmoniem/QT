# Media Player

## Project Overview

A Media Player application developed using Qt, QML, and C++.

The project follows a separation between the User Interface and the application logic:

- QML is responsible for the UI and user interaction.
- C++ is responsible for the application logic.
- Controllers provide communication between QML and C++.
- Signals are used to notify QML when data changes.
- Q_PROPERTY is used to expose C++ properties to QML.
- Q_INVOKABLE is used to allow QML to call C++ functions.

---

## Project Structure

```text
media_player/
│
├── CMakeLists.txt
│
└── appmedia_player/
    │
    ├── Header Files/
    │   ├── BluetoothController.h
    │   ├── LocalMedia.h
    │   ├── MediaController.h
    │   ├── player.h
    │   ├── RadioController.h
    │   └── videoplayer.h
    │
    ├── Source Files/
    │   ├── BluetoothController.cpp
    │   ├── LocalMedia.cpp
    │   ├── main.cpp
    │   ├── Main.qml
    │   ├── MediaController.cpp
    │   ├── player.cpp
    │   ├── RadioController.cpp
    │   └── videoplayer.cpp
    │
    └── <Build Directory>/

CMakeLists.txt

The CMakeLists.txt file is responsible for configuring and building the project.

It defines:

* Project name.
* C++ version.
* Required Qt modules.
* C++ source files.
* Header files.
* QML files.
* Resources.
* QML module configuration.

⸻

Header Files

Header files contain the class declarations and define the structure of each class.

They contain:

* Properties.
* Functions.
* Signals.
* Member variables.
* Enums.
* Qt macros.

⸻

BluetoothController.h

Defines the Bluetooth controller.

Responsibilities:

* Enable Bluetooth.
* Disable Bluetooth.
* Scan for available devices.
* Connect to a device.
* Disconnect from a device.
* Get the Bluetooth state.
* Get the connection state.
* Get the connected device name.
* Get the available devices.

Important Qt macros:
Q_OBJECT
QML_ELEMENT
QML_SINGLETON
Q_OBJECT enables Qt’s meta-object system, including signals and properties.

QML_ELEMENT exposes the class to QML.

QML_SINGLETON allows QML to use a single instance of the controller.

⸻

LocalMedia.h

Defines the local media manager.

Responsibilities:

* Set a local media folder.
* Set a USB folder.
* Search for audio files.
* Search for video files.
* Create audio playlists.
* Create video playlists.
* Notify the application when playlists change.

Basic flow:
Media Files
    │
    ▼
LocalMedia
    │
    ├── Audio Playlist
    │
    └── Video Playlist
MediaController.h

Defines the main media controller.

It acts as the communication layer between QML and the audio/video players.

Responsibilities:

* Play.
* Pause.
* Next.
* Previous.
* Volume control.
* Mute control.
* Position.
* Duration.
* Playback state.
* Audio/Video selection.
* Playlist management.
* Video output.

Important properties include:
position
duration
volume
muted
mediaType
playbackState
playing

Functions exposed to QML use:
Q_INVOKABLE
player.h

Defines the audio player.

Responsibilities:

* Audio playback.
* Play.
* Pause.
* Next.
* Previous.
* Volume.
* Mute.
* Position.
* Duration.
* Playback state.
* Playlist management.

⸻

RadioController.h

Defines the radio controller.

Responsibilities:

* Turn the radio on.
* Turn the radio off.
* Increase frequency.
* Decrease frequency.
* Get the current frequency.
* Get the radio state.

Frequency range:
87.5 MHz - 108.0 MHz

videoplayer.h

Defines the video player.

Responsibilities:

* Video playback.
* Play.
* Pause.
* Next.
* Previous.
* Volume.
* Mute.
* Position.
* Duration.
* Playback state.
* Playlist management.
* Video output.

⸻

Source Files

Source files contain the implementation of the classes declared in the header files.
BluetoothController.cpp

Implements the Bluetooth controller.

Main functions:
enable()
disable()
startScan()
connectToDevice()
disconnectDevice()
The controller keeps track of:
Bluetooth state
Connection state
Connected device
Available devices
Scanning state
The current device scan uses predefined device names for simulation:
Car Headset
John's Phone
Office Speaker
This means the current implementation simulates Bluetooth scanning instead of performing a real hardware Bluetooth scan.

⸻

LocalMedia.cpp

Implements the local media manager.

It handles media files from:
Local Folder
USB Folder
It searches for:
Audio Files
Video Files

Then creates:
Audio Playlist
Video Playlist

main.cpp

The entry point of the application.

It creates the Qt application:
QGuiApplication app(argc, argv);
Then creates the QML engine:
QQmlApplicationEngine engine;

The QML engine loads the main QML module:
engine.loadFromModule("media_player", "Main");

Finally, the application starts the event loop:
return app.exec();
# MediaController.cpp

Implements the main Media Controller.

It manages three main components:

- Audio Player.
- Video Player.
- LocalMedia.

The main objects are:

- m_audioPlayer
- m_videoPlayer
- m_localMedia

The MediaController decides whether commands should be sent to the Audio Player or the Video Player depending on the current media type.

## setMediaType()

Changes the current media type between:

- Audio.
- Video.

The selected media type determines which player receives the commands.

It also emits the required change signals so the QML interface can update.

## play()

If the current media type is Audio, the command is sent to the Audio Player.

If the current media type is Video, the command is sent to the Video Player.

Flow:

QML
|
v
MediaController.play()
|
+-- Audio --> Audio Player
|
+-- Video --> Video Player

## pause()

Pauses the currently selected media player.

If the current media type is Audio, it pauses the Audio Player.

If the current media type is Video, it pauses the Video Player.

## next()

Moves to the next item in the current playlist.

The command is sent to either the Audio Player or Video Player depending on the current media type.

## previous()

Moves to the previous item in the current playlist.

The command is sent to either the Audio Player or Video Player.

## setVolume()

Changes the volume of the currently selected player.

The volume command is sent to the Audio Player or Video Player depending on the current media type.

## setMuted()

Mutes or unmutes the currently selected media player.

## setMediaFolder()

Sets the local media folder.

The folder is passed to LocalMedia.

LocalMedia searches the folder and creates the audio and video playlists.

Then the playlists are passed to the corresponding players.

Flow:

Media Folder
     |
     v
LocalMedia
     |
 +---+---+
 |       |
 v       v
Audio   Video
List    List
 |       |
 v       v
Player  VideoPlayer

## setUsbFolder()

Sets the USB media folder.

LocalMedia searches the USB folder for audio and video files.

Then the playlists are updated and sent to the corresponding players.

## setVideoOutput()

Connects the Video Player to the video output object received from QML.

This allows the video to be displayed inside the QML interface.

## getAudioPlaylist()

Returns the current audio playlist from LocalMedia.

## getVideoPlaylist()

Returns the current video playlist from LocalMedia.

## position()

Returns the current playback position.

If the current media type is Audio, it gets the position from the Audio Player.

If the current media type is Video, it gets the position from the Video Player.

## duration()

Returns the total duration of the current media.

The duration is taken from the currently selected player.

## volume()

Returns the current volume of the selected player.

## isMuted()

Returns whether the selected player is muted.

Possible results:

- true means muted.
- false means not muted.

## playbackState()

Returns the current playback state of the selected player.

The state is converted to an integer using static_cast<int>().

## isPlaying()

Checks whether the current media is playing.

It compares the current playback state with QMediaPlayer::PlayingState.

If they match, the function returns true.

Otherwise, it returns false.

## connect()

The connect() function is very important in the MediaController.

It connects signals from the Audio Player, Video Player, and LocalMedia to the MediaController.

Example flow:

Audio Player
     |
     | positionChanged
     v
MediaController
     |
     | positionChanged
     v
QML
     |
     v
UI Update

The same mechanism is used for:

- positionChanged.
- durationChanged.
- volumeChanged.
- mutedChanged.
- playbackStateChanged.
- errorOccurred.
- playlistChanged.

This allows changes inside the C++ backend to reach the QML interface.

# player.cpp

Implements the Audio Player.

It is responsible for the actual audio playback logic.

Main responsibilities:

- Play.
- Pause.
- Next.
- Previous.
- Volume.
- Mute.
- Position.
- Duration.
- Playlist.
- Playback state.

# RadioController.cpp

Implements the Radio Controller.

Main functions:

- turnOn()
- turnOff()
- seekUp()
- seekDown()

The initial frequency is:

97.5 MHz.

seekUp() increases the frequency by 0.1 MHz.

seekDown() decreases the frequency by 0.1 MHz.

The frequency range is:

87.5 MHz to 108.0 MHz.

If the frequency goes above 108.0 MHz, it returns to 87.5 MHz.

If the frequency goes below 87.5 MHz, it returns to 108.0 MHz.

This creates a continuous frequency loop.

# videoplayer.cpp

Implements the Video Player.

It is responsible for the actual video playback logic.

Main responsibilities:

- Play.
- Pause.
- Next.
- Previous.
- Volume.
- Mute.
- Position.
- Duration.
- Playlist.
- Playback state.
- Video output.

It uses Qt Multimedia functionality for video playback.

# Main.qml

Main.qml is responsible for the application's User Interface.

It contains the visual part of the application and handles user interaction.

The QML interface communicates with the C++ Controllers.

The main communication mechanisms are:

- QML_ELEMENT.
- QML_SINGLETON.
- Q_PROPERTY.
- Q_INVOKABLE.
- Signals.

Example flow:

User presses Play
       |
       v
     QML
       |
       v
MediaController.play()
       |
       v
AudioPlayer / VideoPlayer
       |
       v
Media starts playing

QML handles the interface while C++ handles the application logic.

# Communication Between QML and C++

## Q_PROPERTY

Q_PROPERTY exposes C++ properties to QML.

Examples:

- position.
- duration.
- volume.
- muted.
- mediaType.
- playbackState.
- playing.

This allows QML to read the current state of the application.

## Q_INVOKABLE

Q_INVOKABLE allows QML to call functions implemented in C++.

Examples:

- play().
- pause().
- next().
- previous().
- setVolume().
- setMuted().
- turnOn().
- turnOff().

## Signals

Signals are used by C++ to notify QML when something changes.

Examples:

- positionChanged.
- durationChanged.
- volumeChanged.
- mutedChanged.
- playbackStateChanged.
- mediaTypeChanged.
- playlistChanged.
- errorOccurred.
- isOnChanged.
- isConnectedChanged.

Basic flow:

C++ Object
    |
    v
Signal
    |
    v
Controller
    |
    v
QML
    |
    v
UI Update

# Overall Application Flow

main.cpp
    |
    v
QML Application
    |
    v
Main.qml
    |
    +-----------------+-----------------+
    |                 |                 |
    v                 v                 v
MediaController  RadioController  BluetoothController
    |
    +---+---+
    |       |
    v       v
 Player  VideoPlayer
    |       |
    +---+---+
        |
        v
    LocalMedia
        |
    +---+---+
    |       |
    v       v
Local Files USB Files

# Important Files

main.cpp
    Application entry point

Main.qml
    User Interface

MediaController
    Main media control layer

Player
    Audio playback

VideoPlayer
    Video playback

LocalMedia
    Local and USB media management

RadioController
    Radio control

BluetoothController
    Bluetooth control

CMakeLists.txt
    Project build configuration

# Architecture Summary

The project separates the User Interface from the application logic.

Presentation Layer
        |
        v
       QML
        |
        v
Controllers Layer
        |
   +----+----+----------+
   |         |          |
   v         v          v
Media      Radio    Bluetooth
Controller Controller Controller
   |
   v
C++ Logic Layer
   |
   +---------+---------+
   |                   |
   v                   v
Audio Player       Video Player
   |
   v
LocalMedia

QML is responsible for the presentation and user interaction.

C++ is responsible for the application logic.

Controllers act as the communication layer between QML and C++.

Q_PROPERTY exposes C++ properties to QML.

Q_INVOKABLE allows QML to call C++ functions.

Signals notify QML when the application state changes.

This architecture keeps the project modular, organized, and easy to maintain.
