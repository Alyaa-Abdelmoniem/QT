#ifndef LOCALMEDIA_H
#define LOCALMEDIA_H

#include <QObject>
#include <QDir>
#include <QFileInfo>
#include <QList>
#include <QUrl>
#include <QStorageInfo>
#include <QSet>

class LocalMedia : public QObject
{
    Q_OBJECT

public:
    explicit LocalMedia(QObject *parent = nullptr);

    void setFolder(const QString &folderPath);
    void setUsbFolder(const QString &folderPath);
    void scanFolder();

    QList<QUrl> getAudioPlaylist() const;
    QList<QUrl> getVideoPlaylist() const;

signals:
    void playlistChanged();
    void errorOccurred(const QString &message);

private:
    QString m_folderPath;

    QList<QUrl> m_audioPlaylist;
    QList<QUrl> m_videoPlaylist;
};

#endif
