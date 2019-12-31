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
 * @brief: displays the backgrounds based on the available data
 */

import QtQuick 2.12
import QtGraphicalEffects 1.0

import styles 1.0

Item {
    id: background_item_frame
    anchors.fill: parent


    //Declare some properties to use and change the Background
    //Public properties
    property string background_image_name: "sky_sunny"

    //Public properties that would normally be private, but aren't.
    property string _background_image_path: "qrc:/backgrounds/"


    //The Background component will set the main weather view's background to one of a few background assets while simultaneously blurring the background asset. The goal
    //is to be able to set them programmatically with a controller class based on the kind of weather experienced. If its sunny the controller class will add in a sunny sky
    //as the background.
    Image {
        id: background_image
        source: _background_image_path + background_image_name
        sourceSize: Qt.size(parent.width, parent.height)
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectCrop
        visible: Styles.background_image_visible
        smooth: Styles.background_image_smooth
        antialiasing: Styles.background_image_antialiasing
    }//end of Image

    FastBlur {
        anchors.fill: background_image
        source: background_image
        radius: Styles.background_image_blur_radius
    }//end of FastBlur
}//end of Item
