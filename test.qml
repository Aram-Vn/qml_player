import QtQuick 2.15
import QtMultimedia 5.15

Item {
    width: 640
    height: 360

    Video {
        id: testVideo
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        source: "file:///home/aram/dev/qml_test/media_player/assets/videos/fire.mp4"
        loops: MediaPlayer.Infinite
        autoPlay: true
    }
}

