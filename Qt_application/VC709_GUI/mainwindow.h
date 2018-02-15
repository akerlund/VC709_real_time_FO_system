#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QLabel>
#include <QTimer>
#include <QByteArray>
#include <QSerialPort>
#include <QElapsedTimer>


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

    void serial_RX_event( );
    void serialPortError(QSerialPort::SerialPortError error);

    void on_btn_serial_refresh_clicked();
    void on_btn_serial_connect_clicked();
    void on_btn_serial_disconnect_clicked();

    void q_timer_50Hz_event( );
    void q_timer_10Hz_event( );


    void on_pushButton_cont_BER_clicked();

private:

    Ui::MainWindow *ui;

    QSerialPort *serial_port;
    QLabel *status_label; // Displays the serial status at bottom right.

    QTimer *q_timer_50Hz;
    QTimer *q_timer_10Hz;


    // RX variables
    int rx_state;
    int rx_header;
    int bytes_to_receieve;
    int bytes_received;
    char unsigned rx_buffer[2048];
    int rx_buf_pointer;

    int FBERT_run_time;


    int max_vector_size;
    QVector<double> x_axis; // This one we fill up with (0,1,2, ... max_vector_size)
                            // because at the moment I do not know any better.

    QVector<double> BER;
    QVector<double> BER_avg_line;

    double BER_accumulator; // Saving BER in long runs.
    int nr_of_BER_accumulated;
    QElapsedTimer *elapse_timer;
    int last_received_BER; // Used for not counting in copies.
    int last_received_BER_counter;


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

    // Functions.
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
