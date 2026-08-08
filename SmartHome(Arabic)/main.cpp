#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "translator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Translator translator;
    engine.rootContext()->setContextProperty("Translator", &translator);

    engine.loadFromModule("SmartHome", "Main");

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
