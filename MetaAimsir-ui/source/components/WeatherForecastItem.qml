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
 * @brief: displays the main forecast information
 */

import QtQuick 2.12


import components 1.0
import styles 1.0

Item {
    id: weather_forecast_item_frame

    //Declare some properties to use throughout the application while being accessible to the outside
    property string weather_icon: "04d"
    property string weather_max_temp: "35"
    property string weather_min_temp: "15"
    property string weather_description: "light wind"
    property string weather_unit: "C"
    property int weather_icon_scale: 2
    property bool weather_forecast_item_background_pane_is_visible: false

    //properties that would normally be private
    property string _weather_icon_path: "qrc:/icons/"
    property string _weather_degreees_symbol: "\u00B0"
    property real _weather_forecast_icon_pane_height_percentage: 1 - Styles.weather_forecast_today_sidebar_default_size


    //Some basic/default settings for the pane
    height: 120
    width: parent.width

    //Add in the actual background properties
    BackgroundPane {
        id: weather_forecast_background_pane
        anchors.fill: parent

        visible: weather_forecast_item_background_pane_is_visible
    }//end of BackgroundPane

    //Add in the Icon to be displayed
    Item{
        id: weather_forecast_icon_item
        width: weather_forecast_background_pane.width
        height: weather_forecast_background_pane.height * _weather_forecast_icon_pane_height_percentage
        anchors{
            top: weather_forecast_background_pane.top
            left: weather_forecast_background_pane.left
            right: weather_forecast_background_pane.right
        }//end of anchors aggregate

        Image {
            id: weather_forecast_icon_image
            fillMode: Image.PreserveAspectCrop
            anchors.centerIn: parent

            source: _weather_icon_path + (weather_icon != "" ? weather_icon: "01d")

            smooth: true
            antialiasing: true
            scale: weather_icon_scale
        }//end of Image
    }//end of Item


    //Add in the weather temperature
    Item{
        id: weather_forecast_temperature_item
        width: weather_forecast_background_pane.with
        height: weather_forecast_background_pane.height * (1 - _weather_forecast_icon_pane_height_percentage)
        anchors{
            top: weather_forecast_icon_item.bottm
            left: weather_forecast_background_pane.left
            right: weather_forecast_background_pane.right
            bottom: weather_forecast_background_pane.bottom
        }//end of anchors aggregate

        //The Temperature Text component
        Item {
            id: weather_forecast_temperature_text_item
            width: parent.width
            anchors.centerIn: parent

            //The text will be centered, but be offset vertically with the largest height between the temperature components
            //The max and min weather text components will also be offset horizontally by half of their original size
            Text{
                id: weather_forecast_max_temp_text_item
                text: weather_max_temp
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: -(width/2)
                anchors.verticalCenterOffset: -(height)
                font.pixelSize: Styles.default_text_header_pixel_size
                color: Styles.default_text_colour
            }//end of Text

            Text{
                id: weather_forecast_min_temp_text_item
                text: "|" + weather_min_temp + _weather_degreees_symbol + weather_unit
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: (width/2)
                anchors.verticalCenterOffset: -(weather_forecast_max_temp_text_item.height)
                font.pixelSize: Styles.default_text_small_header_pixel_size
                color: Styles.default_text_colour
            }//end of Text

            Text{
                id: weather_forecast_description_text_item
                text: weather_description
                anchors.centerIn: parent
                font.pixelSize: Styles.default_text_pixel_size
                font.capitalization: Font.Capitalize
                color: Styles.default_text_colour
            }//end of text
        }//end of Item
    }//end of Item
}//end of Item

