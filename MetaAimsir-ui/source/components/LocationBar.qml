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
 * @brief: displays the current location (city)
 */

import QtQuick 2.12
import QtQuick.Controls 2.5

import styles 1.0
import components 1.0


Item {
    id: location_bar_item_frame

    //Define some Properties that will be accessible from the outside
    property string location_bar_text: "london"
    property color location_bar_text_colour: Styles.default_text_colour
    property int location_bar_text_pixel_size: Styles.default_text_header_pixel_size

    property real _extra_offset_opacity: 0.1
    //property alias opacity: location_bar_background_pane.background_pane_opacity

    //Set some basic settings
    width: parent.width
    height: 60

    //Create the actual LocationBar component
    /*BackgroundPane{
        id: location_bar_background_pane
        anchors.fill: parent

        background_pane_opacity: Styles.pane_background_opacity + _extra_offset_opacity
    }//end of BackgroundPane*/

    //Add in a Text element that will display the location
    TextField{
        id: location_bar_location_text
        anchors.margins: Styles.pane_margins
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        color: location_bar_text_colour
        text: location_bar_text
        font.pixelSize: location_bar_text_pixel_size
        font.capitalization: Font.Capitalize
        font.bold: true

        background: BackgroundPane{
            id: location_bar_background_pane
            anchors.centerIn:  parent
            width: location_bar_item_frame.width
            height: location_bar_item_frame.height
        }//end of BackgroundPane

        //Add in functionality that will search the current weather based on the text entered
        onAccepted: {
            var entered_city_name = location_bar_location_text.text;
            weather_controller.receive_city_data(entered_city_name);
        }//end of onAccepted:
    }//end of Text

    clip:true
}//end of Item
