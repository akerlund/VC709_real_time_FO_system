-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
-- Date        : Tue May  9 09:26:02 2017
-- Host        : freakuency-N550JK running 64-bit Ubuntu 14.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/freakuency/Vivado/April/VC709_transceiver_k113_n127_t2/gtwizard_0_example/gtwizard_0_example.runs/gtwizard_0_synth_1/gtwizard_0_stub.vhdl
-- Design      : gtwizard_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gtwizard_0 is
  Port ( 
    SYSCLK_IN : in STD_LOGIC;
    SOFT_RESET_TX_IN : in STD_LOGIC;
    SOFT_RESET_RX_IN : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    GT0_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT0_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT0_DATA_VALID_IN : in STD_LOGIC;
    GT0_TX_MMCM_LOCK_IN : in STD_LOGIC;
    GT0_TX_MMCM_RESET_OUT : out STD_LOGIC;
    GT0_RX_MMCM_LOCK_IN : in STD_LOGIC;
    GT0_RX_MMCM_RESET_OUT : out STD_LOGIC;
    GT1_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT1_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT1_DATA_VALID_IN : in STD_LOGIC;
    GT1_TX_MMCM_LOCK_IN : in STD_LOGIC;
    GT1_TX_MMCM_RESET_OUT : out STD_LOGIC;
    GT1_RX_MMCM_LOCK_IN : in STD_LOGIC;
    GT1_RX_MMCM_RESET_OUT : out STD_LOGIC;
    GT2_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT2_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT2_DATA_VALID_IN : in STD_LOGIC;
    GT2_TX_MMCM_LOCK_IN : in STD_LOGIC;
    GT2_TX_MMCM_RESET_OUT : out STD_LOGIC;
    GT2_RX_MMCM_LOCK_IN : in STD_LOGIC;
    GT2_RX_MMCM_RESET_OUT : out STD_LOGIC;
    GT3_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT3_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT3_DATA_VALID_IN : in STD_LOGIC;
    GT3_TX_MMCM_LOCK_IN : in STD_LOGIC;
    GT3_TX_MMCM_RESET_OUT : out STD_LOGIC;
    GT3_RX_MMCM_LOCK_IN : in STD_LOGIC;
    GT3_RX_MMCM_RESET_OUT : out STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpclk_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drprdy_out : out STD_LOGIC;
    gt0_drpwe_in : in STD_LOGIC;
    gt0_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_rxuserrdy_in : in STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_rxcdrhold_in : in STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 63 downto 0 );
    gt0_rxprbserr_out : out STD_LOGIC;
    gt0_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxprbscntreset_in : in STD_LOGIC;
    gt0_gthrxn_in : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxdfelpmreset_in : in STD_LOGIC;
    gt0_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxratedone_out : out STD_LOGIC;
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_rxoutclkfabric_out : out STD_LOGIC;
    gt0_rxdatavalid_out : out STD_LOGIC;
    gt0_rxheader_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxheadervalid_out : out STD_LOGIC;
    gt0_rxgearboxslip_in : in STD_LOGIC;
    gt0_gtrxreset_in : in STD_LOGIC;
    gt0_rxpcsreset_in : in STD_LOGIC;
    gt0_rxpmareset_in : in STD_LOGIC;
    gt0_rxlpmen_in : in STD_LOGIC;
    gt0_rxpolarity_in : in STD_LOGIC;
    gt0_gthrxp_in : in STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt0_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt0_gttxreset_in : in STD_LOGIC;
    gt0_txuserrdy_in : in STD_LOGIC;
    gt0_txheader_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_txusrclk_in : in STD_LOGIC;
    gt0_txusrclk2_in : in STD_LOGIC;
    gt0_txprbsforceerr_in : in STD_LOGIC;
    gt0_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt0_txinhibit_in : in STD_LOGIC;
    gt0_txmaincursor_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_txdata_in : in STD_LOGIC_VECTOR ( 63 downto 0 );
    gt0_gthtxn_out : out STD_LOGIC;
    gt0_gthtxp_out : out STD_LOGIC;
    gt0_txoutclk_out : out STD_LOGIC;
    gt0_txoutclkfabric_out : out STD_LOGIC;
    gt0_txoutclkpcs_out : out STD_LOGIC;
    gt0_txsequence_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_txpcsreset_in : in STD_LOGIC;
    gt0_txpmareset_in : in STD_LOGIC;
    gt0_txresetdone_out : out STD_LOGIC;
    gt0_txpolarity_in : in STD_LOGIC;
    gt0_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt1_drpclk_in : in STD_LOGIC;
    gt1_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpen_in : in STD_LOGIC;
    gt1_drprdy_out : out STD_LOGIC;
    gt1_drpwe_in : in STD_LOGIC;
    gt1_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_eyescanreset_in : in STD_LOGIC;
    gt1_rxuserrdy_in : in STD_LOGIC;
    gt1_eyescandataerror_out : out STD_LOGIC;
    gt1_eyescantrigger_in : in STD_LOGIC;
    gt1_rxcdrhold_in : in STD_LOGIC;
    gt1_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt1_rxusrclk_in : in STD_LOGIC;
    gt1_rxusrclk2_in : in STD_LOGIC;
    gt1_rxdata_out : out STD_LOGIC_VECTOR ( 63 downto 0 );
    gt1_rxprbserr_out : out STD_LOGIC;
    gt1_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_rxprbscntreset_in : in STD_LOGIC;
    gt1_gthrxn_in : in STD_LOGIC;
    gt1_rxbufreset_in : in STD_LOGIC;
    gt1_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_rxdfelpmreset_in : in STD_LOGIC;
    gt1_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt1_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxratedone_out : out STD_LOGIC;
    gt1_rxoutclk_out : out STD_LOGIC;
    gt1_rxoutclkfabric_out : out STD_LOGIC;
    gt1_rxdatavalid_out : out STD_LOGIC;
    gt1_rxheader_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxheadervalid_out : out STD_LOGIC;
    gt1_rxgearboxslip_in : in STD_LOGIC;
    gt1_gtrxreset_in : in STD_LOGIC;
    gt1_rxpcsreset_in : in STD_LOGIC;
    gt1_rxpmareset_in : in STD_LOGIC;
    gt1_rxlpmen_in : in STD_LOGIC;
    gt1_rxpolarity_in : in STD_LOGIC;
    gt1_gthrxp_in : in STD_LOGIC;
    gt1_rxresetdone_out : out STD_LOGIC;
    gt1_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt1_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt1_gttxreset_in : in STD_LOGIC;
    gt1_txuserrdy_in : in STD_LOGIC;
    gt1_txheader_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_txusrclk_in : in STD_LOGIC;
    gt1_txusrclk2_in : in STD_LOGIC;
    gt1_txprbsforceerr_in : in STD_LOGIC;
    gt1_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt1_txinhibit_in : in STD_LOGIC;
    gt1_txmaincursor_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gt1_txdata_in : in STD_LOGIC_VECTOR ( 63 downto 0 );
    gt1_gthtxn_out : out STD_LOGIC;
    gt1_gthtxp_out : out STD_LOGIC;
    gt1_txoutclk_out : out STD_LOGIC;
    gt1_txoutclkfabric_out : out STD_LOGIC;
    gt1_txoutclkpcs_out : out STD_LOGIC;
    gt1_txsequence_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gt1_txpcsreset_in : in STD_LOGIC;
    gt1_txpmareset_in : in STD_LOGIC;
    gt1_txresetdone_out : out STD_LOGIC;
    gt1_txpolarity_in : in STD_LOGIC;
    gt1_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt2_drpclk_in : in STD_LOGIC;
    gt2_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpen_in : in STD_LOGIC;
    gt2_drprdy_out : out STD_LOGIC;
    gt2_drpwe_in : in STD_LOGIC;
    gt2_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_eyescanreset_in : in STD_LOGIC;
    gt2_rxuserrdy_in : in STD_LOGIC;
    gt2_eyescandataerror_out : out STD_LOGIC;
    gt2_eyescantrigger_in : in STD_LOGIC;
    gt2_rxcdrhold_in : in STD_LOGIC;
    gt2_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt2_rxusrclk_in : in STD_LOGIC;
    gt2_rxusrclk2_in : in STD_LOGIC;
    gt2_rxdata_out : out STD_LOGIC_VECTOR ( 63 downto 0 );
    gt2_rxprbserr_out : out STD_LOGIC;
    gt2_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_rxprbscntreset_in : in STD_LOGIC;
    gt2_gthrxn_in : in STD_LOGIC;
    gt2_rxbufreset_in : in STD_LOGIC;
    gt2_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_rxdfelpmreset_in : in STD_LOGIC;
    gt2_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt2_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxratedone_out : out STD_LOGIC;
    gt2_rxoutclk_out : out STD_LOGIC;
    gt2_rxoutclkfabric_out : out STD_LOGIC;
    gt2_rxdatavalid_out : out STD_LOGIC;
    gt2_rxheader_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxheadervalid_out : out STD_LOGIC;
    gt2_rxgearboxslip_in : in STD_LOGIC;
    gt2_gtrxreset_in : in STD_LOGIC;
    gt2_rxpcsreset_in : in STD_LOGIC;
    gt2_rxpmareset_in : in STD_LOGIC;
    gt2_rxlpmen_in : in STD_LOGIC;
    gt2_rxpolarity_in : in STD_LOGIC;
    gt2_gthrxp_in : in STD_LOGIC;
    gt2_rxresetdone_out : out STD_LOGIC;
    gt2_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt2_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt2_gttxreset_in : in STD_LOGIC;
    gt2_txuserrdy_in : in STD_LOGIC;
    gt2_txheader_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_txusrclk_in : in STD_LOGIC;
    gt2_txusrclk2_in : in STD_LOGIC;
    gt2_txprbsforceerr_in : in STD_LOGIC;
    gt2_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt2_txinhibit_in : in STD_LOGIC;
    gt2_txmaincursor_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gt2_txdata_in : in STD_LOGIC_VECTOR ( 63 downto 0 );
    gt2_gthtxn_out : out STD_LOGIC;
    gt2_gthtxp_out : out STD_LOGIC;
    gt2_txoutclk_out : out STD_LOGIC;
    gt2_txoutclkfabric_out : out STD_LOGIC;
    gt2_txoutclkpcs_out : out STD_LOGIC;
    gt2_txsequence_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gt2_txpcsreset_in : in STD_LOGIC;
    gt2_txpmareset_in : in STD_LOGIC;
    gt2_txresetdone_out : out STD_LOGIC;
    gt2_txpolarity_in : in STD_LOGIC;
    gt2_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt3_drpclk_in : in STD_LOGIC;
    gt3_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpen_in : in STD_LOGIC;
    gt3_drprdy_out : out STD_LOGIC;
    gt3_drpwe_in : in STD_LOGIC;
    gt3_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_eyescanreset_in : in STD_LOGIC;
    gt3_rxuserrdy_in : in STD_LOGIC;
    gt3_eyescandataerror_out : out STD_LOGIC;
    gt3_eyescantrigger_in : in STD_LOGIC;
    gt3_rxcdrhold_in : in STD_LOGIC;
    gt3_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt3_rxusrclk_in : in STD_LOGIC;
    gt3_rxusrclk2_in : in STD_LOGIC;
    gt3_rxdata_out : out STD_LOGIC_VECTOR ( 63 downto 0 );
    gt3_rxprbserr_out : out STD_LOGIC;
    gt3_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_rxprbscntreset_in : in STD_LOGIC;
    gt3_gthrxn_in : in STD_LOGIC;
    gt3_rxbufreset_in : in STD_LOGIC;
    gt3_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_rxdfelpmreset_in : in STD_LOGIC;
    gt3_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt3_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxratedone_out : out STD_LOGIC;
    gt3_rxoutclk_out : out STD_LOGIC;
    gt3_rxoutclkfabric_out : out STD_LOGIC;
    gt3_rxdatavalid_out : out STD_LOGIC;
    gt3_rxheader_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxheadervalid_out : out STD_LOGIC;
    gt3_rxgearboxslip_in : in STD_LOGIC;
    gt3_gtrxreset_in : in STD_LOGIC;
    gt3_rxpcsreset_in : in STD_LOGIC;
    gt3_rxpmareset_in : in STD_LOGIC;
    gt3_rxlpmen_in : in STD_LOGIC;
    gt3_rxpolarity_in : in STD_LOGIC;
    gt3_gthrxp_in : in STD_LOGIC;
    gt3_rxresetdone_out : out STD_LOGIC;
    gt3_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt3_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt3_gttxreset_in : in STD_LOGIC;
    gt3_txuserrdy_in : in STD_LOGIC;
    gt3_txheader_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_txusrclk_in : in STD_LOGIC;
    gt3_txusrclk2_in : in STD_LOGIC;
    gt3_txprbsforceerr_in : in STD_LOGIC;
    gt3_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt3_txinhibit_in : in STD_LOGIC;
    gt3_txmaincursor_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gt3_txdata_in : in STD_LOGIC_VECTOR ( 63 downto 0 );
    gt3_gthtxn_out : out STD_LOGIC;
    gt3_gthtxp_out : out STD_LOGIC;
    gt3_txoutclk_out : out STD_LOGIC;
    gt3_txoutclkfabric_out : out STD_LOGIC;
    gt3_txoutclkpcs_out : out STD_LOGIC;
    gt3_txsequence_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gt3_txpcsreset_in : in STD_LOGIC;
    gt3_txpmareset_in : in STD_LOGIC;
    gt3_txresetdone_out : out STD_LOGIC;
    gt3_txpolarity_in : in STD_LOGIC;
    gt3_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    GT0_QPLLLOCK_IN : in STD_LOGIC;
    GT0_QPLLREFCLKLOST_IN : in STD_LOGIC;
    GT0_QPLLRESET_OUT : out STD_LOGIC;
    GT0_QPLLOUTCLK_IN : in STD_LOGIC;
    GT0_QPLLOUTREFCLK_IN : in STD_LOGIC
  );

end gtwizard_0;

architecture stub of gtwizard_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SYSCLK_IN,SOFT_RESET_TX_IN,SOFT_RESET_RX_IN,DONT_RESET_ON_DATA_ERROR_IN,GT0_TX_FSM_RESET_DONE_OUT,GT0_RX_FSM_RESET_DONE_OUT,GT0_DATA_VALID_IN,GT0_TX_MMCM_LOCK_IN,GT0_TX_MMCM_RESET_OUT,GT0_RX_MMCM_LOCK_IN,GT0_RX_MMCM_RESET_OUT,GT1_TX_FSM_RESET_DONE_OUT,GT1_RX_FSM_RESET_DONE_OUT,GT1_DATA_VALID_IN,GT1_TX_MMCM_LOCK_IN,GT1_TX_MMCM_RESET_OUT,GT1_RX_MMCM_LOCK_IN,GT1_RX_MMCM_RESET_OUT,GT2_TX_FSM_RESET_DONE_OUT,GT2_RX_FSM_RESET_DONE_OUT,GT2_DATA_VALID_IN,GT2_TX_MMCM_LOCK_IN,GT2_TX_MMCM_RESET_OUT,GT2_RX_MMCM_LOCK_IN,GT2_RX_MMCM_RESET_OUT,GT3_TX_FSM_RESET_DONE_OUT,GT3_RX_FSM_RESET_DONE_OUT,GT3_DATA_VALID_IN,GT3_TX_MMCM_LOCK_IN,GT3_TX_MMCM_RESET_OUT,GT3_RX_MMCM_LOCK_IN,GT3_RX_MMCM_RESET_OUT,gt0_drpaddr_in[8:0],gt0_drpclk_in,gt0_drpdi_in[15:0],gt0_drpdo_out[15:0],gt0_drpen_in,gt0_drprdy_out,gt0_drpwe_in,gt0_loopback_in[2:0],gt0_rxrate_in[2:0],gt0_eyescanreset_in,gt0_rxuserrdy_in,gt0_eyescandataerror_out,gt0_eyescantrigger_in,gt0_rxcdrhold_in,gt0_dmonitorout_out[14:0],gt0_rxusrclk_in,gt0_rxusrclk2_in,gt0_rxdata_out[63:0],gt0_rxprbserr_out,gt0_rxprbssel_in[2:0],gt0_rxprbscntreset_in,gt0_gthrxn_in,gt0_rxbufreset_in,gt0_rxbufstatus_out[2:0],gt0_rxdfelpmreset_in,gt0_rxmonitorout_out[6:0],gt0_rxmonitorsel_in[1:0],gt0_rxratedone_out,gt0_rxoutclk_out,gt0_rxoutclkfabric_out,gt0_rxdatavalid_out,gt0_rxheader_out[1:0],gt0_rxheadervalid_out,gt0_rxgearboxslip_in,gt0_gtrxreset_in,gt0_rxpcsreset_in,gt0_rxpmareset_in,gt0_rxlpmen_in,gt0_rxpolarity_in,gt0_gthrxp_in,gt0_rxresetdone_out,gt0_txpostcursor_in[4:0],gt0_txprecursor_in[4:0],gt0_gttxreset_in,gt0_txuserrdy_in,gt0_txheader_in[1:0],gt0_txusrclk_in,gt0_txusrclk2_in,gt0_txprbsforceerr_in,gt0_txbufstatus_out[1:0],gt0_txdiffctrl_in[3:0],gt0_txinhibit_in,gt0_txmaincursor_in[6:0],gt0_txdata_in[63:0],gt0_gthtxn_out,gt0_gthtxp_out,gt0_txoutclk_out,gt0_txoutclkfabric_out,gt0_txoutclkpcs_out,gt0_txsequence_in[6:0],gt0_txpcsreset_in,gt0_txpmareset_in,gt0_txresetdone_out,gt0_txpolarity_in,gt0_txprbssel_in[2:0],gt1_drpaddr_in[8:0],gt1_drpclk_in,gt1_drpdi_in[15:0],gt1_drpdo_out[15:0],gt1_drpen_in,gt1_drprdy_out,gt1_drpwe_in,gt1_loopback_in[2:0],gt1_rxrate_in[2:0],gt1_eyescanreset_in,gt1_rxuserrdy_in,gt1_eyescandataerror_out,gt1_eyescantrigger_in,gt1_rxcdrhold_in,gt1_dmonitorout_out[14:0],gt1_rxusrclk_in,gt1_rxusrclk2_in,gt1_rxdata_out[63:0],gt1_rxprbserr_out,gt1_rxprbssel_in[2:0],gt1_rxprbscntreset_in,gt1_gthrxn_in,gt1_rxbufreset_in,gt1_rxbufstatus_out[2:0],gt1_rxdfelpmreset_in,gt1_rxmonitorout_out[6:0],gt1_rxmonitorsel_in[1:0],gt1_rxratedone_out,gt1_rxoutclk_out,gt1_rxoutclkfabric_out,gt1_rxdatavalid_out,gt1_rxheader_out[1:0],gt1_rxheadervalid_out,gt1_rxgearboxslip_in,gt1_gtrxreset_in,gt1_rxpcsreset_in,gt1_rxpmareset_in,gt1_rxlpmen_in,gt1_rxpolarity_in,gt1_gthrxp_in,gt1_rxresetdone_out,gt1_txpostcursor_in[4:0],gt1_txprecursor_in[4:0],gt1_gttxreset_in,gt1_txuserrdy_in,gt1_txheader_in[1:0],gt1_txusrclk_in,gt1_txusrclk2_in,gt1_txprbsforceerr_in,gt1_txbufstatus_out[1:0],gt1_txdiffctrl_in[3:0],gt1_txinhibit_in,gt1_txmaincursor_in[6:0],gt1_txdata_in[63:0],gt1_gthtxn_out,gt1_gthtxp_out,gt1_txoutclk_out,gt1_txoutclkfabric_out,gt1_txoutclkpcs_out,gt1_txsequence_in[6:0],gt1_txpcsreset_in,gt1_txpmareset_in,gt1_txresetdone_out,gt1_txpolarity_in,gt1_txprbssel_in[2:0],gt2_drpaddr_in[8:0],gt2_drpclk_in,gt2_drpdi_in[15:0],gt2_drpdo_out[15:0],gt2_drpen_in,gt2_drprdy_out,gt2_drpwe_in,gt2_loopback_in[2:0],gt2_rxrate_in[2:0],gt2_eyescanreset_in,gt2_rxuserrdy_in,gt2_eyescandataerror_out,gt2_eyescantrigger_in,gt2_rxcdrhold_in,gt2_dmonitorout_out[14:0],gt2_rxusrclk_in,gt2_rxusrclk2_in,gt2_rxdata_out[63:0],gt2_rxprbserr_out,gt2_rxprbssel_in[2:0],gt2_rxprbscntreset_in,gt2_gthrxn_in,gt2_rxbufreset_in,gt2_rxbufstatus_out[2:0],gt2_rxdfelpmreset_in,gt2_rxmonitorout_out[6:0],gt2_rxmonitorsel_in[1:0],gt2_rxratedone_out,gt2_rxoutclk_out,gt2_rxoutclkfabric_out,gt2_rxdatavalid_out,gt2_rxheader_out[1:0],gt2_rxheadervalid_out,gt2_rxgearboxslip_in,gt2_gtrxreset_in,gt2_rxpcsreset_in,gt2_rxpmareset_in,gt2_rxlpmen_in,gt2_rxpolarity_in,gt2_gthrxp_in,gt2_rxresetdone_out,gt2_txpostcursor_in[4:0],gt2_txprecursor_in[4:0],gt2_gttxreset_in,gt2_txuserrdy_in,gt2_txheader_in[1:0],gt2_txusrclk_in,gt2_txusrclk2_in,gt2_txprbsforceerr_in,gt2_txbufstatus_out[1:0],gt2_txdiffctrl_in[3:0],gt2_txinhibit_in,gt2_txmaincursor_in[6:0],gt2_txdata_in[63:0],gt2_gthtxn_out,gt2_gthtxp_out,gt2_txoutclk_out,gt2_txoutclkfabric_out,gt2_txoutclkpcs_out,gt2_txsequence_in[6:0],gt2_txpcsreset_in,gt2_txpmareset_in,gt2_txresetdone_out,gt2_txpolarity_in,gt2_txprbssel_in[2:0],gt3_drpaddr_in[8:0],gt3_drpclk_in,gt3_drpdi_in[15:0],gt3_drpdo_out[15:0],gt3_drpen_in,gt3_drprdy_out,gt3_drpwe_in,gt3_loopback_in[2:0],gt3_rxrate_in[2:0],gt3_eyescanreset_in,gt3_rxuserrdy_in,gt3_eyescandataerror_out,gt3_eyescantrigger_in,gt3_rxcdrhold_in,gt3_dmonitorout_out[14:0],gt3_rxusrclk_in,gt3_rxusrclk2_in,gt3_rxdata_out[63:0],gt3_rxprbserr_out,gt3_rxprbssel_in[2:0],gt3_rxprbscntreset_in,gt3_gthrxn_in,gt3_rxbufreset_in,gt3_rxbufstatus_out[2:0],gt3_rxdfelpmreset_in,gt3_rxmonitorout_out[6:0],gt3_rxmonitorsel_in[1:0],gt3_rxratedone_out,gt3_rxoutclk_out,gt3_rxoutclkfabric_out,gt3_rxdatavalid_out,gt3_rxheader_out[1:0],gt3_rxheadervalid_out,gt3_rxgearboxslip_in,gt3_gtrxreset_in,gt3_rxpcsreset_in,gt3_rxpmareset_in,gt3_rxlpmen_in,gt3_rxpolarity_in,gt3_gthrxp_in,gt3_rxresetdone_out,gt3_txpostcursor_in[4:0],gt3_txprecursor_in[4:0],gt3_gttxreset_in,gt3_txuserrdy_in,gt3_txheader_in[1:0],gt3_txusrclk_in,gt3_txusrclk2_in,gt3_txprbsforceerr_in,gt3_txbufstatus_out[1:0],gt3_txdiffctrl_in[3:0],gt3_txinhibit_in,gt3_txmaincursor_in[6:0],gt3_txdata_in[63:0],gt3_gthtxn_out,gt3_gthtxp_out,gt3_txoutclk_out,gt3_txoutclkfabric_out,gt3_txoutclkpcs_out,gt3_txsequence_in[6:0],gt3_txpcsreset_in,gt3_txpmareset_in,gt3_txresetdone_out,gt3_txpolarity_in,gt3_txprbssel_in[2:0],GT0_QPLLLOCK_IN,GT0_QPLLREFCLKLOST_IN,GT0_QPLLRESET_OUT,GT0_QPLLOUTCLK_IN,GT0_QPLLOUTREFCLK_IN";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "gtwizard_0,gtwizard_v3_6_6,{protocol_file=10GBASE-R}";
begin
end;
