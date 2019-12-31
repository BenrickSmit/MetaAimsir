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
 * @brief: enables connection to the openweathermap.org servers to collect the free forecast data
 */

#ifndef NETWORKCONNECTION_H
#define NETWORKCONNECTION_H

#include <QObject>
#include <QString>
#include <QNetworkReply>
#include <QNetworkRequest>
    #include <QNetworkSession>
#include <QNetworkConfigurationManager>
#include <QNetworkAccessManager>
#include <QUrl>
#include <QUrlQuery>
#include <QJsonDocument>
#include <QJsonObject>


class NetworkConnection : public QObject
{
    Q_OBJECT
public:
    explicit NetworkConnection(QObject *parent = nullptr);
    ~NetworkConnection();

    //Connection Settings
    void load_connection(bool used_city = false);

    //Getters
    QString get_weather_json_data() const;
    QString get_forecast_json_data() const;
    QString get_uv_json_data() const;

    QString get_units() const;                  //Returns the units as either "metric" or "imperial"


    //Setters
    void set_weather_json_data(const QString& data);
    void set_forecast_json_data(const QString& data);
    void set_uv_json_data(const QString& data);

    void set_units(const QString& data = "metric");
    void set_city(const QString &city = "London");
    void set_latitude(const QString& lat);
    void set_longitude(const QString& lon);

    //Others
    void get_geo_weather_data();
    void get_geo_forecast_data();
    void get_geo_uv_data();

    void get_city_weather_data();                                       //Used when there are no locations specified


signals:
    void finished_getting_weather_data(const QString& weather_data);
    void finished_getting_forecast_data(const QString& forecast_data);
    void finished_getting_uv_data(const QString& uv_data);

public slots:
    void handle_weather_data(QNetworkReply *reply);
    void handle_forecast_data(QNetworkReply *reply);
    void handle_uv_data(QNetworkReply *reply);

private:
    QNetworkConfigurationManager *m_manager;
    QNetworkAccessManager *m_weather_access;                            //To get the normal weather forecast for today
    QNetworkAccessManager *m_forecast_access;                           //To get the normal daily forecast for 5 days
    QNetworkAccessManager *m_uv_access;                                 //To get the UV data for today at this location
    QNetworkSession *m_session;

    QString m_city;                                                     //Holds the city name
    QString m_latitude, m_longitude;                                    //Holds the city latitude and longitude for use
    QString m_today;                                                    //Holds the day name
    bool m_useGPS;                                                      //Boolean which determines whether GPS is used in the application
    bool m_used_city;                                                   //Boolean which determines whether the extra functions should be called from load_connection or the slot after the current data has been handled
    QString m_units;                                                    //Determines whether the api returns fahrenheit or celcius
    QString m_api_key;                                                  //The application programming interface key for use with www.openweathermap.org. *Gotten from code.qt.io - change when relevant*

        QString m_weather_json_data;                                    //This contains the normal weather forecast for one day for the specifided location
        QString m_forecast_json_data;                                   //This contains the normal 5 day forecast for the specified location
        QString m_uv_json_data;                                         //This contains the UV data for the location

    QUrl m_weather_url;                                                 //This contains the url that will return the current weather
    QUrl m_forecast_url;                                                //this contains the url that will return the 5 day forecast
    QUrl m_uv_url;                                               //Thiscontains the url that will return the pollution index
};

#endif // NETWORKCONNECTION_H
