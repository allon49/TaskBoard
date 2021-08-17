#include "jsontomodel.h"
#include "qjsonmodel.h"

JsonToModel::JsonToModel(QObject *parent)
    : QObject(parent)
{
}

JsonToModel::~JsonToModel()
{
}

void JsonToModel::read()
{
    qWarning() << "source2: " << m_source;

    if(m_source.isEmpty()) {
        return;
    }

    qWarning() << "source_string: " << m_source_string;



    QFile file(m_source);
    //QFile file(m_source.toLocalFile());
    //QFile file(m_source.toLocalFile());
    if(!file.exists()) {
        //qWarning() << "Does not exits: " << m_source.toLocalFile();
        return;
    }
    QJsonModel * model = new QJsonModel;
    model->load(m_source);
    m_model = model;
    emit textChanged(m_model);


//    if(file.open(QIODevice::ReadOnly)) {
//        QTextStream stream(&file);
//        m_text = stream.readAll();
//        emit textChanged(m_text);
//    }
}

void JsonToModel::write()
{
    if(m_source.isEmpty()) {
        return;
    }
    QFile file(m_source);
    if(file.open(QIODevice::WriteOnly)) {
        QTextStream stream(&file);
        stream << m_text;
    }
}

QString JsonToModel::source() const
{
    return m_source;
}

QString JsonToModel::text() const
{
    return m_text;
}

void JsonToModel::setSource(QString source)
{

    qWarning() << "source: " << source;

    if (m_source == source)
        return;

    m_source = source;
    emit sourceChanged(source);
}

void JsonToModel::setText(QString text)
{
    if (m_text == text)
        return;

    m_text = text;
//    emit textChanged(text);
}
