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
 * @brief: contains the resource data for the icons8 icons used
 */

import QtQuick 2.12

//This model contains the necessary information for the ResourcesPane to show the icons found on Icons8.com
ListModel{
    ListElement { resource_icon: "qrc:/icons8/back_icon"; resource_path: "back"}
    ListElement { resource_icon: "qrc:/icons8/direction_icon"; resource_path: "compass"}
    ListElement { resource_icon: "qrc:/icons8/humidity_icon"; resource_path: "wet"}
    ListElement { resource_icon: "qrc:/icons8/loading_icon"; resource_path: "loading sign"}
    ListElement { resource_icon: "qrc:/icons8/pressure_icon"; resource_path: "atmospheric pressure"}
    ListElement { resource_icon: "qrc:/icons8/rain_icon"; resource_path: "horizontal line"}
    ListElement { resource_icon: "qrc:/icons8/visibility_icon"; resource_path: "eye"}
    ListElement { resource_icon: "qrc:/icons8/snow_icon"; resource_path: "winter"}
    //ListElement { resource_icon: "qrc:/icons8/sunrise_icon"; resource_path: "sunrise"}
    //ListElement { resource_icon: "qrc:/icons8/sunset_icon"; resource_path: "sunset"}
    ListElement { resource_icon: "qrc:/icons8/temp_high_icon"; resource_path: "temperature high"}
    ListElement { resource_icon: "qrc:/icons8/temp_low_icon"; resource_path: "temperature low"}
    ListElement { resource_icon: "qrc:/icons8/wind_icon"; resource_path: "windsock"}
    ListElement { resource_icon: "qrc:/icons8/c++"; resource_path: "C++"}
    ListElement { resource_icon: "qrc:/icons8/qt"; resource_path: "Qt"}
}//end of ListModel
