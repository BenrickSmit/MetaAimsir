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
 * @brief: displays the main form and allows interaction between various views
 */

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import styles 1.0
import components 1.0

Window {
    id: master_view_main_view
    visible: true
    width: Styles.main_view_default_width //506
    height: Styles.main_view_default_height //720
    color: Styles.main_view_background_colour
    title: qsTr(Styles.main_view_title)

    SwipeView{
        id: master_view_swipe_view

        currentIndex: 1
        anchors.fill: parent

        Item{
            id: fist_page
            focus: true

            StackView {
                id: master_view_about_view
                anchors.fill: parent
                initialItem: "qrc:/views/about_view.qml"
            }//end of stackview

            clip: true
        }//end of Item
        Item{
            id: second_page

            StackView {
                id: master_view_weather_view
                anchors.fill: parent
                initialItem: "qrc:/views/splash_view.qml"
            }//end of stack view
            clip: true
        }//end of Item
    }//end of SwipeView


    //Adjust the PageIndicator for the SwipeView
    PageIndicator {
        id: master_view_swipe_view_page_indicator

        count: master_view_swipe_view.count
        currentIndex: master_view_swipe_view.currentIndex

        anchors.bottom: master_view_swipe_view.bottom
        anchors.horizontalCenter: master_view_swipe_view.horizontalCenter
        delegate: Rectangle {
                implicitWidth: 8
                implicitHeight: 8

                radius: width * 0.5
                color: "#FF8000"

                opacity: index == master_view_swipe_view.currentIndex ? 0.95 : pressed ? 0.6 : 0.35

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 100
                    }//end of OpacityAnimator
                }//end of Behavior on opacity
        }//end of Rectangle
    }//end of PageIndicator

    Connections {
        target: form_controller
        onShow_privacy_policy_view: master_view_about_view.push("qrc:/views/privacy_policy_view.qml")
        onShow_resources_view: {master_view_about_view.push("qrc:/views/resources_view.qml")}
        onShow_about_view: master_view_about_view.pop()
        onShow_licenses_view: master_view_about_view.push("qrc:/views/licenses_view.qml")
        onShow_about_application_view: master_view_about_view.push("qrc:/views/about_application_view.qml")
        onShow_disclaimer_view: master_view_about_view.push("qrc:/views/disclaimer_view.qml");
        onShow_master_view: master_view_swipe_view.setCurrentIndex(1)
    }//end of connections

    Component.onCompleted: {
        master_view_weather_view.replace("qrc:/views/weather_view.qml")
    }//end of onCompleted

    //To repeatedly update the weather information every 5 minutes
    Timer {
        id: weather_update_timer
        repeat: true
        running: true
        interval: 1000 * 60 * 20                                     //20 minute update intervals - beginner version will only allow you to use one loaction - your GPS location or input location
        onTriggered: weather_controller.start_weather_data_update();
    }//end of Timer
}//end of main window component
