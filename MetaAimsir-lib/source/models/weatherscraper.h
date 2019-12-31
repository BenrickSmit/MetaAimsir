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
 * @brief: scrapes the retrieved json data
 */

#ifndef WEATHERSCRAPER_H
#define WEATHERSCRAPER_H

#include <QObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>
#include <QVariant>
#include <QDebug>
#include <QDateTime>
#include <QString>

#include "models/networkconnection.h"

class WeatherScraper : public QObject{
    Q_OBJECT
public:
    explicit WeatherScraper(QObject *parent = nullptr);
    WeatherScraper(const WeatherScraper& copy);
    WeatherScraper& operator=(const WeatherScraper& rhs);

    //Major Getters
    void get_weather_data();                                     //Get all the necessary weather data
    void get_forecast_data();                                    //Get all the necessary forecast data
    void get_uv_data();                                          //Get all the necessary uv data

    //Major Setters

    //Parameter Setters
    void set_latitude(const QVariant& value);
    void set_longitude(const QVariant& value);

    void set_icon(const QVariant& value);
    void set_description(const QVariant& value);
    void set_current_temp(const QVariant& value);
    void set_feels_like(const QVariant& value);
    void set_humidity(const QVariant& value);
    void set_pressure(const QVariant& value);
    void set_min_temp(const QVariant& value);
    void set_max_temp(const QVariant& value);
    void set_visibility(const QVariant& value);
    void set_wind_speed(const QVariant& value);
    void set_wind_direction(const QVariant& value);
    void set_cloud_coverage(const QVariant& value);
    void set_country_code(const QVariant& value);
    void set_sunset_time(const QVariant& value);
    void set_sunrise_time(const QVariant& value);
    void set_town_name(const QVariant& value);
    void set_rain_value(const QVariant& value);
    void set_snow_value(const QVariant& value);

    void set_forecast_descriptions(const QList<QString>& input);
    void set_forecast_icons(const QList<QString>& input);
    void set_forecast_days(const QList<QString>& input);
    void set_forecast_min_temps(const QList<QString>& input);
    void set_forecast_max_temps(const QList<QString>& input);
    void set_forecast_units(const QList<QString>& inupt);

    void set_uv_date_measured(const QVariant& value);
    void set_uv_time_measured(const QVariant& value);
    void set_uv_value(const QVariant& value);
    void set_uv_warning(const QVariant& value);

    //Parameter Getters
    QString get_latitude() const;
    QString get_longitude() const;

    QString get_icon() const;
    QString get_description() const;
    QString get_current_temp() const;
    QString get_feels_like() const;
    QString get_humidity() const;
    QString get_pressure() const;
    QString get_min_temp() const;
    QString get_max_temp() const;
    QString get_visibility() const;
    QString get_wind_speed() const;
    QString get_wind_direction() const;
    QString get_cloud_coverage() const;
    QString get_country_code() const;
    QString get_sunset_time() const;
    QString get_sunrise_time() const;
    QString get_town_name() const;
    QString get_rain_value() const;
    QString get_snow_value() const;

    QList<QString> get_forecast_descriptions() const;
    QList<QString> get_forecast_icons() const;
    QList<QString> get_forecast_days() const;
    QList<QString> get_forecast_max_temps() const;
    QList<QString> get_forecast_min_temps() const;
    QList<QString> get_forecast_units() const;

    QString get_uv_date_measured() const;
    QString get_uv_time_measured() const;
    QString get_uv_value() const;
    QString get_uv_warning() const;

    QList<QString> get_sidebar_model_data() const;
    //QList<QString> get_five_day_model_data() const;

signals:
    void updated_weather_data();
    void updated_forecast_data();
    void updated_uv_data();


public slots:
    void handle_received_weather_data(const QString& weather_data);
    void handle_received_forecast_data(const QString& forecast_data);
    void handle_received_uv_data(const QString& uv_data);

private:
    //To display on the QML interface
    QString m_current_weather_icon;
    QString m_current_weather_max_temp;
    QString m_current_weather_min_temp;
    QString m_current_weather_temp;
    QString m_current_weather_description;

    QString m_current_feels_like;
    QString m_current_humidity;
    QString m_current_pressure;
    QString m_current_visibility;
    QString m_current_wind_speed;
    QString m_current_wind_direction;
    QString m_current_cloud_coverage;
    QString m_current_country_code;
    QString m_current_sunrise_time;
    QString m_current_sunset_time;
    QString m_current_town_name;
    QString m_current_rain_value;
    QString m_current_snow_value;

    QList<QString> m_positional_data;
    QString m_positional_latitude;                                          //Lat first, then lon
    QString m_positional_longitude;                                         //Lat first, then lon

    QList<QString> m_forecast_descriptions;                                 //Contains 5 days' worth of description
    QList<QString> m_forecast_icons;                                        //Contains 5 days' worth of icons
    QList<QString> m_forecast_days;                                         //Contains 5 days' worth of day names
    QList<QString> m_forecast_max_temps;                                    //Contains 5 days' worth of max temps
    QList<QString> m_forecast_min_temps;                                    //Contains 5 days' worth of min temps
    QList<QString> m_forecast_units;                                        //Contains 5 days' worth of temperature units

    QString m_uv_date;                                                      //Contains the date at which the UV value was measured
    QString m_uv_time;                                                      //Contains the time at which the UV value was measured
    QString m_uv_value;                                                     //Contains the UV Value measured
    QString m_uv_warning;                                                   //Contains a warning based on the UV Value

    //To store the network connection data
    QString m_weather_json_data;
    QString m_forecast_json_data;
    QString m_uv_json_data;
};

#endif // WEATHERSCRAPER_H
