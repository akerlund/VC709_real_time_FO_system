----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: 02/01/2017 12:52:27 PM
-- Design Name: 
-- Module Name: compressor_buffer - Behavioral
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

entity compressor_buffer is
generic
(
    IN_WIDTH  : integer := 32;
    BUF_WIDTH : integer := 16
);
port
(
    user_clk      : in  std_logic;       
    reset_in      : in  std_logic;
    enable_in     : in  std_logic;
    tx_sync_rdy   : in  std_logic;
    congestion    : out std_logic;

    data_in       : in  std_logic_vector((IN_WIDTH-1) downto 0);
    in_rdy        : in  std_logic;
    
    buf_out       : out std_logic_vector((IN_WIDTH-1) downto 0);
    out_rdy       : out std_logic
);
end compressor_buffer;

architecture arch_compressor_buffer of compressor_buffer is

    type   buffer_type is array (0 to (BUF_WIDTH-1)) of std_logic_vector((IN_WIDTH-1) downto 0);
    signal buffer_A : buffer_type;
    signal buffer_B : buffer_type;

    signal words_in_A : integer range 0 to (BUF_WIDTH-1);
    signal words_in_B : integer range 0 to (BUF_WIDTH-1);

    type   current_buffer_type is (A, B);
    signal current_buffer : current_buffer_type;

    type   true_false_type is (TRUE, FALSE);
    signal buffer_A_full : true_false_type;
    signal buffer_B_full : true_false_type;

    signal output_counter : integer range 0 to (BUF_WIDTH-1);
    
begin

the_buffing_process:
process(reset_in, user_clk, enable_in)
begin

    if reset_in = '0' then

        current_buffer <= A;

        buffer_A   <= (others=>(others=>'0'));
        words_in_A <= 0;
        buffer_A_full <= FALSE;

        buffer_B   <=  (others=>(others=>'0'));
        words_in_B <= 0;
        buffer_B_full <= FALSE;

        congestion <= '0';

        buf_out <= (others=> '0');
        out_rdy <= '0';

        output_counter <= 0;
        
    elsif rising_edge(user_clk) and enable_in = '1' then

       

        
            -- First parts deals with buffering the data.
            if in_rdy = '1' then
    
                if current_buffer = A and buffer_A_full = FALSE then
    
                    buffer_A(words_in_A) <= data_in;
    
                    if words_in_A /= (BUF_WIDTH-1) then
                        words_in_A     <= words_in_A + 1;
                    else
                        words_in_A     <= 0;
                        buffer_A_full  <= TRUE;
                        current_buffer <= B;
                    end if;
    
                elsif current_buffer = B and buffer_B_full = FALSE then
    
                    buffer_B(words_in_B) <= data_in;
    
                    if words_in_B /= (BUF_WIDTH-1) then
                        words_in_B     <= words_in_B + 1;
                    else
                        words_in_B     <= 0;
                        buffer_B_full  <= TRUE;
                        current_buffer <= A;
                        
                         if buffer_A_full = TRUE and tx_sync_rdy = '0' then
                             congestion <= '1';
                         end if;

                    end if;
    
                end if;
    
            end if;
    
            -- Second part deals with the output.
            if buffer_A_full = TRUE and tx_sync_rdy = '1' then--and system_is_halted = FALSE then
    
                buf_out <= buffer_A(output_counter);
    
                -- Output counter.
                if output_counter /= (BUF_WIDTH-1) then
                    output_counter <= output_counter + 1;
                    out_rdy        <= '1';
                else
                    output_counter <= 0;
                    buffer_A_full  <= FALSE;
                    congestion <= '0';

                end if;
    
            elsif buffer_B_full = TRUE and tx_sync_rdy = '1' then--and system_is_halted = FALSE then

                congestion <= '0';    
                buf_out <= buffer_B(output_counter);
    
                -- Output counter.
                if output_counter /= (BUF_WIDTH-1) then
                    output_counter <= output_counter + 1;
                    out_rdy        <= '1';
                else
                    output_counter <= 0;
                    buffer_B_full  <= FALSE;
                end if;
    
            else
    
                buf_out <= (others=>'0');
                out_rdy <= '0';
    
            end if;
            
        
    elsif rising_edge(user_clk) and enable_in = '0' then
    --                    out_rdy <= '0';

    end if;

end process the_buffing_process;

end architecture arch_compressor_buffer;