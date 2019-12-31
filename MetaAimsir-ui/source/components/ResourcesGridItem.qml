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
 * @brief: displays a resource item and a value horizontally separated
 */

import QtQuick 2.12
import QtGraphicalEffects 1.0

import components 1.0
import styles 1.0


Item {
    id: resources_grid_item_item_frame

    property alias _resource_path: resource_grid_item_text.text
    property alias _resource_icon: resource_grid_item_main_image.source

    width: 120
    height: 140

    //Create a simple yellow Background
    Rectangle {
        id: resource_grid_item_main_background_rectangle
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        radius: width * 0.05
        color: "transparent"//Styles.default_about_view_grid_item_colour
        opacity: 0.8
    }

    DropShadow {
        source: resource_grid_item_main_background_rectangle
        anchors.fill: resource_grid_item_main_background_rectangle
    }//end of DropShadow


    //Create the item that will contain the image
    Item {
        id: resource_grid_item_image_frame
        width: parent.width
        height: parent.height * 0.75

        anchors{
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            margins: Styles.pane_margins
        }//end of anchors

        Image {
            id: resource_grid_item_main_image
            source: "qrc:/icons8/altitude_icon"
            height: 52
            width: height

            anchors.centerIn: parent
        }//end of Image

        DropShadow {
            source: resource_grid_item_main_image
            anchors.fill: resource_grid_item_main_image
        }//end of DropShadow
    }//end of Item

    //Create the item that will contain the description
    Item {
        id: resource_grid_item_text_frame
        width: parent.width
        height: parent.height * 0.35

        anchors{
            top: resource_grid_item_image_frame.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            margins: Styles.pane_margins
        }//end of anchors

        Text{
            id: resource_grid_item_text
            text: "resource_name"
            color: Styles.default_about_view_text_colour
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -(height/2)
            font.pixelSize: 10
        }//end of Text
    }//end of Item
}//end of Item
