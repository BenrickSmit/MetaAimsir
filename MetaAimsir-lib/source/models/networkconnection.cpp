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

#include "networkconnection.h"


NetworkConnection::NetworkConnection(QObject *parent) : QObject(parent){
    m_weather_url = QUrl("http://api.openweathermap.org/data/2.5/weather");
    m_forecast_url = QUrl("http://api.openweathermap.org/data/2.5/forecast/daily");

    m_api_key = "4be9f9d9ff788b1030f6e4c61260a057";

    m_latitude =  "40.73";
    m_longitude =  "-73.99";

    m_used_city = false;    //Determines whether only the city used or the GPS coordinates is used for the first search. Useful for when information is sent from the QML interface
    m_useGPS = true;        //If there are GPS coordinates available for the data

    m_weather_access = nullptr;
    m_forecast_access = nullptr;
    m_uv_access = nullptr;

    set_units(); //set_units("imperial"); //set_units("kelvin");
}//end of ctor

NetworkConnection::~NetworkConnection(){
    m_weather_access->deleteLater();
    m_forecast_access->deleteLater();
    m_uv_access->deleteLater();
}//end of dtor



void NetworkConnection::load_connection(bool used_city) {
    //Ensure we have an active network session
        //Find out whether the pointers already contain data
            if(m_weather_access == nullptr){
                m_weather_access = new QNetworkAccessManager(this);
                connect(m_weather_access, SIGNAL(finished(QNetworkReply*)), this, SLOT(handle_weather_data(QNetworkReply*)));
            }//end of if

            if(m_forecast_access == nullptr){
                m_forecast_access = new QNetworkAccessManager(this);
                connect(m_forecast_access, SIGNAL(finished(QNetworkReply*)), this, SLOT(handle_forecast_data(QNetworkReply*)));
            }//end of if

            if(m_uv_access == nullptr){
                m_uv_access = new QNetworkAccessManager(this);
                connect(m_uv_access, SIGNAL(finished(QNetworkReply*)), this, SLOT(handle_uv_data(QNetworkReply*)));
            }//end of if

    //Determine whether the function used just the city name
    if(used_city){
        get_city_weather_data();
        m_used_city = used_city;
        return;
    }//end of if

    //Determine whether GPS coordinates can be used or not. If they can, use the GPS settings, otherwise use the input name
    get_geo_weather_data();
    get_geo_forecast_data();
    get_geo_uv_data();
}//end of NetworkConnection::load_connection





//Getters
QString NetworkConnection::get_weather_json_data() const{
    return m_weather_json_data;
}//end of NetworkConnection::get_weather_json_data()

QString NetworkConnection::get_forecast_json_data() const{
    return m_forecast_json_data;
}//end of NetworkConnection::get_forecast_json_data()

QString NetworkConnection::get_uv_json_data() const{
    return m_uv_json_data;
}//end of NetworkConnection::get_co_pollution_json_data

QString NetworkConnection::get_units() const{
    return m_units;
}//end of NetworkConnection::get_units()



//Setters
void NetworkConnection::set_weather_json_data(const QString& data){
    m_weather_json_data = data;
}//end of NetworkConnection::set_weather_json_data

void NetworkConnection::set_forecast_json_data(const QString& data){
    m_forecast_json_data = data;
}//end of NetworkConnection::set_forecast_json_data

void NetworkConnection::set_uv_json_data(const QString& data){
    m_uv_json_data = data;
}//end of NetworkConnection::set_co_pollution_json_data

void NetworkConnection::set_units(const QString &data){
    m_units = data;
}//end of NetworkConnection::set_units()


void NetworkConnection::set_city(const QString& city){
    m_city = city;
}//end of NetworkConnection::set_city()

void NetworkConnection::set_latitude(const QString& lat){
    m_latitude = lat;
}//end of NetworkConnection::set_latitude()

void NetworkConnection::set_longitude(const QString& lon){
    m_longitude = lon;
}//end of NetworkConnection::set_longitude()

//Others
void NetworkConnection::get_geo_weather_data(){
    QUrlQuery query;
    query.addQueryItem("lat", m_latitude);//"-29.12107"
    query.addQueryItem("lon", m_longitude);//"26.21400"
    query.addQueryItem("units", m_units);
    query.addQueryItem("mode","json");
    query.addQueryItem("APPID", m_api_key);
    m_weather_url.setQuery(query);

    m_weather_access->get(QNetworkRequest(m_weather_url));
}//end of NetworkConnection::get_geo_weather_data();

void NetworkConnection::get_geo_forecast_data(){
    QUrlQuery query;
    query.addQueryItem("lat", m_latitude);
    query.addQueryItem("lon", m_longitude);
    query.addQueryItem("units", m_units);
    query.addQueryItem("mode","json");
    query.addQueryItem("APPID", m_api_key);
    m_forecast_url.setQuery(query);

    m_forecast_access->get(QNetworkRequest(m_forecast_url));
}//end of NetworkConnection::get_geo_forecast_data();

void NetworkConnection::get_geo_uv_data(){
    //m_pollution_url = QUrl("http://api.openweathermap.org/pollution/v1/so2/-29.12107,26.21400/"+QDateTime::currentDateTime().toUTC().toString("yyyy-MM-dd")+"Z"+".json");
    m_uv_url = QUrl("http://api.openweathermap.org/data/2.5/uvi/forecast?");


    QUrlQuery query;
    query.addQueryItem("appid", m_api_key);
    query.addQueryItem("lat", m_latitude);
    query.addQueryItem("lon", m_longitude);
    m_uv_url.setQuery(query);

    m_uv_access->get(QNetworkRequest(m_uv_url));
}//end of NetworkConnection::get_geo_pollution_data



void NetworkConnection::get_city_weather_data(){
    QUrlQuery query;
    query.addQueryItem("q", m_city);
    query.addQueryItem("units", m_units);
    query.addQueryItem("mode","json");
    query.addQueryItem("APPID", m_api_key);
    m_weather_url.setQuery(query);

    m_weather_access->get(QNetworkRequest(m_weather_url));
}//end of NetworkConnection::get_city_weather_data();



//SLOTS
void NetworkConnection::handle_weather_data(QNetworkReply *reply){
    //Determine if the pointer contains any data at all
    if(!reply){
        qDebug() << "Error: pointer is empty";
        return;
    }//end of if

    if(!reply->error()){
        QVariant reply_data = reply->readAll();

        if(!m_city.isEmpty()){
            //Parse the received data and find the latitude and longitude data
            QJsonDocument document = QJsonDocument::fromJson(reply_data.toString().toUtf8());
            QJsonObject object = document.object();

            //Set the lat and lon coordinates
            m_latitude = object.find("coord").value().toObject().find("lat").value().toVariant().toString();
            m_longitude = object.find("coord").value().toObject().find("lon").value().toVariant().toString();

            //Clear the previous data and restart the information gathering process to work with "geo" data
            m_city.clear();
            m_used_city = false;
            load_connection();
            return;
        }//end of if

        emit finished_getting_weather_data(reply_data.toString());       //Let the scraper class know that the data is available
    }else{
        qDebug() << "Error occurred:";
        qDebug() << reply->errorString();
    }//end of if

    //Delete the data pointer at a later time
    reply->deleteLater();
}//end of NetworkConnection::handle_weather_data

void NetworkConnection::handle_forecast_data(QNetworkReply *reply){
    //Determine if the pointer contains any data at all
    if(!reply){
        qDebug() << "Error: pointer is empty";
        return;
    }//end of if

    if(!reply->error()){
        emit finished_getting_forecast_data(reply->readAll());       //Let the scraper class konw that the data is available
    }else{
        qDebug() << "Error occurred:";
        qDebug() << reply->errorString();
    }//end of if

    //Delete the data pointer at a later time
    reply->deleteLater();
}//end of NetworkConnection::handle_forecast_data

void NetworkConnection::handle_uv_data(QNetworkReply *reply){
    //Determine if the pointer contains any data at all
    if(!reply){
        qDebug() << "Error: pointer is empty";
        return;
    }//end of if

    if(!reply->error()){
        emit finished_getting_uv_data(reply->readAll());
    }else{
        qDebug() << "Error occurred:";
        qDebug() << reply->errorString();
    }//end of if

    //Delete the data pointer at a later time
    reply->deleteLater();
}//end of NetoworkConnection::handle_pollution_data

