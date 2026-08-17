#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "Calculator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Calculator>(
        "Calculator.Backend",
        1, 0,
        "Calculator"
        );

    QQmlApplicationEngine engine;

    engine.loadFromModule("Calculator", "Main");

    return app.exec();
}
