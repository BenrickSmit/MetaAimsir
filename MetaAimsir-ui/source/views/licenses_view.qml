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
 * @brief: displays the licences used and how they apply to the software
 */

import QtQuick 2.12

import components 1.0
import styles 1.0

Item {
    id: licenses_view_item_frame

    Text {
        id: name
        text: Credits.default_license_text
        color: Styles.default_about_view_text_colour
        font.pixelSize: Credits.default_license_text_size
        wrapMode: Text.WordWrap
        anchors{
            top: about_view_main_menu_bar.bottom
            bottom: parent.bottom
            right: parent.right
            left: parent.left
            margins: Styles.pane_margins * 2
        }//end of anchors aggregate
    }//end of Text


    //Display the menu bar
    AboutViewMenuBar{
        id: about_view_main_menu_bar

        width: Styles.default_about_view_menu_bar_width
        height: Styles.default_about_view_menu_bar_height
    }//end of AboutViewMenuBar

    //Necessary for the program to change views with the help of the back button
    Keys.onBackPressed: {
        form_controller.show_about_view();
        event.accepted = true;
    }//end of Keys
}//end of Item
