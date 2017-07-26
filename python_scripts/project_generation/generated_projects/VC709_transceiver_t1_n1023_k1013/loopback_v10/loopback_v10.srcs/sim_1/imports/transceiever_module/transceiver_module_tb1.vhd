
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2017 08:05:58 PM
-- Design Name: 
-- Module Name: transceiver_module_tb1 - arch_transceiver_module_tb1
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transceiver_module_tb1 is
generic(
    DATA_WIDTH : integer := 64;
    N_WIDTH    : integer := 1023;
    K_WIDTH    : integer := 1013;
    
    BUF_WIDTH  : integer := 16
);
end transceiver_module_tb1;

architecture arch_transceiver_module_tb1 of transceiver_module_tb1 is


-- Component Declaration for the Unit Under Test (UUT)
    component transceiver_module is
    generic(
        DATA_WIDTH : integer;
        N_WIDTH    : integer;
        K_WIDTH    : integer;
        BUF_WIDTH  : integer
    );
    port(
        -- CLOCKS.
        tx_clk          : in  std_logic;
        rx_clk          : in  std_logic;
        
        -- RESETS.
        reset_in        : in  std_logic;
        
        -- TX PORTS.
        TXVALID         : out std_logic;
        TXSEQ           : out std_logic_vector(6 downto 0);
        TXHEADER        : out std_logic_vector(1 downto 0);
        TXDATA          : out std_logic_vector((DATA_WIDTH-1) downto 0);
        
        -- RX PORTS.
        RXVALID         : in  std_logic;
        RXHEADER        : in  std_logic_vector(1 downto 0);
        RXHEADERVALID   : in  std_logic;
        RXDATA          : in  std_logic_vector((DATA_WIDTH-1) downto 0);
        RXGEARBOXSLIP   : out std_logic;
                
        -- FBERT.
        FBERT_run_rdy   : out std_logic;
        FBERT_BER_out   : out std_logic_vector(31 downto 0);
        
        FBERT_time_interval   : in std_logic_vector(31 downto 0);
        FBERT_state_out       : out std_logic_vector(2 downto 0)
    );
    end component;


    component GTHE2_SIM is
    generic(
        IN_WIDTH : integer -- => DATA_WIDTH
    );
    port(
         user_clk            : in  std_logic;
         reset_in            : in  std_logic;
           
         tx_data             : in  std_logic_vector;
         tx_seq_in           : in  std_logic_vector(6 downto 0);
         tx_header_in        : in  std_logic_vector(1 downto 0);
         tx_valid_in         : in  std_logic;
           
         rx_valid_out        : out std_logic;
         rx_header_out       : out std_logic_vector(1 downto 0);
           
         rx_header_valid_out : out std_logic;
         rx_data             : out std_logic_vector
     );           
    end component;

        -- Inputs
    signal sim_clk       : std_logic;
    signal reset_in_i    : std_logic;
    signal tx_reset_i    : std_logic;
    signal rx_reset_i    : std_logic;


    -- Clock period definitions.
    constant clk_period : time := 100 ns;
    
    
    -- Transceiver Module
    signal fsm_reset_done_i : std_logic;
    
    signal TXVALID_i  : std_logic;
    signal TXSEQ_i    : std_logic_vector(6 downto 0);
    signal TXHEADER_i : std_logic_vector(1 downto 0);
    signal TXDATA_i   : std_logic_vector((DATA_WIDTH-1) downto 0);    

    signal RXGEARBOXSLIP_i : std_logic;    
    
    signal FBERT_run_rdy_i : std_logic;
    signal FBERT_BER_out_i : std_logic_vector(31 downto 0);
    
    signal FBERT_time_interval   : std_logic_vector(31 downto 0);
    signal FBERT_state_out       : std_logic_vector(2 downto 0);
    
    signal pre_FEC_FBERT_run_rdy_i : std_logic;
    signal pre_FEC_FBERT_BER_out_i : std_logic_vector(31 downto 0);
    
    
    -- GTH_SIM
    signal gth_valid_out_i        : std_logic;
    signal gth_header_out_i       : std_logic_vector(1 downto 0);
    signal gth_header_valid_out_i : std_logic;
    signal gth_data_i             : std_logic_vector((DATA_WIDTH-1) downto 0);
    
    
    -- SIMULATION WAVES, JUST NAMES
    type components_type is (DATA_GENERATOR, WORD_EXPANDER, ENCODER, DECODER, WORD_COMPRESSOR, COMPRESSOR_BUFFER, TX_LOGIC, GTH,
                                BER_CALCULATOR, BER_CIRCUIT, FBERT, SCRAMBLER, DESCRAMBLER, RX_BLOCK_SYNC, RX_DATA_SYNC, TRANSCEIVER,
                                TX_SYNCRONIZER, PRE_FEC_BER, PRE_FEC_CALCULATOR, PRE_FEC_COMPRESSOR, PRE_FEC_ENCODER, PRE_FEC_BER_CIRCUIT);
    
    signal tx_DATA_GENERATOR : components_type := DATA_GENERATOR;
    signal tx_WORD_EXPANDER : components_type := WORD_EXPANDER;
    signal tx_ENCODER : components_type := ENCODER;
    signal tx_WORD_COMPRESSOR : components_type := WORD_COMPRESSOR;
    signal tx_TX_LOGIC : components_type := TX_LOGIC;
    signal tx_COMPRESSOR_BUFFER : components_type := COMPRESSOR_BUFFER;
    signal tx_SCRAMBLER : components_type := SCRAMBLER;
    signal tx_DESCRAMBLER : components_type := DESCRAMBLER;
    
    signal gth1 : components_type := GTH;
    signal tx_TRANSCEIVER : components_type := TRANSCEIVER;
    signal tx_TX_SYNCRONIZER : components_type := TX_SYNCRONIZER;
    
    signal rx_RX_BLOCK_SYNC : components_type := RX_BLOCK_SYNC;
    signal rx_RX_DATA_SYNC : components_type := RX_DATA_SYNC;
    signal rx_WORD_EXPANDER : components_type := WORD_EXPANDER;
    signal rx_DECODER : components_type := DECODER;
    signal rx_WORD_COMPRESSOR : components_type := WORD_COMPRESSOR;
    signal rx_BER_CALCULATOR : components_type := BER_CALCULATOR;
    signal rx_BER_CIRCUIT : components_type := BER_CIRCUIT;

    signal rx_FBERT : components_type := FBERT;
    signal rx_pre_FEC_BER : components_type := PRE_FEC_BER;
    signal rx_PRE_FEC_CALC : components_type := PRE_FEC_CALCULATOR;
    signal rx_PRE_FEC_COMP : components_type := PRE_FEC_COMPRESSOR;
    signal rx_PRE_FEC_ENC  : components_type := PRE_FEC_ENCODER;
    signal rx_PRE_BER_CIRCUIT  : components_type := PRE_FEC_BER_CIRCUIT;
    
begin

transceiver_module_0:
component transceiver_module
    generic map(
        DATA_WIDTH => DATA_WIDTH,
        N_WIDTH    => N_WIDTH,
        K_WIDTH    => K_WIDTH,
        BUF_WIDTH  => BUF_WIDTH
    )
    port map(
        -- CLOCKS.
        tx_clk          => sim_clk,
        rx_clk          => sim_clk,
        
        -- RESETS.
        reset_in        => reset_in_i,
                
        -- TX PORTS.
        TXVALID         => TXVALID_i,
        TXSEQ           => TXSEQ_i, 
        TXHEADER        => TXHEADER_i, 
        TXDATA          => TXDATA_i, 
        
        -- RX PORTS.
        RXVALID         => gth_valid_out_i,
        RXHEADER        => gth_header_out_i,
        RXHEADERVALID   => gth_header_valid_out_i,
        RXDATA          => gth_data_i,
        RXGEARBOXSLIP   => RXGEARBOXSLIP_i, 
                
        -- FBERT.
        FBERT_run_rdy   => FBERT_run_rdy_i, 
        FBERT_BER_out   => FBERT_BER_out_i , 
        
        FBERT_time_interval   => FBERT_time_interval,
        FBERT_state_out       => FBERT_state_out
    );


GTH_SIM_0:
component GTHE2_SIM
    generic map(
        IN_WIDTH => DATA_WIDTH
    )
    port map(
        user_clk            => sim_clk,
        reset_in            => reset_in_i,
          
        tx_data             => TXDATA_i,
        tx_seq_in           => TXSEQ_i,
        tx_header_in        => TXHEADER_i,
        tx_valid_in         => TXVALID_i,
          
        rx_valid_out        => gth_valid_out_i,
        rx_header_out       => gth_header_out_i,
          
        rx_header_valid_out => gth_header_valid_out_i,
        rx_data             => gth_data_i
    );
     
     
-- Clock process.
rx_clk_process:
process
begin
    sim_clk <= '1';
    wait for clk_period/2;
    sim_clk <= '0';
    wait for clk_period/2;
end process;


-- Reset stimulus process.
stim_proc:
process
begin

    reset_in_i <= '0';
   

    wait for 1 us;


    reset_in_i   <= '1';
    tx_reset_i   <= '1';
    rx_reset_i   <= '1';


    FBERT_time_interval <= x"0000FFFF";


    wait for 100 ms;
    
    
    assert false report "End of simulation" severity FAILURE;

end process;

end arch_transceiver_module_tb1;
