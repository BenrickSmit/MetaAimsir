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
 * @brief: displays the about information for the application
 */

import QtQuick 2.12

import components 1.0
import styles 1.0

Item {
    id: about_application_view_item_frame

    //The main view that displays the application information
    Item {
        anchors.fill: parent
        //The Text
        Text {
            text: "Made with:"
            font.pixelSize: 32
            anchors.centerIn: parent
            color: Styles.default_about_view_text_colour
        }//end of Text

        Item{
            height: 120
            anchors{
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }//end of anchors aggregate

            Text {
                id: weather_text
                text: Styles.default_about_appliation_view_openweather_text
                color: Styles.default_about_view_text_colour
                font.pixelSize: 14
                anchors {
                    verticalCenterOffset: -(height * 2)
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }//end of anchors aggregate
            }//end of Text

            Text {
                id: weather_addition_text
                text: Styles.default_about_application_view_openweather_cc_4_text
                color: Styles.default_about_view_text_colour
                font.pixelSize: 12
                wrapMode: Text.WordWrap
                height: parent.height/2 - (Styles.pane_margins*2)
                width: parent.width - (Styles.pane_margins*2)
                anchors {
                    verticalCenterOffset: +weather_text.height
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }//end of anchors aggregate
            }//end of Text
        }//end of Item

        //The bottom icons
        Row {
            anchors.centerIn: parent
            anchors.verticalCenterOffset: + (height)
            spacing: 20

            Image {
                id: about_application_view_qt_image
                source: "qrc:/icons8/qt"
                height: Styles.default_about_application_view_icon_size
                width: height
            }

            Image {
                id: about_application_view_cpp_image
                source: "qrc:/icons8/c++"
                height: Styles.default_about_application_view_icon_size
                width: height
            }
        }//end of Item
    }//end of Item


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
