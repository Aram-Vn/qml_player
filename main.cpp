#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

#include "PlayerController.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/media_player/assets/icons/heart.png"));

    PlayerController* playerController = new PlayerController(&app);
    qmlRegisterSingletonInstance("com.my.PlayerController", 1, 0, "PlayerController", playerController);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("media_player", "Main");

    return app.exec();
}
