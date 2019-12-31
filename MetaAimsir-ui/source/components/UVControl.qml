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
 * @brief: displays the custom UV Index Progress bar
 */

import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import styles 1.0
import components 1.0

//UVControl is a component that creates a circular wheel progress bar. Inside the circle the value of the gas is displayed together with a string that displays whether
//the index is good, hazardous, etc.
Item {
    id: uv_control_item_frame

    //Property Declarations
    property alias value: uv_control_progress_bar.value
    property alias text: uv_index_score_text.text
    property color uv_control_progress_bar_colour: "#FF8000"
    property color uv_control_progress_bar_background_colour: "#48484A"
    property color uv_control_progress_bar_foreground_colour: Qt.darker("#DBDBDB")
    property color uv_control_uv_index_text_colour: "#ffffff"


    ProgressBar{
        id: uv_control_progress_bar
        anchors.centerIn: parent

        readonly property real size: Math.min(parent.width, parent.height)
        height: size
        width: size

        value: 1
        contentItem: Rectangle {
            implicitHeight: 50
            implicitWidth: 50
            color: uv_control_progress_bar_background_colour
            radius: uv_control_progress_bar.width * 0.5
            antialiasing: true
            anchors.fill: parent

            Canvas {
                id: progress_draw_canvas
                anchors.fill: parent

                Connections {
                    target: uv_control_progress_bar
                    onValueChanged: progress_draw_canvas.requestPaint()
                }

                onPaint: {
                    //Draw the circular progress_bar
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.strokeStyle = uv_control_progress_bar_colour
                    ctx.lineWidth = uv_control_progress_bar.size / 12
                    ctx.lineCap = "round"
                    ctx.beginPath()
                    var startAngle = Math.PI / 5 * 4
                    var endAngle = startAngle + uv_control_progress_bar.value * Math.PI / 5 * 7
                    var endAngle_2 = startAngle + 1.0 * Math.PI / 5 * 7
                    ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
                    ctx.stroke()

                    //Draw a circle in the center
                    ctx.beginPath()
                    ctx.lineCap = "butt"
                    ctx.arc(width/2, height/2, width/2 - ctx.lineWidth*2+4, startAngle, endAngle_2)
                    ctx.fillStyle = uv_control_progress_bar_foreground_colour
                    ctx.fill()
                    ctx.strokeStyle = uv_control_progress_bar_foreground_colour
                    ctx.stroke()
                }
            }//end of Canvas

            Text{
                id: uv_index_score_text
                color: uv_control_uv_index_text_colour
                text: "500"
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -10
                font.pixelSize: 55 * (uv_control_item_frame.height / uv_control_item_frame.width)
            }//end of text
        }//end of contentItem: Rectangle
    }//end of ProgressBar
}//end of Item
