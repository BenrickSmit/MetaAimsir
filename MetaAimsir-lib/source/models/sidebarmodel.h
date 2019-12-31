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

#ifndef SIDEBARMODEL_H
#define SIDEBARMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QModelIndex>
#include <QList>
#include <QString>
#include <QVariant>
#include <QHash>
#include <QByteArray>

class SidebarModel : public QAbstractListModel{
    Q_OBJECT
public:
    enum SidebarRoles {
        ValueRole = Qt::UserRole+1,
        IconRole = Qt::UserRole+2
    };

    explicit SidebarModel(QObject *parent = nullptr);
    SidebarModel(const SidebarModel& copy);
    SidebarModel& operator=(const SidebarModel& rhs);

    virtual int rowCount(const QModelIndex& index) const override;
    virtual QVariant data(const QModelIndex& index, int role) const override;

    virtual QHash<int, QByteArray> roleNames() const override;

    void set_data(QList<QString> input);

private:
    QList<QString> m_icons_path;
    QList<QString> m_icons_values;

};

#endif // SIDEBARMODEL_H
