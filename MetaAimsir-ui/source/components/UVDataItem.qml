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
 * @brief: displays the UV data in a form which contains a main heading and a value
 */

import QtQuick 2.9

import components 1.0
import styles 1.0

Item {
    id: uv_control_data_item_frame

    //Property declarations
    property color uv_control_sidebar_default_text_colour: "#ffffff"
    property string uv_control_sidebar_value: "value"
    property string uv_control_sidebar_gas: "CO"

    //Property declarations that would normally remain private
    property real _uv_control_item_width: 0.4

    //Create the Item that will contain the Gas name in its center
    Item {
        id: uv_control_gas_item
        anchors{
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }//end of anchors aggregate

        height: parent.height
        width: parent.width * _uv_control_item_width

        Text {
            id: uv_control_gas_text
            anchors.centerIn: parent
            color: uv_control_sidebar_default_text_colour
            text: uv_control_sidebar_gas + ":"
            font.bold: true
        }//end of Text
    }//end of Item

    //Create the Item that will contain the Gas' value in its center
    Item {
        id: uv_control_gas_value_item
        anchors{
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: uv_control_gas_item.right
        }//end of anchors aggregate

        height: parent.height
        width: parent.width * (1 - _uv_control_item_width)

        Text {
            id: uv_control_gas_value_text
            anchors.centerIn:  parent
            color: uv_control_sidebar_default_text_colour
            text: uv_control_sidebar_value
        }//end of Text
    }//end of Item
}//end of Item
