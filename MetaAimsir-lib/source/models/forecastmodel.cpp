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
 * @brief: returns the necessary data for the forecast view model to be updated dynamically
 */

#include "forecastmodel.h"

ForecastModel::ForecastModel(QObject* parent): QAbstractListModel(parent){
    //Do nothing yet
    m_forecast_descriptions = {"windy", "windy", "windy", "windy", "windy"};
    m_forecast_icons = {"01d", "02d", "03d", "04d", "09d"};
    m_forecast_days = {"Mon", "Tue", "Wed", "Thu", "Fri"};
    m_forecast_max_temps = {"45", "45", "45", "45", "45"};
    m_forecast_min_temps = {"15", "15", "15", "15", "15"};
    m_forecast_units = {"C", "C", "C", "C", "C"};
}//end of default ctor

ForecastModel::ForecastModel(const ForecastModel& copy){
    m_forecast_descriptions = copy.m_forecast_descriptions;
    m_forecast_icons = copy.m_forecast_icons;
    m_forecast_days = copy.m_forecast_days;
    m_forecast_max_temps = copy.m_forecast_max_temps;
    m_forecast_min_temps = copy.m_forecast_min_temps;
    m_forecast_units = copy.m_forecast_units;
}//end of copy ctor

ForecastModel& ForecastModel::operator=(const ForecastModel& rhs){
    //Prevent self assignment
    if(this != &rhs){
        m_forecast_descriptions = rhs.m_forecast_descriptions;
        m_forecast_icons = rhs.m_forecast_icons;
        m_forecast_days = rhs.m_forecast_days;
        m_forecast_max_temps = rhs.m_forecast_max_temps;
        m_forecast_min_temps = rhs.m_forecast_min_temps;
        m_forecast_units = rhs.m_forecast_units;
    }//end of if

    return *this;
}//end of operator = overload


int ForecastModel::rowCount(const QModelIndex &index) const{
    //Return the maximum number of items in the model
    return m_forecast_descriptions.size();
}//end of ForecastModel::rowCount


QVariant ForecastModel::data(const QModelIndex &index, int role) const{
    //Determine whether the index is valid for further use
    if(!index.isValid()){
        return QVariant();
    }//end of if

    //Depending on the role return only certain types of data
    if(role == DescriptionRole){
        return QVariant(m_forecast_descriptions[index.row()]);
    }//end of if

    if(role == IconRole){
        return QVariant(m_forecast_icons[index.row()]);
    }//end of if

    if(role == DayRole){
        return QVariant(m_forecast_days[index.row()]);
    }//end of if

    if(role == MaxTempRole){
        return QVariant(m_forecast_max_temps[index.row()]);
    }//end of if

    if(role == MinTempRole){
        return QVariant(m_forecast_min_temps[index.row()]);
    }//end of if

    if(role == UnitRole){
        return QVariant(m_forecast_units[index.row()]);
    }//end of if

    //If the roles aren't equivalent add in the an undefined value for display
    return QVariant();
}//end of ForecastModel::data()


QHash<int, QByteArray> ForecastModel::roleNames() const{
    //Declare the available roles for use
    QHash<int, QByteArray> roles;
    roles[IconRole] = "icon";
    roles[DescriptionRole] = "description";
    roles[DayRole] = "day";
    roles[MinTempRole] = "min_temp";
    roles[MaxTempRole] = "max_temp";
    roles[UnitRole] = "unit";
    return roles;
}//end of ForecastModel::roleNames()

void ForecastModel::set_description_data(QList<QString> input){
    m_forecast_descriptions = input;

    //Ensure that the model knows the data has been changed
    QModelIndex start_index = createIndex(0, 0);
    QModelIndex end_index = createIndex(m_forecast_descriptions.size()-1, 0);
    emit QAbstractListModel::dataChanged(start_index, end_index);
}//end of ForecastModel::set_description_data

void ForecastModel::set_icon_data(QList<QString> input){
    m_forecast_icons = input;

    //Ensure that the model knows the data has been changed
    QModelIndex start_index = createIndex(0, 0);
    QModelIndex end_index = createIndex(m_forecast_icons.size()-1, 0);
    emit QAbstractListModel::dataChanged(start_index, end_index);
}//end of ForecastModel::set_icon_data()

void ForecastModel::set_day_data(QList<QString> input){
    m_forecast_days = input;

    //Ensure that the model knows the data has been changed
    QModelIndex start_index = createIndex(0, 0);
    QModelIndex end_index = createIndex(m_forecast_days.size()-1, 0);
    emit QAbstractListModel::dataChanged(start_index, end_index);
}//end of ForecastModel::set_day_data

void ForecastModel::set_min_temp_data(QList<QString> input){
    m_forecast_min_temps = input;

    //Ensure that the model knows the data has been changed
    QModelIndex start_index = createIndex(0, 0);
    QModelIndex end_index = createIndex(m_forecast_min_temps.size()-1, 0);
    emit QAbstractListModel::dataChanged(start_index, end_index);
}//end of ForecastModel::set_min_temp_data

void ForecastModel::set_max_temp_data(QList<QString> input){
    m_forecast_max_temps = input;

    //Ensure that the model knows the data has been changed
    QModelIndex start_index = createIndex(0, 0);
    QModelIndex end_index = createIndex(m_forecast_max_temps.size()-1, 0);
    emit QAbstractListModel::dataChanged(start_index, end_index);
}//end of ForecastModel::set_max_temp_data

void ForecastModel::set_unit_data(QList<QString> input){
    m_forecast_units = input;

    //Ensure that the model knows the data has been changed
    QModelIndex start_index = createIndex(0, 0);
    QModelIndex end_index = createIndex(m_forecast_units.size()-1, 0);
    emit QAbstractListModel::dataChanged(start_index, end_index);
}//end of ForecastModel::set_unit_data
