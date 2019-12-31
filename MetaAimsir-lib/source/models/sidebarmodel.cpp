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
 * @brief: returns the necessary data for the forecast sidebar to be updated dynamically
 */

#include "sidebarmodel.h"

SidebarModel::SidebarModel(QObject *parent) : QAbstractListModel(parent){
    m_icons_path.clear();
    m_icons_path.append("temp_high_icon");
    m_icons_path.append("temp_low_icon");
    m_icons_path.append("wind_icon");
    m_icons_path.append("direction_icon");
    m_icons_path.append("humidity_icon");
    m_icons_path.append("pressure_icon");
    m_icons_path.append("visibility_icon");

    m_icons_values.append("35");
    m_icons_values.append("15");
    m_icons_values.append("3.5");
    m_icons_values.append("270");
    m_icons_values.append("88");
    m_icons_values.append("1027");
    m_icons_values.append("1015");
}//end of default ctor

SidebarModel::SidebarModel(const SidebarModel& copy): QAbstractListModel(copy.parent()){
    m_icons_path = copy.m_icons_path;
    m_icons_values = copy.m_icons_values;
}//end of copy ctor


SidebarModel& SidebarModel::operator=(const SidebarModel& rhs){
    if(this != &rhs){
        m_icons_path = rhs.m_icons_path;
        m_icons_values = rhs.m_icons_values;
    }//end of if

    return *this;
}//end of operator = overload

int SidebarModel::rowCount(const QModelIndex &index) const{
    return m_icons_path.size();
}//end of SidebarModel::rowCount

QVariant SidebarModel::data(const QModelIndex &index, int role) const{
    //Determine whether the index is valid for further use
    if(!index.isValid()){
        return QVariant();
    }//end of if

    //Depending on the role return only certain types of data
    if(role == ValueRole){
        return QVariant(m_icons_values[index.row()]);
    }//end of if

    if(role == IconRole){
        return QVariant(m_icons_path[index.row()]);
    }//end of if

    //If the roles aren't equivalent add in the an undefined value for display
    return QVariant();
}//end of SidebarModel::data

QHash<int, QByteArray> SidebarModel::roleNames() const{
    //Declare the available roles for use
    QHash<int, QByteArray> roles;
    roles[IconRole] = "icon";
    roles[ValueRole] = "value";
    return roles;
}//end of SidebarModel::roleNames

void SidebarModel::set_data(QList<QString> input){
    //Update the model data
    m_icons_values = input;

    //Ensure that the model knows the data has been changed
    QModelIndex start_index = createIndex(0, 0);
    QModelIndex end_index = createIndex(m_icons_values.size()-1, 0);
    emit QAbstractListModel::dataChanged(start_index, end_index);
}//end of set_data
