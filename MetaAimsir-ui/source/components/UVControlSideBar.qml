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
 * @brief: displays the UV index information in a sidebar
 */

import QtQuick 2.0

import components 1.0
import styles 1.0


Item {
    id: uv_control_sidebar

    //Properties accessible from outside
    property alias date: uv_control_date_measured.uv_control_sidebar_value
    property alias time: uv_control_time_measured.uv_control_sidebar_value
    property alias value: uv_control_value.uv_control_sidebar_value
    property alias notice: uv_control_uv_notice.uv_control_sidebar_value

    Column {
       id: uv_control_data_items
       anchors.fill: parent
       spacing: 12

       //CO
       UVControlDataItem {
            id: uv_control_date_measured
            height: 24
            width: parent.width
            uv_control_sidebar_gas: "Date Measured "
            uv_control_sidebar_value: "8.2"
       }//end of UVControlDataItem
       //O3
       UVControlDataItem {
            id: uv_control_time_measured
            height: 24
            width: parent.width

            uv_control_sidebar_gas: "Time Measured "
            uv_control_sidebar_value: "4.5"
       }//end of UVControlDataItem
       //NO2
       UVControlDataItem {
            id: uv_control_value
            height: 24
            width: parent.width

            uv_control_sidebar_gas: "UV Value "
            uv_control_sidebar_value: "7.8"
       }//end of UVControlDataItem
       //SO2
       UVControlDataItem {
            id: uv_control_uv_notice
            height: 24
            width: parent.width

            uv_control_sidebar_gas: "UV Notice "
            uv_control_sidebar_value: "2.4"
       }//end of UVControlDataItem
    }//end of Column
}//end of Item
