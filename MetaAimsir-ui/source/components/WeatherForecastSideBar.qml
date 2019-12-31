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
 * @brief: displays the extra information not necessary for a need-to-see-immediately form in a scrollable sidebar
 */

import QtQuick 2.12
import QtQuick.Controls 2.12

import components 1.0
import styles 1.0
import SBM 1.0

Item{
    id: weather_forecast_today_sidebar_item
    height: weather_forecast_today_background_pane.height
    width: weather_forecast_today_background_pane.width * Styles.weather_forecast_today_sidebar_default_size

    //property declarations that will be settable from outside
    property alias weather_forecast_sidebar_model: weather_forecast_today_sidebar_list_view.model

    property string weather_forecast_sidebar_max_temp: "35"
    property string weather_forecast_sidebar_min_temp: "15"
    property string weather_forecast_sidebar_wind_speed: "3.5"
    property string weather_forecast_sidebar_wind_direction: "270"
    property string weather_forecast_sidebar_humidity: "88"
    property string weather_forecast_sidebar_ground_pressure: "1005"
    property string weather_forecast_sidebar_sea_level_pressure: "1018"

    //Property declarations for use within the component
    property bool weather_forecast_sidebar_background_pane_is_visible: true
    property string weather_forecast_sidebar_temp_unit: "C"
    property string weather_forecast_sidebar_symbol_degrees: "\u00B0"
    property string weather_forecast_sidebar_wind_speed_unit: "m/s"
    property string weather_forecast_sidebar_humidity_symbol: "%"
    property string weather_forecast_sidebar_pressure_symbol: "hPa"


    //Start drawing the components
    BackgroundPane{
        id: weather_forecast_today_sidebar_background_pane
        anchors.fill: parent
        visible: weather_forecast_sidebar_background_pane_is_visible
    }//end of BackgroundPane

    //Add in a column that will order the WeatherData components accordingly
    ScrollView{
        id: weather_forecast_sidebar_scrollview
        anchors.fill: parent
        anchors.margins: weather_forecast_today_sidebar_background_pane.background_pane_margins * 2
        anchors.leftMargin: -weather_forecast_today_sidebar_background_pane.background_pane_margins * 2

        ListView {
            id: weather_forecast_today_sidebar_list_view
            anchors.fill: parent
            orientation: ListView.Vertical
            cacheBuffer: 200
            snapMode: ListView.SnapOneItem
            highlightRangeMode: ListView.ApplyRange
            spacing: 8

            model: SidebarModel {id: sidebar_model}
            delegate: WeatherData {weather_icon: icon; weather_value: value}
            /*model: ListModel{
                id: weather_forecast_sidebar_list_model
                ListElement{icon: "temp_high_icon"; value: "85 C"}      //weather_forecast_sidebar_max_temp + weather_forecast_sidebar_symbol_degrees + weather_forecast_sidebar_temp_unit}
                ListElement{icon: "temp_low_icon"; value: "-22 C"}      //weather_forecast_sidebar_min_temp + weather_forecast_sidebar_symbol_degrees + weather_forecast_sidebar_temp_unit}
                ListElement{icon: "wind_icon"; value: "3.5 m/s"}        //weather_forecast_sidebar_wind_speed + weather_forecast_sidebar_wind_speed_unit}
                ListElement{icon: "direction_icon"; value: "370 "}      //weather_forecast_sidebar_wind_direction + " " + weather_forecast_sidebar_symbol_degrees}
                ListElement{icon: "humidity_icon"; value: "77%"}        //weather_forecast_sidebar_humidity + " " + weather_forecast_sidebar_humidity_symbol}
                ListElement{icon: "altitude_icon"; value: "1018 hPa"}   //weather_forecast_sidebar_ground_pressure + " " + weather_forecast_sidebar_pressure_symbol}
                ListElement{icon: "sea_level_icon"; value: "1005 hPa"}  //weather_forecast_sidebar_sea_level_pressure + " " + weather_forecast_sidebar_pressure_symbol}
            }//end of model;*/

            clip: true
        }//end of ListView
    }//end of ScrollView

    clip: true
}//end of Item
