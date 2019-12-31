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
 * @brief: contains the required form data and attributes for use in all QML modules except where unnecessary
 */

pragma Singleton
import QtQuick 2.12

Item {
    //Basic Settings
    readonly property color main_view_background_colour: "#444444"//"#F3F3F3"                   //Sets the default application backgound colour
    readonly property color main_view_background_alternative_colour: "#575757"
    readonly property real main_view_default_width: 720                                         //Sets the default application width
    readonly property real main_view_default_height: 1024                                       //Sets the default application height
    readonly property string main_view_title: "Meta Aimsir"                                     //Sets the default application title

    //Background component settings
    readonly property int background_image_blur_radius: 37                                      //Sets the Background image's FastBlur radius
    readonly property bool background_image_smooth: true                                        //Sets the Background image's smooth property to the default
    readonly property bool background_image_visible: false                                      //Sets the Background image's visible property to the default
    readonly property bool background_image_antialiasing: true                                  //Sets the Background image's antialiasing property to the default

    //Loading Icon settings
    readonly property string loading_icon_path: "qrc:/icons8/loading_icon"                      //Sets the path to the loading icon
    readonly property int loading_icon_default_height: loading_icon_default_width               //Sets the width of the loading icon
    readonly property int loading_icon_default_width: 64                                        //Sets the height of the loading icon; identical to the width

    //Default BackgroundPane Style Attributes
    property color pane_background_colour: "#555555"                                            //Sets the BackgroundPane colour
    property real pane_background_opacity: 0.4                                                  //Sets the BackgroundPane opacity
    property real pane_background_opacity_hover: 0.7                                            //Sets the BackgroundPane opacity on hover
    property int pane_margins: 10                                                               //Sets the BackgroundPane default margins
    property real pane_background_radius: 0.01                                                  //Sets the BackgroundPane radius for slightly rounded corners

    //Default Text Attributes
    property color default_text_colour: "#ffffff"                                               //Sets the default text colour to white
    property real default_text_header_pixel_size: 32                                            //Sets the default text pixel size to that of a header
    property real default_text_small_header_pixel_size: 24                                      //Sets the default text pixel size to that of one bigger than default
    property real default_text_pixel_size: 20                                                   //Sets teh default text pixel size for normal text in the application

    //WeatherData default attributes
    property real default_weather_data_icon_size: 32                                            //Set the default icon size for the icons found within WeatherData
    property real default_weather_data_icon_pane_width: 0.4                                     //Set the default icon Item size to about 40$ of the width
    property string default_weather_data_icon_path: "qrc:/icons8/"                              //Set the default icon path for the icons found within WeatherData
    property real default_weather_data_icon_buffer_size: 4                                      //Set the space between where the Icon ends and the item's border should be. This is only for one side

    //WeatherSidebar default attributes
    property real weather_forecast_today_sidebar_default_size: 0.35                             //Set the default size of the weather forecast sidebar

    //WeatherForecastToday default attributes
    property real weather_forecast_today_icon_default_size: 0.65                                //Set the default size of the main weather icon in the form

    //Ratio of the forms                                                                        //This sets the aspect ratios of each of the "windows" on the main_weather_view and can be changed to allow different sizes
    property real air_quality_item_width_ratio: 1
    property real air_quality_item_height_ratio: 0.395256916996

    property real weather_forecast_five_days_width_ratio: 1
    property real weather_forecast_five_days_height_ratio: 0.3359683794466

    property real weather_forecast_today_width_ratio: 1
    property real weather_forecast_today_height_ratio: 0.592885375494

    //Button Press Colours
    property color default_button_colour: main_view_background_colour                           //Sets the default button colour of buttons created with this scheme
    property color default_button_pressed_colour: "#FF8000"                                     //Sets the colour of the button once pressed
    property color default_button_hover_colour: "#636363"                                       //Sets the colour of the button on mouse over, or hover. Will not appear with mobile applications
    property int default_color_animation_time: 100                                              //Sets the time it takes for the custom buttons to change colours

    //About View & About View Menu Bar Settigns
    property real default_about_view_menu_bar_width: main_view_default_width                    //Sets the default width of the bar
    property real default_about_view_menu_bar_height: 80                                        //Sets the default height of the bar
    property real default_about_view_menu_bar_icon_size: 32                                     //Sets the default size (widthxheight) of the icon that will appear
    property color default_about_view_text_colour: "white"                                      //Sets the default text colour for the about_view and its components
    property color default_about_view_grid_item_colour: "#FF8000"

    //About Application View settigns
    property real default_about_application_view_icon_size: 64                                  //Sets the default size for the about application view's icons
    property string default_about_appliation_view_openweather_text: "Weather by http://www.openweathermap.org"
    property string default_about_application_view_openweather_cc_4_text: "Note: The data received has NOT been changed. This includes the icons. It has only been transformed into a more human-readable form. Please find a copy of the license used at <https://creativecommons.org/licenses/by-sa/4.0/> and <https://openweathermap.org/terms#Licenses>"

    //privacy and data policy View settings
    property string default_privacy_policy_text: "<b>Stored Data and Privacy:</b><p>This program does not store any data in any way, shape or form as it does not collect any data except for immediate use.</p><p>The only data the program collects is the device's latitude and longitude which is stored only temporarily while retrieving the weather forecast data for the device's current position.</p>"
    property real default_privacy_policy_text_size: 20

    //Licenses
    property string default_licenses_text: "<b>Licenses:</b>"
    property real default_licenses_text_size: 20

    //Disclaimer View Settings
    property string default_disclaimer_text: "<b>Disclaimer:</b><p>The materials contained within the application are provided for general information purposes only and do not claim to be or constitute legal or other professional advice and shall not be relied upon as such.</p><br/><p>We do not accept any responsibility for any loss which may arise from accessing or reliance on the information on this application and to the fullest extent permitted by English law, we exclude all liability for loss or damages direct or indirect arising from use of this application.</p>"
    property real default_disclaimer_text_size: 20
}//end of Item
