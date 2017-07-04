----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: 04/11/2017 05:19:28 PM
-- Design Name: 
-- Module Name: exdes_TX_logic - Behavioral
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

entity exdes_TX_logic is
    port
    (

        tx_clk       : in  std_logic;
        reset_in     : in  std_logic;
                
        tx_valid_out   : out std_logic;
        
        txsequence_out : out std_logic_vector(6 downto 0);
        txheader_out   : out std_logic_vector(1 downto 0)
        
        --txfsmresetdone : in std_logic -- _r2
        
    );
end exdes_TX_logic;

architecture arch_exdes_TX_logic of exdes_TX_logic is

    signal tx_clk_i        : std_logic;
    signal gt0_txusrclk2_i : std_logic;
    signal gt0_tx_reset_i  : std_logic;
    signal reset_in_i      : std_logic;

    signal tied_to_ground_i     : std_logic;
    signal tied_to_ground_vec_i : std_logic_vector(63 downto 0);
    signal tied_to_vcc_i        : std_logic;
    signal tied_to_vcc_vec_i    : std_logic_vector(7 downto 0);
    
    
    signal gt0_txheader_i        : std_logic_vector(1 downto 0);

    signal gt0_tx_system_reset_c : std_logic;

    --signal gt0_data_valid_i     :   std_logic;
    signal gt0_data_valid_out_i :   std_logic;
    --signal gt0_reset_r          :   std_logic; -- To scrambler.
    
----------------------- Frame check/gen Module Signals --------------------
    --signal gt0_txctrl_i      : std_logic;
    --signal gt0_txctrl_r      : std_logic;
    --signal gt0_txctrl_2r     : std_logic;
    signal gt0_txdatavalid_i : std_logic;


--***************************** Register Declarations *****************************
    signal gt0_txseq_counter_r    : unsigned(8 downto 0);
    signal gt0_txheader_r         : std_logic_vector(1 downto 0);
    --signal gt0_extend_reset_r     : std_logic_vector(3 downto 0);
    signal gt0_pause_data_valid_r : std_logic;
    
--------------------- Transmit Ports - TX Gearbox Ports --------------------
    signal  gt0_txsequence_i : std_logic_vector(6 downto 0);
    
    signal header_counter : integer range 0 to 15;

begin

    tx_clk_i <= tx_clk;
    gt0_txusrclk2_i <= tx_clk_i;
    
    reset_in_i <= reset_in;
    
    tx_valid_out   <= gt0_txdatavalid_i;
    txsequence_out <= gt0_txsequence_i;
    txheader_out   <= gt0_txheader_i;

--***********************************************************************--
--                                                                       --
----------------------- Logic for 64B66B/67B Encoding----------------------
--                                                                       --
--***********************************************************************--
    
    -- TODO:
    --gt0_txctrl_i <= '1';

-- This counter helps to generate the header output.
ctrl_logic_process:
process(tx_clk_i, reset_in_i)
--variable header_counter : integer := 0;
begin

    if reset_in_i = '0' then
        header_counter <= 0;
        --gt0_txctrl_i   <= '0';
    elsif rising_edge(tx_clk_i) then
        if header_counter = 0 then
            --gt0_txctrl_i <= '1';
            gt0_txheader_i <= "10";
            header_counter <= header_counter + 1;
        elsif header_counter /= 15 then
            --gt0_txctrl_i <= '0';
            gt0_txheader_i <= "01";
            header_counter <= header_counter + 1;
        else
            gt0_txheader_i <= "01";
            header_counter <= 0;
        end if;
    end if;
end process;


--control_header_process:
--process(gt0_txusrclk2_i)
--begin
--    if( gt0_txusrclk2_i'event and gt0_txusrclk2_i = '1') then
--        gt0_txctrl_r   <= gt0_txctrl_i; -- after DLY;
--        gt0_txctrl_2r  <= gt0_txctrl_r; -- after DLY;
--    end if;
--end process;


--    gt0_txheader_i <= "10" when ((gt0_txctrl_i = '1') or (gt0_txctrl_r = '1' and gt0_txctrl_2r = '0')) else "01";
    

    gt0_tx_reset_i        <= gt0_tx_system_reset_c;
    gt0_tx_system_reset_c <= not reset_in; --gt0_tx_reset; --'0'; not gt0_txfsmresetdone_r2;


    gt0_data_valid_out_i <=  '1' when (gt0_txsequence_i /= "0011111") else '0';
    gt0_txdatavalid_i    <=  gt0_data_valid_out_i when reset_in = '1' else '0'; -- FÅ CHANGED to else 1 
    
    gt0_txsequence_i(5 downto 0)  <= std_logic_vector(gt0_txseq_counter_r(5 downto 0)); -- after DLY;
    
    
    
    
    

--__________________________ Generating Data Valid Signal _________________________   
--pause_data_valid_process:
--process(gt0_txusrclk2_i)
--begin
--  if(gt0_txusrclk2_i'event and gt0_txusrclk2_i = '1') then
--         gt0_pause_data_valid_r <=  gt0_data_valid_out_i;-- after DLY;
--  end if;
--end process;

    --gt0_data_valid_i  <= '1' when (gt0_pause_data_valid_r='1') else '0';

--____________________________ TXSEQUENCE counter to GT __________________________
txseq_count_process:
process(tx_clk_i, reset_in_i)
begin

    if reset_in_i = '0' then
        gt0_txseq_counter_r <= (others => '0'); -- after DLY;
        --gt0_txsequence_i(5 downto 0)  <= std_logic_vector(gt0_txseq_counter_r(5 downto 0)); -- after DLY;
    elsif rising_edge(tx_clk_i) then
        if gt0_txseq_counter_r = 32 then
            gt0_txseq_counter_r <= (others => '0'); -- after DLY;
        --    gt0_txsequence_i(5 downto 0)  <= std_logic_vector(gt0_txseq_counter_r(5 downto 0)); -- after DLY;
        else 
            gt0_txseq_counter_r <= gt0_txseq_counter_r + 1; -- after DLY;
        --gt0_txsequence_i(5 downto 0)  <= std_logic_vector(gt0_txseq_counter_r(5 downto 0)); -- after DLY;
        end if;
    end if;
end process;

gt0_txsequence_i(6)           <= '0'; -- after DLY;


--_____________________________ TXHEADER port to GTH_______________________________
tx_header_out_process:
process(gt0_txusrclk2_i, reset_in_i)
begin
  if(gt0_txusrclk2_i'event and gt0_txusrclk2_i = '1') then
    if(reset_in_i='0') then 
              gt0_txheader_r   <=  (others => '0'); -- after DLY;
    else     
              gt0_txheader_r   <=  gt0_txheader_i; -- after DLY;
    end if;
  end if;
end process; 

-- Extend the system reset to hold the scrambler in reset for a few extra cycles
-- This is to ensure that the scrambler is in reset till the data appears at the
-- output of the bram
--extended_reset_process:
--process(gt0_txusrclk2_i)
--begin
--  if(gt0_txusrclk2_i'event and gt0_txusrclk2_i = '1') then
--    gt0_extend_reset_r <=  (gt0_extend_reset_r(2 downto 0) & gt0_tx_reset_i);
--  end if;
--end process;  
    
--    -- To scrambler
--    gt0_reset_r    <=   gt0_extend_reset_r(0) or
--                        gt0_extend_reset_r(1) or
--                        gt0_extend_reset_r(2) or
--                        gt0_extend_reset_r(3);

 


end arch_exdes_TX_logic;
