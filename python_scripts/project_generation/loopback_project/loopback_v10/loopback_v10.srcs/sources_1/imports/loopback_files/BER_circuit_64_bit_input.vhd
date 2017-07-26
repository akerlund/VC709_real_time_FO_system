

----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: 30/03/2017 12:52:27 PM
-- Design Name: 
-- Module Name: BER_circuit - Behavioral
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

entity BER_circuit_64_bit_input is
generic
(
    IN_WIDTH  : integer := 64

);
port
(
    user_clk : in  std_logic;       
    reset_in : in  std_logic;

    in_rdy   : in  std_logic;
    out_rdy  : out std_logic;

    data_in  : in  std_logic_vector((IN_WIDTH-1) downto 0);
    ref_in   : in  std_logic_vector((IN_WIDTH-1) downto 0);
    
    errors   : out std_logic_vector(15 downto 0)
    
);
end BER_circuit_64_bit_input;

architecture arch_BER_circuit of BER_circuit_64_bit_input is

    signal XOR_register : std_logic_vector((IN_WIDTH-1) downto 0);
    signal stage_0 : std_logic_vector((IN_WIDTH-1-0) downto 0);
    signal stage_1 : std_logic_vector((IN_WIDTH-1-16) downto 0);
    signal stage_2 : std_logic_vector((IN_WIDTH-1-32) downto 0);
    signal stage_3 : std_logic_vector(19 downto 0);
    signal stage_4 : std_logic_vector(11 downto 0);
    signal stage_5 : std_logic_vector(6 downto 0);

    signal out_rdy_0 : std_logic;
    signal out_rdy_1 : std_logic;
    signal out_rdy_2 : std_logic;
    signal out_rdy_3 : std_logic;
    signal out_rdy_4 : std_logic;
    signal out_rdy_5 : std_logic;
    signal out_rdy_6 : std_logic;


    function one_bit_adder(a : std_logic; b : std_logic) return std_logic_vector is
    begin
        if a = '0' and b = '1' then
            return "01";
        elsif a = '1' and b = '0' then
            return "01";
        elsif a = '1' and b = '1' then
            return "10";
        else
            return "00";
        end if;
    end one_bit_adder;

begin


the_error_find_process:
process(reset_in, user_clk)
begin

    if reset_in = '0' then

        XOR_register <= (others=>'0');
        stage_0 <= (others=>'0');
        stage_1 <= (others=>'0');
        stage_2 <= (others=>'0');
        stage_3 <= (others=>'0');
        stage_4 <= (others=>'0');
        stage_5 <= (others=>'0');

        out_rdy_0 <= '0';
        out_rdy_1 <= '0';
        out_rdy_2 <= '0';
        out_rdy_3 <= '0';
        out_rdy_4 <= '0';
        out_rdy_5 <= '0';
        out_rdy_6 <= '0';
        
        errors <= (others=>'0');
        out_rdy   <= '0';

    elsif rising_edge(user_clk) then

        if in_rdy = '1' then

            XOR_register <= data_in xor ref_in;

        end if;


        stage_0(1 downto 0) <= one_bit_adder(XOR_register(0),XOR_register(1));
        stage_0(3 downto 2) <= one_bit_adder(XOR_register(2),XOR_register(3));
        stage_0(5 downto 4) <= one_bit_adder(XOR_register(4),XOR_register(5));
        stage_0(7 downto 6) <= one_bit_adder(XOR_register(6),XOR_register(7));
        stage_0(9 downto 8) <= one_bit_adder(XOR_register(8),XOR_register(9));
        stage_0(11 downto 10) <= one_bit_adder(XOR_register(10),XOR_register(11));
        stage_0(13 downto 12) <= one_bit_adder(XOR_register(12),XOR_register(13));
        stage_0(15 downto 14) <= one_bit_adder(XOR_register(14),XOR_register(15));
        stage_0(17 downto 16) <= one_bit_adder(XOR_register(16),XOR_register(17));
        stage_0(19 downto 18) <= one_bit_adder(XOR_register(18),XOR_register(19));
        stage_0(21 downto 20) <= one_bit_adder(XOR_register(20),XOR_register(21));
        stage_0(23 downto 22) <= one_bit_adder(XOR_register(22),XOR_register(23));
        stage_0(25 downto 24) <= one_bit_adder(XOR_register(24),XOR_register(25));
        stage_0(27 downto 26) <= one_bit_adder(XOR_register(26),XOR_register(27));
        stage_0(29 downto 28) <= one_bit_adder(XOR_register(28),XOR_register(29));
        stage_0(31 downto 30) <= one_bit_adder(XOR_register(30),XOR_register(31));
        stage_0(33 downto 32) <= one_bit_adder(XOR_register(32),XOR_register(33));
        stage_0(35 downto 34) <= one_bit_adder(XOR_register(34),XOR_register(35));
        stage_0(37 downto 36) <= one_bit_adder(XOR_register(36),XOR_register(37));
        stage_0(39 downto 38) <= one_bit_adder(XOR_register(38),XOR_register(39));
        stage_0(41 downto 40) <= one_bit_adder(XOR_register(40),XOR_register(41));
        stage_0(43 downto 42) <= one_bit_adder(XOR_register(42),XOR_register(43));
        stage_0(45 downto 44) <= one_bit_adder(XOR_register(44),XOR_register(45));
        stage_0(47 downto 46) <= one_bit_adder(XOR_register(46),XOR_register(47));
        stage_0(49 downto 48) <= one_bit_adder(XOR_register(48),XOR_register(49));
        stage_0(51 downto 50) <= one_bit_adder(XOR_register(50),XOR_register(51));
        stage_0(53 downto 52) <= one_bit_adder(XOR_register(52),XOR_register(53));
        stage_0(55 downto 54) <= one_bit_adder(XOR_register(54),XOR_register(55));
        stage_0(57 downto 56) <= one_bit_adder(XOR_register(56),XOR_register(57));
        stage_0(59 downto 58) <= one_bit_adder(XOR_register(58),XOR_register(59));
        stage_0(61 downto 60) <= one_bit_adder(XOR_register(60),XOR_register(61));
        stage_0(63 downto 62) <= one_bit_adder(XOR_register(62),XOR_register(63));


        -- Stage 1 has 16 blocks each containing 3 bits
        stage_1(2 downto 0) <= std_logic_vector(resize(unsigned(stage_0(1 downto 0)),3) + resize(unsigned(stage_0(3 downto 2)),3));
        stage_1(5 downto 3) <= std_logic_vector(resize(unsigned(stage_0(5 downto 4)),3) + resize(unsigned(stage_0(7 downto 6)),3));
        stage_1(8 downto 6) <= std_logic_vector(resize(unsigned(stage_0(9 downto 8)),3) + resize(unsigned(stage_0(11 downto 10)),3));
        stage_1(11 downto 9) <= std_logic_vector(resize(unsigned(stage_0(13 downto 12)),3) + resize(unsigned(stage_0(15 downto 14)),3));
        stage_1(14 downto 12) <= std_logic_vector(resize(unsigned(stage_0(17 downto 16)),3) + resize(unsigned(stage_0(19 downto 18)),3));
        stage_1(17 downto 15) <= std_logic_vector(resize(unsigned(stage_0(21 downto 20)),3) + resize(unsigned(stage_0(23 downto 22)),3));
        stage_1(20 downto 18) <= std_logic_vector(resize(unsigned(stage_0(25 downto 24)),3) + resize(unsigned(stage_0(27 downto 26)),3));
        stage_1(23 downto 21) <= std_logic_vector(resize(unsigned(stage_0(29 downto 28)),3) + resize(unsigned(stage_0(31 downto 30)),3));
        stage_1(26 downto 24) <= std_logic_vector(resize(unsigned(stage_0(33 downto 32)),3) + resize(unsigned(stage_0(35 downto 34)),3));
        stage_1(29 downto 27) <= std_logic_vector(resize(unsigned(stage_0(37 downto 36)),3) + resize(unsigned(stage_0(39 downto 38)),3));
        stage_1(32 downto 30) <= std_logic_vector(resize(unsigned(stage_0(41 downto 40)),3) + resize(unsigned(stage_0(43 downto 42)),3));
        stage_1(35 downto 33) <= std_logic_vector(resize(unsigned(stage_0(45 downto 44)),3) + resize(unsigned(stage_0(47 downto 46)),3));
        stage_1(38 downto 36) <= std_logic_vector(resize(unsigned(stage_0(49 downto 48)),3) + resize(unsigned(stage_0(51 downto 50)),3));
        stage_1(41 downto 39) <= std_logic_vector(resize(unsigned(stage_0(53 downto 52)),3) + resize(unsigned(stage_0(55 downto 54)),3));
        stage_1(44 downto 42) <= std_logic_vector(resize(unsigned(stage_0(57 downto 56)),3) + resize(unsigned(stage_0(59 downto 58)),3));
        stage_1(47 downto 45) <= std_logic_vector(resize(unsigned(stage_0(61 downto 60)),3) + resize(unsigned(stage_0(63 downto 62)),3));

        -- Stage 2 has 8 blocks each containing 4 bits
        stage_2(3 downto 0) <= std_logic_vector(resize(unsigned(stage_1(2 downto 0)),4) + resize(unsigned(stage_1(5 downto 3)),4));
        stage_2(7 downto 4) <= std_logic_vector(resize(unsigned(stage_1(8 downto 6)),4) + resize(unsigned(stage_1(11 downto 9)),4));
        stage_2(11 downto 8) <= std_logic_vector(resize(unsigned(stage_1(14 downto 12)),4) + resize(unsigned(stage_1(17 downto 15)),4));
        stage_2(15 downto 12) <= std_logic_vector(resize(unsigned(stage_1(20 downto 18)),4) + resize(unsigned(stage_1(23 downto 21)),4));
        stage_2(19 downto 16) <= std_logic_vector(resize(unsigned(stage_1(26 downto 24)),4) + resize(unsigned(stage_1(29 downto 27)),4));
        stage_2(23 downto 20) <= std_logic_vector(resize(unsigned(stage_1(32 downto 30)),4) + resize(unsigned(stage_1(35 downto 33)),4));
        stage_2(27 downto 24) <= std_logic_vector(resize(unsigned(stage_1(38 downto 36)),4) + resize(unsigned(stage_1(41 downto 39)),4));
        stage_2(31 downto 28) <= std_logic_vector(resize(unsigned(stage_1(44 downto 42)),4) + resize(unsigned(stage_1(47 downto 45)),4));

        -- Stage 3 has 4 blocks each containing 5 bits
        stage_3(4 downto 0) <= std_logic_vector(resize(unsigned(stage_2(3 downto 0)),5) + resize(unsigned(stage_2(7 downto 4)),5));
        stage_3(9 downto 5) <= std_logic_vector(resize(unsigned(stage_2(11 downto 8)),5) + resize(unsigned(stage_2(15 downto 12)),5));
        stage_3(14 downto 10) <= std_logic_vector(resize(unsigned(stage_2(19 downto 16)),5) + resize(unsigned(stage_2(23 downto 20)),5));
        stage_3(19 downto 15) <= std_logic_vector(resize(unsigned(stage_2(27 downto 24)),5) + resize(unsigned(stage_2(31 downto 28)),5));

        -- Stage 4 has 2 blocks each containing 6 bits
        stage_4(5 downto 0) <= std_logic_vector(resize(unsigned(stage_3(4 downto 0)),6) + resize(unsigned(stage_3(9 downto 5)),6));
        stage_4(11 downto 6) <= std_logic_vector(resize(unsigned(stage_3(14 downto 10)),6) + resize(unsigned(stage_3(19 downto 15)),6));

        -- Stage_5 has 1 block with the sum of its previous.
        stage_5 <= std_logic_vector(resize(unsigned(stage_4(11 downto 6)), 7) + resize(unsigned(stage_4(5 downto 0)),7));
        
        --errors <= stage_5;
        errors <= std_logic_vector(resize(unsigned(stage_5), 16));
        
        out_rdy_0 <= in_rdy;
        out_rdy_1 <= out_rdy_0;
        out_rdy_2 <= out_rdy_1;
        out_rdy_3 <= out_rdy_2;
        out_rdy_4 <= out_rdy_3;
        out_rdy_5 <= out_rdy_4;
        out_rdy_6 <= out_rdy_5;
        out_rdy   <= out_rdy_6;

    end if;

end process the_error_find_process;
end architecture arch_BER_circuit;
