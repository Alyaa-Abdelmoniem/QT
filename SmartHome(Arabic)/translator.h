#ifndef TRANSLATOR_H
#define TRANSLATOR_H

#include <QObject>
#include <QMap>
#include <QString>

class Translator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString language READ language WRITE setLanguage NOTIFY languageChanged)
    Q_PROPERTY(bool isRtl READ isRtl NOTIFY languageChanged)

public:
    explicit Translator(QObject *parent = nullptr);

    QString language() const;
    void setLanguage(const QString &lang);
    bool isRtl() const;

    Q_INVOKABLE QString t(const QString &key) const;
    Q_INVOKABLE void toggleLanguage();

signals:
    void languageChanged();

private:
    QString m_language;
    QMap<QString, QMap<QString, QString>> m_strings;
    void initStrings();
};

#endif // TRANSLATOR_H
