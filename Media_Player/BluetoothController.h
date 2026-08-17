#ifndef BLUETOOTHCONTROLLER_H
#define BLUETOOTHCONTROLLER_H

#include <QObject>
#include <QQmlEngine>
#include <QString>
#include <QStringList>

class BluetoothController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(bool isEnabled READ isEnabled NOTIFY isEnabledChanged)
    Q_PROPERTY(bool isConnected READ isConnected NOTIFY isConnectedChanged)
    Q_PROPERTY(QString connectedDeviceName READ connectedDeviceName NOTIFY connectedDeviceChanged)
    Q_PROPERTY(QStringList availableDevices READ availableDevices NOTIFY availableDevicesChanged)
    Q_PROPERTY(bool scanning READ isScanning NOTIFY scanningChanged)

public:
    static BluetoothController *instance();

    static BluetoothController *create(
        QQmlEngine *engine,
        QJSEngine *scriptEngine
        );

    Q_INVOKABLE void enable();
    Q_INVOKABLE void disable();

    Q_INVOKABLE void startScan();

    Q_INVOKABLE void connectToDevice(const QString &deviceName);
    Q_INVOKABLE void disconnectDevice();

    bool isEnabled() const;
    bool isConnected() const;
    QString connectedDeviceName() const;
    QStringList availableDevices() const;
    bool isScanning() const;

signals:
    void isEnabledChanged();
    void isConnectedChanged();
    void connectedDeviceChanged();
    void availableDevicesChanged();
    void scanningChanged();

    void errorOccurred(const QString &message);

private:
    explicit BluetoothController(QObject *parent = nullptr);

    BluetoothController(const BluetoothController &) = delete;
    BluetoothController &operator=(const BluetoothController &) = delete;

    bool m_isEnabled;
    bool m_isConnected;
    bool m_scanning;

    QString m_connectedDeviceName;
    QStringList m_availableDevices;
};

#endif
