#ifndef PLAYERCONTROLLER_H
#define PLAYERCONTROLLER_H

#include <QAudioDevice>
#include <QAudioOutput>
#include <QMediaDevices>
#include <QMediaPlayer>
#include <QObject>
#include <qurl.h>

class PlayerController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int currentSongIndex READ currentSongIndex NOTIFY currentSongIndexChanged FINAL)
    Q_PROPERTY(int songCount READ songCount NOTIFY songCountChanged FINAL)
    Q_PROPERTY(bool isPlaying READ isPlaying NOTIFY isPlayingChanged FINAL)

public:
    explicit PlayerController(QObject* parent = nullptr);

public:
    int  currentSongIndex() const;
    int  songCount() const;
    bool isPlaying() const;

public slots:
    void switchToPreviousSong();
    void switchToNextSong();
    void playPause();
    void changeAudioSource(const QUrl& source);

signals:
    void currentSongIndexChanged();
    void songCountChanged();
    void isPlayingChanged();

private:
    int          m_currentSongIndex;
    int          m_songCount;
    bool         m_isPlaying;
    QMediaPlayer m_mediaPlayer;
};

#endif // PLAYERCONTROLLER_H
