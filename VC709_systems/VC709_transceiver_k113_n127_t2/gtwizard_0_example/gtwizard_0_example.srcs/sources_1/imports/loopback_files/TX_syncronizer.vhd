----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik �kerlund
-- 
-- Create Date: 04/11/2017 10:48:05 PM
-- Design Name: 
-- Module Name: TX_syncronizer - arch_TX_syncronizer
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
--use work.reference_data_package.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TX_syncronizer is
    generic(
        IN_WIDTH : integer := 64
    );
    port(
        tx_clk       : in  std_logic;
        reset_in     : in  std_logic;
        enable_in    : in  std_logic;
        
        --run_synq_seq : in  std_logic;
        synq_rdy_z   : out std_logic;
        synq_rdy     : out std_logic;
        tx_mux_sel   : out std_logic;
        
        data_out     : out std_logic_vector((IN_WIDTH-1) downto 0);
        out_rdy      : out std_logic
    );
end TX_syncronizer;

architecture arch_TX_syncronizer of TX_syncronizer is

    constant NR_OF_SYNC_WORDS : integer := 8;

    type sync_states is (STARTUP_SYNC, SENDING_SYNC_DATA, SYNCRONIZED);--, BULLSHIT1, BULLSHIT2, BULLSHIT3, BULLSHIT4, BULLSHIT5);
    signal SYNC_STATE : sync_states;
    
    --constant data_out_cnt_MAX : integer := 15;
    constant sync_cnt_MAX    : integer := 127;
    constant nr_loops_MAX     : integer := 255;
    
    --signal data_out_cnt : integer range 0 to data_out_cnt_MAX;
    signal loop_cnt     : integer range 0 to nr_loops_MAX;
    signal sync_cnt     : integer range 0 to sync_cnt_MAX;
    
    
    signal synq_rdy_r   : std_logic;
    signal tx_mux_sel_r : std_logic;
    
    signal data_out_r   : std_logic_vector((IN_WIDTH-1) downto 0);
    signal out_rdy_r    : std_logic;
    
	type sync_vector_type is array (0 to 127) of std_logic_vector(63 downto 0);
    constant sync_vector_64 : sync_vector_type := (
        "0011101110101101100011100010010110010101011011100111000100111011",
        "0011100101110100010001000111001110100010110001110101110011010010",
        "0100010101001000101000110100100110011101011101110001110001110001",
        "1100010010001010010001110111011000110001101011101010001110111000",
        "0101110001001010001110010011010100010001100110010110010111011000",
        "1100101100111011100010001010011100010111011010001101110001101110",
        "0100010110101100111011000101101100110001110101001001000100100100",
        "0110110100110010111011101000101100100110101110101001011000110111",
        "0011100100010111011000100010101000101001100110111001010110100100",
        "1011101000110010011000100011100010100100011101011100111010110110",
        "1100110100011000111011001110111010100011001001001001110110001010",
        "1101110011000111011100100100010001101001001110111001110110100010",
        "0011100110001100110010011000101010001001011101011010101110001000",
        "0011100011100011101101011000111001110010110001100101010111010011",
        "1101000110010001110101010110111011011101110110001011100010100011",
        "0010100011101100011101110001001010011101100010001100010100010111",
        "0011010011100110010101001001000111011101001010111000101100011011",
        "0111011101100010001101000101110100100110110001110001010001100010",
        "1010011101011010101010001100101110001110100010001010001000100011",
        "1010001100010010001001010110110100010110010100111000110010100010",
        "0111000111011001110001001101001101100100101100101000110110111001",
        "1011011100011001001001001000111001101011000100100011010110101110",
        "1101010110100011011100010001000110111011100101000111011100010001",
        "1011100011101001101110001100011101000110011010101110101000111011",
        "0100111011100110111000100111000111011101101100010100100011101011",
        "1100111011001101110100110101110101101101001001100110010111011101",
        "1010011100011000100010001110011101110001110111000110011001110110",
        "0111010010101100011010001100011000111010110001100100100011000100",
        "0100101110100011101011001100011000110010001110111010111001101110",
        "0111010001110001001101010101101000101110111010001001010111011000",
        "0110010010010010111000111001011001000110110001010101101011011000",
        "0010101001110110001001001100010110010010110110111000100100100111",
        "1100010011010111000110100011011101101001110101110011011001000110",
        "0110100100111001110100111000100010011101000111001010100101011101",
        "0011001100011100011000110001110001110110111011010101000100110100",
        "0100011000100011011100100100010100100101110100100011101110110101",
        "1001000110001010111001110110111000110010110110101011100011100100",
        "0111000111000100010110001001110010001011000110001001110110001110",
        "1011101001110001110011100011000101011000101000100010001100100101",
        "1100010101101110111000101110110111011100011101001001011011100010",
        "1000111000100101011001110001110001000110010110110001110101101101",
        "0101010111011000110010110110001000110010001000100100011001000101",
        "0111001000110010100101011101110111000110001100101110001001011101",
        "0111010011011001110100010111001010010011101001010110111000111011",
        "0111011011000101011001110101101000100101100011100111011100010011",
        "0010101001000111011010011101110010001011011101101100010001110110",
        "0101110111001101101100010110100111000111010101001110011100011101",
        "1101010100011101011011000100010011100100011100110010111001011101",
        "1100111000100110001000100010101010111011101000110100110010011101",
        "1100110011101101011100011100101010111011011011010100111011101000",
        "0101000110001101011000110111001011101000111000111000100010110110",
        "1000110001000100110011100010100010011100011101010101101010011100",
        "1010110110001000110001110001100011101100011100101000101110100100",
        "0110110101000101011101101010100111010100101110111001101000100011",
        "0101000101110001010001110010110110100100101010101101101101110100",
        "1100101001001000110011000100010001110001001010100100100111000101",
        "1100010010001011100011000111011101001001110010001101011000111001",
        "1101110111001110101001110011101110101110001001010101010100011000",
        "0110100011001100101110110100110010111011011101011101101000100010",
        "1101000101110010001100010100100111011101001110011100111000110010",
        "0101000110100011010101100110001100101110101000110011101110010101",
        "0100111000100010011100100100010111010010110011100101100011000100",
        "0101001010001001001100110101101100100111000101110100110001010001",
        "0010101110111010010010001000110110001010001101100111010100011011",
        "1101110100101100111001101110001011011101110011101110010110001110",
        "1001011011100011010101110011101110111011010110001110100111011100",
        "0101000111001110001001011011100011011000100101011100100010010001",
        "0111001110100010101110111010100011010111010001010110011010111010",
        "0110001110001110111010001100110100010011101001001110101001001110",
        "0011011100101001011010110110100010101101011100101110001000111011",
        "0010100010100101000111001011100110011101100101000101110001101101",
        "1010100010110011010011100100110011010110010001000101000110011010",
        "1101110001010011101010100010001110011100101010111010011000100111",
        "1101011101100110001001101010101000101110110001110100011010101100",
        "0110001100101101110100111001101000111010111011101001110010001110",
        "0010111010011010010001000101010011011010101000101010010001001000",
        "1000100100110110001011100100010001101001101100101001110101001000",
        "1100101110011010110001000100010011101100011000101010101010010001",
        "0011011100010001110010101010001100111011000101011001011011100010",
        "0100111011011100010110011100110101000101000111011011101000100010",
        "1001100111011010101001010010101011000100010101100110110010001110",
        "0111001001011101101100100010001101110101110001110001100101101110",
        "1010101001100101010101101110110111011011100110111000101011010001",
        "0010011000100010110100010011100111010011010001110001110100101100",
        "1000111010001000100010010011011100011000110010010011101110100111",
        "1010010011001001110100101011100100011010111001011101001110001001",
        "0111010100011100110010011011100101010001011100010001110100010001",
        "0110011011010001001110001011101001000101101001010001110111000111",
        "0101000101110010111011000101101000101101011010111010101101011001",
        "0011101011101001011000100011100010110010110110001000111000100100",
        "1011100011100100101000110010011101100100010001001110110011011001",
        "1100010001101100111000111011001001011000110010011010111001110010",
        "0100011010010010100010100011101110111000100100110010010011010111",
        "1011010010101001000110100010111011101000100011010100011101000110",
        "0111010011001101110100010011101110111000101011101001000101110111",
        "0110010111010101000110011100011010011001110011101001101110011101",
        "0101101000101000101100010001110010001101101101100111010001110001",
        "1101011010010100100011010100100100110110111011100110101100110010",
        "0101011010001110001110010001000110101010001000101101110101010100",
        "1100011011101100100011100110010101110100100111001101001011100110",
        "1101110011010101001000111010001001010101011000101110100011011010",
        "0011001011101101100101110110100101000110011100011100011100011001",
        "0010001110001000110110001101110010010111000111001110011100010100",
        "0011101110001101010001000111011100010101100010011001101011001010",
        "0010010011001011001110110110101010011101110001101110110010101000",
        "1001010101110100010110110011100101110001011101110111001000100101",
        "0011101110001110111010001101011100100011001100111000111001110010",
        "1100010011000100011000111010011101110101000100010101010101011011",
        "0010001010110010100010100011001001110100010011100011101001001001",
        "0101001101110010001001000110101101000111000110011010110101101000",
        "0110001011011101010001101110100010111011010100010011101010011100",
        "0011010011001010001001000101101110100101001000100100010011100111",
        "1011000100101110101100010111010001011000110001101000101010111011",
        "1101001110111011100010100111010010111011011100110010001011100010",
        "0110001000101110100011101001001110001010101100110110100100100010",
        "0111010011100010010001110010001011101110001010011000100110111000",
        "0101110100011100100011100010001110001101110001100010001010010110",
        "1101010011001000101000111011101000110011101011000110111011101001",
        "1001100101011001110001110001000110001011010011010001110110010100",
        "0011100100010001011101100110011101001011100111011000111011001000",
        "1001110110111010011011001010110001110110101110001100101101101100",
        "1100100011100100011101110001010011011101001011101011000110001001",
        "0100111010101011000111010100100101110100101010010100011100110111",
        "1000100011011100011000101110001010010001010001101110100011001000",
        "1101010001101101110011100011100011100010001011101110001011000101",
        "0010111000110100010110011000101100101100010001011101010100101110",
        "0011010100010100011101110001100011000100010010101010101001011011",
        "0011100111011000101011101101011101101001010110110110001100101001");

begin

    
register_process:
process(tx_clk, reset_in)
begin

    if reset_in = '0' then

        synq_rdy <= '0';
        tx_mux_sel <= '0';
        
        data_out <= (others=>'0');
        out_rdy <= '0';

    elsif rising_edge(tx_clk) then-- and enable_in = '1' then
 
        synq_rdy <= synq_rdy_r;
        tx_mux_sel <= tx_mux_sel_r;
        
        data_out <= data_out_r;
        out_rdy <= out_rdy_r;   
    
    end if;
    
end process;


tx_sync_process:
process(tx_clk, reset_in)
begin

    if reset_in = '0' then

        SYNC_STATE   <= STARTUP_SYNC;
        sync_cnt     <= 0;

        out_rdy_r    <= '0';
        data_out_r   <= (others=>'0');
        synq_rdy_r   <= '0';
        
        synq_rdy_z <= '0';
        tx_mux_sel_r <= '0';

        sync_cnt     <= 0;

    elsif rising_edge(tx_clk) then
    
        case SYNC_STATE is
        
            when STARTUP_SYNC =>
                synq_rdy_z <= '0';
            
                data_out_r <= sync_vector_64(sync_cnt);                
                synq_rdy_r <= '0';

                sync_cnt <= sync_cnt + 1;
                if sync_cnt = sync_cnt_MAX then
                    sync_cnt <= 0;
                    if loop_cnt = nr_loops_MAX then
                        SYNC_STATE <= SENDING_SYNC_DATA;
                    else
                        loop_cnt <= loop_cnt + 1;
                    end if;
                else
                    SYNC_STATE <= STARTUP_SYNC;
                end if;
                                    
            when SENDING_SYNC_DATA =>
                        synq_rdy_z <= '0';
            
            
                data_out_r <=  x"AAAAAAAAAAAAAAAA";
                
                if sync_cnt >= NR_OF_SYNC_WORDS-1 then
                    synq_rdy_z <= '1';
                else
                    synq_rdy_z <= '0';
                end if;
                
                if sync_cnt /= NR_OF_SYNC_WORDS-1 then
                    sync_cnt   <= sync_cnt + 1;
                    out_rdy_r  <= '1';
                    SYNC_STATE <= SENDING_SYNC_DATA;
                else
                    out_rdy_r  <= '0';
                    synq_rdy_r <= '1';
                    SYNC_STATE <= SYNCRONIZED;
                end if;

                
            when SYNCRONIZED =>
            
                SYNC_STATE   <= SYNCRONIZED;

                data_out_r     <= (others=>'0');
                out_rdy_r      <= '0';
                synq_rdy_r     <= '1';
                synq_rdy_z     <= '1';
                tx_mux_sel_r   <= '1';

                        synq_rdy_z <= '1';
            
                
                
--            when BULLSHIT1 =>
--                SYNC_STATE <= BULLSHIT1;
--            when BULLSHIT2 =>
--                SYNC_STATE <= BULLSHIT2;
--            when BULLSHIT3 =>
--                SYNC_STATE <= BULLSHIT3;
--            when BULLSHIT4 =>
--                SYNC_STATE <= BULLSHIT4;
--            when BULLSHIT5 =>
--                SYNC_STATE <= BULLSHIT1;
--            when others =>
--                SYNC_STATE <= BULLSHIT1;
        end case;

    end if;
    
end process;


end arch_TX_syncronizer;
