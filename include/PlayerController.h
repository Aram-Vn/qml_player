#ifndef PLAYERCONTROLLER_H
#define PLAYERCONTROLLER_H

#include <QAbstractListModel>
#include <QAudioDevice>
#include <QAudioOutput>
#include <QMediaDevices>
#include <QMediaPlayer>

class AudioInfo;

class PlayerController : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)
    Q_PROPERTY(AudioInfo* currentSong READ currentSong WRITE setCurrentSong NOTIFY currentSongChanged)

public:
    explicit PlayerController(QObject* parent = nullptr);

public:
    bool playing() const;

public:
    virtual int                    rowCount(const QModelIndex& parent) const override;
    virtual QVariant               data(const QModelIndex& index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

    AudioInfo* currentSong() const;
    void       setCurrentSong(AudioInfo* newCurrentSong);

public slots:
    void switchToPreviousSong();
    void switchToNextSong();
    void playPause();
    void changeAudioSource(const QUrl& source);
    void addAudio(const QString& title, const QString& authorName, const QUrl& audioSource, const QUrl& imageSource,
                  const QUrl& videoSource = QUrl());
    void removeAudio(int index);
    void switchToAudioByIndex(int index);

signals:
    void playingChanged();

    void currentSongChanged();

public:
    enum Role
    {
        AudioTitleRole = Qt::UserRole + 1,
        AudioAuthorNameRole,
        AudioSourceRole,
        AudioImageSourceRole,
        AudioVideoSourceRole
    };

private:
    bool         m_Isplaying;
    QMediaPlayer m_mediaPlayer;

    QList<AudioInfo*> m_audioList;
    AudioInfo*        m_currentSong;
};

#endif // PLAYERCONTROLLER_H
