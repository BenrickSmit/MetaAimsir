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

#include "weathercontroller.h"

int WeatherController::geo_positional_data_received_counter = 0;

WeatherController::WeatherController(QObject *parent) : QObject(parent){
    //Ensure the data is transferred as from the Network API to the necessary scraper
    connect(this, SIGNAL(start_weather_data_update()), this, SLOT(get_weather_data_update()));

    //Ensure that when the data actually arrives at the network connection, that you get the required data with the handler class
    connect(&m_network_connection, SIGNAL(finished_getting_weather_data(const QString&)), &m_weather_scraper, SLOT(handle_received_weather_data(const QString&)));
    connect(&m_network_connection, SIGNAL(finished_getting_forecast_data(const QString&)), &m_weather_scraper, SLOT(handle_received_forecast_data(const QString&)));
    connect(&m_network_connection, SIGNAL(finished_getting_uv_data(const QString&)), &m_weather_scraper, SLOT(handle_received_uv_data(const QString&)));

    connect(&m_weather_scraper, SIGNAL(updated_weather_data()), this, SLOT(received_weather_data()));
    connect(&m_weather_scraper, SIGNAL(updated_forecast_data()), this, SLOT(received_forecast_data()));
    connect(&m_weather_scraper, SIGNAL(updated_uv_data()), this, SLOT(received_uv_data()));

    //Connect the Geo Position Signals and slots
    connect(&m_geo_position, SIGNAL(no_geo_position_available()), this, SLOT(no_geo_position_available()));
    connect(&m_geo_position, SIGNAL(retrieved_geo_position(const QList<QString>&)), this, SLOT(received_geo_position(const QList<QString>&)));
}//default ctor





//Getters
WeatherScraper *WeatherController::get_weather_scraper() const{
    static WeatherScraper scraper(m_weather_scraper);
    return &scraper;
}//end of WeatherController::get_weather_scraper()

SidebarModel* WeatherController::get_sidebar_model(){
    static SidebarModel model = (m_sidebar_model);
    model.set_data(m_weather_scraper.get_sidebar_model_data());

    return &model;
}//end of WeatherController::get_sidebar_model

ForecastModel* WeatherController::get_forecast_model(){
    static ForecastModel model(m_forecast_model);
    model.set_description_data(m_weather_scraper.get_forecast_descriptions());
    model.set_day_data(m_weather_scraper.get_forecast_days());
    model.set_icon_data(m_weather_scraper.get_forecast_icons());
    model.set_max_temp_data(m_weather_scraper.get_forecast_max_temps());
    model.set_min_temp_data(m_weather_scraper.get_forecast_min_temps());
    model.set_unit_data(m_weather_scraper.get_forecast_units());
    return &model;
}//end of WeatherController::get_forecast_model

QString WeatherController::get_town_name() const {
    return m_weather_scraper.get_town_name();
}//end of WeatherController::

QString WeatherController::get_country_code() const{
    return m_weather_scraper.get_country_code();
}

QString WeatherController::get_max_temp() const {
    return QString().number(m_weather_scraper.get_max_temp().toDouble(), 'f', 0);
}

QString WeatherController::get_min_temp() const {
    return QString().number(m_weather_scraper.get_min_temp().toDouble(), 'f', 0);
}

QString WeatherController::get_current_temp() const {
    return QString().number(m_weather_scraper.get_current_temp().toDouble(), 'f', 0);;
}

QString WeatherController::get_weather_icon() const {
    return m_weather_scraper.get_icon();
}

QString WeatherController::get_weather_description() {
    //The description will determine what the background is
    QString weather_description = m_weather_scraper.get_description();
    int time_hour = QDateTime::currentDateTime().time().hour();
    if(weather_description.contains("cloud", Qt::CaseSensitivity::CaseInsensitive)){    //if its rainy
        emit show_cloudy_weather();
    }else if(weather_description.contains("snow", Qt::CaseSensitivity::CaseInsensitive) || weather_description.contains("sleet", Qt::CaseSensitivity::CaseInsensitive)){ //If its snowy
        emit show_snowy_weather();
    }else if(weather_description.contains("wind", Qt::CaseSensitivity::CaseInsensitive)){ //If its windy
        emit show_windy_weather();
    }else if(weather_description.contains("rain", Qt::CaseSensitivity::CaseInsensitive) || weather_description.contains("thunderstorm", Qt::CaseSensitivity::CaseInsensitive)){
        emit show_rainy_weather();
    }else if((time_hour <= QTime::fromString(m_weather_scraper.get_sunrise_time(), "hh:mm").hour()) || (time_hour >= QTime::fromString(m_weather_scraper.get_sunset_time()).hour())){ //If its night
        emit show_night_weather();
    }else{  //On default
        emit show_sunny_weather();
    }//end of if

    void show_rainy_weather();
    void show_sunny_weather();
    void show_snowy_weather();
    void show_windy_weather();
    void show_night_weather();

    return m_weather_scraper.get_description();
}

QString WeatherController::get_weather_feels_like() const {
    return m_weather_scraper.get_feels_like();
}

QString WeatherController::get_weather_humidity() const {
    return m_weather_scraper.get_humidity();
}

QString WeatherController::get_weather_pressure() const {
    return m_weather_scraper.get_pressure();
}

QString WeatherController::get_uv_value_full() const {
    return QString().number(m_weather_scraper.get_uv_value().toDouble()*100.0, 'f', 2);
}

double WeatherController::get_uv_value() const {
    return m_weather_scraper.get_uv_value().toDouble()*100/25; //Max is supposed to be around 25, but the value are from 0 to 100, so multiply by 25 to get the supposed value
}

QString WeatherController::get_uv_time() const {
    return m_weather_scraper.get_uv_time_measured();
}

QString WeatherController::get_uv_date() const {
    return m_weather_scraper.get_uv_date_measured();
}

QString WeatherController::get_uv_warning() const {
    return m_weather_scraper.get_uv_warning();
}

//SLOTS
void WeatherController::get_weather_data_update(){
    m_network_connection.load_connection(false);
}//end of WeatherController::get_weather_data_update()

void WeatherController::received_weather_data(){
    //This is to ensure that the data is shown on the display as is necessary.
    emit notify_weather_data_updated();
}//end of WeatherController:;received_weather_data

void WeatherController::received_forecast_data(){
    m_forecast_model.set_day_data(m_weather_scraper.get_forecast_days());
    m_forecast_model.set_description_data(m_weather_scraper.get_forecast_descriptions());
    m_forecast_model.set_icon_data(m_weather_scraper.get_forecast_icons());
    m_forecast_model.set_max_temp_data(m_weather_scraper.get_forecast_max_temps());
    m_forecast_model.set_min_temp_data(m_weather_scraper.get_forecast_min_temps());

    emit notify_forecast_data_updated();
}//end of WeatherController::received_forecast_data

void WeatherController::received_uv_data(){
    m_sidebar_model.set_data(m_weather_scraper.get_sidebar_model_data());

    emit notify_uv_data_updated();
}//end of WeatherController::received_uv_data


//Slots
void WeatherController::receive_city_data(const QVariant &input){
    //Determine whether the passed QVariant is valid for use
        QString input_city_data = "Los Angeles";
        if(input.isValid()){
            input_city_data = input.toString();
        }//end of if

    //Make sure that there are no commas in the name, and that the name of the city is used with no additional parameters
        //Look for the comma, if there is one
        if(input_city_data.contains(", ")){
            //Here the assumption is made that if they did attach the country code, then it(country code) will be input first
            input_city_data = input_city_data.split(", ").last();
        }else if(input_city_data.contains(',')){
            //Here the same assumption is made, but with the additional assumption that they didn't separate the town and country code with a space
            input_city_data = input_city_data.split(",").last();
        }else if(input_city_data.contains("loading...", Qt::CaseSensitivity::CaseInsensitive)){
            input_city_data = "Los Angeles";
        }//end of if

    //Run the city through the network connection to get the necessary data
        m_network_connection.set_city(input_city_data.toLower());
        m_network_connection.load_connection(true);
}//end of WeatherController::find_city_data


void WeatherController::received_geo_position(const QList<QString>& position){
    if(geo_positional_data_received_counter < 1){
        //qDebug() << "Received Geo Coordinates";
        m_network_connection.set_latitude(position.front());
        m_network_connection.set_longitude(position.back());
    }//end of if

    //Start the gathering weather data with the provided location, be it the default or the GPS provided
    emit start_weather_data_update();
    geo_positional_data_received_counter++;
}//end of WeatherController::received_geo_position

void WeatherController::no_geo_position_available(){
    //qDebug() << "No GeoPosition devices available for the device. Transmitting default coordinates.";
}//end of WeatherController::no_geo_position_available
