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
 * @brief: displays the forecast for the next 5-6 days
 */

import QtQuick 2.12
import QtQuick.Controls 2.12

import components 1.0
import styles 1.0
import FSM 1.0

//The WeatherForecastFiveDays component creates a view that displays five days' worth of WeatherForecastItem components in a scrollable list view horizontally.
Item {
    id: weather_forecast_five_days_item_frame

    //Properties accessible from outside
    property alias weather_forecast_five_days_model: weather_forecast_five_days_list_view.model

    //Add in the necessary background pane
    BackgroundPane {
        id: weather_forecast_five_days_background_pane
        width: parent.width
        height: parent.height
        anchors.fill: parent
    }//end of Background Pane

    //Add in the ListView that will display 5 days' worth of forecasts
    ListView {
        id: weather_forecast_five_days_list_view
        anchors.fill: parent
        anchors.margins: weather_forecast_five_days_background_pane.background_pane_margins * 2
        orientation: ListView.Horizontal
        cacheBuffer: 20
        snapMode: ListView.SnapToItem
        highlightRangeMode: ListView.ApplyRange

        model: ForecastModel {id: forecast_model}
        delegate: WeatherForecastItemSmall {weather_icon: icon; weather_max_temp: max_temp; weather_min_temp: min_temp; weather_description: description; weather_day: day}
        /*model: ListModel{
            ListElement{icon: "01d"; max: 45; min: 24; description: "windy"; unit: "C"; day: "mon"}
            ListElement{icon: "02d"; max: 45; min: 24; description: "windy"; unit: "C"; day: "tue"}
            ListElement{icon: "03d"; max: 45; min: 24; description: "windy"; unit: "C"; day: "thu"}
            ListElement{icon: "04d"; max: 45; min: 24; description: "windy"; unit: "C"; day: "fri"}
            ListElement{icon: "09d"; max: 45; min: 24; description: "windy"; unit: "C"; day: "sat"}
        }//end of model*/
        clip:true
    }//end of ListView
}//end of Item
