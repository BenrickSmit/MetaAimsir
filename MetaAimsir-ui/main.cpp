/**
 * MetaAimsir: a weather forecast prgoram for the forecast and UV Index
 *
 * Copyright © 2019 Benrick Smit
 *
 * This file is part of MetaAimsir.
 *
 * MetaAimsir is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * MetaAimsir is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with MetaAimsir (/LICENSE). If not, see <https://www.gnu.org/licenses/>.
 */
/**
 * Notice:
 * This program contains some of Qt's Libraries which are licensed under
 * GPL as well. MetaAimsir will only support GPLv3 or later should Qt and the
 * relevant libraries in question also support the same condition. In the case of
 * any discrepencies default to the conditions specified in Qt's library notices.
 */

/**
 * @author: Benrick Smit
 * @moderators: N/A             //Anyone who added their input
 * @date_finished: 29/12/2019   //Finished All core functionality
 * @date_updated: 29/12/2019    //Updated one or two components, includes Refactoring
 * @brief: contains the main QML interface to run.
 */

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <controllers/formcontroller.h>
#include <controllers/weathercontroller.h>
#include <models/weatherscraper.h>
#include <models/sidebarmodel.h>
#include <models/forecastmodel.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<FormController>("FM", 1, 0, "FormController");
    qmlRegisterType<WeatherController>("WM", 1, 0, "WeatherController");
    qmlRegisterType<WeatherScraper>("WS", 1, 0, "WeatherScraper");
    qmlRegisterType<SidebarModel>("SBM", 1, 0, "SidebarModel");
    qmlRegisterType<ForecastModel>("FSM", 1, 0, "ForecastModel");
    FormController form_controller;
    WeatherController weather_controller;

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:");
    const QUrl url(QStringLiteral("qrc:/views/master_view.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("form_controller", &form_controller);
    engine.rootContext()->setContextProperty("weather_controller", & weather_controller);
    engine.load(url);

    return app.exec();
}
