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
 * @brief: displays the custom UV progress bar and UV Index sidebar component
 */

import QtQuick 2.12

import components 1.0
import styles 1.0

Item {
    id: uv_item_frame

    //property declarations
    property string uv_value: "400"
    property alias uv_progress_bar_value: uv_control_index_item.value
    property string uv_warning: "Hazardous"
    property string uv_date: "Fri, June 31"
    property string uv_time: "22:00"
    property string uv_text_colour: "#ffffff"

    //Add in the backgroud pane
    BackgroundPane{
        id: uv_background_pane
        height: parent.height
        width: parent.width
        anchors.centerIn: parent
    }//end of BackgroundPane


    //UVControl to show the levels of gasses in the UVControl
    Item {
        id: uv_control_progress_bar
        anchors.margins: uv_background_pane.background_pane_margins * 2.2
        anchors{
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }

        width: parent.width/2
        height: parent.height

        UVControl {
            id: uv_control_index_item
            anchors.margins: 10
            anchors{
                top: parent.top
                bottom: parent.bottom
                left: parent.left
            }//end of anchors aggregate

            width: parent.width
            height: parent.height

            //Set the values
            text: uv_value
        }//end of UVControl
    }//end of Item

    Item {
        id: uv_control_sidebar
        anchors.margins: uv_background_pane.background_pane_margins * 2.2
        anchors{
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: uv_control_progress_bar.right
        }//end of anchors aggregate

        width: parent.width/2
        height: parent.height

        UVControlSideBar {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height

            date: uv_date
            time: uv_time
            value: uv_value
            notice: uv_warning
        }//end of UVControlSideBar
    }//end of Item

    clip: true
}//end of Item
