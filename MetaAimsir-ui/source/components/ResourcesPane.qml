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
 * @brief: used to display all resources used and their attributions
 */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

import components 1.0
import styles 1.0

Item {
    id: resource_pane_item_frame

    //Property declarations
    property alias model: resources_pane_grid_view.model
    property alias delegate: resources_pane_grid_view.delegate
    property alias description: resource_pane_description_text.text
    property alias sub_description: resource_pane_sub_description_text.text


    //The background and the footer
    Rectangle {
        id: resources_pane_frame_rectangle
        color: (Styles.main_view_background_alternative_colour)
        border.color: Qt.lighter(Styles.pane_background_colour)
        border.width: 1
        radius: width * 0.01
        anchors.fill: parent
    }

    //The actual view of items and their names
    GridView {
        id: resources_pane_grid_view
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            margins: 20
        }//end of anchors aggregate

        clip: true
        width: parent.width
        height: parent.height * 0.65
        cellWidth: 140
        cellHeight: 160

        delegate: ResourcesGridItem {}
        model: IconsModel {}
    }//end of GridView

    Item {
        width: parent.width
        height: parent.height * 0.35
        anchors{
            top: resources_pane_grid_view.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }//end of anchors aggregate
        Text{
            id: resource_pane_description_text
            text: "Icons by Icons8"
            font.pixelSize: 20
            anchors.centerIn: parent
            anchors.verticalCenterOffset: - height/2
            color: Styles.default_about_view_text_colour
        }
        Text{
            id: resource_pane_sub_description_text
            text: "https://icons8.com"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: + height/2
            color: Styles.default_about_view_text_colour
            wrapMode: Text.WordWrap
        }
        clip: true
    }//end of Item
}//end of Item
