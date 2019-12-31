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

#ifndef FORECASTMODEL_H
#define FORECASTMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QModelIndex>
#include <QList>
#include <QString>
#include <QVariant>
#include <QHash>
#include <QByteArray>

class ForecastModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ForecastRoles{
        DayRole = Qt::UserRole+1,
        DescriptionRole = Qt::UserRole+2,
        IconRole = Qt::UserRole+3,
        MaxTempRole = Qt::UserRole+4,
        MinTempRole = Qt::UserRole+5,
        UnitRole = Qt::UserRole+6
    };

    explicit ForecastModel(QObject* parent = nullptr);
    ForecastModel(const ForecastModel& copy);
    ForecastModel& operator=(const ForecastModel& rhs);

    virtual int rowCount(const QModelIndex& index) const override;
    virtual QVariant data(const QModelIndex& index, int role) const override;

    virtual QHash<int, QByteArray> roleNames() const override;

    void set_description_data(QList<QString> input);
    void set_icon_data(QList<QString> input);
    void set_day_data(QList<QString> input);
    void set_max_temp_data(QList<QString> input);
    void set_min_temp_data(QList<QString> input);
    void set_unit_data(QList<QString> input);

private:
    QList<QString> m_forecast_descriptions;
    QList<QString> m_forecast_icons;
    QList<QString> m_forecast_days;
    QList<QString> m_forecast_max_temps;
    QList<QString> m_forecast_min_temps;
    QList<QString> m_forecast_units;
};

#endif // FORECASTMODEL_H
