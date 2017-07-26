#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QLabel>
#include <QTimer>
#include <QByteArray>
#include <QSerialPort>


#include "qcustomplot.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:

    void q_timer_event( );
    void serial_RX_event( );
    void serialPortError(QSerialPort::SerialPortError error);

    void on_btn_SYSCLK_clicked();
    void on_btn_run_time_clicked();
    void on_btn_serial_refresh_clicked();
    void on_btn_serial_connect_clicked();

    void on_btn_serial_disconnect_clicked();

private:

    Ui::MainWindow *ui;

    QSerialPort *serial_port;
    QLabel *status_label;
    QTimer *q_timer;

    double sin_shifter;
    double SYSCLK;
    int run_time;

    // RX variables
    int rx_state;
    int rx_header;
    int bytes_to_receieve;
    int bytes_received;
    char unsigned rx_buffer[2048];
    int rx_buf_pointer;




    static const int max_vector_size = 1000;

    QVector<double> BER;
    QVector<double> BER_avg;
    QVector<double> BER_avg_line;
    int BER_avg_size;
    int BER_avg_cnt;

    QVector<double> RX_LOSS;
    QVector<double> HEADER_VALID;
    QVector<double> RX_DATA_VALID;
    QVector<double> FBERT_state;

    QVector<double> SFP0_TEMP;
    QVector<double> SFP0_VCC;
    QVector<double> SFP0_TX_CUR;
    QVector<double> SFP0_TX_PWR;
    QVector<double> SFP0_RX_PWR;
    QVector<double> SFP1_TEMP;
    QVector<double> SFP1_VCC;
    QVector<double> SFP1_TX_CUR;
    QVector<double> SFP1_TX_PWR;
    QVector<double> SFP1_RX_PWR;
    QVector<double> SFP2_TEMP;
    QVector<double> SFP2_VCC;
    QVector<double> SFP2_TX_CUR;
    QVector<double> SFP2_TX_PWR;
    QVector<double> SFP2_RX_PWR;
    QVector<double> SFP3_TEMP;
    QVector<double> SFP3_VCC;
    QVector<double> SFP3_TX_CUR;
    QVector<double> SFP3_TX_PWR;
    QVector<double> SFP3_RX_PWR;

    void init_plots( );
    void process_RX_data(QByteArray &data);
    void process_RX_package(char unsigned *rx_data, int received_bytes);
    void shift_in_to_vector(QVector<double> *vector, double value, int max_size);
    void serial_TX_send(QByteArray &data);
    void refreshSerialDevices( );
    void print_to_terminal(QString str);
    void print_to_sfp_reg_browser(QString str);

};

#endif // MAINWINDOW_H
