
----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: 04/11/2017 10:48:05 PM
-- Design Name: 
-- Module Name: transceiver_module - arch_transceiver_module
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
use work.reference_data_package.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transceiver_module is

    generic(
        DATA_WIDTH : integer := 64;
        N_WIDTH    : integer := 255;
        K_WIDTH    : integer := 239;
        BUF_WIDTH  : integer := 16   -- Compressor Buffer.        
    );
    port(
        -- CLOCKS.
        tx_clk          : in  std_logic;
        rx_clk          : in  std_logic;
        
        -- RESETS.
        reset_in        : in  std_logic;
        
        -- TX PORTS.
        TXVALID         : out std_logic; -- Just for connecting it up to the simulation, indicating RXVALID at RX. Debug/simulation only.
        TXSEQ           : out std_logic_vector(6 downto 0);
        TXHEADER        : out std_logic_vector(1 downto 0);
        TXDATA          : out std_logic_vector((DATA_WIDTH-1) downto 0);
        
        -- RX PORTS.
        RXVALID         : in  std_logic;
        RXHEADER        : in  std_logic_vector(1 downto 0);
        RXHEADERVALID   : in  std_logic;
        RXDATA          : in  std_logic_vector((DATA_WIDTH-1) downto 0);
        RXGEARBOXSLIP   : out std_logic;
        RX_REF_CNT      : out std_logic_vector(7 downto 0);
                
        -- FBERT.
        FBERT_run_rdy   : out std_logic;
        FBERT_BER_out   : out std_logic_vector(31 downto 0);
        
        FBERT_time_interval   : in  std_logic_vector(31 downto 0);
        FBERT_state_out       : out std_logic_vector(2 downto 0)
    );

end transceiver_module;

architecture arch_transceiver_module of transceiver_module is

--------------------------------------------------------------------------------

    constant tied_to_ground_i : std_logic := '0';
    constant tied_to_vcc_i    : std_logic := '1';
        
    signal rx_clk_i : std_logic;
    signal tx_clk_i : std_logic;
    
    signal reset_in_i     : std_logic;
    signal not_reset_in_i : std_logic;
    
    
    signal RXDATA_i : std_logic_vector((DATA_WIDTH-1) downto 0);

--------------------------------------------------------------------------------
    component data_generator is
    generic(
        DATA_WIDTH : integer;
        ROM_SIZE   : integer
    );
    port (
        tx_clk   : in  std_logic;       
        reset_in : in  std_logic; 

        enable_in  : in  std_logic;
        enable_out : out std_logic;

        data_out : out std_logic_vector
    );
    end component;

    signal tx_data_gen_enable_out_i : std_logic;
    signal tx_data_gen_data_out_i   : std_logic_vector(DATA_WIDTH-1 downto 0);
--------------------------------------------------------------------------------
    component word_expander_64IN_to_239OUT is
    generic
    (
        IN_WIDTH   : integer;
        OUT_WIDTH  : integer
    );
    port(
        user_clk   : in  std_logic;       
        reset_in   : in  std_logic;
        enable_in  : in  std_logic;
    
        in_rdy     : in  std_logic;
        data_in    : in  std_logic_vector;
    
        buf_out    : out std_logic_vector;
        out_rdy    : out std_logic
    
        );
    end component;
--------------------------------------------------------------------------------
    component word_expander_64IN_to_255OUT is
    generic
    (
        IN_WIDTH   : integer;
        OUT_WIDTH  : integer
    );
    port(
        user_clk   : in  std_logic;       
        reset_in   : in  std_logic;
        enable_in  : in  std_logic;
    
        in_rdy     : in  std_logic;
        data_in    : in  std_logic_vector;
    
        buf_out    : out std_logic_vector;
        out_rdy    : out std_logic
    
        );
    end component;

    signal tx_word_expander_buf_out_i : std_logic_vector(K_WIDTH-1 downto 0);
    signal tx_word_expander_out_rdy_i : std_logic;

    -- Delayed signal to the word compressor for compensation of the encoder's delay.
    signal tx_word_expander_out_rdy_r0 : std_logic;
--------------------------------------------------------------------------------
    component word_compressor_255IN_to_64OUT is
    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;
    
        enable_in      : in  std_logic;
        congestion_out : out std_logic;
    
        data_in        : in  std_logic_vector;
        in_rdy         : in  std_logic;
    
        buf_out        : out std_logic_vector;
        out_rdy        : out std_logic
    
        );
    end component;
--------------------------------------------------------------------------------
    component word_compressor_239IN_to_64OUT is
    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;
    
        enable_in      : in  std_logic;
        congestion_out : out std_logic;
    
        data_in        : in  std_logic_vector;
        in_rdy         : in  std_logic;
    
        buf_out        : out std_logic_vector;
        out_rdy        : out std_logic
    
        );
    end component;
--------------------------------------------------------------------------------
    component synenc_reg is
    port(
        in_data  : in  std_logic_vector;
        out_data : out std_logic_vector;
        clk      : in  std_logic;
        ena      : in  std_logic
    );
    end component;
    
    signal tx_synenc_reg_out_data_i : std_logic_vector(N_WIDTH-1 downto 0);
--------------------------------------------------------------------------------
    component bch_peterson is
    port(
        clk    : in  std_logic;
        enable : in  std_logic;
        x      : in  std_logic_vector;
        E      : out std_logic_vector
    );
    end component;

    signal rx_bch_peterson_E_out : std_logic_vector(K_WIDTH-1 downto 0);
--------------------------------------------------------------------------------
    
    signal tx_word_compressor_congestion_i : std_logic;
    signal tx_word_compressor_enable_in_i  : std_logic;
    signal tx_word_compressor_buf_out_i    : std_logic_vector((DATA_WIDTH-1) downto 0);
    signal tx_word_compressor_out_rdy_i    : std_logic;
    
--------------------------------------------------------------------------------
    component compressor_buffer is
    generic
    (
        IN_WIDTH  : integer;
        BUF_WIDTH : integer
    );
    port
    (
        user_clk      : in  std_logic;       
        reset_in      : in  std_logic;
        enable_in     : in  std_logic;
        tx_sync_rdy   : in  std_logic;
        congestion    : out std_logic;

        data_in       : in  std_logic_vector;
        in_rdy        : in  std_logic;
        
        buf_out       : out std_logic_vector;
        out_rdy       : out std_logic
    );
    end component;

    signal tx_compressor_buffer_enable_in_i  : std_logic;
    signal tx_compressor_buffer_congestion_i : std_logic;
    signal tx_compressor_buffer_buf_out_i    : std_logic_vector((DATA_WIDTH-1) downto 0);
    signal tx_compressor_buffer_out_rdy_i    : std_logic;
    signal tx_compressor_buffer_header_i     : std_logic_vector(1 downto 0);
    signal tx_compressor_buffer_halt_i       : std_logic;
    
    -- Delayed signal to the channel. (SIMULATION).
    --signal tx_compressor_buffer_out_rdy_r    : std_logic;
--------------------------------------------------------------------------------    
    component exdes_TX_logic is
    port
    (
        tx_clk         : in  std_logic;
        reset_in       : in  std_logic;                       
        tx_valid_out   : out std_logic;
        
        txsequence_out : out std_logic_vector(6 downto 0);
        txheader_out   : out std_logic_vector(1 downto 0)
    );
    end component;
    
    signal TX_logic_tx_valid_out_i   : std_logic;
    signal TX_logic_txsequence_out_i : std_logic_vector(6 downto 0);
    signal TX_logic_txheader_out_i   : std_logic_vector(1 downto 0);
--------------------------------------------------------------------------------
    component TX_syncronizer is
    generic(
        IN_WIDTH : integer
    );
    port(
        tx_clk       : in  std_logic;
        reset_in     : in  std_logic;
        enable_in    : in  std_logic;
        
        synq_rdy     : out std_logic;
        synq_rdy_z   : out std_logic;
        tx_mux_sel   : out std_logic;
        
        data_out     : out std_logic_vector;
        out_rdy      : out std_logic
    );
    end component;
    
    signal tx_sync_enable_in_i    : std_logic;
    signal tx_sync_run_synq_seq_i : std_logic;
    signal tx_sync_synq_rdy_i     : std_logic;
    signal tx_sync_synq_rdy_z_i   : std_logic;
    signal tx_mux_sel_i           : std_logic;
    signal tx_sync_data_out_i     : std_logic_vector((DATA_WIDTH-1) downto 0);
    signal tx_sync_out_rdy_i      : std_logic;
--------------------------------------------------------------------------------
    component gtwizard_0_SCRAMBLER_alt is
    generic( 
        TX_DATA_WIDTH       : integer
    );
    port(
        UNSCRAMBLED_DATA_IN : in  std_logic_vector;
        SCRAMBLED_DATA_OUT  : out std_logic_vector;
        DATA_VALID_IN       : in  std_logic;
        USER_CLK            : in  std_logic;      
        SYSTEM_RESET        : in  std_logic;
        ENABLE              : in  std_logic
    );
    end component;
    
    signal tx_scrambler_enable_i        : std_logic;
    signal tx_scrambler_data_valid_in_i : std_logic;
    signal tx_scrambler_data_out        : std_logic_vector((DATA_WIDTH-1) downto 0);
--------------------------------------------------------------------------------
    component gtwizard_0_DESCRAMBLER_alt is
    generic
    ( 
        RX_DATA_WIDTH        : integer
    );
    port
    (
        SCRAMBLED_DATA_IN    : in  std_logic_vector;
        UNSCRAMBLED_DATA_OUT : out std_logic_vector;
        DATA_VALID_IN        : in  std_logic;
        USER_CLK             : in  std_logic;      
        SYSTEM_RESET         : in  std_logic
    );
    end component;
    
    signal rx_data_valid_in_i : std_logic;
    signal rx_descrambler_data_out_i : std_logic_vector((DATA_WIDTH-1) downto 0);
--------------------------------------------------------------------------------
    component gtwizard_0_BLOCK_SYNC_SM_alt is
    generic
    (
        SH_CNT_MAX         :  integer  := 64;
        SH_INVALID_CNT_MAX :  integer  := 16 
    );
    port
    (
           -- User Interface
        BLOCKSYNC_OUT      : out std_logic;
        RXGEARBOXSLIP_OUT  : out std_logic;
        RXHEADER_IN        : in  std_logic_vector(1 downto 0);
        RXHEADERVALID_IN   : in  std_logic;
        
            -- System Interface
        USER_CLK           : in  std_logic;
        SYSTEM_RESET       : in  std_logic
    );  
    end component;
--------------------------------------------------------------------------------
    component RX_syncronizer is
    generic
    (
        IN_WIDTH : integer
    );
    port
    (
        rx_clk        : in  std_logic;
        reset_in      : in  std_logic;
        block_lock    : in  std_logic;
        rx_data_in    : in  std_logic_vector((IN_WIDTH-1) downto 0);        
        
        ref_cnt_out   : out std_logic_vector(7 downto 0);  
        rx_synced_out : out std_logic
    );
    end component;
--------------------------------------------------------------------------------
    component BER_calculator is
    generic
    (
        DATA_WIDTH : integer
    );
    port (
        rx_clk           : in  std_logic;       
        reset_in         : in  std_logic;
        halt_in          : in  std_logic;

        in_rdy           : in  std_logic;
        received_data_in : in  std_logic_vector;
        
        out_rdy          : out std_logic;
        errors_out       : out std_logic_vector(15 downto 0)
    );
    end component;

    signal BER_circuit_out_rdy_i : std_logic;
    signal BER_circuit_errors_i  : std_logic_vector(15 downto 0);
--------------------------------------------------------------------------------
    component FBERT is
    generic
    (
        IN_WIDTH   : integer;
        START_WORD : std_logic_vector
    );
    port (
        rx_clk          : in  std_logic;       
        reset_in        : in  std_logic;
        block_sync_in   : in  std_logic;
    
        time_interval   : in  std_logic_vector(31 downto 0); -- 2**32 = 4294967296
 
        rx_data_in      : in  std_logic_vector;
        rx_in_rdy       : in  std_logic;
               
        BER_data_in     : in  std_logic_vector(15 downto 0);
        BER_in_rdy      : in  std_logic;
        BER_halt_out    : out std_logic;
        
        start_run       : in  std_logic;
        run_rdy         : out std_logic;
        BER_out         : out std_logic_vector(31 downto 0);
        
        state_out       : out std_logic_vector(2 downto 0)
    );
    end component;
    
    
        
    signal FBERT_time_interval_i   : std_logic_vector(31 downto 0);
    signal FBERT_nr_of_intervals_i : std_logic_vector(7 downto 0);
    signal FBERT_BER_halt_out_i    : std_logic;
    signal FBERT_run_rdy_i         : std_logic; 
    signal FBERT_BER_out_i         : std_logic_vector(31 downto 0);
    signal FBERT_state_out_i       : std_logic_vector(2 downto 0);
    
--------------------------------------------------------------------------------

    -- Rx signals.

    -- This signal is supposed to come from GTHE2_CHANNEL
    signal rxdata_valid_i : std_logic;
    
    
    signal rx_descrambler_system_reset_i : std_logic;
    
    -- A delayed signal of former, passed around the descrambler to a Word Expander.
    signal rxdata_valid_r  : std_logic;
    signal rxdata_valid_r2 : std_logic;
    
    
    -- Blocksync
    signal rx_blocksync_out_i : std_logic;
    signal RXHEADER_IN_i      : std_logic_vector(2 downto 0);
    
    -- RX Sync
    signal rx_sync_reset_out_i : std_logic;
    signal rx_sync_reset_in_i  : std_logic;
        
    signal rx_sync_ref_cnt_out_i : std_logic_vector(7 downto 0);  
        
    -- RX Expander.
    signal rx_word_expander_buf_out_i : std_logic_vector(N_WIDTH-1 downto 0);
    signal rx_word_expander_out_rdy_i : std_logic;
    signal rx_word_expander_reset_in_i : std_logic;
    
    -- RX Compressor.
    signal rx_word_compressor_buf_out_i    : std_logic_vector((DATA_WIDTH-1) downto 0);
    signal rx_word_compressor_out_rdy_i    : std_logic;
    signal rx_word_compressor_fucked       : std_logic;
    signal rx_word_compressor_congestion_i : std_logic;
    
    -- Delayed signal to the word expander for compensation of the decoder's delay.
    signal rx_word_expander_out_rdy_r0 : std_logic;
    signal rx_word_expander_out_rdy_r1 : std_logic; 
    signal rx_word_expander_out_rdy_r2 : std_logic;
    
    signal BER_circuit_reset_in_i : std_logic;
    signal FBERT_time_reset_in_i  : std_logic;

--------------------------------------------------------------------------------
    -- Needed signal for the overall transmitting system.
    signal tx_enable_i : std_logic;
    
begin

    -- Clock.
    rx_clk_i <= rx_clk;
    
    reset_in_i     <= reset_in;
    not_reset_in_i <= not reset_in;
    
    tx_clk_i <= tx_clk;
    
    RXDATA_i <= RXDATA;
    
    FBERT_run_rdy <= FBERT_run_rdy_i;
    FBERT_BER_out <= FBERT_BER_out_i;
    FBERT_time_interval_i <= FBERT_time_interval;
    
    --FBERT_nr_of_intervals_i <= FBERT_nr_of_intervals;
    FBERT_nr_of_intervals_i <= (others=>'0');
    FBERT_state_out         <= FBERT_state_out_i;
    

-- Here starts (TX), the transmitting chain of components.    

    -- Enable signal to enable/disable the pipe.
    
        --tx_enable_i <= (not tx_word_compressor_congestion_i) and TX_logic_tx_valid_out_i;
        tx_enable_i <= (not tx_word_compressor_congestion_i) and TX_logic_tx_valid_out_i and (not tx_compressor_buffer_congestion_i);

-- TX DATA GENERATOR.
tx_data_generator:
component data_generator
    generic map(
        DATA_WIDTH => DATA_WIDTH,
        ROM_SIZE => ROM_ROWS
    )
    port map(
        tx_clk     => tx_clk_i,
        reset_in   => reset_in_i,

        enable_in  => tx_enable_i,
        enable_out => tx_data_gen_enable_out_i,
        data_out   => tx_data_gen_data_out_i
    );


-- TX WORD EXPANDER.
tx_word_expander:
component word_expander_64IN_to_239OUT
    generic map(
        IN_WIDTH => DATA_WIDTH, OUT_WIDTH => K_WIDTH
    )
    port map(
        user_clk  => tx_clk_i,
        reset_in  => reset_in_i,
        enable_in => tx_enable_i,
        in_rdy    => tx_data_gen_enable_out_i,
        data_in   => tx_data_gen_data_out_i,
        buf_out   => tx_word_expander_buf_out_i,
        out_rdy   => tx_word_expander_out_rdy_i
    );


-- This process delays the signaling of "data_in_available" to the TX Compressor,
--   so it will sync with the encoder output.
tx_word_expander_out_rdy_delay:
process(tx_clk_i, reset_in_i, tx_word_compressor_congestion_i, TX_logic_tx_valid_out_i, tx_compressor_buffer_congestion_i)
begin
    if reset_in_i = '0' then
        tx_word_expander_out_rdy_r0 <= '0';
    --elsif rising_edge(tx_clk_i) and tx_word_compressor_congestion_i = '0' and TX_logic_tx_valid_out_i = '1' then
    elsif rising_edge(tx_clk_i) and tx_word_compressor_congestion_i = '0' and TX_logic_tx_valid_out_i = '1' and tx_compressor_buffer_congestion_i = '0' then
        if tx_word_expander_out_rdy_i = '1' then
            tx_word_expander_out_rdy_r0 <= '1';
        else
            tx_word_expander_out_rdy_r0 <= '0';
        end if;
    end if;
end process;


--  FEC ENCODER.
tx_synenc_reg:
component synenc_reg
    port map(
        in_data  => tx_word_expander_buf_out_i,
        out_data => tx_synenc_reg_out_data_i,
        clk      => tx_clk_i,
        ena      => tx_enable_i
    );
    

-- TX WORD COMPRESSOR.
tx_word_compressor:
word_compressor_255IN_to_64OUT
    port map(
        user_clk          => tx_clk_i,
        reset_in          => reset_in_i,
        
        enable_in         => tx_word_compressor_enable_in_i,--TX_logic_tx_valid_out_i,
        congestion_out    => tx_word_compressor_congestion_i,

        data_in           => tx_synenc_reg_out_data_i,
        in_rdy            => tx_word_expander_out_rdy_r0,

        buf_out           => tx_word_compressor_buf_out_i,
        out_rdy           => tx_word_compressor_out_rdy_i
    );
    
    --tx_word_compressor_enable_in_i <= TX_logic_tx_valid_out_i;
    tx_word_compressor_enable_in_i <= TX_logic_tx_valid_out_i and not tx_compressor_buffer_congestion_i;
    
    
-- TX BUFFER FOR THE COMPRESSOR.
tx_compressor_buffer:
component compressor_buffer
    generic map(
        IN_WIDTH => DATA_WIDTH, BUF_WIDTH => 16
    )
    port map(
        user_clk      => tx_clk_i,
        reset_in      => reset_in_i,
        enable_in     => tx_compressor_buffer_enable_in_i,
        
        tx_sync_rdy   => tx_sync_synq_rdy_z_i,
        
        congestion    => tx_compressor_buffer_congestion_i,
        data_in       => tx_word_compressor_buf_out_i,
        in_rdy        => tx_word_compressor_out_rdy_i,
        buf_out       => tx_compressor_buffer_buf_out_i,
        out_rdy       => tx_compressor_buffer_out_rdy_i
    );

    tx_compressor_buffer_enable_in_i <= TX_logic_tx_valid_out_i;

-- SCRAMBLER.
tx_scrambler_comp:
component gtwizard_0_SCRAMBLER_alt
    generic map( 
        TX_DATA_WIDTH       => DATA_WIDTH
    )
    port map(
        UNSCRAMBLED_DATA_IN => tx_compressor_buffer_buf_out_i,
        SCRAMBLED_DATA_OUT  => tx_scrambler_data_out,
        DATA_VALID_IN       => tx_scrambler_data_valid_in_i,
        USER_CLK            => tx_clk_i,
        SYSTEM_RESET        => reset_in_i,
        ENABLE              => tx_scrambler_enable_i
    );

    tx_scrambler_data_valid_in_i <= tx_compressor_buffer_out_rdy_i;
    tx_scrambler_enable_i <= TX_logic_tx_valid_out_i;


-- SYNCRONIZER, SENDS RANDOM DATA TO THE RX PLL AND SYNC DATA TO THE RX SYNCRONIZER..
tx_TX_syncronizer:
component TX_syncronizer 
    generic map(
        IN_WIDTH     => DATA_WIDTH
    )
    port map(
        tx_clk       => tx_clk_i,
        reset_in     => reset_in_i,
        enable_in    => tx_sync_enable_in_i,
        
        synq_rdy     => tx_sync_synq_rdy_i,
        synq_rdy_z   => tx_sync_synq_rdy_z_i,
        tx_mux_sel   => tx_mux_sel_i,
        
        data_out     => tx_sync_data_out_i,
        out_rdy      => tx_sync_out_rdy_i
    );
    
    tx_sync_enable_in_i <= TX_logic_tx_valid_out_i;
    
-- TX LOGIC; SEQUENCE COUNTER, PAUSE SIGNAL AND HEADER.
tx_64b66b_logic:
component exdes_TX_logic
    port map(
        tx_clk         => tx_clk_i,
        reset_in       => reset_in_i,
        tx_valid_out   => TX_logic_tx_valid_out_i,
        txsequence_out => TX_logic_txsequence_out_i,
        txheader_out   => TX_logic_txheader_out_i
    );


-- PORTS

    TXVALID  <= TX_logic_tx_valid_out_i;

    TXSEQ    <= TX_logic_txsequence_out_i;
    
    TXHEADER <= TX_logic_txheader_out_i;
    
    --TXDATA   <= tx_scrambler_data_out;
    TXDATA   <= tx_scrambler_data_out when tx_mux_sel_i = '1' else tx_sync_data_out_i;
    --TXDATA   <= tx_compressor_buffer_buf_out_i when tx_mux_sel_i = '1' else tx_sync_data_out_i;
            


-- Here starts (RX), the receiving chain of components.


--  BLOCK SYNCRONIZER
rx_block_sync:
component gtwizard_0_BLOCK_SYNC_SM_alt
    generic map(
        SH_CNT_MAX         => 64,
        SH_INVALID_CNT_MAX => 16 
    )
    port map(
       -- User Interface
        BLOCKSYNC_OUT      => rx_blocksync_out_i,
        RXGEARBOXSLIP_OUT  => RXGEARBOXSLIP,
        --RXHEADER_IN        => RXHEADER_IN_i,
        RXHEADER_IN        => RXHEADER,
        RXHEADERVALID_IN   => RXHEADERVALID,
    
        -- System Interface
        USER_CLK           => rx_clk_i,
        SYSTEM_RESET       => not_reset_in_i
    );
    
    --RXHEADER_IN_i <= std_logic_vector('0' & RXHEADER);
    


--  DATA SYNCRONIZER
rx_RX_syncronizer:
component RX_syncronizer
    generic map(
        IN_WIDTH => DATA_WIDTH
    )
    port map(
        rx_clk        => rx_clk_i,
        reset_in      => reset_in,
        block_lock    => rx_blocksync_out_i,
        
        rx_data_in    => RXDATA_i,
        
        ref_cnt_out   => rx_sync_ref_cnt_out_i,
        rx_synced_out => rx_sync_reset_out_i
        
    );

    RX_REF_CNT <= rx_sync_ref_cnt_out_i;

--DESCRAMBLER
rx_descrambler:
component gtwizard_0_DESCRAMBLER_alt
    generic map( 
        RX_DATA_WIDTH        => DATA_WIDTH
    )
    port map(
        SCRAMBLED_DATA_IN    => RXDATA_i,
        UNSCRAMBLED_DATA_OUT => rx_descrambler_data_out_i,
        DATA_VALID_IN        => rx_data_valid_in_i,
        USER_CLK             => rx_clk_i,
        SYSTEM_RESET         => rx_descrambler_system_reset_i
    );

    rx_data_valid_in_i <= rx_sync_reset_out_i and RXVALID;
    
    --rx_descrambler_system_reset_i <= reset_in;
    rx_descrambler_system_reset_i <= reset_in and rx_blocksync_out_i;
        

    -- We use this to simulate rxvalid, letting the buffer assert it.
    rxdata_valid_i <= rx_sync_reset_out_i and RXVALID;


-- DESCRAMBLER OUTPUT_RDY DELAY        
-- This process delays the signaling of "rx_data_valid_in_i" to components subsequent of the descrambler.
rx_datavalid_delay:
process(rx_clk_i, reset_in)
begin
    if reset_in = '0' then
        rxdata_valid_r <= '0';
        rxdata_valid_r2 <= '0';
    elsif rising_edge(rx_clk_i) then
    
        if rx_data_valid_in_i = '1' then
            rxdata_valid_r <= '1';
        else
            rxdata_valid_r <= '0';
        end if;
        
        rxdata_valid_r2 <= rxdata_valid_r;
        
    end if;
end process;    
    
    
-- This Expander will take the FC input and forward to an FEC decoder.
rx_word_expander:
--component word_expander
component word_expander_64IN_to_255OUT
    generic map(
        IN_WIDTH => DATA_WIDTH, OUT_WIDTH => N_WIDTH
    )
    port map(
        user_clk  => rx_clk_i,
        reset_in  => rx_word_expander_reset_in_i,
        enable_in => tied_to_vcc_i,
        in_rdy    => rxdata_valid_r,
        data_in   => rx_descrambler_data_out_i,
        --data_in   => RXDATA_i,
        buf_out   => rx_word_expander_buf_out_i,
        out_rdy   => rx_word_expander_out_rdy_i
    );
    
    --rx_word_expander_reset_in_i <= reset_in;
    rx_word_expander_reset_in_i <= reset_in and rx_blocksync_out_i;
    
--  DECODER OUTPUT_RDY DELAY
-- This process delays the signaling of "data_in_available" to the RX Compressor.
rx_word_expander_out_rdy_delay:
process(rx_clk_i, reset_in)
begin
    if reset_in = '0' then
        rx_word_expander_out_rdy_r0 <= '0';
        rx_word_expander_out_rdy_r1 <= '0';
        rx_word_expander_out_rdy_r2 <= '0';
    elsif rising_edge(rx_clk_i) then
        if rx_word_expander_out_rdy_i = '1' then
            rx_word_expander_out_rdy_r0 <= '1';
            rx_word_expander_out_rdy_r1 <= rx_word_expander_out_rdy_r0;
            rx_word_expander_out_rdy_r2 <= rx_word_expander_out_rdy_r1;
        else
            rx_word_expander_out_rdy_r0 <= '0';
            rx_word_expander_out_rdy_r1 <= rx_word_expander_out_rdy_r0;
            rx_word_expander_out_rdy_r2 <= rx_word_expander_out_rdy_r1;
        end if;
    end if;
end process;


--  DECODER
rx_bch_peterson:
component bch_peterson
    port map(
        clk    => rx_clk_i,
        enable => rx_word_expander_out_rdy_i,
        x      => rx_word_expander_buf_out_i,
        E      => rx_bch_peterson_E_out
    );


-- COMPRESSOR
rx_word_compressor:
word_compressor_239IN_to_64OUT
    port map(
        user_clk       => rx_clk_i,
        reset_in       => rx_word_expander_reset_in_i,
        
        enable_in      => tied_to_vcc_i,
        congestion_out => rx_word_compressor_congestion_i,

        data_in        => rx_bch_peterson_E_out,
        in_rdy         => rx_word_expander_out_rdy_r2,

        buf_out        => rx_word_compressor_buf_out_i,
        out_rdy        => rx_word_compressor_out_rdy_i
    );

    --rx_word_expander_reset_in_i <= reset_in;
    rx_word_expander_reset_in_i <= reset_in and rx_blocksync_out_i;



rx_BER_calculator:
component BER_calculator
    generic map(
        DATA_WIDTH => DATA_WIDTH
    )
    port map(
        rx_clk           => rx_clk_i,
        reset_in         => BER_circuit_reset_in_i,
        
        halt_in          => FBERT_BER_halt_out_i,
        --enable_in        => rxdata_valid_r2,
    
        in_rdy           => rx_word_compressor_out_rdy_i,
        received_data_in => rx_word_compressor_buf_out_i,
        
        out_rdy          => BER_circuit_out_rdy_i,
        errors_out       => BER_circuit_errors_i
    );
    
    BER_circuit_reset_in_i <= reset_in;
    --BER_circuit_reset_in_i <= reset_in and rx_blocksync_out_i;
    
rx_FBERT:
component FBERT
    generic map(
        IN_WIDTH   => DATA_WIDTH,
        --START_WORD => x"00000000000000fb"
        START_WORD => x"00000000000000fb"
    )
    port map(
        rx_clk          => rx_clk_i,
        reset_in        => FBERT_time_reset_in_i,
        block_sync_in   => tied_to_vcc_i,
        
        time_interval   => FBERT_time_interval_i,
        
        rx_data_in      => rx_word_compressor_buf_out_i,
        rx_in_rdy       => rx_word_compressor_out_rdy_i,
        
        BER_data_in     => BER_circuit_errors_i,
        BER_in_rdy      => BER_circuit_out_rdy_i,
        
        BER_halt_out    => FBERT_BER_halt_out_i,
        start_run       => '1',
        
        run_rdy         => FBERT_run_rdy_i,
        BER_out         => FBERT_BER_out_i,
        
        state_out       => FBERT_state_out_i
    );
    
    --FBERT_time_reset_in_i <= reset_in;
    FBERT_time_reset_in_i <= reset_in and rx_blocksync_out_i;

end arch_transceiver_module;