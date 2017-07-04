----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik �kerlund
-- 
-- Create Date: 04/19/2017 10:04:58 AM
-- Design Name: 
-- Module Name: top_module - arch_top_module
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top_module is
    generic(
        DATA_WIDTH : integer := 64;
        N_WIDTH    : integer := 127;
        K_WIDTH    : integer := 113;
        BUF_WIDTH  : integer := 16
    );
    port(
        --CPU_RESET       : in  std_logic;
        
        GPIO_LED        : out std_logic_vector(7 downto 0);
        GPIO_DIP        : in  std_logic_vector(7 downto 0);
        
        CPU_RESET       : in  std_logic;
        
        SYSCLK_N        : in  std_logic;
        SYSCLK_P        : in  std_logic
        
        
        --  BUTTONS ON PCB
--        GPIO_SW_N : in std_logic;
--        GPIO_SW_S : in std_logic;
--        GPIO_SW_W : in std_logic;
--        GPIO_SW_E : in std_logic;
--        GPIO_SW_C : in std_logic
             
        
    );
end top_module;

architecture arch_top_module of top_module is

    -- Clock signals.
    signal clk_i : std_logic;
    signal I     : std_logic;
    signal IB    : std_logic;

    -- Reset signal.
    signal reset_i : std_logic;
    signal btn_reset_in_i : std_logic;
    
    -- LED signals.
    signal GPIO_LED_i : std_logic_vector(7 downto 0);
    
    
    component transceiver_module is
    generic(
        DATA_WIDTH : integer := 64;
        N_WIDTH    : integer := 127;
        K_WIDTH    : integer := 113;
        BUF_WIDTH  : integer := 16
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
    end component;

    signal tm0_TXVALID_i               : std_logic;
    signal tm0_TXSEQ_i                 : std_logic_vector(6 downto 0);
    signal tm0_TXHEADER_i              : std_logic_vector(1 downto 0);
    signal tm0_RXHEADERVALID_i         : std_logic;
    signal tm0_TXDATA_i                : std_logic_vector((DATA_WIDTH-1) downto 0);
    signal tm0_RXGEARBOXSLIP_i         : std_logic;
    signal tm0_RX_REF_CNT_i            : std_logic_vector(7 downto 0);
    signal tm0_FBERT_run_rdy_i         : std_logic;
    signal tm0_FBERT_BER_out_i         : std_logic_vector(31 downto 0);
    signal tm0_FBERT_time_interval_i   : std_logic_vector(31 downto 0);
    signal tm0_FBERT_state_out         : std_logic_vector(2 downto 0);
    
--------------------------------------------------------------------------------


begin

-- An IBUFG drives a global clock net from an external pin.
IBUFDS_inst: IBUFDS
    generic map( IOSTANDARD => "LVDS_25")
    port map ( O => clk_i, I => I, IB => IB );
    I  <= SYSCLK_P;
    IB <= SYSCLK_N;
    
btn_reset_in_i  <= CPU_RESET;
GPIO_LED <= GPIO_LED_i; 

tm0:
component transceiver_module
generic map (
    DATA_WIDTH => DATA_WIDTH,
    N_WIDTH    => 127,
    K_WIDTH    => 113,
    BUF_WIDTH  => 16
)
port map(
    -- CLOCKS.
    tx_clk          => clk_i,
    rx_clk          => clk_i,
    
    -- RESETS.
    reset_in        => reset_i,
    
    -- TX PORTS.
    TXVALID         => tm0_TXVALID_i,
    TXSEQ           => tm0_TXSEQ_i,
    TXHEADER        => tm0_TXHEADER_i,
    TXDATA          => tm0_TXDATA_i,
    
    -- RX PORTS.
    RXVALID       => tm0_TXVALID_i,
    RXHEADER      => tm0_TXHEADER_i,
    RXHEADERVALID => tm0_RXHEADERVALID_i,
    RXDATA        => tm0_TXDATA_i,
    RXGEARBOXSLIP => tm0_RXGEARBOXSLIP_i,
    RX_REF_CNT    => tm0_RX_REF_CNT_i,
            
    -- FBERT.
    FBERT_run_rdy   => tm0_FBERT_run_rdy_i,
    FBERT_BER_out   => tm0_FBERT_BER_out_i,
    
    FBERT_time_interval => tm0_FBERT_time_interval_i,
    FBERT_state_out     => tm0_FBERT_state_out
);

tm0_FBERT_time_interval_i   <= x"00000080";
tm0_RXHEADERVALID_i <= '1' when (tm0_TXHEADER_i = "01" or tm0_TXHEADER_i = "10") else '0';

reset_process:
process(clk_i)
variable reset_cnt : integer := 0;
begin
    if rising_edge(clk_i) then
        
        if reset_cnt = 8 then
            reset_i <= '1';
        else
            reset_i <= '0';
            reset_cnt := reset_cnt + 1;
        end if;
    end if;
end process;

led_process:
process(clk_i)
begin
    if rising_edge(clk_i) then
        case GPIO_DIP is
        
            when "00000001" =>
                if tm0_FBERT_run_rdy_i = '1' then
                    GPIO_LED_i <= tm0_FBERT_BER_out_i(7 downto 0);
                end if;
                
            when "00000010" =>
                if tm0_FBERT_run_rdy_i = '1' then
                    GPIO_LED_i <= tm0_FBERT_BER_out_i(15 downto 8);
                end if;              
                  
            when "00000011" =>
                if tm0_FBERT_run_rdy_i = '1' then
                    GPIO_LED_i <= tm0_FBERT_BER_out_i(23 downto 16);
                end if;              
                  
            when "00000100" =>
                if tm0_FBERT_run_rdy_i = '1' then
                    GPIO_LED_i <= tm0_FBERT_BER_out_i(31 downto 24);
                end if;              
                        
--            when "00000101" =>
--                if tm0_FBERT_run_rdy_i = '1' then
--                    GPIO_LED_i <= tm0_FBERT_BER_out_i(39 downto 32);
--                end if;
                
--            when "00000110" =>
--                if tm0_FBERT_run_rdy_i = '1' then
--                    GPIO_LED_i <= tm0_FBERT_BER_out_i(47 downto 40);
--                end if;              
                  
--            when "00000111" =>
--                if tm0_FBERT_run_rdy_i = '1' then
--                    GPIO_LED_i <= tm0_FBERT_BER_out_i(55 downto 48);
--                end if;              
                  
--            when "00001000" =>
--                if tm0_FBERT_run_rdy_i = '1' then
--                    GPIO_LED_i <= tm0_FBERT_BER_out_i(63 downto 56);
--                end if;              
                
            when "00001001" =>
                GPIO_LED_i(3 downto 0) <= tm0_RX_REF_CNT_i(3 downto 0);
                GPIO_LED_i(7 downto 4) <= (others=>'0');
                
            when others =>
                GPIO_LED_i(2 downto 0) <= tm0_FBERT_state_out;
                GPIO_LED_i(3) <= tm0_RXGEARBOXSLIP_i;
                GPIO_LED_i(4) <= btn_reset_in_i;
                GPIO_LED_i(7 downto 5) <= (others=>'0');
                
            
        end case;
    end if;
end process;

end arch_top_module;
