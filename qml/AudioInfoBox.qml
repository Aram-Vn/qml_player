import QtQuick
import QtMultimedia
import com.my.PlayerController 1.0

Item {
    id: root

    required property int songIndex
    property alias title: titleText.text
    property alias authorName: authorText.text
    property alias imageSourse: albumImage.source
    property alias videoSours: albumVideo.source

    visible: PlayerController.currentSongIndex === root.songIndex

    Image {
        id: albumImage

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        width: 150
        height: 150
        
    }

    Video {
        id: albumVideo

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        width: 150
        height: 150

        loops: MediaPlayer.Infinite
        volume: 0
    }

    Text {
        id: titleText

        anchors {
            bottom: parent.verticalCenter
            left: albumImage.right
            right: parent.right
            margins: 20
        }

        color: "white"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        font {
            pixelSize: 20
            bold: true
        }
    }

    Text {
        id: authorText

        anchors {
            top: parent.verticalCenter
            left: titleText.left
            right: parent.right
            topMargin: 5
        }

        color: "gray"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        font {
            pixelSize: 17
        }
    }

    onVisibleChanged: {
        onVisibleChanged: {
            if (visible) {
                albumVideo.play()
            } else {
                albumVideo.seek(0)
                albumVideo.stop()
            }
        }
    }
}
