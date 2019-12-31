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

#include "weatherscraper.h"

#include "sidebarmodel.h"

WeatherScraper::WeatherScraper(QObject *parent) : QObject(parent){
    //Do nothing
}//end of ctor

WeatherScraper::WeatherScraper(const WeatherScraper& copy):QObject(this){
    m_current_weather_icon = copy.m_current_weather_icon;
    m_current_weather_max_temp = copy.m_current_weather_max_temp;
    m_current_weather_min_temp = copy.m_current_weather_min_temp;
    m_current_weather_temp = copy.m_current_weather_temp;
    m_current_weather_description = copy.m_current_weather_description;

    m_current_visibility = copy.m_current_visibility;
    m_current_wind_speed = copy.m_current_wind_speed;
    m_current_wind_direction = copy.m_current_wind_direction;
    m_current_cloud_coverage = copy.m_current_cloud_coverage;
    m_current_country_code = copy.m_current_country_code;
    m_current_sunrise_time = copy.m_current_sunrise_time;
    m_current_sunset_time = copy.m_current_sunset_time;
    m_current_town_name = copy.m_current_town_name;
    m_current_rain_value = copy.m_current_rain_value;
    m_current_snow_value = copy.m_current_snow_value;

    m_positional_data = copy.m_positional_data;
    m_forecast_descriptions = copy.m_forecast_descriptions;
    m_forecast_icons = copy.m_forecast_icons;
    m_forecast_days = copy.m_forecast_days;
    m_forecast_max_temps = copy.m_forecast_max_temps;
    m_forecast_min_temps = copy.m_forecast_min_temps;

    //To store the network connection data
    m_weather_json_data = copy.m_weather_json_data;
    m_forecast_json_data = copy.m_forecast_json_data;
    m_uv_json_data = copy.m_uv_json_data;
}//end of overloaded dtor

WeatherScraper& WeatherScraper::operator=(const WeatherScraper& copy){
    //prevents self-assignment
    if(this != &copy){
        WeatherScraper::QObject(this);
        m_current_weather_icon = copy.m_current_weather_icon;
        m_current_weather_max_temp = copy.m_current_weather_max_temp;
        m_current_weather_min_temp = copy.m_current_weather_min_temp;
        m_current_weather_temp = copy.m_current_weather_temp;
        m_current_weather_description = copy.m_current_weather_description;

        m_current_visibility = copy.m_current_visibility;
        m_current_wind_speed = copy.m_current_wind_speed;
        m_current_wind_direction = copy.m_current_wind_direction;
        m_current_cloud_coverage = copy.m_current_cloud_coverage;
        m_current_country_code = copy.m_current_country_code;
        m_current_sunrise_time = copy.m_current_sunrise_time;
        m_current_sunset_time = copy.m_current_sunset_time;
        m_current_town_name = copy.m_current_town_name;
        m_current_rain_value = copy.m_current_rain_value;
        m_current_snow_value = copy.m_current_snow_value;

        m_positional_data = copy.m_positional_data;
        m_forecast_descriptions = copy.m_forecast_descriptions;
        m_forecast_icons = copy.m_forecast_icons;
        m_forecast_days = copy.m_forecast_days;
        m_forecast_max_temps = copy.m_forecast_max_temps;
        m_forecast_min_temps = copy.m_forecast_min_temps;

        //To store the network connection data
        m_weather_json_data = copy.m_weather_json_data;
        m_forecast_json_data = copy.m_forecast_json_data;
        m_uv_json_data = copy.m_uv_json_data;
    }//end of if

    return *this;
}//end of overloaded =


//Other functions
void WeatherScraper::get_weather_data(){
    //Create the Json Object from the transferred json data
    QJsonDocument document = QJsonDocument::fromJson(m_weather_json_data.toUtf8());
    QJsonObject object = document.object();

    //Get the positional data
    QJsonObject coordinates = object.find("coord")->toObject();
    set_latitude(coordinates.find("lat").value().toVariant());
    set_longitude(coordinates.find("lon").value().toVariant());

    //Get the weather data: icon, description
    QJsonObject weather = object.find("weather")->toArray().takeAt(0).toObject();
    set_description(weather.find("description").value().toVariant());
    set_icon(weather.find("icon").value().toVariant());

    //Get the main weather data: temp, max temp, min temp, humidity, pressure, and feels like
    QJsonObject main = object.find("main")->toObject();
    set_feels_like(main.find("feels_like").value().toVariant());
    set_humidity(main.find("humidity").value().toVariant());
    set_pressure(main.find("pressure").value().toVariant());
    set_current_temp(main.find("temp").value().toVariant());
    set_max_temp(main.find("temp_max").value().toVariant());
    set_min_temp(main.find("temp_min").value().toVariant());

    QJsonObject visibility = object.find("visibility")->toObject();
    set_visibility(object.find("visibility").value().toVariant());

    QJsonObject wind = object.find("wind")->toObject();
    set_wind_speed(wind.find("speed").value().toVariant());
    set_wind_direction(wind.find("deg").value().toVariant());

    //Get cloud coverage %
    set_cloud_coverage(object.find("clouds")->toObject().find("all").value().toVariant());

    //Get main system information: country, sunrise time and sunset time
    QJsonObject system = object.find("sys")->toObject();

    set_country_code(system.find("country").value().toVariant());

    set_sunset_time(QVariant(QDateTime::fromTime_t(system.find("sunset").value().toVariant().toUInt(), Qt::LocalTime).toString("hh:mm")));
    set_sunrise_time(QVariant(QDateTime::fromTime_t(system.find("sunrise").value().toVariant().toUInt(), Qt::LocalTime).toString("hh:mm")));

    //Get the town name
    set_town_name(object.find("name").value().toVariant());

    //Get and Set the rain or snow data if applicable - not sure where yet
    set_rain_value(object.find("rain")->toObject().find("1h")->toVariant());
    set_snow_value(object.find("snow")->toObject().find("1h")->toVariant());

    //Send the signal indicating that the weather data has been updated and clear the inserted weather forecast data
    emit updated_weather_data();
    m_weather_json_data.clear();
}//end of WeatherScraper:;get_weather_data();

void WeatherScraper::get_forecast_data(){
    //Create the Json Object from the transferred json data
    QJsonDocument document = QJsonDocument::fromJson(m_forecast_json_data.toUtf8());
    QJsonObject object = document.object();

    //Get the daily forecast data for 5 days
    QList<QString> descriptions;
    QList<QString> icons;
    QList<QString> max_temps;
    QList<QString> min_temps;
    QList<QString> days;
    QList<QString> units;
    int NUMBER_OF_DAYS = 6;                                                                     //Get 5 days' worth of forecasts, including today

    for(int day_counter = 0; day_counter <= NUMBER_OF_DAYS; day_counter++){
        //Set the JsonArray to the appropriate data
        QJsonObject today = object.find("list")->toArray().at(day_counter).toObject();

        //Get the Date and Day:
        days.append(QDateTime::fromTime_t(today.find("dt").value().toVariant().toUInt(), Qt::LocalTime).toString("ddd"));

        //Get the day's max and min temps - convert them to integers instead of doubles and store them
        max_temps.append(QVariant(today.find("temp").value().toObject().find("max").value().toVariant().toInt()).toString());
        min_temps.append(QVariant(today.find("temp").value().toObject().find("min").value().toVariant().toInt()).toString());

        //Get the icon and weather description
        today = today.find("weather").value().toArray().at(0).toObject();
        descriptions.append(today.find("description").value().toString());
        icons.append(today.find("icon").value().toString());

        //Stopgap measure since the weather application will first work with Celsius and only Celsius
        units.append("C");
    }//end of for loop

    //Remove the first item (it represents the current day) after determining whether there is an inconsistency in the max and min temps
        if(get_max_temp().toInt() != max_temps.front().toInt()){
            set_max_temp(QVariant(max_temps.front()));
        }//end of if
        if(get_min_temp().toInt() != min_temps.front().toInt()){
            set_min_temp(QVariant(min_temps.front()));
        }//end of if

        descriptions.pop_front();
        icons.pop_front();
        max_temps.pop_front();
        min_temps.pop_front();
        days.pop_front();
        units.pop_front();

    //Set the necessary data
        set_forecast_descriptions(descriptions);
        set_forecast_icons(icons);
        set_forecast_days(days);
        set_forecast_min_temps(min_temps);
        set_forecast_max_temps(max_temps);
        set_forecast_units(units);

    //Send the signal indicating that the weather data has been updated and clear the inserted weather daily forecast data
    emit updated_forecast_data();
    m_forecast_json_data.clear();
}//end of WeatherScraper::get_forecast_data

void WeatherScraper::get_uv_data(){
    //Create the Json Object from the transferred json data
    QJsonDocument document = QJsonDocument::fromJson(m_uv_json_data.toUtf8());
    QJsonObject object = document.array().at(0).toObject();

    //Get the current data
    set_uv_date_measured(QVariant(QDateTime::fromString(object.find("date_iso").value().toString(), "yyyy-MM-ddThh:mm:ssZ").toString("ddd, MMM dd")));

    //Get the current time
    set_uv_time_measured(QVariant(QDateTime::fromString(object.find("date_iso").value().toString(), "yyyy-MM-ddThh:mm:ssZ").toString("hh:mm")));

    //Get the UV Value
    set_uv_value(QVariant(object.find("value").value().toDouble()/100));  //Divide it to a number between 0 and 1 for progress bar use - but the max value is supposed to stay between 0 and 25 for spectrum use

    //Set the UV Warning through looking at the uv value
    set_uv_warning(object.find("value").value().toVariant());

    //Send the signal indicating that the weather data has been updated and clear the inserted uv data
    emit updated_uv_data();
    m_uv_json_data.clear();
}//end of WeatherScraper::get_uv_data


//Getters
QString WeatherScraper::get_latitude() const{
    return m_positional_latitude;
}//end of WeatherScraper::get_latitude()

QString WeatherScraper::get_longitude() const{
    return m_positional_longitude;
}//end of WeatherScraper::get_longitude()

QString WeatherScraper::get_icon() const{
    return m_current_weather_icon;
}//end of WeatherScraper::get_icon

QString WeatherScraper::get_description() const{
    return m_current_weather_description;
}//end of WeatherScraper::get_description()

QString WeatherScraper::get_feels_like() const{
    return m_current_feels_like;
}//end of WeatherScraper::get_feels_like()

QString WeatherScraper::get_humidity() const {
    return m_current_humidity;
}//end of WeatherScraper::get_humidity()

QString WeatherScraper::get_pressure() const {
    return m_current_pressure;
}//end of WeatherScraper::get_pressure()

QString WeatherScraper::get_current_temp() const{
    return m_current_weather_temp;
}//end of WeatherScraper:;get_current_temp()

QString WeatherScraper::get_max_temp() const{
    return m_current_weather_max_temp;
}//end of WeatherScraper::get_max_tem()

QString WeatherScraper::get_min_temp() const{
    return m_current_weather_min_temp;
}//end of WeatherScraper::get_min_temp()

QString WeatherScraper::get_visibility() const {
    return m_current_visibility;
}//end of WeatherScraper::get_visiblity()

QString WeatherScraper::get_wind_speed() const {
    return m_current_wind_speed;
}//end of WeatherScraper::get_wind_speed()

QString WeatherScraper::get_wind_direction() const{
    return m_current_wind_direction;
}//end of WeatherScraper::get_wind_direction()

QString WeatherScraper::get_cloud_coverage() const{
    return m_current_cloud_coverage;
}//end of WeatherScraper::get_cloud_coverage()

QString WeatherScraper::get_country_code() const {
    return m_current_country_code;
}//end of WeatherScraper::get_country_code()

QString WeatherScraper:: get_sunset_time() const {
    return m_current_sunset_time;
}//end of WeatherScraper::get_sunset_time()

QString WeatherScraper::get_sunrise_time() const {
    return m_current_sunrise_time;
}//end of WeatherScraper::get_sunrise_time()

QString WeatherScraper::get_town_name() const {
    return m_current_town_name;
}//end of WeatherScraper::get_town_name()

QString WeatherScraper::get_rain_value() const {
    return m_current_rain_value;
}//end of WeatherScraper::get_rain_value()

QString WeatherScraper::get_snow_value() const {
    return m_current_snow_value;
}//end of WeatherScraper::get_snow_value()


QList<QString> WeatherScraper::get_forecast_descriptions() const{
    return m_forecast_descriptions;
}//end of WeatherScraper::get_forecast_descriptions

QList<QString> WeatherScraper::get_forecast_icons() const{
    return m_forecast_icons;
}//end of WeatherScraper::get_forecast_icons

QList<QString> WeatherScraper::get_forecast_days() const{
    return m_forecast_days;
}//end of WeatherScraper:;get_forecast_days()

QList<QString> WeatherScraper::get_forecast_max_temps() const{
    return m_forecast_max_temps;
}//end of WeatherScraper::get_forecast_max_temps()

QList<QString> WeatherScraper::get_forecast_min_temps() const{
    return m_forecast_min_temps;
}//end of WeatherScraper::get_forecast_min_temps

QList<QString> WeatherScraper::get_forecast_units() const{
    return m_forecast_units;
}//end of WeatherScraper:;get_Foreacst_units

QString WeatherScraper::get_uv_date_measured() const{
    return m_uv_date;
}//end of WeatherScraper::get_uv_date()

QString WeatherScraper::get_uv_time_measured() const{
    return m_uv_time;
}//end of WeatherScraper::get_uv_time_measured

QString WeatherScraper::get_uv_value() const{
    return m_uv_value;
}//end of WeatherScraper::get_uv_value()

QString WeatherScraper::get_uv_warning() const{
    return m_uv_warning;
}//end of WeatherScraper::get_uv_warning()

QList<QString> WeatherScraper::get_sidebar_model_data() const{
    static QList<QString> model_data;
    model_data.clear();

    model_data.append(get_max_temp()+" \u00B0C");
    model_data.append(get_min_temp()+" \u00B0C");
    model_data.append(get_wind_speed()+" m/s");
    model_data.append(get_wind_direction()+(get_wind_direction() != "N/A" ? " \u00B0":""));
    model_data.append(get_cloud_coverage()+" %");
    model_data.append(get_pressure()+" hPa");
    model_data.append(QString("%1 km").arg((get_visibility().toInt()/1000.0)));

    return model_data;
}//end of model data


//Setters
void WeatherScraper::set_latitude(const QVariant &value){
    //Determine whether the value passed as a QVariant is valid
    QString lat = "N/A";
    if(value.isValid()){
        lat = value.toString();
    }//end of if

    m_positional_latitude = lat;
}//end of WeatherScraper::set_latitude

void WeatherScraper::set_longitude(const QVariant &value){
    //Determine whether the value passed as a QVariant is valid
    QString lon = "N/A";
    if(value.isValid()){
        lon = value.toString();
    }//end of if

    m_positional_longitude = lon;
}//end of WeatherScraper::set_longitude


void WeatherScraper::set_icon(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString icon = "01d";
    if(value.isValid()){
        icon = value.toString();
    }//end of if

    m_current_weather_icon = icon;
}//end of WeatherScraper::set_icon

void WeatherScraper::set_description(const QVariant &value){
    //Determine whetheer the value passed as a QVariant is valid
    QString description = "N/A";
    if(value.isValid()){
        description = value.toString();
    }//end of if

    m_current_weather_description = description;
}//end of WeatherScraper::set_description

void WeatherScraper::set_feels_like(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString feels_like = "N/A";
    if(value.isValid()){
        feels_like = value.toString();
    }//end of if

    m_current_feels_like = feels_like;
}//end of WeatherScraper::set_feels_like

void WeatherScraper::set_humidity(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString humidity = "N/A";
    if(value.isValid()){
        humidity = value.toString();
    }//end of if

    m_current_humidity = humidity;
}//end of WeatherScraper::set_humidity

void WeatherScraper::set_pressure(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString pressure = "N/A";
    if(value.isValid()){
        pressure = value.toString();
    }//end of if

    m_current_pressure = pressure;
}//end of WeatherScraper::set_pressuer

void WeatherScraper::set_current_temp(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString current_temp = "N/A";
    if(value.isValid()){
        current_temp = value.toString();
    }//end of if

    m_current_weather_temp = current_temp;
}//end of WeatherScraper::set_current_temp()

void WeatherScraper::set_max_temp(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString max_temp = "N/A";
    if(value.isValid()){
        max_temp = value.toString();
    }//end of if

    m_current_weather_max_temp = max_temp;
}//end of WeatherScraper::set_max_temp()

void WeatherScraper::set_min_temp(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString min_temp = "N/A";
    if(value.isValid()){
        min_temp = value.toString();
    }//end of if

    m_current_weather_min_temp = min_temp;
}//end of WeatherScraper::set_min_temp()

void WeatherScraper::set_visibility(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString visibility = "N/A";
    if(value.isValid()){
        visibility = value.toString();
    }//end of if

    m_current_visibility = visibility;
}//end of WeatherScraper::set_visibility()

void WeatherScraper::set_wind_direction(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString wind_direction = "N/A";
    if(value.isValid()){
        wind_direction = value.toString();
    }//end of if

    m_current_wind_direction = wind_direction;
}//end of WeatherScraper::set_wind_direction

void WeatherScraper::set_wind_speed(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString wind_speed = "N/A";
    if(value.isValid()){
        wind_speed = value.toString();
    }//end of if

    m_current_wind_speed = wind_speed;
}//end of WeatherScraper::set_wind_speed

void WeatherScraper::set_cloud_coverage(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString cloud_coverage = "N/A";
    if(value.isValid()) {
        cloud_coverage = value.toString();
    }//end of if

    m_current_cloud_coverage = cloud_coverage;
}//end of WeatherScraper::set_cloud_coverage()

void WeatherScraper::set_country_code(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString country_code = "N/A";
    if(value.isValid()){
        country_code = value.toString();
    }//end of if

    m_current_country_code = country_code;
}//end of WeatherScraper::set_country

void WeatherScraper::set_sunrise_time(const QVariant& value) {
    //Determine whether the value passed as a QVariant is valid
    QString sunrise_time = "N/A";
    if(value.isValid()){
        sunrise_time = value.toString();
    }//end of if

    m_current_sunrise_time = sunrise_time;
}//end of WeatherScraper::set_sunrise_time()

void WeatherScraper::set_sunset_time(const QVariant& value) {
    //Determine whether the value passed as a QVariant is valid
    QString sunset_time = "N/A";
    if(value.isValid()){
        sunset_time = value.toString();
    }//end of if

    m_current_sunset_time = sunset_time;
}//end of WeatherScraper:;set_sunset_time()

void WeatherScraper::set_town_name(const QVariant &value){
    //Determine whether the value passed as a QVariant is valid
    QString town_value = "N/A";

    //Determine if the QVariant has any defined values
    if(value.isValid()){
        town_value = value.toString();
    }//end of if

    m_current_town_name = town_value;
}//end of WeatherScraper::set_town_name

void WeatherScraper::set_rain_value(const QVariant &value){
    //Find how much it rained in the last 1h or 3h. The value will not be valid if there has been no rain.
    QString rain_value = "N/A";
    QJsonObject rain_value_object = value.toJsonObject();

    //Determine if the JsonObject has any defined values, if it has, find out whether there is a 3h or 1h version. Whichever is found first will be used for the display
    if(value.isValid()){
        //If the rain object
        if(rain_value_object.find("snow")->toObject().find("1h")->toVariant().isValid()){
            rain_value = QString("%1mm/1h").arg(rain_value_object.find("snow")->toObject().find("1h")->toVariant().toString());
        }else{
            rain_value = QString("%1mm/3h").arg(rain_value_object.find("snow")->toObject().find("3h")->toVariant().toString());
        }//end of if else
    }//end of if else

    m_current_rain_value = rain_value;
}//end of WeatherScraper::set_rain_value()

void WeatherScraper::set_snow_value(const QVariant &value){
    QString snow_value = "N/A";
    QJsonObject snow_value_object = value.toJsonObject();
    if(value.isValid()){
        //If the rain object
        if(snow_value_object.find("snow")->toObject().find("1h")->toVariant().isValid()){
            snow_value = QString("%1mm/1h").arg(snow_value_object.find("snow")->toObject().find("1h")->toVariant().toString());
        }else{
            snow_value = QString("%1mm/3h").arg(snow_value_object.find("snow")->toObject().find("3h")->toVariant().toString());
        }//end of if else
    }//end of if else

    m_current_snow_value = snow_value;
}//end of WeatherScraper::set_snow_value()



void WeatherScraper::set_forecast_descriptions(const QList<QString>& input){
    m_forecast_descriptions = input;
}//end of WeatherScraper::set_forecast_descriptions

void WeatherScraper::set_forecast_icons(const QList<QString>& input){
    m_forecast_icons = input;
}//end of WeatherScraper::set_forecast_icons

void WeatherScraper::set_forecast_days(const QList<QString>& input){
    m_forecast_days = input;
}//end of WeatherScraper::set_forecast_days()

void WeatherScraper::set_forecast_max_temps(const QList<QString>& input){
    m_forecast_max_temps = input;
}//end of WeatherScraper::set_forecast_max_temps()

void WeatherScraper::set_forecast_min_temps(const QList<QString>& input){
    m_forecast_min_temps = input;
}//end of WeatherScraper::set_forecast_min_temps

void WeatherScraper::set_forecast_units(const QList<QString>& input){
    m_forecast_units = input;
}//end of WeatherScraper:;get_Foreacst_units



void WeatherScraper::set_uv_date_measured(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString date = "N/A";
    if(value.isValid()){
        date = value.toString();
    }//end of if

    m_uv_date = date;
}//end of WeatherScraper::set_uv_date_measured

void WeatherScraper::set_uv_time_measured(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString time = "N/A";
    if(value.isValid()){
        time = value.toString();
    }//end of if

    m_uv_time = time;
}//end of WeatherScraper::set_uv_time_measured

void WeatherScraper::set_uv_value(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString uv = "N/A";
    if(value.isValid()){
        uv = value.toString();
    }//end of if

    m_uv_value = uv;
}//end of WeatherScraper::set_uv_value()

void WeatherScraper::set_uv_warning(const QVariant& value){
    //Determine whether the value passed as a QVariant is valid
    QString warning = "N/A";
    if(value.isValid()){
        //Based on the scale from https://en.wikipedia.org/wiki/Ultraviolet_index#Index_usage adjust the warning as presented
        if((value.toDouble() >= 0.0f) && (value.toDouble() <= 2.0f)){
            warning = "Low";
        }else if((value.toDouble() >= 2.0f) && (value.toDouble() <= 3.0f)){
            warning = "High Low";
        }else if((value.toDouble() >= 3.0f) && (value.toDouble() <= 5.0f)){
            warning = "Moderate";
        }else if((value.toDouble() >= 5.0f) && (value.toDouble() <= 6.0f)){
            warning = "High Moderate";
        }else if((value.toDouble() >= 6.0f) && (value.toDouble() <= 7.0f)){
            warning = "High";
        }else if((value.toDouble() >= 7.0f) && (value.toDouble() <= 8.0f)){
            warning = "High High";
        }else if((value.toDouble() >= 8.0f) && (value.toDouble() <= 10.0f)){
            warning = "Very High";
        }else{
            warning = "Extreme";
        }//end of if else
    }//end of if

    m_uv_warning = warning;
}//end of WeatherScraper::set_uv_warning



//SLOTS
void WeatherScraper::handle_received_weather_data(const QString& weather_data){
    //qDebug() << weather_data;
    m_weather_json_data = weather_data;
    get_weather_data();
}//end of WeatherScraper::handle_received_weather_data()

void WeatherScraper::handle_received_forecast_data(const QString& forecast_data){
    //qDebug() << forecast_data;
    m_forecast_json_data = forecast_data;
    get_forecast_data();
}//end of WeatherScraper::handle_received_forecast_data

void WeatherScraper::handle_received_uv_data(const QString& uv_data){
    m_uv_json_data = uv_data;
    get_uv_data();
}//end of WeatherScraper::handle_received_uv_data
