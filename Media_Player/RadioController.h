#ifndef RADIOCONTROLLER_H
#define RADIOCONTROLLER_H

#include <QObject>
#include <QQmlEngine>

class RadioController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(double frequency READ frequency WRITE setFrequency NOTIFY frequencyChanged)
    Q_PROPERTY(bool isOn READ isOn NOTIFY isOnChanged)

public:
    static RadioController *instance();

    static RadioController *create(
        QQmlEngine *engine,
        QJSEngine *scriptEngine
        );

    Q_INVOKABLE void turnOn();
    Q_INVOKABLE void turnOff();

    Q_INVOKABLE void seekUp();
    Q_INVOKABLE void seekDown();

    double frequency() const;
    void setFrequency(double freq);

    bool isOn() const;

signals:
    void frequencyChanged();
    void isOnChanged();
    void errorOccurred(const QString &message);

private:
    explicit RadioController(QObject *parent = nullptr);

    RadioController(const RadioController &) = delete;
    RadioController &operator=(const RadioController &) = delete;

    double m_frequency;
    bool m_isOn;

    static constexpr double MIN_FREQ = 87.5;
    static constexpr double MAX_FREQ = 108.0;
};

#endif
