#include "MediaController.h"

MediaController::MediaController(QObject *parent)
    : QObject(parent),
    m_audioPlayer(new Player(this)),
    m_videoPlayer(new VideoPlayer(this)),
    m_localMedia(new LocalMedia(this)),
    m_currentMediaType(MediaType::Audio)
{
    connect(m_audioPlayer, &Player::positionChanged,
            this, &MediaController::positionChanged);
    connect(m_audioPlayer, &Player::durationChanged,
            this, &MediaController::durationChanged);
    connect(m_audioPlayer, &Player::volumeChanged,
            this, &MediaController::volumeChanged);
    connect(m_audioPlayer, &Player::mutedChanged,
            this, &MediaController::mutedChanged);
    connect(m_audioPlayer, &Player::playbackStateChanged,
            this, &MediaController::playbackStateChanged);
    connect(m_audioPlayer, &Player::errorOccurred,
            this, &MediaController::errorOccurred);

    connect(m_videoPlayer, &VideoPlayer::positionChanged,
            this, &MediaController::positionChanged);
    connect(m_videoPlayer, &VideoPlayer::durationChanged,
            this, &MediaController::durationChanged);
    connect(m_videoPlayer, &VideoPlayer::volumeChanged,
            this, &MediaController::volumeChanged);
    connect(m_videoPlayer, &VideoPlayer::mutedChanged,
            this, &MediaController::mutedChanged);
    connect(m_videoPlayer, &VideoPlayer::playbackStateChanged,
            this, &MediaController::playbackStateChanged);
    connect(m_videoPlayer, &VideoPlayer::errorOccurred,
            this, &MediaController::errorOccurred);

    connect(m_localMedia, &LocalMedia::playlistChanged,
            this, &MediaController::playlistChanged);
    connect(m_localMedia, &LocalMedia::errorOccurred,
            this, &MediaController::errorOccurred);
}

MediaController *MediaController::instance()
{
    static MediaController controller;
    return &controller;
}

MediaController *MediaController::create(QQmlEngine *engine,
                                         QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    QQmlEngine::setObjectOwnership(
        instance(), QQmlEngine::CppOwnership);

    return instance();
}

void MediaController::setMediaType(MediaType type)
{
    if (type == m_currentMediaType)
        return;

    m_currentMediaType = type;

    emit mediaTypeChanged();
    emit positionChanged();
    emit durationChanged();
    emit volumeChanged();
    emit mutedChanged();
    emit playbackStateChanged();
}

MediaController::MediaType MediaController::mediaType() const
{
    return m_currentMediaType;
}

void MediaController::play()
{
    if (m_currentMediaType == MediaType::Audio)
        m_audioPlayer->play();
    else
        m_videoPlayer->play();
}

void MediaController::pause()
{
    if (m_currentMediaType == MediaType::Audio)
        m_audioPlayer->pause();
    else
        m_videoPlayer->pause();
}

void MediaController::next()
{
    if (m_currentMediaType == MediaType::Audio)
        m_audioPlayer->next();
    else
        m_videoPlayer->next();
}

void MediaController::previous()
{
    if (m_currentMediaType == MediaType::Audio)
        m_audioPlayer->previous();
    else
        m_videoPlayer->previous();
}

void MediaController::setVolume(int volume)
{
    if (m_currentMediaType == MediaType::Audio)
        m_audioPlayer->setVolume(volume);
    else
        m_videoPlayer->setVolume(volume);
}

void MediaController::setMuted(bool muted)
{
    if (m_currentMediaType == MediaType::Audio)
        m_audioPlayer->setMuted(muted);
    else
        m_videoPlayer->setMuted(muted);
}

void MediaController::setMediaFolder(const QString &folderPath)
{
    m_localMedia->setFolder(folderPath);

    m_audioPlayer->setPlaylist(m_localMedia->getAudioPlaylist());
    m_videoPlayer->setPlaylist(m_localMedia->getVideoPlaylist());
}

void MediaController::setUsbFolder(const QString &folderPath)
{
    m_localMedia->setUsbFolder(folderPath);

    m_audioPlayer->setPlaylist(m_localMedia->getAudioPlaylist());
    m_videoPlayer->setPlaylist(m_localMedia->getVideoPlaylist());
}

void MediaController::setVideoOutput(QObject *videoOutput)
{
    m_videoPlayer->setVideoOutput(videoOutput);
}

QList<QUrl> MediaController::getAudioPlaylist() const
{
    return m_localMedia->getAudioPlaylist();
}

QList<QUrl> MediaController::getVideoPlaylist() const
{
    return m_localMedia->getVideoPlaylist();
}

qint64 MediaController::position() const
{
    if (m_currentMediaType == MediaType::Audio)
        return m_audioPlayer->position();

    return m_videoPlayer->position();
}

qint64 MediaController::duration() const
{
    if (m_currentMediaType == MediaType::Audio)
        return m_audioPlayer->duration();

    return m_videoPlayer->duration();
}

int MediaController::volume() const
{
    if (m_currentMediaType == MediaType::Audio)
        return m_audioPlayer->volume();

    return m_videoPlayer->volume();
}

bool MediaController::isMuted() const
{
    if (m_currentMediaType == MediaType::Audio)
        return m_audioPlayer->isMuted();

    return m_videoPlayer->isMuted();
}

int MediaController::playbackState() const
{
    if (m_currentMediaType == MediaType::Audio)
        return static_cast<int>(m_audioPlayer->playbackState());

    return static_cast<int>(m_videoPlayer->playbackState());
}

bool MediaController::isPlaying() const
{
    return playbackState() ==
           static_cast<int>(QMediaPlayer::PlayingState);
}
