----------------------------------------------------------------------------------
    -- Company:  Chalmers
    -- Engineer: Fredrik Åkerlund
    -- 
    -- Create Date: Mon Jul 24 13:30:05 2017

    -- Design Name: 
    -- Module Name: word_expander_64IN_to_113OUT - arch_word_expander_64IN_to_113OUT
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
    entity word_expander_64IN_to_113OUT is

    generic(
        IN_WIDTH  : integer := 64;
        OUT_WIDTH : integer := 113
    );
    port(
        user_clk  : in  std_logic;       
        reset_in  : in  std_logic;
        enable_in : in  std_logic;

        in_rdy    : in  std_logic;
        data_in   : in  std_logic_vector(IN_WIDTH-1 downto 0);

        buf_out   : out std_logic_vector(OUT_WIDTH-1 downto 0);
        out_rdy   : out std_logic

        );
    end word_expander_64IN_to_113OUT;
architecture arch_word_expander_64IN_to_113OUT of word_expander_64IN_to_113OUT is

        constant BUF_WIDTH : integer := (OUT_WIDTH + IN_WIDTH);

        signal buf_input_r  : std_logic_vector(BUF_WIDTH-1 downto 0);
        signal buf_output_r : std_logic_vector(OUT_WIDTH-1 downto 0);
        signal out_rdy_r    : std_logic;

        signal bits_in_buffer : integer range 0 to BUF_WIDTH;

    begin

    output_reg_process:
    process(reset_in, user_clk, enable_in)
    begin
        if reset_in = '0' then
            buf_out <= (others=>'0');
            out_rdy <= '0';
        elsif rising_edge(user_clk) then
            if enable_in = '1' then
                buf_out <= buf_output_r;
                out_rdy <= out_rdy_r;
            end if;
        end if;
    end process;


    the_buffing_process:
    process(reset_in, user_clk, in_rdy, enable_in)
    begin
        if reset_in = '0' then

            buf_input_r  <= (others=>'0');
            buf_output_r <= (others=>'0');

            bits_in_buffer <= 0;

            out_rdy_r <= '0';

        elsif rising_edge(user_clk) then
            if in_rdy = '1' and enable_in = '1' then
            if bits_in_buffer >= 49 then
                out_rdy_r <= '1';
                case bits_in_buffer is
                    when 49 =>
                        buf_output_r(48 downto 0)    <= buf_input_r(48 downto 0);
                        buf_output_r(112 downto 49)  <= data_in(63 downto 0);
                        buf_input_r                  <= (others=>'0');
                        bits_in_buffer               <= 0;
                    when 50 =>
                        buf_output_r(49 downto 0)    <= buf_input_r(49 downto 0);
                        buf_output_r(112 downto 50)  <= data_in(62 downto 0);
                        buf_input_r (0 downto 0)     <= data_in(63 downto 63);
                        bits_in_buffer               <= 1;
                    when 51 =>
                        buf_output_r(50 downto 0)    <= buf_input_r(50 downto 0);
                        buf_output_r(112 downto 51)  <= data_in(61 downto 0);
                        buf_input_r (1 downto 0)     <= data_in(63 downto 62);
                        bits_in_buffer               <= 2;
                    when 52 =>
                        buf_output_r(51 downto 0)    <= buf_input_r(51 downto 0);
                        buf_output_r(112 downto 52)  <= data_in(60 downto 0);
                        buf_input_r (2 downto 0)     <= data_in(63 downto 61);
                        bits_in_buffer               <= 3;
                    when 53 =>
                        buf_output_r(52 downto 0)    <= buf_input_r(52 downto 0);
                        buf_output_r(112 downto 53)  <= data_in(59 downto 0);
                        buf_input_r (3 downto 0)     <= data_in(63 downto 60);
                        bits_in_buffer               <= 4;
                    when 54 =>
                        buf_output_r(53 downto 0)    <= buf_input_r(53 downto 0);
                        buf_output_r(112 downto 54)  <= data_in(58 downto 0);
                        buf_input_r (4 downto 0)     <= data_in(63 downto 59);
                        bits_in_buffer               <= 5;
                    when 55 =>
                        buf_output_r(54 downto 0)    <= buf_input_r(54 downto 0);
                        buf_output_r(112 downto 55)  <= data_in(57 downto 0);
                        buf_input_r (5 downto 0)     <= data_in(63 downto 58);
                        bits_in_buffer               <= 6;
                    when 56 =>
                        buf_output_r(55 downto 0)    <= buf_input_r(55 downto 0);
                        buf_output_r(112 downto 56)  <= data_in(56 downto 0);
                        buf_input_r (6 downto 0)     <= data_in(63 downto 57);
                        bits_in_buffer               <= 7;
                    when 57 =>
                        buf_output_r(56 downto 0)    <= buf_input_r(56 downto 0);
                        buf_output_r(112 downto 57)  <= data_in(55 downto 0);
                        buf_input_r (7 downto 0)     <= data_in(63 downto 56);
                        bits_in_buffer               <= 8;
                    when 58 =>
                        buf_output_r(57 downto 0)    <= buf_input_r(57 downto 0);
                        buf_output_r(112 downto 58)  <= data_in(54 downto 0);
                        buf_input_r (8 downto 0)     <= data_in(63 downto 55);
                        bits_in_buffer               <= 9;
                    when 59 =>
                        buf_output_r(58 downto 0)    <= buf_input_r(58 downto 0);
                        buf_output_r(112 downto 59)  <= data_in(53 downto 0);
                        buf_input_r (9 downto 0)     <= data_in(63 downto 54);
                        bits_in_buffer               <= 10;
                    when 60 =>
                        buf_output_r(59 downto 0)    <= buf_input_r(59 downto 0);
                        buf_output_r(112 downto 60)  <= data_in(52 downto 0);
                        buf_input_r (10 downto 0)    <= data_in(63 downto 53);
                        bits_in_buffer               <= 11;
                    when 61 =>
                        buf_output_r(60 downto 0)    <= buf_input_r(60 downto 0);
                        buf_output_r(112 downto 61)  <= data_in(51 downto 0);
                        buf_input_r (11 downto 0)    <= data_in(63 downto 52);
                        bits_in_buffer               <= 12;
                    when 62 =>
                        buf_output_r(61 downto 0)    <= buf_input_r(61 downto 0);
                        buf_output_r(112 downto 62)  <= data_in(50 downto 0);
                        buf_input_r (12 downto 0)    <= data_in(63 downto 51);
                        bits_in_buffer               <= 13;
                    when 63 =>
                        buf_output_r(62 downto 0)    <= buf_input_r(62 downto 0);
                        buf_output_r(112 downto 63)  <= data_in(49 downto 0);
                        buf_input_r (13 downto 0)    <= data_in(63 downto 50);
                        bits_in_buffer               <= 14;
                    when 64 =>
                        buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
                        buf_output_r(112 downto 64)  <= data_in(48 downto 0);
                        buf_input_r (14 downto 0)    <= data_in(63 downto 49);
                        bits_in_buffer               <= 15;
                    when 65 =>
                        buf_output_r(64 downto 0)    <= buf_input_r(64 downto 0);
                        buf_output_r(112 downto 65)  <= data_in(47 downto 0);
                        buf_input_r (15 downto 0)    <= data_in(63 downto 48);
                        bits_in_buffer               <= 16;
                    when 66 =>
                        buf_output_r(65 downto 0)    <= buf_input_r(65 downto 0);
                        buf_output_r(112 downto 66)  <= data_in(46 downto 0);
                        buf_input_r (16 downto 0)    <= data_in(63 downto 47);
                        bits_in_buffer               <= 17;
                    when 67 =>
                        buf_output_r(66 downto 0)    <= buf_input_r(66 downto 0);
                        buf_output_r(112 downto 67)  <= data_in(45 downto 0);
                        buf_input_r (17 downto 0)    <= data_in(63 downto 46);
                        bits_in_buffer               <= 18;
                    when 68 =>
                        buf_output_r(67 downto 0)    <= buf_input_r(67 downto 0);
                        buf_output_r(112 downto 68)  <= data_in(44 downto 0);
                        buf_input_r (18 downto 0)    <= data_in(63 downto 45);
                        bits_in_buffer               <= 19;
                    when 69 =>
                        buf_output_r(68 downto 0)    <= buf_input_r(68 downto 0);
                        buf_output_r(112 downto 69)  <= data_in(43 downto 0);
                        buf_input_r (19 downto 0)    <= data_in(63 downto 44);
                        bits_in_buffer               <= 20;
                    when 70 =>
                        buf_output_r(69 downto 0)    <= buf_input_r(69 downto 0);
                        buf_output_r(112 downto 70)  <= data_in(42 downto 0);
                        buf_input_r (20 downto 0)    <= data_in(63 downto 43);
                        bits_in_buffer               <= 21;
                    when 71 =>
                        buf_output_r(70 downto 0)    <= buf_input_r(70 downto 0);
                        buf_output_r(112 downto 71)  <= data_in(41 downto 0);
                        buf_input_r (21 downto 0)    <= data_in(63 downto 42);
                        bits_in_buffer               <= 22;
                    when 72 =>
                        buf_output_r(71 downto 0)    <= buf_input_r(71 downto 0);
                        buf_output_r(112 downto 72)  <= data_in(40 downto 0);
                        buf_input_r (22 downto 0)    <= data_in(63 downto 41);
                        bits_in_buffer               <= 23;
                    when 73 =>
                        buf_output_r(72 downto 0)    <= buf_input_r(72 downto 0);
                        buf_output_r(112 downto 73)  <= data_in(39 downto 0);
                        buf_input_r (23 downto 0)    <= data_in(63 downto 40);
                        bits_in_buffer               <= 24;
                    when 74 =>
                        buf_output_r(73 downto 0)    <= buf_input_r(73 downto 0);
                        buf_output_r(112 downto 74)  <= data_in(38 downto 0);
                        buf_input_r (24 downto 0)    <= data_in(63 downto 39);
                        bits_in_buffer               <= 25;
                    when 75 =>
                        buf_output_r(74 downto 0)    <= buf_input_r(74 downto 0);
                        buf_output_r(112 downto 75)  <= data_in(37 downto 0);
                        buf_input_r (25 downto 0)    <= data_in(63 downto 38);
                        bits_in_buffer               <= 26;
                    when 76 =>
                        buf_output_r(75 downto 0)    <= buf_input_r(75 downto 0);
                        buf_output_r(112 downto 76)  <= data_in(36 downto 0);
                        buf_input_r (26 downto 0)    <= data_in(63 downto 37);
                        bits_in_buffer               <= 27;
                    when 77 =>
                        buf_output_r(76 downto 0)    <= buf_input_r(76 downto 0);
                        buf_output_r(112 downto 77)  <= data_in(35 downto 0);
                        buf_input_r (27 downto 0)    <= data_in(63 downto 36);
                        bits_in_buffer               <= 28;
                    when 78 =>
                        buf_output_r(77 downto 0)    <= buf_input_r(77 downto 0);
                        buf_output_r(112 downto 78)  <= data_in(34 downto 0);
                        buf_input_r (28 downto 0)    <= data_in(63 downto 35);
                        bits_in_buffer               <= 29;
                    when 79 =>
                        buf_output_r(78 downto 0)    <= buf_input_r(78 downto 0);
                        buf_output_r(112 downto 79)  <= data_in(33 downto 0);
                        buf_input_r (29 downto 0)    <= data_in(63 downto 34);
                        bits_in_buffer               <= 30;
                    when 80 =>
                        buf_output_r(79 downto 0)    <= buf_input_r(79 downto 0);
                        buf_output_r(112 downto 80)  <= data_in(32 downto 0);
                        buf_input_r (30 downto 0)    <= data_in(63 downto 33);
                        bits_in_buffer               <= 31;
                    when 81 =>
                        buf_output_r(80 downto 0)    <= buf_input_r(80 downto 0);
                        buf_output_r(112 downto 81)  <= data_in(31 downto 0);
                        buf_input_r (31 downto 0)    <= data_in(63 downto 32);
                        bits_in_buffer               <= 32;
                    when 82 =>
                        buf_output_r(81 downto 0)    <= buf_input_r(81 downto 0);
                        buf_output_r(112 downto 82)  <= data_in(30 downto 0);
                        buf_input_r (32 downto 0)    <= data_in(63 downto 31);
                        bits_in_buffer               <= 33;
                    when 83 =>
                        buf_output_r(82 downto 0)    <= buf_input_r(82 downto 0);
                        buf_output_r(112 downto 83)  <= data_in(29 downto 0);
                        buf_input_r (33 downto 0)    <= data_in(63 downto 30);
                        bits_in_buffer               <= 34;
                    when 84 =>
                        buf_output_r(83 downto 0)    <= buf_input_r(83 downto 0);
                        buf_output_r(112 downto 84)  <= data_in(28 downto 0);
                        buf_input_r (34 downto 0)    <= data_in(63 downto 29);
                        bits_in_buffer               <= 35;
                    when 85 =>
                        buf_output_r(84 downto 0)    <= buf_input_r(84 downto 0);
                        buf_output_r(112 downto 85)  <= data_in(27 downto 0);
                        buf_input_r (35 downto 0)    <= data_in(63 downto 28);
                        bits_in_buffer               <= 36;
                    when 86 =>
                        buf_output_r(85 downto 0)    <= buf_input_r(85 downto 0);
                        buf_output_r(112 downto 86)  <= data_in(26 downto 0);
                        buf_input_r (36 downto 0)    <= data_in(63 downto 27);
                        bits_in_buffer               <= 37;
                    when 87 =>
                        buf_output_r(86 downto 0)    <= buf_input_r(86 downto 0);
                        buf_output_r(112 downto 87)  <= data_in(25 downto 0);
                        buf_input_r (37 downto 0)    <= data_in(63 downto 26);
                        bits_in_buffer               <= 38;
                    when 88 =>
                        buf_output_r(87 downto 0)    <= buf_input_r(87 downto 0);
                        buf_output_r(112 downto 88)  <= data_in(24 downto 0);
                        buf_input_r (38 downto 0)    <= data_in(63 downto 25);
                        bits_in_buffer               <= 39;
                    when 89 =>
                        buf_output_r(88 downto 0)    <= buf_input_r(88 downto 0);
                        buf_output_r(112 downto 89)  <= data_in(23 downto 0);
                        buf_input_r (39 downto 0)    <= data_in(63 downto 24);
                        bits_in_buffer               <= 40;
                    when 90 =>
                        buf_output_r(89 downto 0)    <= buf_input_r(89 downto 0);
                        buf_output_r(112 downto 90)  <= data_in(22 downto 0);
                        buf_input_r (40 downto 0)    <= data_in(63 downto 23);
                        bits_in_buffer               <= 41;
                    when 91 =>
                        buf_output_r(90 downto 0)    <= buf_input_r(90 downto 0);
                        buf_output_r(112 downto 91)  <= data_in(21 downto 0);
                        buf_input_r (41 downto 0)    <= data_in(63 downto 22);
                        bits_in_buffer               <= 42;
                    when 92 =>
                        buf_output_r(91 downto 0)    <= buf_input_r(91 downto 0);
                        buf_output_r(112 downto 92)  <= data_in(20 downto 0);
                        buf_input_r (42 downto 0)    <= data_in(63 downto 21);
                        bits_in_buffer               <= 43;
                    when 93 =>
                        buf_output_r(92 downto 0)    <= buf_input_r(92 downto 0);
                        buf_output_r(112 downto 93)  <= data_in(19 downto 0);
                        buf_input_r (43 downto 0)    <= data_in(63 downto 20);
                        bits_in_buffer               <= 44;
                    when 94 =>
                        buf_output_r(93 downto 0)    <= buf_input_r(93 downto 0);
                        buf_output_r(112 downto 94)  <= data_in(18 downto 0);
                        buf_input_r (44 downto 0)    <= data_in(63 downto 19);
                        bits_in_buffer               <= 45;
                    when 95 =>
                        buf_output_r(94 downto 0)    <= buf_input_r(94 downto 0);
                        buf_output_r(112 downto 95)  <= data_in(17 downto 0);
                        buf_input_r (45 downto 0)    <= data_in(63 downto 18);
                        bits_in_buffer               <= 46;
                    when 96 =>
                        buf_output_r(95 downto 0)    <= buf_input_r(95 downto 0);
                        buf_output_r(112 downto 96)  <= data_in(16 downto 0);
                        buf_input_r (46 downto 0)    <= data_in(63 downto 17);
                        bits_in_buffer               <= 47;
                    when 97 =>
                        buf_output_r(96 downto 0)    <= buf_input_r(96 downto 0);
                        buf_output_r(112 downto 97)  <= data_in(15 downto 0);
                        buf_input_r (47 downto 0)    <= data_in(63 downto 16);
                        bits_in_buffer               <= 48;
                    when 98 =>
                        buf_output_r(97 downto 0)    <= buf_input_r(97 downto 0);
                        buf_output_r(112 downto 98)  <= data_in(14 downto 0);
                        buf_input_r (48 downto 0)    <= data_in(63 downto 15);
                        bits_in_buffer               <= 49;
                    when 99 =>
                        buf_output_r(98 downto 0)    <= buf_input_r(98 downto 0);
                        buf_output_r(112 downto 99)  <= data_in(13 downto 0);
                        buf_input_r (49 downto 0)    <= data_in(63 downto 14);
                        bits_in_buffer               <= 50;
                    when 100 =>
                        buf_output_r(99 downto 0)    <= buf_input_r(99 downto 0);
                        buf_output_r(112 downto 100) <= data_in(12 downto 0);
                        buf_input_r (50 downto 0)    <= data_in(63 downto 13);
                        bits_in_buffer               <= 51;
                    when 101 =>
                        buf_output_r(100 downto 0)   <= buf_input_r(100 downto 0);
                        buf_output_r(112 downto 101) <= data_in(11 downto 0);
                        buf_input_r (51 downto 0)    <= data_in(63 downto 12);
                        bits_in_buffer               <= 52;
                    when 102 =>
                        buf_output_r(101 downto 0)   <= buf_input_r(101 downto 0);
                        buf_output_r(112 downto 102) <= data_in(10 downto 0);
                        buf_input_r (52 downto 0)    <= data_in(63 downto 11);
                        bits_in_buffer               <= 53;
                    when 103 =>
                        buf_output_r(102 downto 0)   <= buf_input_r(102 downto 0);
                        buf_output_r(112 downto 103) <= data_in(9 downto 0);
                        buf_input_r (53 downto 0)    <= data_in(63 downto 10);
                        bits_in_buffer               <= 54;
                    when 104 =>
                        buf_output_r(103 downto 0)   <= buf_input_r(103 downto 0);
                        buf_output_r(112 downto 104) <= data_in(8 downto 0);
                        buf_input_r (54 downto 0)    <= data_in(63 downto 9);
                        bits_in_buffer               <= 55;
                    when 105 =>
                        buf_output_r(104 downto 0)   <= buf_input_r(104 downto 0);
                        buf_output_r(112 downto 105) <= data_in(7 downto 0);
                        buf_input_r (55 downto 0)    <= data_in(63 downto 8);
                        bits_in_buffer               <= 56;
                    when 106 =>
                        buf_output_r(105 downto 0)   <= buf_input_r(105 downto 0);
                        buf_output_r(112 downto 106) <= data_in(6 downto 0);
                        buf_input_r (56 downto 0)    <= data_in(63 downto 7);
                        bits_in_buffer               <= 57;
                    when 107 =>
                        buf_output_r(106 downto 0)   <= buf_input_r(106 downto 0);
                        buf_output_r(112 downto 107) <= data_in(5 downto 0);
                        buf_input_r (57 downto 0)    <= data_in(63 downto 6);
                        bits_in_buffer               <= 58;
                    when 108 =>
                        buf_output_r(107 downto 0)   <= buf_input_r(107 downto 0);
                        buf_output_r(112 downto 108) <= data_in(4 downto 0);
                        buf_input_r (58 downto 0)    <= data_in(63 downto 5);
                        bits_in_buffer               <= 59;
                    when 109 =>
                        buf_output_r(108 downto 0)   <= buf_input_r(108 downto 0);
                        buf_output_r(112 downto 109) <= data_in(3 downto 0);
                        buf_input_r (59 downto 0)    <= data_in(63 downto 4);
                        bits_in_buffer               <= 60;
                    when 110 =>
                        buf_output_r(109 downto 0)   <= buf_input_r(109 downto 0);
                        buf_output_r(112 downto 110) <= data_in(2 downto 0);
                        buf_input_r (60 downto 0)    <= data_in(63 downto 3);
                        bits_in_buffer               <= 61;
                    when 111 =>
                        buf_output_r(110 downto 0)   <= buf_input_r(110 downto 0);
                        buf_output_r(112 downto 111) <= data_in(1 downto 0);
                        buf_input_r (61 downto 0)    <= data_in(63 downto 2);
                        bits_in_buffer               <= 62;
                    when 112 =>
                        buf_output_r(111 downto 0)   <= buf_input_r(111 downto 0);
                        buf_output_r(112 downto 112) <= data_in(0 downto 0);
                        buf_input_r (62 downto 0)    <= data_in(63 downto 1);
                        bits_in_buffer               <= 63;
                    when others =>
                end case;
            else
                out_rdy_r <= '0';
                case bits_in_buffer is
                    when 0 =>
                        buf_input_r (63 downto 0)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 64;
                    when 1 =>
                        buf_input_r (64 downto 1)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 65;
                    when 2 =>
                        buf_input_r (65 downto 2)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 66;
                    when 3 =>
                        buf_input_r (66 downto 3)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 67;
                    when 4 =>
                        buf_input_r (67 downto 4)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 68;
                    when 5 =>
                        buf_input_r (68 downto 5)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 69;
                    when 6 =>
                        buf_input_r (69 downto 6)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 70;
                    when 7 =>
                        buf_input_r (70 downto 7)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 71;
                    when 8 =>
                        buf_input_r (71 downto 8)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 72;
                    when 9 =>
                        buf_input_r (72 downto 9)    <= data_in(63 downto 0);
                        bits_in_buffer               <= 73;
                    when 10 =>
                        buf_input_r (73 downto 10)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 74;
                    when 11 =>
                        buf_input_r (74 downto 11)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 75;
                    when 12 =>
                        buf_input_r (75 downto 12)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 76;
                    when 13 =>
                        buf_input_r (76 downto 13)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 77;
                    when 14 =>
                        buf_input_r (77 downto 14)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 78;
                    when 15 =>
                        buf_input_r (78 downto 15)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 79;
                    when 16 =>
                        buf_input_r (79 downto 16)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 80;
                    when 17 =>
                        buf_input_r (80 downto 17)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 81;
                    when 18 =>
                        buf_input_r (81 downto 18)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 82;
                    when 19 =>
                        buf_input_r (82 downto 19)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 83;
                    when 20 =>
                        buf_input_r (83 downto 20)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 84;
                    when 21 =>
                        buf_input_r (84 downto 21)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 85;
                    when 22 =>
                        buf_input_r (85 downto 22)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 86;
                    when 23 =>
                        buf_input_r (86 downto 23)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 87;
                    when 24 =>
                        buf_input_r (87 downto 24)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 88;
                    when 25 =>
                        buf_input_r (88 downto 25)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 89;
                    when 26 =>
                        buf_input_r (89 downto 26)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 90;
                    when 27 =>
                        buf_input_r (90 downto 27)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 91;
                    when 28 =>
                        buf_input_r (91 downto 28)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 92;
                    when 29 =>
                        buf_input_r (92 downto 29)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 93;
                    when 30 =>
                        buf_input_r (93 downto 30)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 94;
                    when 31 =>
                        buf_input_r (94 downto 31)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 95;
                    when 32 =>
                        buf_input_r (95 downto 32)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 96;
                    when 33 =>
                        buf_input_r (96 downto 33)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 97;
                    when 34 =>
                        buf_input_r (97 downto 34)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 98;
                    when 35 =>
                        buf_input_r (98 downto 35)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 99;
                    when 36 =>
                        buf_input_r (99 downto 36)   <= data_in(63 downto 0);
                        bits_in_buffer               <= 100;
                    when 37 =>
                        buf_input_r (100 downto 37)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 101;
                    when 38 =>
                        buf_input_r (101 downto 38)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 102;
                    when 39 =>
                        buf_input_r (102 downto 39)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 103;
                    when 40 =>
                        buf_input_r (103 downto 40)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 104;
                    when 41 =>
                        buf_input_r (104 downto 41)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 105;
                    when 42 =>
                        buf_input_r (105 downto 42)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 106;
                    when 43 =>
                        buf_input_r (106 downto 43)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 107;
                    when 44 =>
                        buf_input_r (107 downto 44)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 108;
                    when 45 =>
                        buf_input_r (108 downto 45)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 109;
                    when 46 =>
                        buf_input_r (109 downto 46)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 110;
                    when 47 =>
                        buf_input_r (110 downto 47)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 111;
                    when 48 =>
                        buf_input_r (111 downto 48)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 112;
                    when others =>
                end case;
            end if;
        --else
                --out_rdy_r <= '0';
        end if;
    end if;
end process;
end arch_word_expander_64IN_to_113OUT;