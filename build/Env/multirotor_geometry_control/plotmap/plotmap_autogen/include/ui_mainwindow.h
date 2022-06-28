/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.9.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>
#include <qcustomplot.h>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QWidget *layoutWidget;
    QGridLayout *gridLayout;
    QLabel *label;
    QLineEdit *start_x_text;
    QLineEdit *start_y_text;
    QLabel *label_2;
    QLineEdit *goal_x_text;
    QLineEdit *goal_y_text;
    QPushButton *pushButton;
    QPushButton *save_Button;
    QPushButton *qpsolve_Button;
    QTabWidget *tabWidget;
    QWidget *tab;
    QCustomPlot *plot;
    QWidget *tab_2;
    QCustomPlot *vel_plot;
    QPushButton *publish_button;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(1197, 946);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        layoutWidget = new QWidget(centralWidget);
        layoutWidget->setObjectName(QStringLiteral("layoutWidget"));
        layoutWidget->setGeometry(QRect(880, 50, 292, 135));
        gridLayout = new QGridLayout(layoutWidget);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        label = new QLabel(layoutWidget);
        label->setObjectName(QStringLiteral("label"));

        gridLayout->addWidget(label, 0, 0, 1, 1);

        start_x_text = new QLineEdit(layoutWidget);
        start_x_text->setObjectName(QStringLiteral("start_x_text"));

        gridLayout->addWidget(start_x_text, 1, 0, 1, 1);

        start_y_text = new QLineEdit(layoutWidget);
        start_y_text->setObjectName(QStringLiteral("start_y_text"));

        gridLayout->addWidget(start_y_text, 1, 1, 1, 1);

        label_2 = new QLabel(layoutWidget);
        label_2->setObjectName(QStringLiteral("label_2"));

        gridLayout->addWidget(label_2, 2, 0, 1, 1);

        goal_x_text = new QLineEdit(layoutWidget);
        goal_x_text->setObjectName(QStringLiteral("goal_x_text"));

        gridLayout->addWidget(goal_x_text, 3, 0, 1, 1);

        goal_y_text = new QLineEdit(layoutWidget);
        goal_y_text->setObjectName(QStringLiteral("goal_y_text"));

        gridLayout->addWidget(goal_y_text, 3, 1, 1, 1);

        pushButton = new QPushButton(layoutWidget);
        pushButton->setObjectName(QStringLiteral("pushButton"));

        gridLayout->addWidget(pushButton, 4, 0, 1, 1);

        save_Button = new QPushButton(centralWidget);
        save_Button->setObjectName(QStringLiteral("save_Button"));
        save_Button->setGeometry(QRect(890, 240, 89, 25));
        qpsolve_Button = new QPushButton(centralWidget);
        qpsolve_Button->setObjectName(QStringLiteral("qpsolve_Button"));
        qpsolve_Button->setGeometry(QRect(890, 290, 89, 25));
        tabWidget = new QTabWidget(centralWidget);
        tabWidget->setObjectName(QStringLiteral("tabWidget"));
        tabWidget->setGeometry(QRect(10, 20, 851, 851));
        tab = new QWidget();
        tab->setObjectName(QStringLiteral("tab"));
        plot = new QCustomPlot(tab);
        plot->setObjectName(QStringLiteral("plot"));
        plot->setGeometry(QRect(20, 10, 800, 800));
        tabWidget->addTab(tab, QString());
        tab_2 = new QWidget();
        tab_2->setObjectName(QStringLiteral("tab_2"));
        vel_plot = new QCustomPlot(tab_2);
        vel_plot->setObjectName(QStringLiteral("vel_plot"));
        vel_plot->setGeometry(QRect(20, 20, 811, 371));
        tabWidget->addTab(tab_2, QString());
        publish_button = new QPushButton(centralWidget);
        publish_button->setObjectName(QStringLiteral("publish_button"));
        publish_button->setGeometry(QRect(1040, 240, 89, 25));
        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 1197, 22));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);

        retranslateUi(MainWindow);

        tabWidget->setCurrentIndex(1);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", Q_NULLPTR));
        label->setText(QApplication::translate("MainWindow", "Start(x,y)", Q_NULLPTR));
        label_2->setText(QApplication::translate("MainWindow", "Goal(x,y)", Q_NULLPTR));
        pushButton->setText(QApplication::translate("MainWindow", "planning", Q_NULLPTR));
        save_Button->setText(QApplication::translate("MainWindow", "Save", Q_NULLPTR));
        qpsolve_Button->setText(QApplication::translate("MainWindow", "QPSolve", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab), QApplication::translate("MainWindow", "Tab 1", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_2), QApplication::translate("MainWindow", "Tab 2", Q_NULLPTR));
        publish_button->setText(QApplication::translate("MainWindow", "Publish", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
