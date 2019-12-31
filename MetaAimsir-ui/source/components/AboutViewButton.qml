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
 * @brief: enables movement to different views as specified by the name
 */

import QtQuick 2.12
import QtQuick.Controls 2.12

import components 1.0
import styles 1.0


Rectangle {
    id: about_view
    property alias button_text: about_view_button_text.text
    color: Styles.default_button_colour
    width: parent.width
    height: 80

    Text {
        id: about_view_button_text
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: Styles.pane_margins
        color: Styles.default_about_view_text_colour
    }//end of Text

    //Allow for the interactivity
    MouseArea {
        anchors.fill: about_view

        hoverEnabled: true
        onEntered: about_view.state = "hover"
        onExited: about_view.state = "default"
        onPressed: {
            about_view.state = "clicked"

            if (button_text == " Resources") {
                form_controller.show_resources_view();
            }//end of if
            if (button_text == " Licenses") {
                form_controller.show_licenses_view();
            }
            if (button_text == " Privacy Policy") {
                form_controller.show_privacy_policy_view();
            }
            if (button_text == " About") {
                form_controller.show_about_application_view();
            }
            if (button_text == " Disclaimer") {
                form_controller.show_disclaimer_view();
            }
        }
    }//end of MouseArea

    states: [
        State {
            name: "clicked"
            PropertyChanges {
                target: about_view
                color: Styles.default_button_pressed_colour
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: about_view
                color: Styles.default_button_hover_colour
            }
        },
        State {
            name: "default"
            PropertyChanges {
                target: about_view
                color: Styles.default_button_colour
            }
        }
    ]

    Behavior on color {
        ColorAnimation {
            duration: Styles.default_color_animation_time
        }//end of ColorAnimation
    }//end of Behavior
}//end of Rectangle
