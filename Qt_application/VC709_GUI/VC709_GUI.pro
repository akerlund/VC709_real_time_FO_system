#-------------------------------------------------
#
# Project created by QtCreator 2017-04-19T20:29:28
#
#-------------------------------------------------

QT       += core gui
QT       += printsupport
QT       += serialport

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = VC709_GUI
TEMPLATE = app


SOURCES  += main.cpp\
            mainwindow.cpp \
            qcustomplot.cpp

HEADERS  += mainwindow.h \
            qcustomplot.h

FORMS    += mainwindow.ui
