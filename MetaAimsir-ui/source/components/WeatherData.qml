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
 * @brief: displays unessential data in a bar. Icons and Values only
 */

import QtQuick 2.12

import components 1.0
import styles 1.0

Item{
    id: weather_data_item_frame
    width: parent.width
    height: Styles.default_weather_data_icon_size + (2*Styles.default_weather_data_icon_buffer_size)

    //property declarations
    property string weather_icon: "altitude_icon"
    property int weather_icon_size: Styles.default_weather_data_icon_size
    property string weather_value: "value"
    property real weather_icon_pane_size: Styles.default_weather_data_icon_pane_width

    //properties that would normally be declared private
    property string _weather_icon_path: Styles.default_weather_data_icon_path
    property int _text_pixel_size: Styles.default_text_pixel_size

    //The Item containing the icon in its center
    Item{
        id: weather_data_icon_item

        anchors{
            top: weather_data_item_frame.top
            left: weather_data_item_frame.left
            bottom: weather_data_item_frame.bottom
        }//end of anchors aggregate

        width: parent.width * weather_icon_pane_size
        height: parent.height

        Image{
            source: _weather_icon_path + weather_icon
            width: Styles.default_weather_data_icon_size
            height: Styles.default_weather_data_icon_size
            anchors.centerIn: parent
        }//end of image
    }//end of Item

    //The Item containing the value in its center
    Item{
        id: weather_data_icon_value_item

        anchors{
            top: weather_data_item_frame.top
            right: weather_data_item_frame.right
            bottom: weather_data_item_frame.bottom
            left: weather_data_icon_item.right
        }//end of anchors aggregate

        width: parent.width * (1 - weather_icon_pane_size)
        height: parent.height

        Text {
            text: weather_value
            color: Styles.default_text_colour
            anchors.centerIn: parent
        }//end of Text
    }//end of Item

    clip: true
}//end of Item
