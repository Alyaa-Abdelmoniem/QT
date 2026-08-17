#include "BluetoothController.h"

BluetoothController::BluetoothController(QObject *parent)
    : QObject(parent),
    m_isEnabled(false),
    m_isConnected(false),
    m_scanning(false)
{
}

BluetoothController *BluetoothController::instance()
{
    static BluetoothController controller;
    return &controller;
}

BluetoothController *BluetoothController::create(
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

void BluetoothController::enable()
{
    m_isEnabled = true;
    emit isEnabledChanged();
}

void BluetoothController::disable()
{
    m_isEnabled = false;
    m_isConnected = false;
    m_connectedDeviceName = "";

    emit isEnabledChanged();
    emit isConnectedChanged();
    emit connectedDeviceChanged();
}

void BluetoothController::startScan()
{
    if (!m_isEnabled) {
        emit errorOccurred("Bluetooth is off.");
        return;
    }

    m_availableDevices = QStringList{
        "Car Headset",
        "John's Phone",
        "Office Speaker"
    };

    emit availableDevicesChanged();
}

void BluetoothController::connectToDevice(const QString &deviceName)
{
    if (!m_isEnabled) {
        emit errorOccurred("Bluetooth is off.");
        return;
    }

    m_connectedDeviceName = deviceName;
    m_isConnected = true;

    emit isConnectedChanged();
    emit connectedDeviceChanged();
}

void BluetoothController::disconnectDevice()
{
    m_connectedDeviceName = "";
    m_isConnected = false;

    emit isConnectedChanged();
    emit connectedDeviceChanged();
}

bool BluetoothController::isEnabled() const
{
    return m_isEnabled;
}

bool BluetoothController::isConnected() const
{
    return m_isConnected;
}

QString BluetoothController::connectedDeviceName() const
{
    return m_connectedDeviceName;
}

QStringList BluetoothController::availableDevices() const
{
    return m_availableDevices;
}

bool BluetoothController::isScanning() const
{
    return m_scanning;
}
