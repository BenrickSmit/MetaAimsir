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
 * @brief: constains all the data necessary to credit the relevant sources for their resources
 */

pragma Singleton
import QtQuick 2.12

Item {
    id: credit_info_item

    //Sunny BG Image
    readonly property string sunny_image_local_link: "qrc:/backgrounds/sky_sunny"
    readonly property string sunny_image_link: "https://www.pexels.com/photo/sky-sunny-clouds-cloudy-3768/"
    readonly property string sunny_image_artist: "Photo by Skitterphoto from Pexels"
    readonly property string sunny_image_publisher: "Pexels.com"
    readonly property string sunny_image_license: "PEXELS License"
    readonly property string sunny_image_artist_name: "Skitterphoto"

    //Night BG Image
    readonly property string night_image_local_link: "qrc:/backgrounds/sky_night"
    readonly property string night_image_link: "https://www.pexels.com/photo/moon-and-stars-813269/"
    readonly property string night_image_artist: "Photo by Min An from Pexels"
    readonly property string night_image_publisher: "Pexels.com"
    readonly property string night_image_license: "PEXELS License"
    readonly property string night_image_artist_name: "Min An"

    //Cloudy BG Image
    readonly property string cloudy_image_local_link: "qrc:/backgrounds/sky_cloudy"
    readonly property string cloudy_image_link: "https://www.pexels.com/photo/atmosphere-background-bright-clouds-19670/"
    readonly property string cloudy_image_artist: "Photo by Miguel Á. Padriñán from Pexels"
    readonly property string cloudy_image_publisher: "Pexels.com"
    readonly property string cloudy_image_license: "PEXELS License"
    readonly property string cloudy_image_artist_name: "Miguel A. Padriñán"

    //Rainy BG Image
    readonly property string rainy_image_local_link: "qrc:/backgrounds/sky_rainy"
    readonly property string rainy_image_link: "https://www.pexels.com/photo/white-clouds-1077536/"
    readonly property string rainy_image_artist: "Photo by Oleg Magni from Pexels"
    readonly property string rainy_image_publisher: "Pexels.com"
    readonly property string rainy_image_license: "PEXELS License"
    readonly property string rainy_image_artist_name: "Oleg Magni"

    //Snowy BG Image
    readonly property string snowy_image_local_link: "qrc:/backgrounds/sky_snowy"
    readonly property string snowy_image_link: "https://www.pexels.com/photo/green-trees-1552212/"
    readonly property string snowy_image_artist: "Photo by James Wheeler from Pexels"
    readonly property string snowy_image_publisher: "Pexels.com"
    readonly property string snowy_image_license: "PEXELS License"
    readonly property string snowy_image_artist_name: "James Wheeler"

    //Windy BG Image
    readonly property string windy_image_local_link: "qrc:/backgrounds/sky_windy"
    readonly property string windy_image_link: "https://www.pexels.com/photo/grayscale-photography-of-trees-and-house-2869657/"
    readonly property string windy_image_artist: "Photo by Harrison Haines from Pexels"
    readonly property string windy_image_publisher: "Pexels.com"
    readonly property string windy_image_license: "PEXELS License"
    readonly property string windy_image_artist_name: "Harrison Haines"

    //PEXELS License Link
    readonly property string pexels_image_license_url: "https://www.pexels.com/photo-license/"
    readonly property string pexels_license_cans: "All photos on Pexels are free to use.\nAttribution is not required. Giving credit to the photographer or Pexels is not necessary but always appreciated.\nYou can modify the photos. Be creative and edit the photos as you like."
    readonly property string pexels_license_cants: "Identifiable people may not appear in a bad light or in a way that is offensive.\nDon't sell unaltered copies of a photo, e.g. don't sell it as a stock photo, poster, print or on a physical product without adding any value.\nDon't imply endorsement of your product by people or brands on the image.\nDon't redistribute or sell the photos on other stock photo or wallpaper platforms.\n"

    //Loading.io Loading animation for splash screen
    readonly property string icons_8_license_url: "https://loading.io/license/#free-license"


    //Icons also provided by Icons8.com.
    readonly property string how_to_credit: "For smartphone apps, please set a link to https://icons8.com in the About dialog or settings.\nAlso, please credit our work in your App Store or Google Play description (something like \"Icons by Icons8\" is fine)."
    readonly property string icons_8_url: "https://icons8.com"

    //License information
    readonly property string default_license_text: "<b>License:</b><p>MetaAimsir: a weather forecast program for the forecast and UV Index</p><br/><p>Copyright (C) 2019  Benrick Smit</p><br><p>This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</p><br/><p>This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.</p><br/><p>You should have received a copy of the GNU General Public License along with this program (/LICENSE).  If not, see <a href=\"https:/www.gnu.org/licenses/\">https://www.gnu.org/licenses/</a>.</p><br><p> Note: This only applies to this program and does not apply to the relevant Qt libraries used in this application. These come with their own GPL License to adhere to.</p><br><p>All other resources used adhere to their own licenses. Some require attribution (Icons8, Openweathermap.org) for use, while others (pexels.com) do not.</p>"
    readonly property real default_license_text_size: 14
}//end of Item component
