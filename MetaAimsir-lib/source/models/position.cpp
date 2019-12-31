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
 * @brief: returns the device's current coordinates for use in the rest of the program
 */

#include "position.h"

Position::Position(QObject *parent) : QObject(parent){
    //Create the object for use
    m_position_source = QGeoPositionInfoSource::createDefaultSource(this);

    //Connect the necessary slots for information display
    connect(m_position_source, SIGNAL(error(QGeoPositionInfoSource::Error)), this, SLOT(display_positioning_error(QGeoPositionInfoSource::Error)));
    connect(m_position_source, SIGNAL(positionUpdated(const QGeoPositionInfo&)), this, SLOT(geo_position_updated(const QGeoPositionInfo&)));


    //Set the update interval of the position source if the source was successfully created
    if(m_position_source){
        m_position_source->setUpdateInterval(0);                                                            //Update position only once at startup and then not again
        m_position_source->setPreferredPositioningMethods(QGeoPositionInfoSource::AllPositioningMethods);
        m_position_source->startUpdates();

        //Debug information
        //qDebug() << "SOURCE NAME USED: " << m_position_source->sourceName();

        //emit the signal that says the source was properly created and data retrieval should occur
    }else{
        //emit the signal that indicates the source could not be created
        qDebug() << "Error: Can't create the QGeoPositionInfoSource object";
    }//end of if else
}//end of default ctor

Position::~Position(){
    m_position_source->deleteLater();
}//end of default dtor






//Slots
void Position::display_positioning_error(QGeoPositionInfoSource::Error error){
    //Display the error and connect to find the Sattelite position for use if possible
    if(error){
        QString error_string = "no error";
        if(QGeoPositionInfoSource::AccessError == error){
            error_string = "<Geo Position Error> The connection setup to the remote positioning backend failed because the application lacked the required privileges.";
        }else if(QGeoPositionInfoSource::ClosedError == error){
            error_string = "<Geo Position Error> The remote positioning backend closed the connection, which happens for example in case the user is switching location services to off. As soon as the location service is re-enabled regular updates will resume.";
        }else if(QGeoPositionInfoSource::NoError == error){
            error_string = "<Geo Position Error> No error has occurred.";
        }else if(QGeoPositionInfoSource::UnknownSourceError == error){
            error_string = "<Geo Position Error> An unidentified error occurred.";
        }else{
            error_string = "<Geo Position Error>";
        }//end of if else

        qDebug() << error_string;

        //emit the signal indicating the necessity to use the default city specified: New York
        m_coordinates.clear();
        m_coordinates.append("40.714550018");
        m_coordinates.append("-74.007141113");

        emit retrieved_geo_position(m_coordinates);
        emit no_geo_position_available();
    }//end of if
}//end of Position::display_error()

void Position::geo_position_updated(const QGeoPositionInfo& position){
    //Emit the signal containing lat and longitudinal information for use in the weather application
    m_coordinates.clear();
    m_coordinates.append(QVariant(position.coordinate().latitude()).toString());
    m_coordinates.append(QVariant(position.coordinate().longitude()).toString());

    emit retrieved_geo_position(m_coordinates);
}//end of Position::geo_position_updated()

