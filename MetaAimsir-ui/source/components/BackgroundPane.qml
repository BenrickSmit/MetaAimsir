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
 * @brief: displays the rounded background pane for each of the main components
 */


import QtQuick 2.12
import QtGraphicalEffects 1.0

import styles 1.0

Item {
    id: background_pane_item_frame

    //Declare some properties that will determine the BackgroundPane's looks
    property int background_pane_margins: Styles.pane_margins
    property color background_pane_colour: Styles.pane_background_colour
    property real background_pane_opacity: Styles.pane_background_opacity

    property int background_pane_width: parent.width - (background_pane_margins)
    property int background_pane_height: 120

    //To enable mouse over events
    opacity: background_pane_opacity
    property alias color: background_pane_item_frame.background_pane_colour

    //Add some Item settings that can be changed later
    height: background_pane_height
    width: background_pane_width

    Rectangle {
        id: background_pane_coloured_rectangle

        color: background_pane_colour
        radius: width * Styles.pane_background_radius

        anchors {
            fill: parent
            margins: background_pane_margins
        }//end of anchors aggregate

        /*Behavior on opacity {
            NumberAnimation {
                duration: 500
            }//end of NumberAnimation
        }//end of Behaviour*/
    }//end of Rectangle

    clip:true
}//end of Item
