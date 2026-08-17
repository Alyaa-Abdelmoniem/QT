#ifndef MEDIACONTROLLER_H
#define MEDIACONTROLLER_H

#include <QObject>
#include <QList>
#include <QUrl>
#include <QString>
#include <QQmlEngine>
#include <QMediaPlayer>

#include "player.h"
#include "videoplayer.h"
#include "LocalMedia.h"

class MediaController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(qint64 position READ position NOTIFY positionChanged)
    Q_PROPERTY(qint64 duration READ duration NOTIFY durationChanged)
    Q_PROPERTY(int volume READ volume NOTIFY volumeChanged)
    Q_PROPERTY(bool muted READ isMuted NOTIFY mutedChanged)
    Q_PROPERTY(MediaType mediaType READ mediaType NOTIFY mediaTypeChanged)
    Q_PROPERTY(int playbackState READ playbackState NOTIFY playbackStateChanged)
    Q_PROPERTY(bool playing READ isPlaying NOTIFY playbackStateChanged)

public:
    static MediaController *instance();
    static MediaController *create(QQmlEngine *engine,
                                   QJSEngine *scriptEngine);

    enum class MediaType { Audio, Video };
    Q_ENUM(MediaType)

    Q_INVOKABLE void setMediaType(MediaType type);
    MediaType mediaType() const;

    Q_INVOKABLE void play();
    Q_INVOKABLE void pause();
    Q_INVOKABLE void next();
    Q_INVOKABLE void previous();

    Q_INVOKABLE void setVolume(int volume);
    Q_INVOKABLE void setMuted(bool muted);

    Q_INVOKABLE void setMediaFolder(const QString &folderPath);
    Q_INVOKABLE void setUsbFolder(const QString &folderPath);
    Q_INVOKABLE void setVideoOutput(QObject *videoOutput);

    Q_INVOKABLE QList<QUrl> getAudioPlaylist() const;
    Q_INVOKABLE QList<QUrl> getVideoPlaylist() const;

    qint64 position() const;
    qint64 duration() const;
    int volume() const;
    bool isMuted() const;
    int playbackState() const;
    bool isPlaying() const;

signals:
    void positionChanged();
    void durationChanged();
    void volumeChanged();
    void mutedChanged();
    void playbackStateChanged();
    void mediaTypeChanged();
    void playlistChanged();
    void errorOccurred(const QString &message);

private:
    explicit MediaController(QObject *parent = nullptr);

    MediaController(const MediaController &) = delete;
    MediaController &operator=(const MediaController &) = delete;

    Player *m_audioPlayer;
    VideoPlayer *m_videoPlayer;
    LocalMedia *m_localMedia;

    MediaType m_currentMediaType;
};

#endif
