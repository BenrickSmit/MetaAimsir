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
 * @brief: contains the resources data for the openweathermap.org icons found
 */

import QtQuick 2.12

//This model contains the necessary information for the ResourcesPane to show the OpenWeatherMap weather icons
ListModel{
    ListElement { resource_icon: "qrc:/icons/01d"; resource_path: "01d"}
    ListElement { resource_icon: "qrc:/icons/01n"; resource_path: "01n"}
    ListElement { resource_icon: "qrc:/icons/02d"; resource_path: "02d"}
    ListElement { resource_icon: "qrc:/icons/02n"; resource_path: "02n"}
    ListElement { resource_icon: "qrc:/icons/03d"; resource_path: "03d"}
    ListElement { resource_icon: "qrc:/icons/03n"; resource_path: "03n"}
    ListElement { resource_icon: "qrc:/icons/04d"; resource_path: "04d"}
    ListElement { resource_icon: "qrc:/icons/04n"; resource_path: "04n"}
    ListElement { resource_icon: "qrc:/icons/09d"; resource_path: "09d"}
    ListElement { resource_icon: "qrc:/icons/09n"; resource_path: "09n"}
    ListElement { resource_icon: "qrc:/icons/10d"; resource_path: "10d"}
    ListElement { resource_icon: "qrc:/icons/10n"; resource_path: "10n"}
    ListElement { resource_icon: "qrc:/icons/11d"; resource_path: "11d"}
    ListElement { resource_icon: "qrc:/icons/11n"; resource_path: "11n"}
    ListElement { resource_icon: "qrc:/icons/13d"; resource_path: "13d"}
    ListElement { resource_icon: "qrc:/icons/13n"; resource_path: "13n"}
    ListElement { resource_icon: "qrc:/icons/50d"; resource_path: "50d"}
    ListElement { resource_icon: "qrc:/icons/50n"; resource_path: "50n"}
}//end of ListModel
