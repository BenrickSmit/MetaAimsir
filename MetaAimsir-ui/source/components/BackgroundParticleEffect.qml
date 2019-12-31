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
 * @brief: displays the necessary particles on the relevant screen to simulate different weather patterns
 */

import QtQuick 2.9
import QtQuick.Particles 2.12

Item {
    id: background_particle_effect_item_frame

    //Property declarations
    property string particle_type: "snow"                                               //Declare what to output - either "rain" or "snow"
    property string particle_severity: particle_type == "rain"? "hard": "light"                                          //Declare the severity of the output - either "light", "hard"

    //property declarations that would normally be private
    property string _particle_path: "qrc:/icons8/"
    property string _particle_icon_name: "_icon"                                        //adds the necessary bottom part for the filename
    property real _particle_size: 16

    property real _particle_life_span: 2000
    property real _particle_life_span_variation: 500
    property real _particle_emit_rate: (particle_severity == "hard" ? 1000 : 100)

    property real _particle_speed: (particle_type == "rain" ? 1000: 100)

    ParticleSystem {
        id: background_particle_effect_particle_system
    }//end of ParticleSystem

    Emitter {
        id: background_particle_effect_particle_emitter
        anchors.fill: parent
        system: background_particle_effect_particle_system
        emitRate: _particle_emit_rate
        lifeSpan: _particle_life_span
        lifeSpanVariation: _particle_life_span_variation
        size: _particle_size
        endSize: _particle_size

        velocity: AngleDirection{
            angle: 90
            angleVariation: 0//15
            magnitude: _particle_speed
            magnitudeVariation: 50
        }//end of velocity
    }//end of emitter

    ImageParticle {
        id: background_particle_effect_image_particle
        source: _particle_path + particle_type + _particle_icon_name
        system: background_particle_effect_particle_system
        height: _particle_size
        width: height
        rotation: -90
        color: "white"
    }//end of ImageParticle

    states: [
        State {
            name: "snowy"
            PropertyChanges {
                target: background_particle_effect_item_frame
                particle_type: "snow";
                _particle_life_span: 2000;
                _particle_life_span_variation: 500;
                _particle_emit_rate: 100;
                _particle_speed: 100;
                _particle_size: 16;
            }
        },//end of State
        State {
            name: "rainy"
            PropertyChanges {
                target: background_particle_effect_item_frame
                particle_type: "rain";
                _particle_life_span: 2000;
                _particle_life_span_variation: 500;
                _particle_emit_rate: 1000;
                _particle_speed: 1000;
                _particle_size: 14;
            }
        },//end of State
        State {
            name: "default"
            PropertyChanges {
                target: background_particle_effect_item_frame
                particle_type: "snow";
                _particle_life_span: 1;
                _particle_life_span_variation: 1;
                _particle_emit_rate: 1;
                _particle_speed: 1;
                _particle_size: 0;
            }
        }//end of State
    ]//end of states:

    //Add in some weather controller stats to control the background and icons
    Connections {
        target: weather_controller

        onShow_rainy_weather: {
            background_particle_effect_item_frame.state = "rainy";
        }//end of signal
        onShow_sunny_weather: {
            background_particle_effect_item_frame.state = "default";
        }//end of signal
        onShow_snowy_weather: {
            background_particle_effect_item_frame.state = "snowy";
        }//end of signal
        onShow_windy_weather: {
            background_particle_effect_item_frame.state = "default";
        }//end of signal
        onShow_night_weather: {
            background_particle_effect_item_frame.state = "default";
        }//end of signal
        onShow_cloudy_weather: {
            background_particle_effect_item_frame.state = "default";
        }//end of signal
    }//end of Connections
}//end of item
