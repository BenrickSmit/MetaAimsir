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
 * @brief: allows navigation from one form to another
 */

import QtQuick 2.0

import components 1.0
import styles 1.0


Item {
    id: about_view_menu_bar_item_frame

    //property declarations
    property real icon_size: Styles.default_about_view_menu_bar_icon_size
    property string function_description: "about_view"

    //property declarations that would normally be declared private
    property color _button_pressed_colour: Styles.default_button_pressed_colour
    property color _button_default_colour: Styles.default_button_colour
    property color _button_hover_colour: Styles.default_button_hover_colour

    property string _icon_location: "qrc:/icons8/back_icon"

    //Create the left button, followed by the backBackground
    Rectangle{
        id: about_view_menu_bar_rectangle
        anchors.fill: parent
        color: _button_default_colour

        //The Button will be left_aligned and will contain the icon necessary
        Rectangle{
            id: about_view_menu_bar_back_button_rectangle
            height: parent.height
            width: parent.width * 0.12
            color: _button_default_colour

            anchors{
                top: parent.top
                bottom: parent.bototm
                left: parent.left
            }//end of anchors aggregate

            //Allow the image to show itself
            Image {
                anchors.centerIn: parent
                width: icon_size
                height: icon_size
                source: _icon_location
                smooth: true
                antialiasing: true
            }//end of image

            //Create the mouse area that will handle clicks and touches
            MouseArea{
                id: about_view_main_menu_bar_mouse_area
                hoverEnabled: true
                anchors.fill: parent

                onEntered: about_view_menu_bar_back_button_rectangle.state = "hover"
                onExited: about_view_menu_bar_back_button_rectangle.state = "default"
                onClicked: {
                    about_view_menu_bar_back_button_rectangle.state = "clicked";
                    if (function_description == "master_view") {
                        form_controller.show_master_view()
                    }else{
                        form_controller.show_about_view()
                    }//end of if else
                }//end of onClicked
            }//end of MouseArea

            //create the individual states necessary
            states: [
                State {
                    name: "default"
                    PropertyChanges {
                        target: about_view_menu_bar_back_button_rectangle
                        color: _button_default_colour
                    }
                },//end of State
                State {
                    name: "hover"
                    PropertyChanges {
                        target: about_view_menu_bar_back_button_rectangle
                        color: _button_hover_colour
                    }
                },//end of State
                State {
                    name: "clicked"
                    PropertyChanges {
                        target: about_view_menu_bar_back_button_rectangle
                        color: _button_pressed_colour
                    }
                }//end of State
            ]//end of states:

            Behavior on color {
                ColorAnimation {
                    duration: Styles.default_color_animation_time
                }//end of ColorAnimation
            }//end of Behavior
        }//end of Rectangle
    }//end of Rectangle
}//end of Item
