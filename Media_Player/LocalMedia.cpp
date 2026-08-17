#include "LocalMedia.h"
#include <QDebug>
#include <QUrl>

LocalMedia::LocalMedia(QObject *parent)
    : QObject(parent)
{
}

void LocalMedia::setFolder(const QString &folderPath)
{
    QString localPath = folderPath;
    if (localPath.startsWith("file:")) {
        localPath = QUrl(folderPath).toLocalFile();
    }

    QDir folder(localPath);

    if (!folder.exists()) {
        emit errorOccurred("Folder does not exist.");
        return;
    }

    m_folderPath = localPath;
    scanFolder();
}

void LocalMedia::setUsbFolder(const QString &folderPath)
{
    QString localPath = folderPath;

    if (localPath.startsWith("file:")) {
        localPath = QUrl(folderPath).toLocalFile();
    }

    QStorageInfo usb(localPath);

    if (!usb.isValid() || !usb.isReady()) {
        emit errorOccurred("USB is not available.");
        return;
    }

    m_folderPath = localPath;
    scanFolder();
}

void LocalMedia::scanFolder()
{
    if (m_folderPath.isEmpty()) {
        emit errorOccurred("No folder selected.");
        return;
    }

    QDir folder(m_folderPath);

    if (!folder.exists()) {
        emit errorOccurred("Folder does not exist.");
        return;
    }

    static const QSet<QString> audioExt = {
        "mp3", "wav", "flac", "aac", "ogg", "m4a", "wma"
    };

    static const QSet<QString> videoExt = {
        "mp4", "mkv", "avi", "mov", "webm", "wmv", "flv"
    };

    QFileInfoList files = folder.entryInfoList(
        QDir::Files | QDir::Readable,
        QDir::Name
        );

    m_audioPlaylist.clear();
    m_videoPlaylist.clear();

    qDebug() << "[LocalMedia] scanning:" << m_folderPath
             << "| total files found:" << files.size();
}

    for (const QFileInfo &file : files) {

        QUrl url = QUrl::fromLocalFile(file.absoluteFilePath());
        QString extension = file.suffix().toLower();

        if (audioExt.contains(extension)) {
            m_audioPlaylist.append(url);
        }
        else if (videoExt.contains(extension)) {
            m_videoPlaylist.append(url);
        }
        else {
            qDebug() << "[LocalMedia] skipped (unsupported ext):" << file.fileName();
        }
    }

    qDebug() << "[LocalMedia] audio:" << m_audioPlaylist.size()
             << "video:" << m_videoPlaylist.size();

    if (m_audioPlaylist.isEmpty() && m_videoPlaylist.isEmpty()) {
        emit errorOccurred("No audio or video files found.");
        return;
    }

    emit playlistChanged();
}

QList<QUrl> LocalMedia::getAudioPlaylist() const
{
    return m_audioPlaylist;
}

QList<QUrl> LocalMedia::getVideoPlaylist() const
{
    return m_videoPlaylist;
}
