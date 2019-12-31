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
 * @brief: displays all information found within the forecast for today
 */

import QtQuick 2.12

import styles 1.0
import components 1.0

Item {
    id: weather_forecast_today_item_frame

    //Properties
    property alias weather_forecast_sidebar_model: weather_forecast_today_sidebar.weather_forecast_sidebar_model

    property alias weather_icon: weather_forecast_today_weather_item.weather_icon
    property alias weather_max_temp: weather_forecast_today_weather_item.weather_max_temp
    property alias weather_min_temp: weather_forecast_today_weather_item.weather_min_temp
    property alias weather_description: weather_forecast_today_weather_item.weather_description

    property alias weather_forecast_sidebar_max_temp: weather_forecast_today_sidebar.weather_forecast_sidebar_max_temp
    property alias weather_forecast_sidebar_min_temp: weather_forecast_today_sidebar.weather_forecast_sidebar_min_temp
    property alias weather_forecast_sidebar_wind_speed: weather_forecast_today_sidebar.weather_forecast_sidebar_wind_speed
    property alias weather_forecast_sidebar_wind_direction: weather_forecast_today_sidebar.weather_forecast_sidebar_wind_direction
    property alias weather_forecast_sidebar_humidity: weather_forecast_today_sidebar.weather_forecast_sidebar_humidity
    property alias weather_forecast_sidebar_ground_pressure: weather_forecast_today_sidebar.weather_forecast_sidebar_ground_pressure
    property alias weather_forecast_sidebar_sea_level_pressure: weather_forecast_today_sidebar.weather_forecast_sidebar_sea_level_pressure

    //The actual compoenents
    BackgroundPane{
        id: weather_forecast_today_background_pane
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }//end of BackgroundPane

    WeatherForecastItem{
        id: weather_forecast_today_weather_item
        height: weather_forecast_today_background_pane.height
        width: weather_forecast_today_background_pane.width * (1 - Styles.weather_forecast_today_sidebar_default_size)

        weather_forecast_item_background_pane_is_visible: false

        anchors{
            top: weather_forecast_today_background_pane.top
            bottom: weather_forecast_today_background_pane.bottom
            left: weather_forecast_today_background_pane.left
        }//end of anchors aggregate
    }//end of WeatherForecastItem


    WeatherForecastSideBar{
        id: weather_forecast_today_sidebar
        weather_forecast_sidebar_background_pane_is_visible: false

        anchors{
            top: weather_forecast_today_background_pane.top
            bottom: weather_forecast_today_background_pane.bottom
            right: weather_forecast_today_background_pane.right
            left: weather_forecast_today_weather_item.right
        }//end of anchors aggregate
    }//end of WeatherForecastSideBar

    clip: true
}//end of Item
