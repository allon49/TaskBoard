#ifndef JSONTOMODEL_H
#define JSONTOMODEL_H

#include <QtCore>
#include "qjsonmodel.h"

class JsonToModel : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(JsonToModel)
    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
public:
    JsonToModel(QObject *parent = 0);
    ~JsonToModel();

    Q_INVOKABLE void read();
    Q_INVOKABLE void write();
    QString source() const;
    QString text() const;
public slots:
    void setSource(QString source);
    void setText(QString text);
signals:
    void sourceChanged(QString arg);
    void textChanged(QString arg);
private:
    QString m_source;
    QString m_source_string;
    QString m_text;
    QJsonModel * m_model;
};

#endif // JSONTOMODEL_H

