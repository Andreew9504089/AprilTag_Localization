/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.9.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <GUI/qcustomplot.h>
#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QDoubleSpinBox>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QCheckBox *checkBox;
    QPushButton *pushButton;
    QPushButton *pushButton_2;
    QDoubleSpinBox *maxspinbox;
    QDoubleSpinBox *minspinbox;
    QLabel *label;
    QLabel *label_2;
    QCustomPlot *customplot3;
    QTabWidget *tabWidget;
    QWidget *tab;
    QCustomPlot *customplot;
    QCustomPlot *customplot2;
    QWidget *tab_2;
    QCustomPlot *qcustomplot6;
    QCustomPlot *qcustomplot7;
    QWidget *tab_3;
    QCustomPlot *customplot4;
    QWidget *tab_4;
    QCustomPlot *qcustomplot;
    QCustomPlot *qcustomplot2;
    QWidget *tab_5;
    QCustomPlot *qcustomplot3;
    QCustomPlot *qcustomplot4;
    QWidget *tab_6;
    QCustomPlot *qcustomplot5;
    QWidget *tab_7;
    QCustomPlot *qcustomplot8;
    QCustomPlot *qcustomplot9;
    QWidget *tab_8;
    QCustomPlot *qcustomplot10;
    QCustomPlot *qcustomplot11;
    QWidget *tab_9;
    QCustomPlot *plot;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(1668, 1187);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        checkBox = new QCheckBox(centralWidget);
        checkBox->setObjectName(QStringLiteral("checkBox"));
        checkBox->setGeometry(QRect(1470, 790, 102, 25));
        pushButton = new QPushButton(centralWidget);
        pushButton->setObjectName(QStringLiteral("pushButton"));
        pushButton->setGeometry(QRect(1470, 860, 100, 27));
        pushButton_2 = new QPushButton(centralWidget);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));
        pushButton_2->setGeometry(QRect(1590, 860, 71, 31));
        maxspinbox = new QDoubleSpinBox(centralWidget);
        maxspinbox->setObjectName(QStringLiteral("maxspinbox"));
        maxspinbox->setGeometry(QRect(1560, 710, 101, 28));
        minspinbox = new QDoubleSpinBox(centralWidget);
        minspinbox->setObjectName(QStringLiteral("minspinbox"));
        minspinbox->setGeometry(QRect(1560, 750, 101, 28));
        label = new QLabel(centralWidget);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(1470, 710, 76, 19));
        label_2 = new QLabel(centralWidget);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setGeometry(QRect(1470, 750, 76, 19));
        customplot3 = new QCustomPlot(centralWidget);
        customplot3->setObjectName(QStringLiteral("customplot3"));
        customplot3->setGeometry(QRect(1570, 1150, 71, 61));
        tabWidget = new QTabWidget(centralWidget);
        tabWidget->setObjectName(QStringLiteral("tabWidget"));
        tabWidget->setGeometry(QRect(20, 30, 1441, 1101));
        tab = new QWidget();
        tab->setObjectName(QStringLiteral("tab"));
        customplot = new QCustomPlot(tab);
        customplot->setObjectName(QStringLiteral("customplot"));
        customplot->setGeometry(QRect(20, 20, 900, 400));
        customplot2 = new QCustomPlot(tab);
        customplot2->setObjectName(QStringLiteral("customplot2"));
        customplot2->setGeometry(QRect(20, 440, 900, 400));
        tabWidget->addTab(tab, QString());
        tab_2 = new QWidget();
        tab_2->setObjectName(QStringLiteral("tab_2"));
        qcustomplot6 = new QCustomPlot(tab_2);
        qcustomplot6->setObjectName(QStringLiteral("qcustomplot6"));
        qcustomplot6->setGeometry(QRect(80, 50, 900, 400));
        qcustomplot7 = new QCustomPlot(tab_2);
        qcustomplot7->setObjectName(QStringLiteral("qcustomplot7"));
        qcustomplot7->setGeometry(QRect(80, 460, 900, 400));
        tabWidget->addTab(tab_2, QString());
        tab_3 = new QWidget();
        tab_3->setObjectName(QStringLiteral("tab_3"));
        customplot4 = new QCustomPlot(tab_3);
        customplot4->setObjectName(QStringLiteral("customplot4"));
        customplot4->setGeometry(QRect(70, 20, 900, 550));
        tabWidget->addTab(tab_3, QString());
        tab_4 = new QWidget();
        tab_4->setObjectName(QStringLiteral("tab_4"));
        qcustomplot = new QCustomPlot(tab_4);
        qcustomplot->setObjectName(QStringLiteral("qcustomplot"));
        qcustomplot->setGeometry(QRect(50, 30, 900, 400));
        qcustomplot2 = new QCustomPlot(tab_4);
        qcustomplot2->setObjectName(QStringLiteral("qcustomplot2"));
        qcustomplot2->setGeometry(QRect(50, 440, 900, 400));
        tabWidget->addTab(tab_4, QString());
        tab_5 = new QWidget();
        tab_5->setObjectName(QStringLiteral("tab_5"));
        qcustomplot3 = new QCustomPlot(tab_5);
        qcustomplot3->setObjectName(QStringLiteral("qcustomplot3"));
        qcustomplot3->setGeometry(QRect(20, 20, 900, 400));
        qcustomplot4 = new QCustomPlot(tab_5);
        qcustomplot4->setObjectName(QStringLiteral("qcustomplot4"));
        qcustomplot4->setGeometry(QRect(20, 440, 900, 400));
        tabWidget->addTab(tab_5, QString());
        tab_6 = new QWidget();
        tab_6->setObjectName(QStringLiteral("tab_6"));
        qcustomplot5 = new QCustomPlot(tab_6);
        qcustomplot5->setObjectName(QStringLiteral("qcustomplot5"));
        qcustomplot5->setGeometry(QRect(70, 50, 900, 400));
        tabWidget->addTab(tab_6, QString());
        tab_7 = new QWidget();
        tab_7->setObjectName(QStringLiteral("tab_7"));
        qcustomplot8 = new QCustomPlot(tab_7);
        qcustomplot8->setObjectName(QStringLiteral("qcustomplot8"));
        qcustomplot8->setGeometry(QRect(30, 20, 900, 400));
        qcustomplot9 = new QCustomPlot(tab_7);
        qcustomplot9->setObjectName(QStringLiteral("qcustomplot9"));
        qcustomplot9->setGeometry(QRect(30, 430, 900, 400));
        tabWidget->addTab(tab_7, QString());
        tab_8 = new QWidget();
        tab_8->setObjectName(QStringLiteral("tab_8"));
        qcustomplot10 = new QCustomPlot(tab_8);
        qcustomplot10->setObjectName(QStringLiteral("qcustomplot10"));
        qcustomplot10->setGeometry(QRect(20, 20, 900, 400));
        qcustomplot11 = new QCustomPlot(tab_8);
        qcustomplot11->setObjectName(QStringLiteral("qcustomplot11"));
        qcustomplot11->setGeometry(QRect(20, 430, 900, 400));
        tabWidget->addTab(tab_8, QString());
        tab_9 = new QWidget();
        tab_9->setObjectName(QStringLiteral("tab_9"));
        plot = new QCustomPlot(tab_9);
        plot->setObjectName(QStringLiteral("plot"));
        plot->setGeometry(QRect(40, 30, 900, 900));
        tabWidget->addTab(tab_9, QString());
        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 1668, 22));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);

        retranslateUi(MainWindow);

        tabWidget->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", Q_NULLPTR));
        checkBox->setText(QApplication::translate("MainWindow", "Auto scroll", Q_NULLPTR));
        pushButton->setText(QApplication::translate("MainWindow", "save", Q_NULLPTR));
        pushButton_2->setText(QApplication::translate("MainWindow", "Stop", Q_NULLPTR));
        label->setText(QApplication::translate("MainWindow", "t_max", Q_NULLPTR));
        label_2->setText(QApplication::translate("MainWindow", "t_min", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab), QApplication::translate("MainWindow", "Position", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_2), QApplication::translate("MainWindow", "Velocity", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_3), QApplication::translate("MainWindow", "Trajectory", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_4), QApplication::translate("MainWindow", "Force", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_5), QApplication::translate("MainWindow", "Estimation", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_6), QApplication::translate("MainWindow", "Trigger", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_7), QApplication::translate("MainWindow", "vel_est", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_8), QApplication::translate("MainWindow", "vb", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_9), QApplication::translate("MainWindow", "map", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
