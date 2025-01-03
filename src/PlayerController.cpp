#include "../include/PlayerController.h"

PlayerController::PlayerController(QObject* parent)
    : QObject{ parent },
      m_currentSongIndex(0),
      m_songCount(3),
      m_isPlaying(false)
{
    const auto& audioOutputs = QMediaDevices::audioOutputs();
    if (!audioOutputs.isEmpty())
    {
        m_mediaPlayer.setAudioOutput(new QAudioOutput(&m_mediaPlayer));
    }
}

int PlayerController::currentSongIndex() const
{
    return m_currentSongIndex;
}

int PlayerController::songCount() const
{
    return m_songCount;
}

bool PlayerController::isPlaying() const
{
    return m_isPlaying;
}

void PlayerController::switchToPreviousSong()
{
    if (m_currentSongIndex - 1 == 0)
    {
        m_currentSongIndex = m_songCount - 1;
    }
    else
    {
        --m_currentSongIndex;
    }

    emit currentSongIndexChanged();
}

void PlayerController::switchToNextSong()
{
    if (m_currentSongIndex + 1 >= m_songCount)
    {
        m_currentSongIndex = 0;
    }
    else
    {
        ++m_currentSongIndex;
    }

    emit currentSongIndexChanged();
}

void PlayerController::playPause()
{
    m_isPlaying = !m_isPlaying;

    emit isPlayingChanged();

    if (m_isPlaying)
    {
        m_mediaPlayer.play();
    }
    else
    {
        m_mediaPlayer.stop();
    }
}

void PlayerController::changeAudioSource(const QUrl& source)
{
    m_mediaPlayer.stop();
    m_mediaPlayer.setSource(source);

    if (m_isPlaying)
    {
        m_mediaPlayer.play();
    }
}