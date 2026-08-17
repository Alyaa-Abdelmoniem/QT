#include "RadioController.h"

RadioController::RadioController(QObject *parent)
    : QObject(parent),
    m_frequency(97.5),
    m_isOn(false)
{
}

RadioController *RadioController::instance()
{
    static RadioController controller;
    return &controller;
}

RadioController *RadioController::create(
    QQmlEngine *engine,
    QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    QQmlEngine::setObjectOwnership(
        instance(),
        QQmlEngine::CppOwnership
        );

    return instance();
}

void RadioController::turnOn()
{
    m_isOn = true;
    emit isOnChanged();
}

void RadioController::turnOff()
{
    m_isOn = false;
    emit isOnChanged();
}

void RadioController::seekUp()
{
    if (!m_isOn) {
        emit errorOccurred("Radio is off.");
        return;
    }

    m_frequency += 0.1;

    if (m_frequency > MAX_FREQ)
        m_frequency = MIN_FREQ;

    emit frequencyChanged();
}

void RadioController::seekDown()
{
    if (!m_isOn) {
        emit errorOccurred("Radio is off.");
        return;
    }

    m_frequency -= 0.1;

    if (m_frequency < MIN_FREQ)
        m_frequency = MAX_FREQ;

    emit frequencyChanged();
}

double RadioController::frequency() const
{
    return m_frequency;
}

void RadioController::setFrequency(double freq)
{
    if (freq < MIN_FREQ)
        freq = MIN_FREQ;

    if (freq > MAX_FREQ)
        freq = MAX_FREQ;

    if (qFuzzyCompare(m_frequency, freq))
        return;

    m_frequency = freq;
    emit frequencyChanged();
}

bool RadioController::isOn() const
{
    return m_isOn;
}
