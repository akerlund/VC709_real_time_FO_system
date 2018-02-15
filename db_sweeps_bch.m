clear all; close all;

nr_of_sample_points = 5;
TX_power = 0.58115

BCH_dB__n255_k247_t1   = [];
BCH_ON__n255_k247_t1    = [];
BCH_OFF_n255_k247_t1   = [];

BCH_dB__n511_k502_t1   = [];
BCH_ON__n511_k502_t1   = [];
BCH_OFF_n511_k502_t1   = [];

BCH_dB__n1023_k1013_t1 = [];
BCH_ON__n1023_k1013_t1 = [];
BCH_OFF_n1023_k1013_t1 = [];


BCH_dB__n255_k239_t2   = [12.73         13.09          13.68         14.29         14.61         15.31         15.54         16.39       16.65      17.21  ] .* -1;
BCH_ON__n255_k239_t2   = [1.1938*10^-10 6.37260*10^-9  1.68445*10^-7 2.60265*10^-6 2.15852*10^-5 0.000131146   0.000589873   0.00337705  0.0119029  0.0246 ];
BCH_OFF_n255_k239_t2   = [2.3821*10^-10 8.63996*10^-9  2.08304*10^-7 3.10517*10^-6 2.62939*10^-5 0.000157423   0.000699885   0.00366807  0.0112717  0.0269 ];

figure(4);
plot(BCH_dB__n255_k239_t2, BCH_ON__n255_k239_t2,'X-')
title('n255 k239 t2')
xlabel('dB')
ylabel('Average BER')
set(gca, 'YScale', 'log')
grid on
hold on
plot(BCH_dB__n255_k239_t2, BCH_OFF_n255_k239_t2,'+-')
legend('ON','OFF')

% Using this setting on the OLA-54 for all tests. But we plot with the
% attenuation calculated by the GUI.
OLA_db                 = [12.45         12.95          13.45         13.95         14.45         14.95         15.45         15.95       16.45      16.95     ];

BCH_dB__n511_k493_t2   = [12.73         13.03          13.68         14.25         14.59         15.31         15.64         16.49       16.66      17.35     ] .* -1;
BCH_ON__n511_k493_t2   = [7.8478*10^-10 2.01865*10^-8  1.72559*10^-7 3.0206*10^-6  5.14384*10^-5 0.000374096   0.00112583    0.003792    0.0120189  0.0303936 ];
BCH_OFF_n511_k493_t2   = [5.7565*10^-10 1.18986*10^-8  1.15815*10^-7 2.0408*10^-6  3.56764*10^-5 0.000241601   0.000763051   0.002825    0.0101957  0.028772  ];

figure(5);
plot(BCH_dB__n511_k493_t2, BCH_ON__n511_k493_t2,'X-')
title('n511 k493 t2')
xlabel('dB')
ylabel('Average BER')
set(gca, 'YScale', 'log')
grid on
hold on
plot(BCH_dB__n511_k493_t2, BCH_OFF_n511_k493_t2,'+-')
legend('ON','OFF')


BCH_dB__n1023k_1003_t2 = [];
BCH_ON__n1023_k1003_t2 = [];
BCH_OFF_n1023_k1003_t2 = [];


BCH_dB__n255_k231_t3   = [12.65         13.03          13.65         14.23         14.55         15.31         15.68         16.43       16.64      17.21     ] .* -1;
BCH_ON__n255_k231_t3   = [0             1.42245*10^-11 3.0816*10^-10 3.59786*10^-9 7.69016*10^-8 4.08326*10^-6 7.63415*10^-5 0.000599584 0.00430980 0.0192208 ];
BCH_OFF_n255_k231_t3   = [2.28987*10^-9 1.18018*10^-8  1.18878*10^-7 1.33334*10^-6 1.64140*10^-5 0.000173434   0.000791584   0.002393330 0.00716324 0.0201081 ];

figure(7);
plot(BCH_dB__n255_k231_t3, BCH_ON__n255_k231_t3,'X-')
title('n255 k231 t3')
xlabel('dB')
ylabel('Average BER')
set(gca, 'YScale', 'log')
grid on
hold on
plot(BCH_dB__n255_k231_t3, BCH_OFF_n255_k231_t3,'+-')
legend('ON','OFF')



BCH_dB__n511_k484_t3   = [12.69         13.07          13.68         14.30         14.60         15.30         15.76         16.58       16.69      17.28     ] .* -1;
BCH_ON__n511_k484_t3   = [1.37295*10^-9 3.0297*10^-8   6.24314*10^-7 9.88052*10^-6 9.19932*10^-5 0.000556387   0.00251156    0.00685655  0.0120778  0.0270474 ];
BCH_OFF_n511_k484_t3   = [3.9402*10^-10 8.67188*10^-9  2.17872*10^-7 2.84851*10^-6 2.68353*10^-5 0.000158372   0.000827445   0.0033838   0.00991617 0.0266354 ];

figure(8);
plot(BCH_dB__n511_k484_t3, BCH_ON__n511_k484_t3,'X-')
title('n511 k484 t3')
xlabel('dB')
ylabel('Average BER')
set(gca, 'YScale', 'log')
grid on
hold on
plot(BCH_dB__n511_k484_t3, BCH_OFF_n511_k484_t3,'+-')
legend('ON','OFF')



BCH_dB__n1023_k993_t3  = [];
BCH_ON__n1023_k993_t3  = [];
BCH_OFF_n1023_k993_t3  = [];


figure(10);
subplot(1,2,1)
plot(BCH_dB__n255_k231_t3, BCH_ON__n255_k231_t3,'X-')
title('n255 k231 t3')
xlabel('dB')
ylabel('Average BER')
set(gca, 'YScale', 'log')
grid on
hold on
plot(BCH_dB__n255_k231_t3, BCH_OFF_n255_k231_t3,'+-')
legend('ON','OFF')


subplot(1,2,2)
plot(BCH_dB__n255_k239_t2, BCH_ON__n255_k239_t2,'X-')
title('n255 k239 t2')
xlabel('dB')
ylabel('Average BER')
set(gca, 'YScale', 'log')
grid on
hold on
plot(BCH_dB__n255_k239_t2, BCH_OFF_n255_k239_t2,'+-')
legend('ON','OFF')


figure(11);
subplot(1,2,1)
plot(BCH_dB__n511_k484_t3, BCH_ON__n511_k484_t3,'X-')
title('n511 k484 t3')
xlabel('dB')
ylabel('Average BER')
set(gca, 'YScale', 'log')
grid on
hold on
plot(BCH_dB__n511_k484_t3, BCH_OFF_n511_k484_t3,'+-')
legend('ON','OFF')



subplot(1,2,2)
plot(BCH_dB__n511_k493_t2, BCH_ON__n511_k493_t2,'X-')
title('n511 k493 t2')
xlabel('dB')
ylabel('Average BER')
set(gca, 'YScale', 'log')
grid on
hold on
plot(BCH_dB__n511_k493_t2, BCH_OFF_n511_k493_t2,'+-')
legend('ON','OFF')
