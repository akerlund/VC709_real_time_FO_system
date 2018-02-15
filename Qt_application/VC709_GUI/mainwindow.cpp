/*
 *  Fredrik Åkerlund 2017
 *  GUI for the VC709
 */
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QSerialPortInfo>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    serial_port = new QSerialPort(this);
    refreshSerialDevices( );

    status_label = new QLabel(this);
    ui->statusBar->addPermanentWidget(status_label);
    status_label->setText(tr("Port disconnected."));

    max_vector_size = 500;

    FBERT_run_time = 100000000; // This one should be the same as the FBERT
                                // VHDL component is initialized to.

    // Variables for saving BER over a longer time.
    BER_accumulator = 0;
    nr_of_BER_accumulated = 0;
    elapse_timer = new QElapsedTimer( );
    elapse_timer->start( );

    q_timer_50Hz = new QTimer(this);
    q_timer_50Hz->setInterval(20);
    q_timer_50Hz->start( );

    q_timer_10Hz = new QTimer(this);
    q_timer_10Hz->setInterval(200);
    q_timer_10Hz->start( );

    connect(q_timer_50Hz, SIGNAL(timeout()), this, SLOT(q_timer_50Hz_event( )));
    connect(q_timer_10Hz, SIGNAL(timeout()), this, SLOT(q_timer_10Hz_event( )));
    connect(serial_port, SIGNAL(readyRead( )), this, SLOT(serial_RX_event( )));
    connect(serial_port, SIGNAL(error(QSerialPort::SerialPortError)), this, SLOT(serialPortError(QSerialPort::SerialPortError)));

    // Allowing drag and zoom in the plots.
    ui->plot_BER->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_RX_Power->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);

    ui->plot_SFP_00->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_01->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_02->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_03->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_10->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_11->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_12->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_13->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_20->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_21->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_22->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_23->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_30->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_31->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_32->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
    ui->plot_SFP_33->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);

    init_plots( );
}

MainWindow::~MainWindow( ) {

    delete ui;
}

void MainWindow::init_plots(  ){

    // This will be the x-axis used for all plots.
    for (int i = 0; i < max_vector_size; i++) {
        x_axis.append(double(i));
    }

    // We fill these up so that the average can be calculated immediately.
    for (int i = 0; i < max_vector_size; i++) {
        BER.append(0.0);
        SFP0_TX_PWR.append(0.0);
        SFP0_RX_PWR.append(0.0);
    }

    QFont legendFont = font( );
    legendFont.setPointSize(12);

    // BER plot (FBERT tab).
    ui->plot_BER->addGraph( );
    ui->plot_BER->graph(0)->setPen(QPen(Qt::darkRed));
    ui->plot_BER->graph(0)->setName("BER");
    ui->plot_BER->addGraph( );
    ui->plot_BER->graph(1)->setPen(QPen(Qt::darkGreen));
    ui->plot_BER->graph(1)->setName("Avg");
//    ui->plot_BER->addGraph( );
//    ui->plot_BER->graph(2)->setPen(QPen(Qt::darkBlue));
//    ui->plot_BER->graph(2)->setName("#errors");

    ui->plot_BER->xAxis->setLabel("Sample (n)");
    //ui->plot_BER->yAxis->setLabel("BER");
    ui->plot_BER->yAxis->setRange(0, 100);

    ui->plot_BER->legend->setVisible(true);
    ui->plot_BER->legend->setFont(legendFont);
    ui->plot_BER->legend->setBrush(QBrush(QColor(255,255,255,230)));
    ui->plot_BER->axisRect( )->insetLayout( )->setInsetAlignment(0, Qt::AlignRight|Qt::AlignBottom);
    ui->plot_BER->yAxis->setRange(0, 10);


    // RX power plot (FBERT tab).
    ui->plot_RX_Power->addGraph( );
    ui->plot_RX_Power->graph(0)->setPen(QPen(Qt::darkRed));
    ui->plot_RX_Power->graph(0)->setName("PWR");

    ui->plot_RX_Power->xAxis->setLabel("Sample (n)");
    //ui->plot_RX_Power->yAxis->setLabel("Power (mW)");

    ui->plot_RX_Power->legend->setVisible(true);
    ui->plot_RX_Power->legend->setFont(legendFont);
    ui->plot_RX_Power->legend->setBrush(QBrush(QColor(255,255,255,230)));
    ui->plot_RX_Power->axisRect( )->insetLayout( )->setInsetAlignment(0, Qt::AlignRight|Qt::AlignBottom);


    // SFP plot (SFP tab).
    ui->plot_SFP_00->addGraph( );
    ui->plot_SFP_00->graph(0)->setPen(QPen(Qt::darkRed));
    ui->plot_SFP_01->addGraph( );
    ui->plot_SFP_01->graph(0)->setPen(QPen(Qt::darkYellow));
    ui->plot_SFP_02->addGraph( );
    ui->plot_SFP_02->graph(0)->setPen(QPen(Qt::darkMagenta));
    ui->plot_SFP_03->addGraph( );
    ui->plot_SFP_03->graph(0)->setPen(QPen(Qt::darkBlue));

    ui->plot_SFP_10->addGraph( );
    ui->plot_SFP_10->graph(0)->setPen(QPen(Qt::darkRed));
    ui->plot_SFP_11->addGraph( );
    ui->plot_SFP_11->graph(0)->setPen(QPen(Qt::darkYellow));
    ui->plot_SFP_12->addGraph( );
    ui->plot_SFP_12->graph(0)->setPen(QPen(Qt::darkMagenta));
    ui->plot_SFP_13->addGraph( );
    ui->plot_SFP_13->graph(0)->setPen(QPen(Qt::darkBlue));

    ui->plot_SFP_20->addGraph( );
    ui->plot_SFP_20->graph(0)->setPen(QPen(Qt::darkRed));
    ui->plot_SFP_21->addGraph( );
    ui->plot_SFP_21->graph(0)->setPen(QPen(Qt::darkYellow));
    ui->plot_SFP_22->addGraph( );
    ui->plot_SFP_22->graph(0)->setPen(QPen(Qt::darkMagenta));
    ui->plot_SFP_23->addGraph( );
    ui->plot_SFP_23->graph(0)->setPen(QPen(Qt::darkBlue));

    ui->plot_SFP_30->addGraph( );
    ui->plot_SFP_30->graph(0)->setPen(QPen(Qt::darkRed));
    ui->plot_SFP_31->addGraph( );
    ui->plot_SFP_31->graph(0)->setPen(QPen(Qt::darkYellow));
    ui->plot_SFP_32->addGraph( );
    ui->plot_SFP_32->graph(0)->setPen(QPen(Qt::darkMagenta));
    ui->plot_SFP_33->addGraph( );
    ui->plot_SFP_33->graph(0)->setPen(QPen(Qt::darkBlue));

    // SFP Temperature plot (Temperature tab).
    ui->plot_TEMP_0->addGraph( );
    ui->plot_TEMP_0->graph(0)->setPen(QPen(Qt::darkRed));
    ui->plot_TEMP_1->addGraph( );
    ui->plot_TEMP_1->graph(0)->setPen(QPen(Qt::darkRed));
    ui->plot_TEMP_2->addGraph( );
    ui->plot_TEMP_2->graph(0)->setPen(QPen(Qt::darkRed));
    ui->plot_TEMP_3->addGraph( );
    ui->plot_TEMP_3->graph(0)->setPen(QPen(Qt::darkRed));
}


void MainWindow::q_timer_10Hz_event( ) {

    // Now generate the average of RX and TX power.
    double sum_TX = 0.0;
    double sum_RX = 0.0;
    for (int i = 0; i < max_vector_size; i++){
        sum_TX += SFP0_TX_PWR[i];
        sum_RX += SFP0_RX_PWR[i];
    }
    sum_TX = sum_TX / max_vector_size;
    sum_RX = sum_RX / max_vector_size;

    // dB conversion.
    double average_attenuation = 10*log10(sum_RX / sum_TX);

    // Updating the labels seen in the FBERT tab.
    ui->label_attenuation->setText(QString::number(average_attenuation,'f', 6));
    ui->label_avg_TX_pwr->setText(QString::number(sum_TX,'f', 6));
    ui->label_avg_RX_pwr->setText(QString::number(sum_RX,'f', 6));

    //
    ui->label_cont_runtime->setText(QString::number(elapse_timer->elapsed()/1000));
}


void MainWindow::q_timer_50Hz_event( ) {

    ui->plot_BER->graph(0)->setData(x_axis, BER);
    ui->plot_BER->graph(1)->setData(x_axis, BER_avg_line);
    ui->plot_RX_Power->graph(0)->setData(x_axis, SFP0_RX_PWR);

    ui->plot_BER->replot( );
    ui->plot_RX_Power->replot( );

    ui->plot_BER->rescaleAxes();
    ui->plot_RX_Power->rescaleAxes();


    ui->plot_SFP_00->graph(0)->setData(x_axis, SFP0_VCC);
    ui->plot_SFP_00->replot( );
    ui->plot_SFP_00->rescaleAxes();
    ui->plot_SFP_01->graph(0)->setData(x_axis, SFP0_TX_CUR);
    ui->plot_SFP_01->replot( );
    ui->plot_SFP_01->rescaleAxes();
    ui->plot_SFP_02->graph(0)->setData(x_axis, SFP0_TX_PWR);
    ui->plot_SFP_02->replot( );
    ui->plot_SFP_02->rescaleAxes();
    ui->plot_SFP_03->graph(0)->setData(x_axis, SFP0_RX_PWR);
    ui->plot_SFP_03->replot( );
    ui->plot_SFP_03->rescaleAxes();

    ui->plot_SFP_10->graph(0)->setData(x_axis, SFP1_VCC);
    ui->plot_SFP_10->replot( );
    ui->plot_SFP_10->rescaleAxes();
    ui->plot_SFP_11->graph(0)->setData(x_axis, SFP1_TX_CUR);
    ui->plot_SFP_11->replot( );
    ui->plot_SFP_11->rescaleAxes();
    ui->plot_SFP_12->graph(0)->setData(x_axis, SFP1_TX_PWR);
    ui->plot_SFP_12->replot( );
    ui->plot_SFP_12->rescaleAxes();
    ui->plot_SFP_13->graph(0)->setData(x_axis, SFP1_RX_PWR);
    ui->plot_SFP_13->replot( );
    ui->plot_SFP_13->rescaleAxes();

    ui->plot_SFP_20->graph(0)->setData(x_axis, SFP2_VCC);
    ui->plot_SFP_20->replot( );
    ui->plot_SFP_20->rescaleAxes();
    ui->plot_SFP_21->graph(0)->setData(x_axis, SFP2_TX_CUR);
    ui->plot_SFP_21->replot( );
    ui->plot_SFP_21->rescaleAxes();
    ui->plot_SFP_22->graph(0)->setData(x_axis, SFP2_TX_PWR);
    ui->plot_SFP_22->replot( );
    ui->plot_SFP_22->rescaleAxes();
    ui->plot_SFP_23->graph(0)->setData(x_axis, SFP2_RX_PWR);
    ui->plot_SFP_23->replot( );
    ui->plot_SFP_23->rescaleAxes();

    ui->plot_SFP_30->graph(0)->setData(x_axis, SFP3_VCC);
    ui->plot_SFP_30->replot( );
    ui->plot_SFP_30->rescaleAxes();
    ui->plot_SFP_31->graph(0)->setData(x_axis, SFP3_TX_CUR);
    ui->plot_SFP_31->replot( );
    ui->plot_SFP_31->rescaleAxes();
    ui->plot_SFP_32->graph(0)->setData(x_axis, SFP3_TX_PWR);
    ui->plot_SFP_32->replot( );
    ui->plot_SFP_32->rescaleAxes();
    ui->plot_SFP_33->graph(0)->setData(x_axis, SFP3_RX_PWR);
    ui->plot_SFP_33->replot( );
    ui->plot_SFP_33->rescaleAxes();

    // SFP Temperature plot.
    ui->plot_TEMP_0->graph(0)->setData(x_axis, SFP0_TEMP);
    ui->plot_TEMP_0->replot( );
    ui->plot_TEMP_0->rescaleAxes();
    ui->plot_TEMP_1->graph(0)->setData(x_axis, SFP1_TEMP);
    ui->plot_TEMP_1->replot( );
    ui->plot_TEMP_1->rescaleAxes();
    ui->plot_TEMP_2->graph(0)->setData(x_axis, SFP2_TEMP);
    ui->plot_TEMP_2->replot( );
    ui->plot_TEMP_2->rescaleAxes();
    ui->plot_TEMP_3->graph(0)->setData(x_axis, SFP3_TEMP);
    ui->plot_TEMP_3->replot( );
    ui->plot_TEMP_3->rescaleAxes();

    if (!FBERT_state.isEmpty()){
        switch((int)FBERT_state.last( )){
            case 1: ui->label_FBERT_STATE->setText("IDLE"); break;
            case 2: ui->label_FBERT_STATE->setText("SYNC RX"); break;
            case 3: ui->label_FBERT_STATE->setText("RX SYNCED"); break;
            case 4: ui->label_FBERT_STATE->setText("SYNC BER CALCULATOR"); break;
            case 5: ui->label_FBERT_STATE->setText("FBERT RUN"); break;
            case 6: ui->label_FBERT_STATE->setText("FBERT END"); break;
            default: ui->label_FBERT_STATE->setText("OTHERS"); break;
        }
    }
}


void MainWindow::refreshSerialDevices( )
{
    ui->comboBox_serial->clear( );

    QList<QSerialPortInfo> ports = QSerialPortInfo::availablePorts( );
    foreach(const QSerialPortInfo &port, ports) {

        QString name = port.portName( );
        int index = ui->comboBox_serial->count( );

        if(port.manufacturer() == "Digilent") {
            name.insert(0, "JTAG - ");
            index = 0;
        }
        if(port.manufacturer() == "Silicon Labs") {
            name.insert(0, "UART - ");
            index = 0;
        }

        ui->comboBox_serial->insertItem(index, name, port.systemLocation( ));
    }
    ui->comboBox_serial->setCurrentIndex(0);
}

// Receives all data.
void MainWindow::serial_RX_event( )
{
    while (serial_port->bytesAvailable() > 0) {
        QByteArray data = serial_port->readAll( );
        process_RX_data(data);
    }
}

// Collects all received data.
void MainWindow::process_RX_data(QByteArray &data) {

    unsigned char rx_data;

    for(int i = 0; i < data.length( ); i++) {

        rx_data = data[i];

        switch(rx_state)
        {
            case 0:
            {
                switch(rx_data)
                {
                    case 0xA1:{rx_header = 0xA1; rx_state = 1; rx_buf_pointer = 0; bytes_to_receieve = 384;} break;
                    case 0xA2:{rx_header = 0xA2; rx_state = 1; rx_buf_pointer = 0; bytes_to_receieve = 472;} break;
                    case 0xA3:{rx_header = 0xA3; rx_state = 1; rx_buf_pointer = 0; bytes_to_receieve = 40;} break;
                    case 0xA7:{rx_header = 0xA7; rx_state = 1; rx_buf_pointer = 0; bytes_to_receieve = 5;} break;
                    default  :{rx_header = 0x00; rx_state = 0; rx_buf_pointer = 0; bytes_to_receieve = 0;} break;
                }

            } break;

            case 1:
            {
                rx_buffer[rx_buf_pointer++] = data[i];

                if (rx_buf_pointer == bytes_to_receieve) {
                    process_RX_package(rx_buffer, rx_buf_pointer);
                    rx_buf_pointer = 0;
                    rx_state = 0;
                } /*else {

                }*/
            } break;

            default: rx_state = 0; break;
        }
    }
}

// Takes care of all complete data transfers.
void MainWindow::process_RX_package(char unsigned *rx_data, int received_bytes) {

    switch (rx_header)
    {
        // The SFP register Ah0 is 96*4 = 384 bytes
        case 0xA1:
        {
            print_to_sfp_reg_browser("Ah0 header: A1.\n");

            int sfp = 0;

            for(int i = 0; i < received_bytes; i++) {
                if (i % 96 == 0) {
                    print_to_sfp_reg_browser("SFP" + QString::number(sfp) + "\n\n\n");
                    sfp++;
                }
                print_to_sfp_reg_browser(QString::number(rx_data[i]));
            }
        }

        // The SFP register A Ah2 is 118*4 = 472 bytes
        case 0xA2:
        {
            print_to_sfp_reg_browser("Ah2 header: A2.");

            int sfp = 0;

            for (int i = 0; i < received_bytes; i++) {
                if (i % 96 == 0) {
                    print_to_sfp_reg_browser("SFP" + QString::number(sfp) + "\n\n\n");
                    sfp++;
                }
                print_to_sfp_reg_browser(QString::number(rx_data[i]));
            }
        }

        // SFP real time data.
        case 0xA3:
        {
            double sfp0_Temp	= ((rx_data[0] << 8) + rx_data[1]) * (1/256.000); // *C
            double sfp0_Vcc		= ((rx_data[2] << 8) + rx_data[3]) * (0.0001000); // V, 100µV
            double sfp0_Tx_Bias	= ((rx_data[4] << 8) + rx_data[5]) * (0.0020);    // mA, increments of 2µA.

            // Transmitted average optical power (Tx Pwr) is decoded as a 16 bit unsigned integer in increments of 0.1 µW.
            double sfp0_Tx_Pwr  = ((rx_data[6] << 8) + rx_data[7]) * (0.0001); // mW, 0.1µW
            sfp0_Tx_Pwr = round( sfp0_Tx_Pwr * 1000000.0 ) / 1000000.0; // Six decimals.

            // Received average optical power (Rx Pwr) is decoded as a 16 bit unsigned integer in increments of 0.1 µW.
            double sfp0_Rx_Pwr  = ((rx_data[8] << 8) + rx_data[9]) * (0.0001); // mW, 0.1µW
            sfp0_Rx_Pwr = round( sfp0_Rx_Pwr * 1000000.0 ) / 1000000.0;

            shift_in_to_vector(&SFP0_TEMP,   sfp0_Temp,    max_vector_size);
            shift_in_to_vector(&SFP0_VCC,    sfp0_Vcc,     max_vector_size);
            shift_in_to_vector(&SFP0_TX_CUR, sfp0_Tx_Bias, max_vector_size);
            shift_in_to_vector(&SFP0_TX_PWR, sfp0_Tx_Pwr,  max_vector_size);
            shift_in_to_vector(&SFP0_RX_PWR, sfp0_Rx_Pwr,  max_vector_size);


            double sfp1_Temp	= ((rx_data[10] << 8) + rx_data[11]) * (1/256.000); // *C
            double sfp1_Vcc		= ((rx_data[12] << 8) + rx_data[13]) * (0.0001000); // V, 100µV
            double sfp1_Tx_Bias	= ((rx_data[14] << 8) + rx_data[15]) * (0.0020); // mA, 2µA
            double sfp1_Tx_Pwr  = ((rx_data[16] << 8) + rx_data[17]) * (0.0001); // mW, 0.1µW
            double sfp1_Rx_Pwr  = ((rx_data[18] << 8) + rx_data[19]) * (0.0001); // mW, 0.1µW
            shift_in_to_vector(&SFP1_TEMP,   sfp1_Temp,    max_vector_size);
            shift_in_to_vector(&SFP1_VCC,    sfp1_Vcc,     max_vector_size);
            shift_in_to_vector(&SFP1_TX_CUR, sfp1_Tx_Bias, max_vector_size);
            shift_in_to_vector(&SFP1_TX_PWR, sfp1_Tx_Pwr,  max_vector_size);
            shift_in_to_vector(&SFP1_RX_PWR, sfp1_Rx_Pwr,  max_vector_size);

            double sfp2_Temp	= ((rx_data[20] << 8) + rx_data[21]) * (1/256.000); // *C
            double sfp2_Vcc		= ((rx_data[22] << 8) + rx_data[23]) * (0.0001000); // V, 100µV
            double sfp2_Tx_Bias	= ((rx_data[24] << 8) + rx_data[25]) * (0.0020); // mA, 2µA
            double sfp2_Tx_Pwr  = ((rx_data[26] << 8) + rx_data[27]) * (0.0001); // mW, 0.1µW
            double sfp2_Rx_Pwr  = ((rx_data[28] << 8) + rx_data[29]) * (0.0001); // mW, 0.1µW
            shift_in_to_vector(&SFP2_TEMP,   sfp2_Temp,    max_vector_size);
            shift_in_to_vector(&SFP2_VCC,    sfp2_Vcc,     max_vector_size);
            shift_in_to_vector(&SFP2_TX_CUR, sfp2_Tx_Bias, max_vector_size);
            shift_in_to_vector(&SFP2_TX_PWR, sfp2_Tx_Pwr,  max_vector_size);
            shift_in_to_vector(&SFP2_RX_PWR, sfp2_Rx_Pwr,  max_vector_size);

            double sfp3_Temp	= ((rx_data[30] << 8) + rx_data[31]) * (1/256.000); // *C
            double sfp3_Vcc		= ((rx_data[32] << 8) + rx_data[33]) * (0.0001000); // V, 100µV
            double sfp3_Tx_Bias	= ((rx_data[34] << 8) + rx_data[35]) * (0.0020); // mA, 2µA
            double sfp3_Tx_Pwr  = ((rx_data[36] << 8) + rx_data[37]) * (0.0001); // mW, 0.1µW
            double sfp3_Rx_Pwr  = ((rx_data[38] << 8) + rx_data[39]) * (0.0001); // Wm, 0.1µW
            shift_in_to_vector(&SFP3_TEMP,   sfp3_Temp,    max_vector_size);
            shift_in_to_vector(&SFP3_VCC,    sfp3_Vcc,     max_vector_size);
            shift_in_to_vector(&SFP3_TX_CUR, sfp3_Tx_Bias, max_vector_size);
            shift_in_to_vector(&SFP3_TX_PWR, sfp3_Tx_Pwr,  max_vector_size);
            shift_in_to_vector(&SFP3_RX_PWR, sfp3_Rx_Pwr,  max_vector_size);
        }
        break;

        // BER and STATUS data
        case 0xA7:
        {
            double tm_BER = (rx_data[3] << 24) + (rx_data[2] << 16) + (rx_data[1] << 8) + rx_data[0];
            double tm_BER2 = tm_BER;

            //print_to_terminal(QString::number(tm_BER));
            // Here, let's average the real BER.
            // The BERT runs over 20M words.
            // 20M words * 64 bits = 128M bits.
            tm_BER = tm_BER / (64.0*FBERT_run_time);
            shift_in_to_vector(&BER, tm_BER, max_vector_size);

            // Now generate the average of the total BER.
            double sum = 0.0;
            double temp = 0.0;
            int counter = 0;
            int unique_BER = 0;
            for (int i = 0; i < max_vector_size; i++){
                if (temp != BER[i]){ // Because we are receiving copies.
                    sum += BER[i];   // The FPGA sends the sum of all found errors all the time, kinda bad. =/
                                     // Let's hope the chance is small it is the same twice in a row.
                    unique_BER += 1;
                } else {
                    counter += 1;
                    if (counter > 60) { // However, the FPGA sends at 50Hz, so after 60 samples, it was probably a copy.
                        counter = 0;
                        sum += BER[i];
                        unique_BER += 1;
                    }
                }
                temp = BER[i];
            }
            sum = sum / unique_BER; // Average.
            BER_avg_line.clear();
            for (int i = 0; i < max_vector_size; i++){
                BER_avg_line.append(sum);
            }

            ui->label_BER_avg->setText(QString::number(sum)); // In the FBERT tab.

            // Continous BER acculumation.
            if (tm_BER2 != last_received_BER){
                last_received_BER = tm_BER2;
                BER_accumulator += tm_BER;
                nr_of_BER_accumulated += 1;
                last_received_BER_counter = 0;
                if (!ui->checkBox_BER_pause->isChecked( )){
                    ui->label_cont_BER->setText(QString::number(BER_accumulator/nr_of_BER_accumulated));
                    ui->label_cont_received->setText(QString::number(nr_of_BER_accumulated));
                }
            } else {
                if (last_received_BER_counter > 50) {
                    last_received_BER_counter = 0;
                    BER_accumulator += tm_BER;
                    nr_of_BER_accumulated += 1;
                    if (!ui->checkBox_BER_pause->isChecked( )){
                        ui->label_cont_BER->setText(QString::number(BER_accumulator/nr_of_BER_accumulated));
                        ui->label_cont_received->setText(QString::number(nr_of_BER_accumulated));
                    }
                } else {
                    last_received_BER_counter += 1;
                }
            }


            double tm_RX_LOSS       = rx_data[4] & 0x01;
            double tm_HEADER        = ((rx_data[4] & 0x06) >> 1);
            double tm_RX_DATA_VALID = ((rx_data[4] & 0x08) >> 3);
            double tm_FBERT_STATE   = ((rx_data[4] & 0x70) >> 4);
            int correction_enable   = ((rx_data[4] & 0x80) >> 7);

            shift_in_to_vector(&RX_LOSS,       tm_RX_LOSS,       max_vector_size);
            shift_in_to_vector(&HEADER_VALID,  tm_HEADER,        max_vector_size);
            shift_in_to_vector(&RX_DATA_VALID, tm_RX_DATA_VALID, max_vector_size);
            shift_in_to_vector(&FBERT_state,   tm_FBERT_STATE,   max_vector_size);


            if (tm_RX_LOSS == 1){
                ui->label_RX_loss->setText("YES");
            } else {
                ui->label_RX_loss->setText("NO");
            }

            if (correction_enable == 1){
                ui->label_FEC_on_off->setText("ON");
            } else {
                ui->label_FEC_on_off->setText("OFF");
            }
        }
        break;

        default:
        {
            print_to_terminal("Unknown header: " + QString::number(rx_header));
        }
    }
}







void MainWindow::shift_in_to_vector(QVector<double> *vector, double value, int max_size) {

    vector->append(value);

    if(vector->size( ) > max_size) {
        vector->remove(0, vector->size( ) - max_size);
    }
}


void MainWindow::serial_TX_send(QByteArray &data) {

    if (serial_port->isOpen( )) {
        serial_port->write(data);
    }
}


void MainWindow::serialPortError(QSerialPort::SerialPortError error) {

    QString message;

    switch (error) {
    case QSerialPort::NoError:
        break;
    case QSerialPort::DeviceNotFoundError:
        message = tr("Device not found.");
        break;
    case QSerialPort::OpenError:
        message = tr("Can't open device.");
        break;
    case QSerialPort::NotOpenError:
        message = tr("Not open error.");
        break;
    case QSerialPort::ResourceError:
        message = tr("Port disconnected.");
        break;
    case QSerialPort::UnknownError:
        message = tr("Unknown error.");
        break;
    default:
        message = "Serial port error: " + QString::number(error) + ".";
        break;
    }

    if(!message.isEmpty( )) {
        status_label->setText(message);
        if(serial_port->isOpen( )) {
            serial_port->close( );
        }
    }
}


void MainWindow::print_to_terminal(QString str) {

    ui->text_browser_0->append(str);
}


void MainWindow::print_to_sfp_reg_browser(QString str) {

    ui->sfp_reg_browser->append(str);
}










void MainWindow::on_btn_serial_connect_clicked( ) {

    if(serial_port->isOpen( )) {
        return;
    }

    serial_port->setPortName(ui->comboBox_serial->currentData( ).toString( ));
    serial_port->open(QIODevice::ReadWrite);

    if(!serial_port->isOpen( )) {

        print_to_terminal("Serial not open.");
        status_label->setText("Serial not open.");
        return;
    } else {
        print_to_terminal("Serial open.");
        status_label->setText("Serial open.");
    }

    serial_port->setBaudRate(921600);//(QSerialPort::Baud115200);
    serial_port->setDataBits(QSerialPort::Data8);
    serial_port->setParity(QSerialPort::NoParity);
    serial_port->setStopBits(QSerialPort::OneStop);
    serial_port->setFlowControl(QSerialPort::NoFlowControl);
}

void MainWindow::on_btn_serial_refresh_clicked( ) {

    refreshSerialDevices( );
}

void MainWindow::on_btn_serial_disconnect_clicked( ) {

    if (serial_port->isOpen( )) {
        serial_port->close( );
    }
}


void MainWindow::on_pushButton_cont_BER_clicked( ) {

    elapse_timer->restart( );
    ui->label_cont_BER->setText("0");
    ui->label_cont_runtime->setText("0");
    BER_accumulator = 0;
    nr_of_BER_accumulated = 0;
}
