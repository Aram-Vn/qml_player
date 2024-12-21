import QtQuick

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

            songIndex: 0
            title: "AAA"
            authorName: "BBB"
            imageColor: "red"
        }

        AudioInfoBox {
            id: secondSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right

                margins: 20
            }

            songIndex: 1
            title: "AAA222"
            authorName: "BBB222"
            imageColor: "blue"
        }

        AudioInfoBox {
            id: thirdSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right

                margins: 20
            }

            songIndex:  2
            title: "AAA333"
            authorName: "BBB33"
            imageColor: "green"
        }

        QtObject {
            id: playerController

            property int currentSongIndex: 0
            property int songCount: 3
            property bool playing: false

            function playPause() {
                playing = !playing
            }

            function switchToPreviousSong() {
                if (currentSongIndex > 0) {
                    --currentSongIndex
                } else [
                    currentSongIndex = songCount - 1
                ]
            }

            function switchNextSong() {
                if (currentSongIndex + 1 >= songCount) {
                    currentSongIndex = 0
                } else {
                    ++currentSongIndex
                }
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

                spacing: 20

                TextButton {
                    id: previousButton

                    width: 50
                    height: 50

                    text: "<"

                    onClicked: playerController.switchToPreviousSong()
                }

                TextButton {
                    id: playPouseButton

                    width: 75
                    height: 50

                    text: playerController.playing ? "pause" : "play"

                    onClicked: playerController.playPause()
                }

                TextButton {
                    id: nextButton

                    width: 50
                    height: 50

                    text: ">"

                    onClicked: playerController.switchNextSong()
                }


            }
    }

}
