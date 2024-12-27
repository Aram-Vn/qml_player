import QtQuick

import media_player.PlayerController

Window {
    id: root

    width: 640
    height: 480

    visible: true

    title: qsTr("Song Player")

    Rectangle {
        id: topBar

        anchors{
            top: parent.top

            left: parent.left
            right: parent.right
        }

        height: 50
        color: "#2a2a2a"
    }

    Rectangle {
        id: mainSection

        anchors {
            top: topBar.bottom
            bottom: bottomBar.top

            left: parent.left
            right: parent.right
        }

        color: "#1e1e1e"

        AudioInfoBox {
            id: firstSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right

                margins: 20
            }

            infoProvider {
                songIndex: 0
                title: "AAA"
                authorName: "BBB"
                imageSource: "qrc:/assets/images/image1.jpg"
                audioSource: "qrc:/SongPlayer/assets/audio/symphony_no_5.mp3"
            }

        }

        AudioInfoBox {
            id: secondSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right

                margins: 20
            }

            infoProvider {
                songIndex: 1
                title: "AAA222"
                authorName: "BBB222"
                videoSource: "qrc:/assets/videos/fire.mp4"
                audioSource: "qrc:/SongPlayer/assets/audio/symphony_no_5.mp3"
            }
        }

        AudioInfoBox {
            id: thirdSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right

                margins: 20
            }

            infoProvider {
                songIndex:  2
                title: "AAA333"
                authorName: "BBB33"
                imageSource: "qrc:/assets/images/image3.jpg"
                audioSource: "qrc:/SongPlayer/assets/audio/symphony_no_5.mp3"
            }
        }
    }

    Rectangle {
        id: bottomBar

        anchors{
            bottom: parent.bottom

            left: parent.left
            right: parent.right
        }

        height: 100
        color: "#333333"

        Row {
            anchors.centerIn: parent

            spacing: 25

            ImageButton {
                id: previousButton

                width: 50
                height: 50

                source: "qrc:assets/icons/previous.svg"

                onClicked: PlayerController.switchToPreviousSong()
            }

            ImageButton {
                id: playPouseButton

                width: 50
                height: 50

                source: PlayerController.isPlaying ? "qrc:/assets/icons/play.svg" : "qrc:/assets/icons/pause.svg"

                onClicked: PlayerController.playPause()
            }

            ImageButton {
                id: nextButton

                width: 50
                height: 50

                source: "qrc:/assets/icons/next.svg"

                onClicked: PlayerController.switchToNextSong()
            }
        }
    } 
}
