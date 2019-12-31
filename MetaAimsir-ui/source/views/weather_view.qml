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
 * @brief: displays all the required weather data to the user
 */
import QtQuick 2.12
import QtQuick.Controls 2.12

import styles 1.0
import components 1.0

Item {
    id: weather_view_main_view

    //Add in the blurred background - will be changable with the controller class
    Background{
        id: weather_view_main_view_background
        background_image_name: "sky_rainy"
    }//end of background

    //Add in the particle effects for rain and snow when applicable
    BackgroundParticleEffect {
        id: weather_view_main_view_background_particle_effect
        anchors.fill: parent
        particle_type: "snow" //can be snow too
    }//end of BacgroundParticleEffect

    //Add in the comonents that will display the weather an the location as necessary within a ScrollView
    //ScrollView {
        Column {
            anchors.fill: parent
            width: weather_view_main_view.width
            height: weather_view_main_view.height

            spacing: (-1) * (Styles.pane_margins)

            LocationBar{
                id: location_bar_weather_view
                width: parent.width
                height: width * 0.1185770750988

                location_bar_text: "loading..."
            }//end of LocationBar

            WeatherForecastToday{
                id: weather_forecast_today_view
                width: parent.width
                height: width * Styles.weather_forecast_today_height_ratio

            }//end of WeatherForecastToday

            WeatherForecastFiveDays{
                id: weather_forecast_five_days_view
                width: parent.width
                height: width * Styles.weather_forecast_five_days_height_ratio
            }//end of WeatherForecastFiveDays

            UVItem{
                id: uv_item_view
                width: parent.width
                height: width * Styles.air_quality_item_height_ratio //200
            }//end of UVItem
        }//end of Column
    //}//end of ScrollView


        //Add in the Connections to ensure the weather forecast is properly simulated
        Connections {
            target: weather_controller

            onShow_rainy_weather: {
                weather_view_main_view_background.background_image_name = "sky_rainy"
            }//end of signal
            onShow_sunny_weather: {
                weather_view_main_view_background.background_image_name = "sky_sunny"
            }//end of signal
            onShow_snowy_weather: {
                weather_view_main_view_background.background_image_name = "sky_snowy"
            }//end of signal
            onShow_windy_weather: {
                weather_view_main_view_background.background_image_name = "sky_windy"
            }//end of signal
            onShow_night_weather: {
                weather_view_main_view_background.background_image_name = "sky_night"
            }//end of signal
            onShow_cloudy_weather: {
                weather_view_main_view_background.background_image_name = "sky_cloudy"
            }//end of signal

            //To get the data
            onNotify_weather_data_updated: {
                //Set the Location Bar information
                location_bar_weather_view.location_bar_text = weather_controller.ui_country_code + ", " +weather_controller.ui_town_name;

                //Set the current forecast information
                weather_forecast_today_view.weather_icon = weather_controller.ui_weather_icon;
                weather_forecast_today_view.weather_max_temp = weather_controller.ui_current_temp;
                weather_forecast_today_view.weather_min_temp = weather_controller.ui_min_temp;
                weather_forecast_today_view.weather_description = weather_controller.ui_weather_description;

                //Set the current forecast sidebar information
                weather_forecast_today_view.weather_forecast_sidebar_model = weather_controller.ui_sidebar_model;
            }//end of signal
            onNotify_forecast_data_updated: {
                //set the 5-6 day daily forecast information
                weather_forecast_five_days_view.weather_forecast_five_days_model = weather_controller.ui_forecast_model;
            }//end of signal
            onNotify_uv_data_updated: {
                //Set the UV information
                uv_item_view.uv_value = weather_controller.ui_uv_value_full;
                uv_item_view.uv_progress_bar_value = weather_controller.ui_uv_value;
                uv_item_view.uv_warning = weather_controller.ui_uv_warning;
                uv_item_view.uv_date = weather_controller.ui_uv_date;
                uv_item_view.uv_time = weather_controller.ui_uv_time;
            }//end of signal
        }//end of connections
}//end of Item
