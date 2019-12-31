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
 * @brief: displays all used resources as well as attribution where necessary
 */
import QtQuick 2.12
import QtQuick.Controls 2.12

import components 1.0
import styles 1.0

Item {
    id: resources_view_item_frame
    focus: true
    signal back_pressed

    //Display the menu bar
    AboutViewMenuBar{
        id: about_view_main_menu_bar

        width: Styles.default_about_view_menu_bar_width
        height: Styles.default_about_view_menu_bar_height
    }//end of AboutViewMenuBar

    //Add in an Item that will contain all the necessary information
    Item{
        id: resources_view_item_grid_frame
        anchors{
            top: about_view_main_menu_bar.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }//end of anchors aggregate


        Column {
            id: resources_view_item_grid_frame_column
            spacing: 20
            anchors.fill:parent
            anchors.margins: 20

            ResourcesPane {
                id: resources_view_icons_8_resource_pane
                delegate: ResourcesGridItem {_resource_icon: resource_icon; _resource_path: resource_path}
                model: Icons8Model {}
                description: "Icons by Icons8"
                sub_description: "https://icons8.com"

                width: parent.width
                height: parent.height * 0.3
            }

            ResourcesPane {
                id: resources_view_openweathermap_resource_pane
                delegate: ResourcesGridItem {_resource_icon: resource_icon; _resource_path: resource_path}
                model: IconsModel {}
                description: "Icons by OpenWeatherMap.org"
                sub_description: "http://openweathermap.org/img/wn/[code]@2x.png"

                width: parent.width
                height: parent.height * 0.3
            }

            ResourcesPane {
                id: resources_view_background_resource_pane
                delegate: ResourcesGridItem {_resource_icon: resource_icon; _resource_path: resource_path}
                model: BackgroundModel {}
                description: "Backgrounds by Pexels.com"
                sub_description: "Credit: " + Credits.sunny_image_artist_name + ", "  +
                                 Credits.night_image_artist_name + ", "  + Credits.cloudy_image_artist_name + ", "  +
                                 Credits.rainy_image_artist_name + ", "  + Credits.snowy_image_artist_name + ", " +
                                 Credits.windy_image_artist_name

                width: parent.width
                height: parent.height * 0.3
            }
        }//end of Column
    }//end of Item

    //Necessary for the program to change views with the help of the back button
    Keys.onBackPressed: {
        form_controller.show_about_view();
        event.accepted = true;
    }//end of Keys
}//end of Item
