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
 * @brief: enables the view to respond dynamically to any changes in the received weather data
 */
#ifndef WEATHERCONTROLLER_H
#define WEATHERCONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QString>

#include "models/weatherscraper.h"
#include "models/networkconnection.h"
#include "models/sidebarmodel.h"
#include "models/forecastmodel.h"
#include "models/position.h"

#include <MetaAimsir-lib_global.h>

class METAAIMSIRLIB_EXPORT WeatherController: public QObject
{
    Q_OBJECT

    Q_PROPERTY(WeatherScraper* ui_weather_scraper READ get_weather_scraper NOTIFY notify_weather_data_updated)
    Q_PROPERTY(SidebarModel* ui_sidebar_model READ get_sidebar_model)
    Q_PROPERTY(ForecastModel* ui_forecast_model READ get_forecast_model)
    Q_PROPERTY(QString ui_town_name READ get_town_name)
    Q_PROPERTY(QString ui_current_temp READ get_current_temp)
    Q_PROPERTY(QString ui_min_temp READ get_min_temp)
    Q_PROPERTY(QString ui_max_temp READ get_max_temp)
    Q_PROPERTY(QString ui_weather_icon READ get_weather_icon)
    Q_PROPERTY(QString ui_weather_description READ get_weather_description)
    Q_PROPERTY(QString ui_country_code READ get_country_code)
    Q_PROPERTY(QString ui_uv_value_full READ get_uv_value_full)
    Q_PROPERTY(double ui_uv_value READ get_uv_value)
    Q_PROPERTY(QString ui_uv_warning READ get_uv_warning)
    Q_PROPERTY(QString ui_uv_date READ get_uv_date)
    Q_PROPERTY(QString ui_uv_time READ get_uv_time)
public:
    explicit WeatherController(QObject *parent = nullptr);

    //Getters
    WeatherScraper* get_weather_scraper() const;
    SidebarModel* get_sidebar_model();
    ForecastModel* get_forecast_model();
    QString get_town_name() const;
    QString get_country_code() const;
    QString get_min_temp() const;
    QString get_max_temp() const;
    QString get_current_temp() const;
    QString get_weather_icon() const;
    QString get_weather_description();                      //For signal use
    QString get_weather_pressure() const;
    QString get_weather_humidity() const;
    QString get_weather_feels_like() const;

    QString get_uv_value_full() const;
    double get_uv_value() const;
    QString get_uv_time() const;
    QString get_uv_date() const;
    QString get_uv_warning() const;

    //Others


signals:
    void show_rainy_weather();
    void show_sunny_weather();
    void show_snowy_weather();
    void show_windy_weather();
    void show_night_weather();
    void show_cloudy_weather();

    void start_weather_data_update();

    //To notify the View that there is data to be had
    void notify_weather_data_updated();
    void notify_forecast_data_updated();
    void notify_uv_data_updated();

    void notify_all_weather_data_received();
    void notify_data_collection();



public slots:
    void get_weather_data_update();

    void received_weather_data();
    void received_forecast_data();
    void received_uv_data();

    void receive_city_data(const QVariant& input);              //Used when finding the city from the QML interface

    void received_geo_position(const QList<QString>&);          //Will contain the Lat and Lon to use
    void no_geo_position_available();                           //Only when no GeoPosition is available with the QGeoPositionInfoSource
private:
    WeatherScraper m_weather_scraper;
    NetworkConnection m_network_connection;
    SidebarModel m_sidebar_model;
    ForecastModel m_forecast_model;

    //For positional retrieval
    Position m_geo_position;                                        //Will retrieve the current GPS location

    static int geo_positional_data_received_counter;                //How many times the GEO Position has been received
};

#endif // WEATHERCONTROLLER_H
