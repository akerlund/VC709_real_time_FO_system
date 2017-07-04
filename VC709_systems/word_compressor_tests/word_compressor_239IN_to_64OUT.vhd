----------------------------------------------------------------------------------
    -- Company:  Chalmers
    -- Engineer: Fredrik Åkerlund
    -- 
    -- Create Date: Mon Jul  3 13:58:32 2017

    -- Design Name: 
    -- Module Name: word_compressor_239IN_to_64OUT - arch_word_compressor_239IN_to_64OUT
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
    -- use IEEE.NUMERIC_STD.ALL;

    -- Uncomment the following library declaration if instantiating
    -- any Xilinx leaf cells in this code.
    --library UNISIM;
    --use UNISIM.VComponents.all;
    entity word_compressor_239IN_to_64OUT is

    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;

        enable_in      : in  std_logic;
        congestion_out : out std_logic;

        data_in        : in  std_logic_vector(238 downto 0);
        in_rdy         : in  std_logic;

        buf_out        : out std_logic_vector(63 downto 0);
        out_rdy        : out std_logic

    );
    end word_compressor_239IN_to_64OUT;

architecture arch_word_compressor_239IN_to_64OUT of word_compressor_239IN_to_64OUT is

    -- Input registers.
    signal buf_input_r    : std_logic_vector(477 downto 0);
    signal bits_in_buffer : integer range 0 to 478;

    -- Output registers.
    signal buf_output_r : std_logic_vector(63 downto 0);
    signal out_rdy_r    : std_logic;


    begin

    output_reg_process:
    process(reset_in, user_clk, enable_in)
    begin
        if reset_in = '0' then
            buf_out <= (others=>'0');
            out_rdy <= '0';
        elsif rising_edge(user_clk) and enable_in = '1' then
            buf_out <= buf_output_r;
            out_rdy <= out_rdy_r;
        end if;
    end process;

    the_buffing_process:
    process(reset_in, user_clk, enable_in)
    begin

        if reset_in = '0' then

            buf_input_r    <= (others=>'0');
            bits_in_buffer <= 0;

            buf_output_r   <= (others=>'0');
            out_rdy_r      <= '0';

            congestion_out <= '0';

        elsif rising_edge(user_clk) and enable_in = '1' then

    

        -- If bits_in_buffer is less than 64, the output will consist
        --   of both the input and the buffer.

        case bits_in_buffer is
        when 0 =>
            if in_rdy = '1' then
                buf_output_r(63 downto 0)    <= data_in(63 downto 0);
                buf_input_r(174 downto 0)    <= data_in(238 downto 64);
                bits_in_buffer               <= 175;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 1 =>
            if in_rdy = '1' then
                buf_output_r(0 downto 0)     <= buf_input_r(0 downto 0);
                buf_output_r(63 downto 1)    <= data_in(62 downto 0);
                buf_input_r(175 downto 0)    <= data_in(238 downto 63);
                bits_in_buffer               <= 176;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 2 =>
            if in_rdy = '1' then
                buf_output_r(1 downto 0)     <= buf_input_r(1 downto 0);
                buf_output_r(63 downto 2)    <= data_in(61 downto 0);
                buf_input_r(176 downto 0)    <= data_in(238 downto 62);
                bits_in_buffer               <= 177;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 3 =>
            if in_rdy = '1' then
                buf_output_r(2 downto 0)     <= buf_input_r(2 downto 0);
                buf_output_r(63 downto 3)    <= data_in(60 downto 0);
                buf_input_r(177 downto 0)    <= data_in(238 downto 61);
                bits_in_buffer               <= 178;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 4 =>
            if in_rdy = '1' then
                buf_output_r(3 downto 0)     <= buf_input_r(3 downto 0);
                buf_output_r(63 downto 4)    <= data_in(59 downto 0);
                buf_input_r(178 downto 0)    <= data_in(238 downto 60);
                bits_in_buffer               <= 179;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 5 =>
            if in_rdy = '1' then
                buf_output_r(4 downto 0)     <= buf_input_r(4 downto 0);
                buf_output_r(63 downto 5)    <= data_in(58 downto 0);
                buf_input_r(179 downto 0)    <= data_in(238 downto 59);
                bits_in_buffer               <= 180;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 6 =>
            if in_rdy = '1' then
                buf_output_r(5 downto 0)     <= buf_input_r(5 downto 0);
                buf_output_r(63 downto 6)    <= data_in(57 downto 0);
                buf_input_r(180 downto 0)    <= data_in(238 downto 58);
                bits_in_buffer               <= 181;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 7 =>
            if in_rdy = '1' then
                buf_output_r(6 downto 0)     <= buf_input_r(6 downto 0);
                buf_output_r(63 downto 7)    <= data_in(56 downto 0);
                buf_input_r(181 downto 0)    <= data_in(238 downto 57);
                bits_in_buffer               <= 182;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 8 =>
            if in_rdy = '1' then
                buf_output_r(7 downto 0)     <= buf_input_r(7 downto 0);
                buf_output_r(63 downto 8)    <= data_in(55 downto 0);
                buf_input_r(182 downto 0)    <= data_in(238 downto 56);
                bits_in_buffer               <= 183;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 9 =>
            if in_rdy = '1' then
                buf_output_r(8 downto 0)     <= buf_input_r(8 downto 0);
                buf_output_r(63 downto 9)    <= data_in(54 downto 0);
                buf_input_r(183 downto 0)    <= data_in(238 downto 55);
                bits_in_buffer               <= 184;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 10 =>
            if in_rdy = '1' then
                buf_output_r(9 downto 0)     <= buf_input_r(9 downto 0);
                buf_output_r(63 downto 10)   <= data_in(53 downto 0);
                buf_input_r(184 downto 0)    <= data_in(238 downto 54);
                bits_in_buffer               <= 185;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 11 =>
            if in_rdy = '1' then
                buf_output_r(10 downto 0)    <= buf_input_r(10 downto 0);
                buf_output_r(63 downto 11)   <= data_in(52 downto 0);
                buf_input_r(185 downto 0)    <= data_in(238 downto 53);
                bits_in_buffer               <= 186;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 12 =>
            if in_rdy = '1' then
                buf_output_r(11 downto 0)    <= buf_input_r(11 downto 0);
                buf_output_r(63 downto 12)   <= data_in(51 downto 0);
                buf_input_r(186 downto 0)    <= data_in(238 downto 52);
                bits_in_buffer               <= 187;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 13 =>
            if in_rdy = '1' then
                buf_output_r(12 downto 0)    <= buf_input_r(12 downto 0);
                buf_output_r(63 downto 13)   <= data_in(50 downto 0);
                buf_input_r(187 downto 0)    <= data_in(238 downto 51);
                bits_in_buffer               <= 188;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 14 =>
            if in_rdy = '1' then
                buf_output_r(13 downto 0)    <= buf_input_r(13 downto 0);
                buf_output_r(63 downto 14)   <= data_in(49 downto 0);
                buf_input_r(188 downto 0)    <= data_in(238 downto 50);
                bits_in_buffer               <= 189;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 15 =>
            if in_rdy = '1' then
                buf_output_r(14 downto 0)    <= buf_input_r(14 downto 0);
                buf_output_r(63 downto 15)   <= data_in(48 downto 0);
                buf_input_r(189 downto 0)    <= data_in(238 downto 49);
                bits_in_buffer               <= 190;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 16 =>
            if in_rdy = '1' then
                buf_output_r(15 downto 0)    <= buf_input_r(15 downto 0);
                buf_output_r(63 downto 16)   <= data_in(47 downto 0);
                buf_input_r(190 downto 0)    <= data_in(238 downto 48);
                bits_in_buffer               <= 191;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 17 =>
            if in_rdy = '1' then
                buf_output_r(16 downto 0)    <= buf_input_r(16 downto 0);
                buf_output_r(63 downto 17)   <= data_in(46 downto 0);
                buf_input_r(191 downto 0)    <= data_in(238 downto 47);
                bits_in_buffer               <= 192;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 18 =>
            if in_rdy = '1' then
                buf_output_r(17 downto 0)    <= buf_input_r(17 downto 0);
                buf_output_r(63 downto 18)   <= data_in(45 downto 0);
                buf_input_r(192 downto 0)    <= data_in(238 downto 46);
                bits_in_buffer               <= 193;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 19 =>
            if in_rdy = '1' then
                buf_output_r(18 downto 0)    <= buf_input_r(18 downto 0);
                buf_output_r(63 downto 19)   <= data_in(44 downto 0);
                buf_input_r(193 downto 0)    <= data_in(238 downto 45);
                bits_in_buffer               <= 194;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 20 =>
            if in_rdy = '1' then
                buf_output_r(19 downto 0)    <= buf_input_r(19 downto 0);
                buf_output_r(63 downto 20)   <= data_in(43 downto 0);
                buf_input_r(194 downto 0)    <= data_in(238 downto 44);
                bits_in_buffer               <= 195;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 21 =>
            if in_rdy = '1' then
                buf_output_r(20 downto 0)    <= buf_input_r(20 downto 0);
                buf_output_r(63 downto 21)   <= data_in(42 downto 0);
                buf_input_r(195 downto 0)    <= data_in(238 downto 43);
                bits_in_buffer               <= 196;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 22 =>
            if in_rdy = '1' then
                buf_output_r(21 downto 0)    <= buf_input_r(21 downto 0);
                buf_output_r(63 downto 22)   <= data_in(41 downto 0);
                buf_input_r(196 downto 0)    <= data_in(238 downto 42);
                bits_in_buffer               <= 197;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 23 =>
            if in_rdy = '1' then
                buf_output_r(22 downto 0)    <= buf_input_r(22 downto 0);
                buf_output_r(63 downto 23)   <= data_in(40 downto 0);
                buf_input_r(197 downto 0)    <= data_in(238 downto 41);
                bits_in_buffer               <= 198;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 24 =>
            if in_rdy = '1' then
                buf_output_r(23 downto 0)    <= buf_input_r(23 downto 0);
                buf_output_r(63 downto 24)   <= data_in(39 downto 0);
                buf_input_r(198 downto 0)    <= data_in(238 downto 40);
                bits_in_buffer               <= 199;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 25 =>
            if in_rdy = '1' then
                buf_output_r(24 downto 0)    <= buf_input_r(24 downto 0);
                buf_output_r(63 downto 25)   <= data_in(38 downto 0);
                buf_input_r(199 downto 0)    <= data_in(238 downto 39);
                bits_in_buffer               <= 200;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 26 =>
            if in_rdy = '1' then
                buf_output_r(25 downto 0)    <= buf_input_r(25 downto 0);
                buf_output_r(63 downto 26)   <= data_in(37 downto 0);
                buf_input_r(200 downto 0)    <= data_in(238 downto 38);
                bits_in_buffer               <= 201;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 27 =>
            if in_rdy = '1' then
                buf_output_r(26 downto 0)    <= buf_input_r(26 downto 0);
                buf_output_r(63 downto 27)   <= data_in(36 downto 0);
                buf_input_r(201 downto 0)    <= data_in(238 downto 37);
                bits_in_buffer               <= 202;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 28 =>
            if in_rdy = '1' then
                buf_output_r(27 downto 0)    <= buf_input_r(27 downto 0);
                buf_output_r(63 downto 28)   <= data_in(35 downto 0);
                buf_input_r(202 downto 0)    <= data_in(238 downto 36);
                bits_in_buffer               <= 203;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 29 =>
            if in_rdy = '1' then
                buf_output_r(28 downto 0)    <= buf_input_r(28 downto 0);
                buf_output_r(63 downto 29)   <= data_in(34 downto 0);
                buf_input_r(203 downto 0)    <= data_in(238 downto 35);
                bits_in_buffer               <= 204;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 30 =>
            if in_rdy = '1' then
                buf_output_r(29 downto 0)    <= buf_input_r(29 downto 0);
                buf_output_r(63 downto 30)   <= data_in(33 downto 0);
                buf_input_r(204 downto 0)    <= data_in(238 downto 34);
                bits_in_buffer               <= 205;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 31 =>
            if in_rdy = '1' then
                buf_output_r(30 downto 0)    <= buf_input_r(30 downto 0);
                buf_output_r(63 downto 31)   <= data_in(32 downto 0);
                buf_input_r(205 downto 0)    <= data_in(238 downto 33);
                bits_in_buffer               <= 206;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 32 =>
            if in_rdy = '1' then
                buf_output_r(31 downto 0)    <= buf_input_r(31 downto 0);
                buf_output_r(63 downto 32)   <= data_in(31 downto 0);
                buf_input_r(206 downto 0)    <= data_in(238 downto 32);
                bits_in_buffer               <= 207;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 33 =>
            if in_rdy = '1' then
                buf_output_r(32 downto 0)    <= buf_input_r(32 downto 0);
                buf_output_r(63 downto 33)   <= data_in(30 downto 0);
                buf_input_r(207 downto 0)    <= data_in(238 downto 31);
                bits_in_buffer               <= 208;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 34 =>
            if in_rdy = '1' then
                buf_output_r(33 downto 0)    <= buf_input_r(33 downto 0);
                buf_output_r(63 downto 34)   <= data_in(29 downto 0);
                buf_input_r(208 downto 0)    <= data_in(238 downto 30);
                bits_in_buffer               <= 209;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 35 =>
            if in_rdy = '1' then
                buf_output_r(34 downto 0)    <= buf_input_r(34 downto 0);
                buf_output_r(63 downto 35)   <= data_in(28 downto 0);
                buf_input_r(209 downto 0)    <= data_in(238 downto 29);
                bits_in_buffer               <= 210;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 36 =>
            if in_rdy = '1' then
                buf_output_r(35 downto 0)    <= buf_input_r(35 downto 0);
                buf_output_r(63 downto 36)   <= data_in(27 downto 0);
                buf_input_r(210 downto 0)    <= data_in(238 downto 28);
                bits_in_buffer               <= 211;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 37 =>
            if in_rdy = '1' then
                buf_output_r(36 downto 0)    <= buf_input_r(36 downto 0);
                buf_output_r(63 downto 37)   <= data_in(26 downto 0);
                buf_input_r(211 downto 0)    <= data_in(238 downto 27);
                bits_in_buffer               <= 212;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 38 =>
            if in_rdy = '1' then
                buf_output_r(37 downto 0)    <= buf_input_r(37 downto 0);
                buf_output_r(63 downto 38)   <= data_in(25 downto 0);
                buf_input_r(212 downto 0)    <= data_in(238 downto 26);
                bits_in_buffer               <= 213;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 39 =>
            if in_rdy = '1' then
                buf_output_r(38 downto 0)    <= buf_input_r(38 downto 0);
                buf_output_r(63 downto 39)   <= data_in(24 downto 0);
                buf_input_r(213 downto 0)    <= data_in(238 downto 25);
                bits_in_buffer               <= 214;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 40 =>
            if in_rdy = '1' then
                buf_output_r(39 downto 0)    <= buf_input_r(39 downto 0);
                buf_output_r(63 downto 40)   <= data_in(23 downto 0);
                buf_input_r(214 downto 0)    <= data_in(238 downto 24);
                bits_in_buffer               <= 215;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 41 =>
            if in_rdy = '1' then
                buf_output_r(40 downto 0)    <= buf_input_r(40 downto 0);
                buf_output_r(63 downto 41)   <= data_in(22 downto 0);
                buf_input_r(215 downto 0)    <= data_in(238 downto 23);
                bits_in_buffer               <= 216;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 42 =>
            if in_rdy = '1' then
                buf_output_r(41 downto 0)    <= buf_input_r(41 downto 0);
                buf_output_r(63 downto 42)   <= data_in(21 downto 0);
                buf_input_r(216 downto 0)    <= data_in(238 downto 22);
                bits_in_buffer               <= 217;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 43 =>
            if in_rdy = '1' then
                buf_output_r(42 downto 0)    <= buf_input_r(42 downto 0);
                buf_output_r(63 downto 43)   <= data_in(20 downto 0);
                buf_input_r(217 downto 0)    <= data_in(238 downto 21);
                bits_in_buffer               <= 218;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 44 =>
            if in_rdy = '1' then
                buf_output_r(43 downto 0)    <= buf_input_r(43 downto 0);
                buf_output_r(63 downto 44)   <= data_in(19 downto 0);
                buf_input_r(218 downto 0)    <= data_in(238 downto 20);
                bits_in_buffer               <= 219;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 45 =>
            if in_rdy = '1' then
                buf_output_r(44 downto 0)    <= buf_input_r(44 downto 0);
                buf_output_r(63 downto 45)   <= data_in(18 downto 0);
                buf_input_r(219 downto 0)    <= data_in(238 downto 19);
                bits_in_buffer               <= 220;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 46 =>
            if in_rdy = '1' then
                buf_output_r(45 downto 0)    <= buf_input_r(45 downto 0);
                buf_output_r(63 downto 46)   <= data_in(17 downto 0);
                buf_input_r(220 downto 0)    <= data_in(238 downto 18);
                bits_in_buffer               <= 221;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 47 =>
            if in_rdy = '1' then
                buf_output_r(46 downto 0)    <= buf_input_r(46 downto 0);
                buf_output_r(63 downto 47)   <= data_in(16 downto 0);
                buf_input_r(221 downto 0)    <= data_in(238 downto 17);
                bits_in_buffer               <= 222;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 48 =>
            if in_rdy = '1' then
                buf_output_r(47 downto 0)    <= buf_input_r(47 downto 0);
                buf_output_r(63 downto 48)   <= data_in(15 downto 0);
                buf_input_r(222 downto 0)    <= data_in(238 downto 16);
                bits_in_buffer               <= 223;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 49 =>
            if in_rdy = '1' then
                buf_output_r(48 downto 0)    <= buf_input_r(48 downto 0);
                buf_output_r(63 downto 49)   <= data_in(14 downto 0);
                buf_input_r(223 downto 0)    <= data_in(238 downto 15);
                bits_in_buffer               <= 224;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 50 =>
            if in_rdy = '1' then
                buf_output_r(49 downto 0)    <= buf_input_r(49 downto 0);
                buf_output_r(63 downto 50)   <= data_in(13 downto 0);
                buf_input_r(224 downto 0)    <= data_in(238 downto 14);
                bits_in_buffer               <= 225;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 51 =>
            if in_rdy = '1' then
                buf_output_r(50 downto 0)    <= buf_input_r(50 downto 0);
                buf_output_r(63 downto 51)   <= data_in(12 downto 0);
                buf_input_r(225 downto 0)    <= data_in(238 downto 13);
                bits_in_buffer               <= 226;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 52 =>
            if in_rdy = '1' then
                buf_output_r(51 downto 0)    <= buf_input_r(51 downto 0);
                buf_output_r(63 downto 52)   <= data_in(11 downto 0);
                buf_input_r(226 downto 0)    <= data_in(238 downto 12);
                bits_in_buffer               <= 227;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 53 =>
            if in_rdy = '1' then
                buf_output_r(52 downto 0)    <= buf_input_r(52 downto 0);
                buf_output_r(63 downto 53)   <= data_in(10 downto 0);
                buf_input_r(227 downto 0)    <= data_in(238 downto 11);
                bits_in_buffer               <= 228;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 54 =>
            if in_rdy = '1' then
                buf_output_r(53 downto 0)    <= buf_input_r(53 downto 0);
                buf_output_r(63 downto 54)   <= data_in(9 downto 0);
                buf_input_r(228 downto 0)    <= data_in(238 downto 10);
                bits_in_buffer               <= 229;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 55 =>
            if in_rdy = '1' then
                buf_output_r(54 downto 0)    <= buf_input_r(54 downto 0);
                buf_output_r(63 downto 55)   <= data_in(8 downto 0);
                buf_input_r(229 downto 0)    <= data_in(238 downto 9);
                bits_in_buffer               <= 230;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 56 =>
            if in_rdy = '1' then
                buf_output_r(55 downto 0)    <= buf_input_r(55 downto 0);
                buf_output_r(63 downto 56)   <= data_in(7 downto 0);
                buf_input_r(230 downto 0)    <= data_in(238 downto 8);
                bits_in_buffer               <= 231;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 57 =>
            if in_rdy = '1' then
                buf_output_r(56 downto 0)    <= buf_input_r(56 downto 0);
                buf_output_r(63 downto 57)   <= data_in(6 downto 0);
                buf_input_r(231 downto 0)    <= data_in(238 downto 7);
                bits_in_buffer               <= 232;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 58 =>
            if in_rdy = '1' then
                buf_output_r(57 downto 0)    <= buf_input_r(57 downto 0);
                buf_output_r(63 downto 58)   <= data_in(5 downto 0);
                buf_input_r(232 downto 0)    <= data_in(238 downto 6);
                bits_in_buffer               <= 233;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 59 =>
            if in_rdy = '1' then
                buf_output_r(58 downto 0)    <= buf_input_r(58 downto 0);
                buf_output_r(63 downto 59)   <= data_in(4 downto 0);
                buf_input_r(233 downto 0)    <= data_in(238 downto 5);
                bits_in_buffer               <= 234;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 60 =>
            if in_rdy = '1' then
                buf_output_r(59 downto 0)    <= buf_input_r(59 downto 0);
                buf_output_r(63 downto 60)   <= data_in(3 downto 0);
                buf_input_r(234 downto 0)    <= data_in(238 downto 4);
                bits_in_buffer               <= 235;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 61 =>
            if in_rdy = '1' then
                buf_output_r(60 downto 0)    <= buf_input_r(60 downto 0);
                buf_output_r(63 downto 61)   <= data_in(2 downto 0);
                buf_input_r(235 downto 0)    <= data_in(238 downto 3);
                bits_in_buffer               <= 236;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 62 =>
            if in_rdy = '1' then
                buf_output_r(61 downto 0)    <= buf_input_r(61 downto 0);
                buf_output_r(63 downto 62)   <= data_in(1 downto 0);
                buf_input_r(236 downto 0)    <= data_in(238 downto 2);
                bits_in_buffer               <= 237;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 63 =>
            if in_rdy = '1' then
                buf_output_r(62 downto 0)    <= buf_input_r(62 downto 0);
                buf_output_r(63 downto 63)   <= data_in(0 downto 0);
                buf_input_r(237 downto 0)    <= data_in(238 downto 1);
                bits_in_buffer               <= 238;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';


        -- For this range, the buffer has enough bits saved for the output.

        when 64 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            if in_rdy = '1' then
                buf_input_r(238 downto 0)    <= data_in(238 downto 0);
                buf_input_r(477 downto 239)  <= data_in(238 downto 0);
                bits_in_buffer               <= 239;
            else
                bits_in_buffer               <= 0;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 65 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(0 downto 0)          <= buf_input_r(64 downto 64);
            if in_rdy = '1' then
                buf_input_r(239 downto 1)    <= data_in(238 downto 0);
                bits_in_buffer               <= 240;
            else
                bits_in_buffer               <= 1;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 66 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(1 downto 0)          <= buf_input_r(65 downto 64);
            if in_rdy = '1' then
                buf_input_r(240 downto 2)    <= data_in(238 downto 0);
                bits_in_buffer               <= 241;
            else
                bits_in_buffer               <= 2;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 67 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(2 downto 0)          <= buf_input_r(66 downto 64);
            if in_rdy = '1' then
                buf_input_r(241 downto 3)    <= data_in(238 downto 0);
                bits_in_buffer               <= 242;
            else
                bits_in_buffer               <= 3;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 68 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(3 downto 0)          <= buf_input_r(67 downto 64);
            if in_rdy = '1' then
                buf_input_r(242 downto 4)    <= data_in(238 downto 0);
                bits_in_buffer               <= 243;
            else
                bits_in_buffer               <= 4;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 69 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(4 downto 0)          <= buf_input_r(68 downto 64);
            if in_rdy = '1' then
                buf_input_r(243 downto 5)    <= data_in(238 downto 0);
                bits_in_buffer               <= 244;
            else
                bits_in_buffer               <= 5;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 70 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(5 downto 0)          <= buf_input_r(69 downto 64);
            if in_rdy = '1' then
                buf_input_r(244 downto 6)    <= data_in(238 downto 0);
                bits_in_buffer               <= 245;
            else
                bits_in_buffer               <= 6;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 71 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(6 downto 0)          <= buf_input_r(70 downto 64);
            if in_rdy = '1' then
                buf_input_r(245 downto 7)    <= data_in(238 downto 0);
                bits_in_buffer               <= 246;
            else
                bits_in_buffer               <= 7;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 72 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(7 downto 0)          <= buf_input_r(71 downto 64);
            if in_rdy = '1' then
                buf_input_r(246 downto 8)    <= data_in(238 downto 0);
                bits_in_buffer               <= 247;
            else
                bits_in_buffer               <= 8;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 73 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(8 downto 0)          <= buf_input_r(72 downto 64);
            if in_rdy = '1' then
                buf_input_r(247 downto 9)    <= data_in(238 downto 0);
                bits_in_buffer               <= 248;
            else
                bits_in_buffer               <= 9;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 74 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(9 downto 0)          <= buf_input_r(73 downto 64);
            if in_rdy = '1' then
                buf_input_r(248 downto 10)   <= data_in(238 downto 0);
                bits_in_buffer               <= 249;
            else
                bits_in_buffer               <= 10;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 75 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(10 downto 0)         <= buf_input_r(74 downto 64);
            if in_rdy = '1' then
                buf_input_r(249 downto 11)   <= data_in(238 downto 0);
                bits_in_buffer               <= 250;
            else
                bits_in_buffer               <= 11;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 76 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(11 downto 0)         <= buf_input_r(75 downto 64);
            if in_rdy = '1' then
                buf_input_r(250 downto 12)   <= data_in(238 downto 0);
                bits_in_buffer               <= 251;
            else
                bits_in_buffer               <= 12;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 77 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(12 downto 0)         <= buf_input_r(76 downto 64);
            if in_rdy = '1' then
                buf_input_r(251 downto 13)   <= data_in(238 downto 0);
                bits_in_buffer               <= 252;
            else
                bits_in_buffer               <= 13;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 78 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(13 downto 0)         <= buf_input_r(77 downto 64);
            if in_rdy = '1' then
                buf_input_r(252 downto 14)   <= data_in(238 downto 0);
                bits_in_buffer               <= 253;
            else
                bits_in_buffer               <= 14;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 79 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(14 downto 0)         <= buf_input_r(78 downto 64);
            if in_rdy = '1' then
                buf_input_r(253 downto 15)   <= data_in(238 downto 0);
                bits_in_buffer               <= 254;
            else
                bits_in_buffer               <= 15;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 80 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(15 downto 0)         <= buf_input_r(79 downto 64);
            if in_rdy = '1' then
                buf_input_r(254 downto 16)   <= data_in(238 downto 0);
                bits_in_buffer               <= 255;
            else
                bits_in_buffer               <= 16;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 81 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(16 downto 0)         <= buf_input_r(80 downto 64);
            if in_rdy = '1' then
                buf_input_r(255 downto 17)   <= data_in(238 downto 0);
                bits_in_buffer               <= 256;
            else
                bits_in_buffer               <= 17;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 82 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(17 downto 0)         <= buf_input_r(81 downto 64);
            if in_rdy = '1' then
                buf_input_r(256 downto 18)   <= data_in(238 downto 0);
                bits_in_buffer               <= 257;
            else
                bits_in_buffer               <= 18;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 83 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(18 downto 0)         <= buf_input_r(82 downto 64);
            if in_rdy = '1' then
                buf_input_r(257 downto 19)   <= data_in(238 downto 0);
                bits_in_buffer               <= 258;
            else
                bits_in_buffer               <= 19;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 84 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(19 downto 0)         <= buf_input_r(83 downto 64);
            if in_rdy = '1' then
                buf_input_r(258 downto 20)   <= data_in(238 downto 0);
                bits_in_buffer               <= 259;
            else
                bits_in_buffer               <= 20;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 85 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(20 downto 0)         <= buf_input_r(84 downto 64);
            if in_rdy = '1' then
                buf_input_r(259 downto 21)   <= data_in(238 downto 0);
                bits_in_buffer               <= 260;
            else
                bits_in_buffer               <= 21;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 86 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(21 downto 0)         <= buf_input_r(85 downto 64);
            if in_rdy = '1' then
                buf_input_r(260 downto 22)   <= data_in(238 downto 0);
                bits_in_buffer               <= 261;
            else
                bits_in_buffer               <= 22;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 87 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(22 downto 0)         <= buf_input_r(86 downto 64);
            if in_rdy = '1' then
                buf_input_r(261 downto 23)   <= data_in(238 downto 0);
                bits_in_buffer               <= 262;
            else
                bits_in_buffer               <= 23;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 88 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(23 downto 0)         <= buf_input_r(87 downto 64);
            if in_rdy = '1' then
                buf_input_r(262 downto 24)   <= data_in(238 downto 0);
                bits_in_buffer               <= 263;
            else
                bits_in_buffer               <= 24;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 89 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(24 downto 0)         <= buf_input_r(88 downto 64);
            if in_rdy = '1' then
                buf_input_r(263 downto 25)   <= data_in(238 downto 0);
                bits_in_buffer               <= 264;
            else
                bits_in_buffer               <= 25;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 90 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(25 downto 0)         <= buf_input_r(89 downto 64);
            if in_rdy = '1' then
                buf_input_r(264 downto 26)   <= data_in(238 downto 0);
                bits_in_buffer               <= 265;
            else
                bits_in_buffer               <= 26;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 91 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(26 downto 0)         <= buf_input_r(90 downto 64);
            if in_rdy = '1' then
                buf_input_r(265 downto 27)   <= data_in(238 downto 0);
                bits_in_buffer               <= 266;
            else
                bits_in_buffer               <= 27;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 92 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(27 downto 0)         <= buf_input_r(91 downto 64);
            if in_rdy = '1' then
                buf_input_r(266 downto 28)   <= data_in(238 downto 0);
                bits_in_buffer               <= 267;
            else
                bits_in_buffer               <= 28;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 93 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(28 downto 0)         <= buf_input_r(92 downto 64);
            if in_rdy = '1' then
                buf_input_r(267 downto 29)   <= data_in(238 downto 0);
                bits_in_buffer               <= 268;
            else
                bits_in_buffer               <= 29;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 94 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(29 downto 0)         <= buf_input_r(93 downto 64);
            if in_rdy = '1' then
                buf_input_r(268 downto 30)   <= data_in(238 downto 0);
                bits_in_buffer               <= 269;
            else
                bits_in_buffer               <= 30;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 95 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(30 downto 0)         <= buf_input_r(94 downto 64);
            if in_rdy = '1' then
                buf_input_r(269 downto 31)   <= data_in(238 downto 0);
                bits_in_buffer               <= 270;
            else
                bits_in_buffer               <= 31;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 96 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(31 downto 0)         <= buf_input_r(95 downto 64);
            if in_rdy = '1' then
                buf_input_r(270 downto 32)   <= data_in(238 downto 0);
                bits_in_buffer               <= 271;
            else
                bits_in_buffer               <= 32;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 97 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(32 downto 0)         <= buf_input_r(96 downto 64);
            if in_rdy = '1' then
                buf_input_r(271 downto 33)   <= data_in(238 downto 0);
                bits_in_buffer               <= 272;
            else
                bits_in_buffer               <= 33;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 98 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(33 downto 0)         <= buf_input_r(97 downto 64);
            if in_rdy = '1' then
                buf_input_r(272 downto 34)   <= data_in(238 downto 0);
                bits_in_buffer               <= 273;
            else
                bits_in_buffer               <= 34;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 99 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(34 downto 0)         <= buf_input_r(98 downto 64);
            if in_rdy = '1' then
                buf_input_r(273 downto 35)   <= data_in(238 downto 0);
                bits_in_buffer               <= 274;
            else
                bits_in_buffer               <= 35;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 100 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(35 downto 0)         <= buf_input_r(99 downto 64);
            if in_rdy = '1' then
                buf_input_r(274 downto 36)   <= data_in(238 downto 0);
                bits_in_buffer               <= 275;
            else
                bits_in_buffer               <= 36;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 101 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(36 downto 0)         <= buf_input_r(100 downto 64);
            if in_rdy = '1' then
                buf_input_r(275 downto 37)   <= data_in(238 downto 0);
                bits_in_buffer               <= 276;
            else
                bits_in_buffer               <= 37;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 102 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(37 downto 0)         <= buf_input_r(101 downto 64);
            if in_rdy = '1' then
                buf_input_r(276 downto 38)   <= data_in(238 downto 0);
                bits_in_buffer               <= 277;
            else
                bits_in_buffer               <= 38;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 103 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(38 downto 0)         <= buf_input_r(102 downto 64);
            if in_rdy = '1' then
                buf_input_r(277 downto 39)   <= data_in(238 downto 0);
                bits_in_buffer               <= 278;
            else
                bits_in_buffer               <= 39;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 104 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(39 downto 0)         <= buf_input_r(103 downto 64);
            if in_rdy = '1' then
                buf_input_r(278 downto 40)   <= data_in(238 downto 0);
                bits_in_buffer               <= 279;
            else
                bits_in_buffer               <= 40;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 105 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(40 downto 0)         <= buf_input_r(104 downto 64);
            if in_rdy = '1' then
                buf_input_r(279 downto 41)   <= data_in(238 downto 0);
                bits_in_buffer               <= 280;
            else
                bits_in_buffer               <= 41;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 106 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(41 downto 0)         <= buf_input_r(105 downto 64);
            if in_rdy = '1' then
                buf_input_r(280 downto 42)   <= data_in(238 downto 0);
                bits_in_buffer               <= 281;
            else
                bits_in_buffer               <= 42;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 107 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(42 downto 0)         <= buf_input_r(106 downto 64);
            if in_rdy = '1' then
                buf_input_r(281 downto 43)   <= data_in(238 downto 0);
                bits_in_buffer               <= 282;
            else
                bits_in_buffer               <= 43;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 108 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(43 downto 0)         <= buf_input_r(107 downto 64);
            if in_rdy = '1' then
                buf_input_r(282 downto 44)   <= data_in(238 downto 0);
                bits_in_buffer               <= 283;
            else
                bits_in_buffer               <= 44;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 109 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(44 downto 0)         <= buf_input_r(108 downto 64);
            if in_rdy = '1' then
                buf_input_r(283 downto 45)   <= data_in(238 downto 0);
                bits_in_buffer               <= 284;
            else
                bits_in_buffer               <= 45;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 110 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(45 downto 0)         <= buf_input_r(109 downto 64);
            if in_rdy = '1' then
                buf_input_r(284 downto 46)   <= data_in(238 downto 0);
                bits_in_buffer               <= 285;
            else
                bits_in_buffer               <= 46;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 111 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(46 downto 0)         <= buf_input_r(110 downto 64);
            if in_rdy = '1' then
                buf_input_r(285 downto 47)   <= data_in(238 downto 0);
                bits_in_buffer               <= 286;
            else
                bits_in_buffer               <= 47;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 112 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(47 downto 0)         <= buf_input_r(111 downto 64);
            if in_rdy = '1' then
                buf_input_r(286 downto 48)   <= data_in(238 downto 0);
                bits_in_buffer               <= 287;
            else
                bits_in_buffer               <= 48;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 113 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(48 downto 0)         <= buf_input_r(112 downto 64);
            if in_rdy = '1' then
                buf_input_r(287 downto 49)   <= data_in(238 downto 0);
                bits_in_buffer               <= 288;
            else
                bits_in_buffer               <= 49;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 114 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(49 downto 0)         <= buf_input_r(113 downto 64);
            if in_rdy = '1' then
                buf_input_r(288 downto 50)   <= data_in(238 downto 0);
                bits_in_buffer               <= 289;
            else
                bits_in_buffer               <= 50;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 115 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(50 downto 0)         <= buf_input_r(114 downto 64);
            if in_rdy = '1' then
                buf_input_r(289 downto 51)   <= data_in(238 downto 0);
                bits_in_buffer               <= 290;
            else
                bits_in_buffer               <= 51;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 116 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(51 downto 0)         <= buf_input_r(115 downto 64);
            if in_rdy = '1' then
                buf_input_r(290 downto 52)   <= data_in(238 downto 0);
                bits_in_buffer               <= 291;
            else
                bits_in_buffer               <= 52;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 117 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(52 downto 0)         <= buf_input_r(116 downto 64);
            if in_rdy = '1' then
                buf_input_r(291 downto 53)   <= data_in(238 downto 0);
                bits_in_buffer               <= 292;
            else
                bits_in_buffer               <= 53;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 118 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(53 downto 0)         <= buf_input_r(117 downto 64);
            if in_rdy = '1' then
                buf_input_r(292 downto 54)   <= data_in(238 downto 0);
                bits_in_buffer               <= 293;
            else
                bits_in_buffer               <= 54;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 119 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(54 downto 0)         <= buf_input_r(118 downto 64);
            if in_rdy = '1' then
                buf_input_r(293 downto 55)   <= data_in(238 downto 0);
                bits_in_buffer               <= 294;
            else
                bits_in_buffer               <= 55;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 120 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(55 downto 0)         <= buf_input_r(119 downto 64);
            if in_rdy = '1' then
                buf_input_r(294 downto 56)   <= data_in(238 downto 0);
                bits_in_buffer               <= 295;
            else
                bits_in_buffer               <= 56;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 121 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(56 downto 0)         <= buf_input_r(120 downto 64);
            if in_rdy = '1' then
                buf_input_r(295 downto 57)   <= data_in(238 downto 0);
                bits_in_buffer               <= 296;
            else
                bits_in_buffer               <= 57;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 122 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(57 downto 0)         <= buf_input_r(121 downto 64);
            if in_rdy = '1' then
                buf_input_r(296 downto 58)   <= data_in(238 downto 0);
                bits_in_buffer               <= 297;
            else
                bits_in_buffer               <= 58;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 123 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(58 downto 0)         <= buf_input_r(122 downto 64);
            if in_rdy = '1' then
                buf_input_r(297 downto 59)   <= data_in(238 downto 0);
                bits_in_buffer               <= 298;
            else
                bits_in_buffer               <= 59;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 124 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(59 downto 0)         <= buf_input_r(123 downto 64);
            if in_rdy = '1' then
                buf_input_r(298 downto 60)   <= data_in(238 downto 0);
                bits_in_buffer               <= 299;
            else
                bits_in_buffer               <= 60;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 125 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(60 downto 0)         <= buf_input_r(124 downto 64);
            if in_rdy = '1' then
                buf_input_r(299 downto 61)   <= data_in(238 downto 0);
                bits_in_buffer               <= 300;
            else
                bits_in_buffer               <= 61;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 126 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(61 downto 0)         <= buf_input_r(125 downto 64);
            if in_rdy = '1' then
                buf_input_r(300 downto 62)   <= data_in(238 downto 0);
                bits_in_buffer               <= 301;
            else
                bits_in_buffer               <= 62;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 127 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(62 downto 0)         <= buf_input_r(126 downto 64);
            if in_rdy = '1' then
                buf_input_r(301 downto 63)   <= data_in(238 downto 0);
                bits_in_buffer               <= 302;
            else
                bits_in_buffer               <= 63;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 128 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(63 downto 0)         <= buf_input_r(127 downto 64);
            if in_rdy = '1' then
                buf_input_r(302 downto 64)   <= data_in(238 downto 0);
                bits_in_buffer               <= 303;
            else
                bits_in_buffer               <= 64;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 129 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(64 downto 0)         <= buf_input_r(128 downto 64);
            if in_rdy = '1' then
                buf_input_r(303 downto 65)   <= data_in(238 downto 0);
                bits_in_buffer               <= 304;
            else
                bits_in_buffer               <= 65;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 130 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(65 downto 0)         <= buf_input_r(129 downto 64);
            if in_rdy = '1' then
                buf_input_r(304 downto 66)   <= data_in(238 downto 0);
                bits_in_buffer               <= 305;
            else
                bits_in_buffer               <= 66;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 131 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(66 downto 0)         <= buf_input_r(130 downto 64);
            if in_rdy = '1' then
                buf_input_r(305 downto 67)   <= data_in(238 downto 0);
                bits_in_buffer               <= 306;
            else
                bits_in_buffer               <= 67;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 132 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(67 downto 0)         <= buf_input_r(131 downto 64);
            if in_rdy = '1' then
                buf_input_r(306 downto 68)   <= data_in(238 downto 0);
                bits_in_buffer               <= 307;
            else
                bits_in_buffer               <= 68;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 133 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(68 downto 0)         <= buf_input_r(132 downto 64);
            if in_rdy = '1' then
                buf_input_r(307 downto 69)   <= data_in(238 downto 0);
                bits_in_buffer               <= 308;
            else
                bits_in_buffer               <= 69;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 134 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(69 downto 0)         <= buf_input_r(133 downto 64);
            if in_rdy = '1' then
                buf_input_r(308 downto 70)   <= data_in(238 downto 0);
                bits_in_buffer               <= 309;
            else
                bits_in_buffer               <= 70;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 135 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(70 downto 0)         <= buf_input_r(134 downto 64);
            if in_rdy = '1' then
                buf_input_r(309 downto 71)   <= data_in(238 downto 0);
                bits_in_buffer               <= 310;
            else
                bits_in_buffer               <= 71;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 136 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(71 downto 0)         <= buf_input_r(135 downto 64);
            if in_rdy = '1' then
                buf_input_r(310 downto 72)   <= data_in(238 downto 0);
                bits_in_buffer               <= 311;
            else
                bits_in_buffer               <= 72;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 137 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(72 downto 0)         <= buf_input_r(136 downto 64);
            if in_rdy = '1' then
                buf_input_r(311 downto 73)   <= data_in(238 downto 0);
                bits_in_buffer               <= 312;
            else
                bits_in_buffer               <= 73;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 138 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(73 downto 0)         <= buf_input_r(137 downto 64);
            if in_rdy = '1' then
                buf_input_r(312 downto 74)   <= data_in(238 downto 0);
                bits_in_buffer               <= 313;
            else
                bits_in_buffer               <= 74;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 139 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(74 downto 0)         <= buf_input_r(138 downto 64);
            if in_rdy = '1' then
                buf_input_r(313 downto 75)   <= data_in(238 downto 0);
                bits_in_buffer               <= 314;
            else
                bits_in_buffer               <= 75;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 140 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(75 downto 0)         <= buf_input_r(139 downto 64);
            if in_rdy = '1' then
                buf_input_r(314 downto 76)   <= data_in(238 downto 0);
                bits_in_buffer               <= 315;
            else
                bits_in_buffer               <= 76;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 141 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(76 downto 0)         <= buf_input_r(140 downto 64);
            if in_rdy = '1' then
                buf_input_r(315 downto 77)   <= data_in(238 downto 0);
                bits_in_buffer               <= 316;
            else
                bits_in_buffer               <= 77;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 142 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(77 downto 0)         <= buf_input_r(141 downto 64);
            if in_rdy = '1' then
                buf_input_r(316 downto 78)   <= data_in(238 downto 0);
                bits_in_buffer               <= 317;
            else
                bits_in_buffer               <= 78;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 143 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(78 downto 0)         <= buf_input_r(142 downto 64);
            if in_rdy = '1' then
                buf_input_r(317 downto 79)   <= data_in(238 downto 0);
                bits_in_buffer               <= 318;
            else
                bits_in_buffer               <= 79;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 144 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(79 downto 0)         <= buf_input_r(143 downto 64);
            if in_rdy = '1' then
                buf_input_r(318 downto 80)   <= data_in(238 downto 0);
                bits_in_buffer               <= 319;
            else
                bits_in_buffer               <= 80;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 145 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(80 downto 0)         <= buf_input_r(144 downto 64);
            if in_rdy = '1' then
                buf_input_r(319 downto 81)   <= data_in(238 downto 0);
                bits_in_buffer               <= 320;
            else
                bits_in_buffer               <= 81;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 146 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(81 downto 0)         <= buf_input_r(145 downto 64);
            if in_rdy = '1' then
                buf_input_r(320 downto 82)   <= data_in(238 downto 0);
                bits_in_buffer               <= 321;
            else
                bits_in_buffer               <= 82;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 147 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(82 downto 0)         <= buf_input_r(146 downto 64);
            if in_rdy = '1' then
                buf_input_r(321 downto 83)   <= data_in(238 downto 0);
                bits_in_buffer               <= 322;
            else
                bits_in_buffer               <= 83;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 148 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(83 downto 0)         <= buf_input_r(147 downto 64);
            if in_rdy = '1' then
                buf_input_r(322 downto 84)   <= data_in(238 downto 0);
                bits_in_buffer               <= 323;
            else
                bits_in_buffer               <= 84;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 149 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(84 downto 0)         <= buf_input_r(148 downto 64);
            if in_rdy = '1' then
                buf_input_r(323 downto 85)   <= data_in(238 downto 0);
                bits_in_buffer               <= 324;
            else
                bits_in_buffer               <= 85;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 150 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(85 downto 0)         <= buf_input_r(149 downto 64);
            if in_rdy = '1' then
                buf_input_r(324 downto 86)   <= data_in(238 downto 0);
                bits_in_buffer               <= 325;
            else
                bits_in_buffer               <= 86;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 151 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(86 downto 0)         <= buf_input_r(150 downto 64);
            if in_rdy = '1' then
                buf_input_r(325 downto 87)   <= data_in(238 downto 0);
                bits_in_buffer               <= 326;
            else
                bits_in_buffer               <= 87;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 152 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(87 downto 0)         <= buf_input_r(151 downto 64);
            if in_rdy = '1' then
                buf_input_r(326 downto 88)   <= data_in(238 downto 0);
                bits_in_buffer               <= 327;
            else
                bits_in_buffer               <= 88;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 153 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(88 downto 0)         <= buf_input_r(152 downto 64);
            if in_rdy = '1' then
                buf_input_r(327 downto 89)   <= data_in(238 downto 0);
                bits_in_buffer               <= 328;
            else
                bits_in_buffer               <= 89;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 154 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(89 downto 0)         <= buf_input_r(153 downto 64);
            if in_rdy = '1' then
                buf_input_r(328 downto 90)   <= data_in(238 downto 0);
                bits_in_buffer               <= 329;
            else
                bits_in_buffer               <= 90;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 155 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(90 downto 0)         <= buf_input_r(154 downto 64);
            if in_rdy = '1' then
                buf_input_r(329 downto 91)   <= data_in(238 downto 0);
                bits_in_buffer               <= 330;
            else
                bits_in_buffer               <= 91;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 156 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(91 downto 0)         <= buf_input_r(155 downto 64);
            if in_rdy = '1' then
                buf_input_r(330 downto 92)   <= data_in(238 downto 0);
                bits_in_buffer               <= 331;
            else
                bits_in_buffer               <= 92;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 157 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(92 downto 0)         <= buf_input_r(156 downto 64);
            if in_rdy = '1' then
                buf_input_r(331 downto 93)   <= data_in(238 downto 0);
                bits_in_buffer               <= 332;
            else
                bits_in_buffer               <= 93;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 158 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(93 downto 0)         <= buf_input_r(157 downto 64);
            if in_rdy = '1' then
                buf_input_r(332 downto 94)   <= data_in(238 downto 0);
                bits_in_buffer               <= 333;
            else
                bits_in_buffer               <= 94;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 159 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(94 downto 0)         <= buf_input_r(158 downto 64);
            if in_rdy = '1' then
                buf_input_r(333 downto 95)   <= data_in(238 downto 0);
                bits_in_buffer               <= 334;
            else
                bits_in_buffer               <= 95;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 160 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(95 downto 0)         <= buf_input_r(159 downto 64);
            if in_rdy = '1' then
                buf_input_r(334 downto 96)   <= data_in(238 downto 0);
                bits_in_buffer               <= 335;
            else
                bits_in_buffer               <= 96;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 161 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(96 downto 0)         <= buf_input_r(160 downto 64);
            if in_rdy = '1' then
                buf_input_r(335 downto 97)   <= data_in(238 downto 0);
                bits_in_buffer               <= 336;
            else
                bits_in_buffer               <= 97;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 162 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(97 downto 0)         <= buf_input_r(161 downto 64);
            if in_rdy = '1' then
                buf_input_r(336 downto 98)   <= data_in(238 downto 0);
                bits_in_buffer               <= 337;
            else
                bits_in_buffer               <= 98;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 163 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(98 downto 0)         <= buf_input_r(162 downto 64);
            if in_rdy = '1' then
                buf_input_r(337 downto 99)   <= data_in(238 downto 0);
                bits_in_buffer               <= 338;
            else
                bits_in_buffer               <= 99;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 164 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(99 downto 0)         <= buf_input_r(163 downto 64);
            if in_rdy = '1' then
                buf_input_r(338 downto 100)  <= data_in(238 downto 0);
                bits_in_buffer               <= 339;
            else
                bits_in_buffer               <= 100;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 165 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(100 downto 0)        <= buf_input_r(164 downto 64);
            if in_rdy = '1' then
                buf_input_r(339 downto 101)  <= data_in(238 downto 0);
                bits_in_buffer               <= 340;
            else
                bits_in_buffer               <= 101;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 166 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(101 downto 0)        <= buf_input_r(165 downto 64);
            if in_rdy = '1' then
                buf_input_r(340 downto 102)  <= data_in(238 downto 0);
                bits_in_buffer               <= 341;
            else
                bits_in_buffer               <= 102;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 167 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(102 downto 0)        <= buf_input_r(166 downto 64);
            if in_rdy = '1' then
                buf_input_r(341 downto 103)  <= data_in(238 downto 0);
                bits_in_buffer               <= 342;
            else
                bits_in_buffer               <= 103;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 168 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(103 downto 0)        <= buf_input_r(167 downto 64);
            if in_rdy = '1' then
                buf_input_r(342 downto 104)  <= data_in(238 downto 0);
                bits_in_buffer               <= 343;
            else
                bits_in_buffer               <= 104;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 169 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(104 downto 0)        <= buf_input_r(168 downto 64);
            if in_rdy = '1' then
                buf_input_r(343 downto 105)  <= data_in(238 downto 0);
                bits_in_buffer               <= 344;
            else
                bits_in_buffer               <= 105;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 170 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(105 downto 0)        <= buf_input_r(169 downto 64);
            if in_rdy = '1' then
                buf_input_r(344 downto 106)  <= data_in(238 downto 0);
                bits_in_buffer               <= 345;
            else
                bits_in_buffer               <= 106;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 171 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(106 downto 0)        <= buf_input_r(170 downto 64);
            if in_rdy = '1' then
                buf_input_r(345 downto 107)  <= data_in(238 downto 0);
                bits_in_buffer               <= 346;
            else
                bits_in_buffer               <= 107;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 172 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(107 downto 0)        <= buf_input_r(171 downto 64);
            if in_rdy = '1' then
                buf_input_r(346 downto 108)  <= data_in(238 downto 0);
                bits_in_buffer               <= 347;
            else
                bits_in_buffer               <= 108;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 173 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(108 downto 0)        <= buf_input_r(172 downto 64);
            if in_rdy = '1' then
                buf_input_r(347 downto 109)  <= data_in(238 downto 0);
                bits_in_buffer               <= 348;
            else
                bits_in_buffer               <= 109;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 174 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(109 downto 0)        <= buf_input_r(173 downto 64);
            if in_rdy = '1' then
                buf_input_r(348 downto 110)  <= data_in(238 downto 0);
                bits_in_buffer               <= 349;
            else
                bits_in_buffer               <= 110;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 175 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(110 downto 0)        <= buf_input_r(174 downto 64);
            if in_rdy = '1' then
                buf_input_r(349 downto 111)  <= data_in(238 downto 0);
                bits_in_buffer               <= 350;
            else
                bits_in_buffer               <= 111;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 176 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(111 downto 0)        <= buf_input_r(175 downto 64);
            if in_rdy = '1' then
                buf_input_r(350 downto 112)  <= data_in(238 downto 0);
                bits_in_buffer               <= 351;
            else
                bits_in_buffer               <= 112;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 177 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(112 downto 0)        <= buf_input_r(176 downto 64);
            if in_rdy = '1' then
                buf_input_r(351 downto 113)  <= data_in(238 downto 0);
                bits_in_buffer               <= 352;
            else
                bits_in_buffer               <= 113;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 178 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(113 downto 0)        <= buf_input_r(177 downto 64);
            if in_rdy = '1' then
                buf_input_r(352 downto 114)  <= data_in(238 downto 0);
                bits_in_buffer               <= 353;
            else
                bits_in_buffer               <= 114;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 179 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(114 downto 0)        <= buf_input_r(178 downto 64);
            if in_rdy = '1' then
                buf_input_r(353 downto 115)  <= data_in(238 downto 0);
                bits_in_buffer               <= 354;
            else
                bits_in_buffer               <= 115;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 180 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(115 downto 0)        <= buf_input_r(179 downto 64);
            if in_rdy = '1' then
                buf_input_r(354 downto 116)  <= data_in(238 downto 0);
                bits_in_buffer               <= 355;
            else
                bits_in_buffer               <= 116;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 181 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(116 downto 0)        <= buf_input_r(180 downto 64);
            if in_rdy = '1' then
                buf_input_r(355 downto 117)  <= data_in(238 downto 0);
                bits_in_buffer               <= 356;
            else
                bits_in_buffer               <= 117;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 182 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(117 downto 0)        <= buf_input_r(181 downto 64);
            if in_rdy = '1' then
                buf_input_r(356 downto 118)  <= data_in(238 downto 0);
                bits_in_buffer               <= 357;
            else
                bits_in_buffer               <= 118;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 183 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(118 downto 0)        <= buf_input_r(182 downto 64);
            if in_rdy = '1' then
                buf_input_r(357 downto 119)  <= data_in(238 downto 0);
                bits_in_buffer               <= 358;
            else
                bits_in_buffer               <= 119;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 184 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(119 downto 0)        <= buf_input_r(183 downto 64);
            if in_rdy = '1' then
                buf_input_r(358 downto 120)  <= data_in(238 downto 0);
                bits_in_buffer               <= 359;
            else
                bits_in_buffer               <= 120;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 185 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(120 downto 0)        <= buf_input_r(184 downto 64);
            if in_rdy = '1' then
                buf_input_r(359 downto 121)  <= data_in(238 downto 0);
                bits_in_buffer               <= 360;
            else
                bits_in_buffer               <= 121;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 186 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(121 downto 0)        <= buf_input_r(185 downto 64);
            if in_rdy = '1' then
                buf_input_r(360 downto 122)  <= data_in(238 downto 0);
                bits_in_buffer               <= 361;
            else
                bits_in_buffer               <= 122;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 187 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(122 downto 0)        <= buf_input_r(186 downto 64);
            if in_rdy = '1' then
                buf_input_r(361 downto 123)  <= data_in(238 downto 0);
                bits_in_buffer               <= 362;
            else
                bits_in_buffer               <= 123;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 188 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(123 downto 0)        <= buf_input_r(187 downto 64);
            if in_rdy = '1' then
                buf_input_r(362 downto 124)  <= data_in(238 downto 0);
                bits_in_buffer               <= 363;
            else
                bits_in_buffer               <= 124;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 189 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(124 downto 0)        <= buf_input_r(188 downto 64);
            if in_rdy = '1' then
                buf_input_r(363 downto 125)  <= data_in(238 downto 0);
                bits_in_buffer               <= 364;
            else
                bits_in_buffer               <= 125;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 190 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(125 downto 0)        <= buf_input_r(189 downto 64);
            if in_rdy = '1' then
                buf_input_r(364 downto 126)  <= data_in(238 downto 0);
                bits_in_buffer               <= 365;
            else
                bits_in_buffer               <= 126;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 191 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(126 downto 0)        <= buf_input_r(190 downto 64);
            if in_rdy = '1' then
                buf_input_r(365 downto 127)  <= data_in(238 downto 0);
                bits_in_buffer               <= 366;
            else
                bits_in_buffer               <= 127;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 192 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(127 downto 0)        <= buf_input_r(191 downto 64);
            if in_rdy = '1' then
                buf_input_r(366 downto 128)  <= data_in(238 downto 0);
                bits_in_buffer               <= 367;
            else
                bits_in_buffer               <= 128;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 193 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(128 downto 0)        <= buf_input_r(192 downto 64);
            if in_rdy = '1' then
                buf_input_r(367 downto 129)  <= data_in(238 downto 0);
                bits_in_buffer               <= 368;
            else
                bits_in_buffer               <= 129;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 194 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(129 downto 0)        <= buf_input_r(193 downto 64);
            if in_rdy = '1' then
                buf_input_r(368 downto 130)  <= data_in(238 downto 0);
                bits_in_buffer               <= 369;
            else
                bits_in_buffer               <= 130;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 195 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(130 downto 0)        <= buf_input_r(194 downto 64);
            if in_rdy = '1' then
                buf_input_r(369 downto 131)  <= data_in(238 downto 0);
                bits_in_buffer               <= 370;
            else
                bits_in_buffer               <= 131;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 196 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(131 downto 0)        <= buf_input_r(195 downto 64);
            if in_rdy = '1' then
                buf_input_r(370 downto 132)  <= data_in(238 downto 0);
                bits_in_buffer               <= 371;
            else
                bits_in_buffer               <= 132;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 197 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(132 downto 0)        <= buf_input_r(196 downto 64);
            if in_rdy = '1' then
                buf_input_r(371 downto 133)  <= data_in(238 downto 0);
                bits_in_buffer               <= 372;
            else
                bits_in_buffer               <= 133;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 198 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(133 downto 0)        <= buf_input_r(197 downto 64);
            if in_rdy = '1' then
                buf_input_r(372 downto 134)  <= data_in(238 downto 0);
                bits_in_buffer               <= 373;
            else
                bits_in_buffer               <= 134;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 199 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(134 downto 0)        <= buf_input_r(198 downto 64);
            if in_rdy = '1' then
                buf_input_r(373 downto 135)  <= data_in(238 downto 0);
                bits_in_buffer               <= 374;
            else
                bits_in_buffer               <= 135;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 200 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(135 downto 0)        <= buf_input_r(199 downto 64);
            if in_rdy = '1' then
                buf_input_r(374 downto 136)  <= data_in(238 downto 0);
                bits_in_buffer               <= 375;
            else
                bits_in_buffer               <= 136;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 201 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(136 downto 0)        <= buf_input_r(200 downto 64);
            if in_rdy = '1' then
                buf_input_r(375 downto 137)  <= data_in(238 downto 0);
                bits_in_buffer               <= 376;
            else
                bits_in_buffer               <= 137;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 202 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(137 downto 0)        <= buf_input_r(201 downto 64);
            if in_rdy = '1' then
                buf_input_r(376 downto 138)  <= data_in(238 downto 0);
                bits_in_buffer               <= 377;
            else
                bits_in_buffer               <= 138;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 203 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(138 downto 0)        <= buf_input_r(202 downto 64);
            if in_rdy = '1' then
                buf_input_r(377 downto 139)  <= data_in(238 downto 0);
                bits_in_buffer               <= 378;
            else
                bits_in_buffer               <= 139;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 204 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(139 downto 0)        <= buf_input_r(203 downto 64);
            if in_rdy = '1' then
                buf_input_r(378 downto 140)  <= data_in(238 downto 0);
                bits_in_buffer               <= 379;
            else
                bits_in_buffer               <= 140;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 205 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(140 downto 0)        <= buf_input_r(204 downto 64);
            if in_rdy = '1' then
                buf_input_r(379 downto 141)  <= data_in(238 downto 0);
                bits_in_buffer               <= 380;
            else
                bits_in_buffer               <= 141;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 206 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(141 downto 0)        <= buf_input_r(205 downto 64);
            if in_rdy = '1' then
                buf_input_r(380 downto 142)  <= data_in(238 downto 0);
                bits_in_buffer               <= 381;
            else
                bits_in_buffer               <= 142;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 207 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(142 downto 0)        <= buf_input_r(206 downto 64);
            if in_rdy = '1' then
                buf_input_r(381 downto 143)  <= data_in(238 downto 0);
                bits_in_buffer               <= 382;
            else
                bits_in_buffer               <= 143;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 208 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(143 downto 0)        <= buf_input_r(207 downto 64);
            if in_rdy = '1' then
                buf_input_r(382 downto 144)  <= data_in(238 downto 0);
                bits_in_buffer               <= 383;
            else
                bits_in_buffer               <= 144;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 209 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(144 downto 0)        <= buf_input_r(208 downto 64);
            if in_rdy = '1' then
                buf_input_r(383 downto 145)  <= data_in(238 downto 0);
                bits_in_buffer               <= 384;
            else
                bits_in_buffer               <= 145;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 210 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(145 downto 0)        <= buf_input_r(209 downto 64);
            if in_rdy = '1' then
                buf_input_r(384 downto 146)  <= data_in(238 downto 0);
                bits_in_buffer               <= 385;
            else
                bits_in_buffer               <= 146;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 211 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(146 downto 0)        <= buf_input_r(210 downto 64);
            if in_rdy = '1' then
                buf_input_r(385 downto 147)  <= data_in(238 downto 0);
                bits_in_buffer               <= 386;
            else
                bits_in_buffer               <= 147;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 212 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(147 downto 0)        <= buf_input_r(211 downto 64);
            if in_rdy = '1' then
                buf_input_r(386 downto 148)  <= data_in(238 downto 0);
                bits_in_buffer               <= 387;
            else
                bits_in_buffer               <= 148;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 213 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(148 downto 0)        <= buf_input_r(212 downto 64);
            if in_rdy = '1' then
                buf_input_r(387 downto 149)  <= data_in(238 downto 0);
                bits_in_buffer               <= 388;
            else
                bits_in_buffer               <= 149;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 214 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(149 downto 0)        <= buf_input_r(213 downto 64);
            if in_rdy = '1' then
                buf_input_r(388 downto 150)  <= data_in(238 downto 0);
                bits_in_buffer               <= 389;
            else
                bits_in_buffer               <= 150;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 215 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(150 downto 0)        <= buf_input_r(214 downto 64);
            if in_rdy = '1' then
                buf_input_r(389 downto 151)  <= data_in(238 downto 0);
                bits_in_buffer               <= 390;
            else
                bits_in_buffer               <= 151;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 216 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(151 downto 0)        <= buf_input_r(215 downto 64);
            if in_rdy = '1' then
                buf_input_r(390 downto 152)  <= data_in(238 downto 0);
                bits_in_buffer               <= 391;
            else
                bits_in_buffer               <= 152;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 217 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(152 downto 0)        <= buf_input_r(216 downto 64);
            if in_rdy = '1' then
                buf_input_r(391 downto 153)  <= data_in(238 downto 0);
                bits_in_buffer               <= 392;
            else
                bits_in_buffer               <= 153;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 218 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(153 downto 0)        <= buf_input_r(217 downto 64);
            if in_rdy = '1' then
                buf_input_r(392 downto 154)  <= data_in(238 downto 0);
                bits_in_buffer               <= 393;
            else
                bits_in_buffer               <= 154;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 219 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(154 downto 0)        <= buf_input_r(218 downto 64);
            if in_rdy = '1' then
                buf_input_r(393 downto 155)  <= data_in(238 downto 0);
                bits_in_buffer               <= 394;
            else
                bits_in_buffer               <= 155;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 220 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(155 downto 0)        <= buf_input_r(219 downto 64);
            if in_rdy = '1' then
                buf_input_r(394 downto 156)  <= data_in(238 downto 0);
                bits_in_buffer               <= 395;
            else
                bits_in_buffer               <= 156;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 221 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(156 downto 0)        <= buf_input_r(220 downto 64);
            if in_rdy = '1' then
                buf_input_r(395 downto 157)  <= data_in(238 downto 0);
                bits_in_buffer               <= 396;
            else
                bits_in_buffer               <= 157;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 222 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(157 downto 0)        <= buf_input_r(221 downto 64);
            if in_rdy = '1' then
                buf_input_r(396 downto 158)  <= data_in(238 downto 0);
                bits_in_buffer               <= 397;
            else
                bits_in_buffer               <= 158;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 223 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(158 downto 0)        <= buf_input_r(222 downto 64);
            if in_rdy = '1' then
                buf_input_r(397 downto 159)  <= data_in(238 downto 0);
                bits_in_buffer               <= 398;
            else
                bits_in_buffer               <= 159;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 224 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(159 downto 0)        <= buf_input_r(223 downto 64);
            if in_rdy = '1' then
                buf_input_r(398 downto 160)  <= data_in(238 downto 0);
                bits_in_buffer               <= 399;
            else
                bits_in_buffer               <= 160;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 225 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(160 downto 0)        <= buf_input_r(224 downto 64);
            if in_rdy = '1' then
                buf_input_r(399 downto 161)  <= data_in(238 downto 0);
                bits_in_buffer               <= 400;
            else
                bits_in_buffer               <= 161;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 226 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(161 downto 0)        <= buf_input_r(225 downto 64);
            if in_rdy = '1' then
                buf_input_r(400 downto 162)  <= data_in(238 downto 0);
                bits_in_buffer               <= 401;
            else
                bits_in_buffer               <= 162;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 227 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(162 downto 0)        <= buf_input_r(226 downto 64);
            if in_rdy = '1' then
                buf_input_r(401 downto 163)  <= data_in(238 downto 0);
                bits_in_buffer               <= 402;
            else
                bits_in_buffer               <= 163;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 228 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(163 downto 0)        <= buf_input_r(227 downto 64);
            if in_rdy = '1' then
                buf_input_r(402 downto 164)  <= data_in(238 downto 0);
                bits_in_buffer               <= 403;
            else
                bits_in_buffer               <= 164;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 229 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(164 downto 0)        <= buf_input_r(228 downto 64);
            if in_rdy = '1' then
                buf_input_r(403 downto 165)  <= data_in(238 downto 0);
                bits_in_buffer               <= 404;
            else
                bits_in_buffer               <= 165;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 230 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(165 downto 0)        <= buf_input_r(229 downto 64);
            if in_rdy = '1' then
                buf_input_r(404 downto 166)  <= data_in(238 downto 0);
                bits_in_buffer               <= 405;
            else
                bits_in_buffer               <= 166;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 231 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(166 downto 0)        <= buf_input_r(230 downto 64);
            if in_rdy = '1' then
                buf_input_r(405 downto 167)  <= data_in(238 downto 0);
                bits_in_buffer               <= 406;
            else
                bits_in_buffer               <= 167;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 232 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(167 downto 0)        <= buf_input_r(231 downto 64);
            if in_rdy = '1' then
                buf_input_r(406 downto 168)  <= data_in(238 downto 0);
                bits_in_buffer               <= 407;
            else
                bits_in_buffer               <= 168;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 233 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(168 downto 0)        <= buf_input_r(232 downto 64);
            if in_rdy = '1' then
                buf_input_r(407 downto 169)  <= data_in(238 downto 0);
                bits_in_buffer               <= 408;
            else
                bits_in_buffer               <= 169;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 234 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(169 downto 0)        <= buf_input_r(233 downto 64);
            if in_rdy = '1' then
                buf_input_r(408 downto 170)  <= data_in(238 downto 0);
                bits_in_buffer               <= 409;
            else
                bits_in_buffer               <= 170;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 235 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(170 downto 0)        <= buf_input_r(234 downto 64);
            if in_rdy = '1' then
                buf_input_r(409 downto 171)  <= data_in(238 downto 0);
                bits_in_buffer               <= 410;
            else
                bits_in_buffer               <= 171;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 236 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(171 downto 0)        <= buf_input_r(235 downto 64);
            if in_rdy = '1' then
                buf_input_r(410 downto 172)  <= data_in(238 downto 0);
                bits_in_buffer               <= 411;
            else
                bits_in_buffer               <= 172;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 237 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(172 downto 0)        <= buf_input_r(236 downto 64);
            if in_rdy = '1' then
                buf_input_r(411 downto 173)  <= data_in(238 downto 0);
                bits_in_buffer               <= 412;
            else
                bits_in_buffer               <= 173;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 238 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(173 downto 0)        <= buf_input_r(237 downto 64);
            if in_rdy = '1' then
                buf_input_r(412 downto 174)  <= data_in(238 downto 0);
                bits_in_buffer               <= 413;
            else
                bits_in_buffer               <= 174;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 239 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(174 downto 0)        <= buf_input_r(238 downto 64);
            if in_rdy = '1' then
                buf_input_r(413 downto 175)  <= data_in(238 downto 0);
                bits_in_buffer               <= 414;
            else
                bits_in_buffer               <= 175;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 240 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(175 downto 0)        <= buf_input_r(239 downto 64);
            if in_rdy = '1' then
                buf_input_r(414 downto 176)  <= data_in(238 downto 0);
                bits_in_buffer               <= 415;
            else
                bits_in_buffer               <= 176;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';


        -- For this range, congestion_out is asserted if in_rdy = '1'.
        -- Because the minimum bits_in_buffer here if in_rdy = '1', is 304. Maximum is 478.
        -- Therefore there is no space left for another input since; 304(in buffer) + 239(input) - 64(out) = 479 > 478(size).

        when 241 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(176 downto 0)        <= buf_input_r(240 downto 64);
            if in_rdy = '1' then
                buf_input_r(415 downto 177)  <= data_in(238 downto 0);
                bits_in_buffer               <= 416;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 177;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 242 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(177 downto 0)        <= buf_input_r(241 downto 64);
            if in_rdy = '1' then
                buf_input_r(416 downto 178)  <= data_in(238 downto 0);
                bits_in_buffer               <= 417;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 178;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 243 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(178 downto 0)        <= buf_input_r(242 downto 64);
            if in_rdy = '1' then
                buf_input_r(417 downto 179)  <= data_in(238 downto 0);
                bits_in_buffer               <= 418;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 179;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 244 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(179 downto 0)        <= buf_input_r(243 downto 64);
            if in_rdy = '1' then
                buf_input_r(418 downto 180)  <= data_in(238 downto 0);
                bits_in_buffer               <= 419;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 180;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 245 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(180 downto 0)        <= buf_input_r(244 downto 64);
            if in_rdy = '1' then
                buf_input_r(419 downto 181)  <= data_in(238 downto 0);
                bits_in_buffer               <= 420;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 181;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 246 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(181 downto 0)        <= buf_input_r(245 downto 64);
            if in_rdy = '1' then
                buf_input_r(420 downto 182)  <= data_in(238 downto 0);
                bits_in_buffer               <= 421;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 182;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 247 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(182 downto 0)        <= buf_input_r(246 downto 64);
            if in_rdy = '1' then
                buf_input_r(421 downto 183)  <= data_in(238 downto 0);
                bits_in_buffer               <= 422;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 183;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 248 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(183 downto 0)        <= buf_input_r(247 downto 64);
            if in_rdy = '1' then
                buf_input_r(422 downto 184)  <= data_in(238 downto 0);
                bits_in_buffer               <= 423;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 184;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 249 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(184 downto 0)        <= buf_input_r(248 downto 64);
            if in_rdy = '1' then
                buf_input_r(423 downto 185)  <= data_in(238 downto 0);
                bits_in_buffer               <= 424;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 185;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 250 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(185 downto 0)        <= buf_input_r(249 downto 64);
            if in_rdy = '1' then
                buf_input_r(424 downto 186)  <= data_in(238 downto 0);
                bits_in_buffer               <= 425;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 186;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 251 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(186 downto 0)        <= buf_input_r(250 downto 64);
            if in_rdy = '1' then
                buf_input_r(425 downto 187)  <= data_in(238 downto 0);
                bits_in_buffer               <= 426;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 187;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 252 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(187 downto 0)        <= buf_input_r(251 downto 64);
            if in_rdy = '1' then
                buf_input_r(426 downto 188)  <= data_in(238 downto 0);
                bits_in_buffer               <= 427;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 188;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 253 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(188 downto 0)        <= buf_input_r(252 downto 64);
            if in_rdy = '1' then
                buf_input_r(427 downto 189)  <= data_in(238 downto 0);
                bits_in_buffer               <= 428;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 189;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 254 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(189 downto 0)        <= buf_input_r(253 downto 64);
            if in_rdy = '1' then
                buf_input_r(428 downto 190)  <= data_in(238 downto 0);
                bits_in_buffer               <= 429;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 190;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 255 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(190 downto 0)        <= buf_input_r(254 downto 64);
            if in_rdy = '1' then
                buf_input_r(429 downto 191)  <= data_in(238 downto 0);
                bits_in_buffer               <= 430;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 191;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 256 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(191 downto 0)        <= buf_input_r(255 downto 64);
            if in_rdy = '1' then
                buf_input_r(430 downto 192)  <= data_in(238 downto 0);
                bits_in_buffer               <= 431;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 192;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 257 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(192 downto 0)        <= buf_input_r(256 downto 64);
            if in_rdy = '1' then
                buf_input_r(431 downto 193)  <= data_in(238 downto 0);
                bits_in_buffer               <= 432;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 193;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 258 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(193 downto 0)        <= buf_input_r(257 downto 64);
            if in_rdy = '1' then
                buf_input_r(432 downto 194)  <= data_in(238 downto 0);
                bits_in_buffer               <= 433;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 194;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 259 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(194 downto 0)        <= buf_input_r(258 downto 64);
            if in_rdy = '1' then
                buf_input_r(433 downto 195)  <= data_in(238 downto 0);
                bits_in_buffer               <= 434;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 195;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 260 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(195 downto 0)        <= buf_input_r(259 downto 64);
            if in_rdy = '1' then
                buf_input_r(434 downto 196)  <= data_in(238 downto 0);
                bits_in_buffer               <= 435;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 196;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 261 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(196 downto 0)        <= buf_input_r(260 downto 64);
            if in_rdy = '1' then
                buf_input_r(435 downto 197)  <= data_in(238 downto 0);
                bits_in_buffer               <= 436;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 197;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 262 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(197 downto 0)        <= buf_input_r(261 downto 64);
            if in_rdy = '1' then
                buf_input_r(436 downto 198)  <= data_in(238 downto 0);
                bits_in_buffer               <= 437;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 198;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 263 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(198 downto 0)        <= buf_input_r(262 downto 64);
            if in_rdy = '1' then
                buf_input_r(437 downto 199)  <= data_in(238 downto 0);
                bits_in_buffer               <= 438;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 199;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 264 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(199 downto 0)        <= buf_input_r(263 downto 64);
            if in_rdy = '1' then
                buf_input_r(438 downto 200)  <= data_in(238 downto 0);
                bits_in_buffer               <= 439;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 200;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 265 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(200 downto 0)        <= buf_input_r(264 downto 64);
            if in_rdy = '1' then
                buf_input_r(439 downto 201)  <= data_in(238 downto 0);
                bits_in_buffer               <= 440;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 201;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 266 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(201 downto 0)        <= buf_input_r(265 downto 64);
            if in_rdy = '1' then
                buf_input_r(440 downto 202)  <= data_in(238 downto 0);
                bits_in_buffer               <= 441;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 202;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 267 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(202 downto 0)        <= buf_input_r(266 downto 64);
            if in_rdy = '1' then
                buf_input_r(441 downto 203)  <= data_in(238 downto 0);
                bits_in_buffer               <= 442;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 203;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 268 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(203 downto 0)        <= buf_input_r(267 downto 64);
            if in_rdy = '1' then
                buf_input_r(442 downto 204)  <= data_in(238 downto 0);
                bits_in_buffer               <= 443;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 204;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 269 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(204 downto 0)        <= buf_input_r(268 downto 64);
            if in_rdy = '1' then
                buf_input_r(443 downto 205)  <= data_in(238 downto 0);
                bits_in_buffer               <= 444;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 205;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 270 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(205 downto 0)        <= buf_input_r(269 downto 64);
            if in_rdy = '1' then
                buf_input_r(444 downto 206)  <= data_in(238 downto 0);
                bits_in_buffer               <= 445;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 206;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 271 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(206 downto 0)        <= buf_input_r(270 downto 64);
            if in_rdy = '1' then
                buf_input_r(445 downto 207)  <= data_in(238 downto 0);
                bits_in_buffer               <= 446;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 207;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 272 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(207 downto 0)        <= buf_input_r(271 downto 64);
            if in_rdy = '1' then
                buf_input_r(446 downto 208)  <= data_in(238 downto 0);
                bits_in_buffer               <= 447;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 208;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 273 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(208 downto 0)        <= buf_input_r(272 downto 64);
            if in_rdy = '1' then
                buf_input_r(447 downto 209)  <= data_in(238 downto 0);
                bits_in_buffer               <= 448;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 209;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 274 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(209 downto 0)        <= buf_input_r(273 downto 64);
            if in_rdy = '1' then
                buf_input_r(448 downto 210)  <= data_in(238 downto 0);
                bits_in_buffer               <= 449;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 210;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 275 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(210 downto 0)        <= buf_input_r(274 downto 64);
            if in_rdy = '1' then
                buf_input_r(449 downto 211)  <= data_in(238 downto 0);
                bits_in_buffer               <= 450;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 211;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 276 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(211 downto 0)        <= buf_input_r(275 downto 64);
            if in_rdy = '1' then
                buf_input_r(450 downto 212)  <= data_in(238 downto 0);
                bits_in_buffer               <= 451;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 212;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 277 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(212 downto 0)        <= buf_input_r(276 downto 64);
            if in_rdy = '1' then
                buf_input_r(451 downto 213)  <= data_in(238 downto 0);
                bits_in_buffer               <= 452;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 213;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 278 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(213 downto 0)        <= buf_input_r(277 downto 64);
            if in_rdy = '1' then
                buf_input_r(452 downto 214)  <= data_in(238 downto 0);
                bits_in_buffer               <= 453;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 214;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 279 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(214 downto 0)        <= buf_input_r(278 downto 64);
            if in_rdy = '1' then
                buf_input_r(453 downto 215)  <= data_in(238 downto 0);
                bits_in_buffer               <= 454;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 215;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 280 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(215 downto 0)        <= buf_input_r(279 downto 64);
            if in_rdy = '1' then
                buf_input_r(454 downto 216)  <= data_in(238 downto 0);
                bits_in_buffer               <= 455;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 216;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 281 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(216 downto 0)        <= buf_input_r(280 downto 64);
            if in_rdy = '1' then
                buf_input_r(455 downto 217)  <= data_in(238 downto 0);
                bits_in_buffer               <= 456;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 217;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 282 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(217 downto 0)        <= buf_input_r(281 downto 64);
            if in_rdy = '1' then
                buf_input_r(456 downto 218)  <= data_in(238 downto 0);
                bits_in_buffer               <= 457;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 218;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 283 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(218 downto 0)        <= buf_input_r(282 downto 64);
            if in_rdy = '1' then
                buf_input_r(457 downto 219)  <= data_in(238 downto 0);
                bits_in_buffer               <= 458;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 219;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 284 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(219 downto 0)        <= buf_input_r(283 downto 64);
            if in_rdy = '1' then
                buf_input_r(458 downto 220)  <= data_in(238 downto 0);
                bits_in_buffer               <= 459;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 220;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 285 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(220 downto 0)        <= buf_input_r(284 downto 64);
            if in_rdy = '1' then
                buf_input_r(459 downto 221)  <= data_in(238 downto 0);
                bits_in_buffer               <= 460;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 221;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 286 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(221 downto 0)        <= buf_input_r(285 downto 64);
            if in_rdy = '1' then
                buf_input_r(460 downto 222)  <= data_in(238 downto 0);
                bits_in_buffer               <= 461;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 222;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 287 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(222 downto 0)        <= buf_input_r(286 downto 64);
            if in_rdy = '1' then
                buf_input_r(461 downto 223)  <= data_in(238 downto 0);
                bits_in_buffer               <= 462;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 223;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 288 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(223 downto 0)        <= buf_input_r(287 downto 64);
            if in_rdy = '1' then
                buf_input_r(462 downto 224)  <= data_in(238 downto 0);
                bits_in_buffer               <= 463;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 224;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 289 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(224 downto 0)        <= buf_input_r(288 downto 64);
            if in_rdy = '1' then
                buf_input_r(463 downto 225)  <= data_in(238 downto 0);
                bits_in_buffer               <= 464;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 225;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 290 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(225 downto 0)        <= buf_input_r(289 downto 64);
            if in_rdy = '1' then
                buf_input_r(464 downto 226)  <= data_in(238 downto 0);
                bits_in_buffer               <= 465;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 226;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 291 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(226 downto 0)        <= buf_input_r(290 downto 64);
            if in_rdy = '1' then
                buf_input_r(465 downto 227)  <= data_in(238 downto 0);
                bits_in_buffer               <= 466;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 227;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 292 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(227 downto 0)        <= buf_input_r(291 downto 64);
            if in_rdy = '1' then
                buf_input_r(466 downto 228)  <= data_in(238 downto 0);
                bits_in_buffer               <= 467;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 228;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 293 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(228 downto 0)        <= buf_input_r(292 downto 64);
            if in_rdy = '1' then
                buf_input_r(467 downto 229)  <= data_in(238 downto 0);
                bits_in_buffer               <= 468;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 229;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 294 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(229 downto 0)        <= buf_input_r(293 downto 64);
            if in_rdy = '1' then
                buf_input_r(468 downto 230)  <= data_in(238 downto 0);
                bits_in_buffer               <= 469;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 230;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 295 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(230 downto 0)        <= buf_input_r(294 downto 64);
            if in_rdy = '1' then
                buf_input_r(469 downto 231)  <= data_in(238 downto 0);
                bits_in_buffer               <= 470;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 231;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 296 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(231 downto 0)        <= buf_input_r(295 downto 64);
            if in_rdy = '1' then
                buf_input_r(470 downto 232)  <= data_in(238 downto 0);
                bits_in_buffer               <= 471;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 232;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 297 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(232 downto 0)        <= buf_input_r(296 downto 64);
            if in_rdy = '1' then
                buf_input_r(471 downto 233)  <= data_in(238 downto 0);
                bits_in_buffer               <= 472;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 233;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 298 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(233 downto 0)        <= buf_input_r(297 downto 64);
            if in_rdy = '1' then
                buf_input_r(472 downto 234)  <= data_in(238 downto 0);
                bits_in_buffer               <= 473;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 234;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 299 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(234 downto 0)        <= buf_input_r(298 downto 64);
            if in_rdy = '1' then
                buf_input_r(473 downto 235)  <= data_in(238 downto 0);
                bits_in_buffer               <= 474;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 235;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 300 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(235 downto 0)        <= buf_input_r(299 downto 64);
            if in_rdy = '1' then
                buf_input_r(474 downto 236)  <= data_in(238 downto 0);
                bits_in_buffer               <= 475;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 236;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 301 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(236 downto 0)        <= buf_input_r(300 downto 64);
            if in_rdy = '1' then
                buf_input_r(475 downto 237)  <= data_in(238 downto 0);
                bits_in_buffer               <= 476;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 237;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 302 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(237 downto 0)        <= buf_input_r(301 downto 64);
            if in_rdy = '1' then
                buf_input_r(476 downto 238)  <= data_in(238 downto 0);
                bits_in_buffer               <= 477;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 238;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 303 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(238 downto 0)        <= buf_input_r(302 downto 64);
            if in_rdy = '1' then
                buf_input_r(477 downto 239)  <= data_in(238 downto 0);
                bits_in_buffer               <= 478;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 239;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';


        -- For this range, the buffer contains to many bits to receieve another input.
        -- That is why the congestion_out was asserted high in the previous range, and set low here.

        when 304 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(239 downto 0)    <= buf_input_r(303 downto 64);
            bits_in_buffer               <= 240;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 305 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(240 downto 0)    <= buf_input_r(304 downto 64);
            bits_in_buffer               <= 241;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 306 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(241 downto 0)    <= buf_input_r(305 downto 64);
            bits_in_buffer               <= 242;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 307 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(242 downto 0)    <= buf_input_r(306 downto 64);
            bits_in_buffer               <= 243;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 308 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(243 downto 0)    <= buf_input_r(307 downto 64);
            bits_in_buffer               <= 244;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 309 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(244 downto 0)    <= buf_input_r(308 downto 64);
            bits_in_buffer               <= 245;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 310 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(245 downto 0)    <= buf_input_r(309 downto 64);
            bits_in_buffer               <= 246;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 311 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(246 downto 0)    <= buf_input_r(310 downto 64);
            bits_in_buffer               <= 247;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 312 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(247 downto 0)    <= buf_input_r(311 downto 64);
            bits_in_buffer               <= 248;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 313 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(248 downto 0)    <= buf_input_r(312 downto 64);
            bits_in_buffer               <= 249;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 314 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(249 downto 0)    <= buf_input_r(313 downto 64);
            bits_in_buffer               <= 250;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 315 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(250 downto 0)    <= buf_input_r(314 downto 64);
            bits_in_buffer               <= 251;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 316 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(251 downto 0)    <= buf_input_r(315 downto 64);
            bits_in_buffer               <= 252;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 317 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(252 downto 0)    <= buf_input_r(316 downto 64);
            bits_in_buffer               <= 253;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 318 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(253 downto 0)    <= buf_input_r(317 downto 64);
            bits_in_buffer               <= 254;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 319 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(254 downto 0)    <= buf_input_r(318 downto 64);
            bits_in_buffer               <= 255;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 320 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(255 downto 0)    <= buf_input_r(319 downto 64);
            bits_in_buffer               <= 256;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 321 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(256 downto 0)    <= buf_input_r(320 downto 64);
            bits_in_buffer               <= 257;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 322 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(257 downto 0)    <= buf_input_r(321 downto 64);
            bits_in_buffer               <= 258;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 323 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(258 downto 0)    <= buf_input_r(322 downto 64);
            bits_in_buffer               <= 259;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 324 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(259 downto 0)    <= buf_input_r(323 downto 64);
            bits_in_buffer               <= 260;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 325 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(260 downto 0)    <= buf_input_r(324 downto 64);
            bits_in_buffer               <= 261;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 326 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(261 downto 0)    <= buf_input_r(325 downto 64);
            bits_in_buffer               <= 262;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 327 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(262 downto 0)    <= buf_input_r(326 downto 64);
            bits_in_buffer               <= 263;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 328 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(263 downto 0)    <= buf_input_r(327 downto 64);
            bits_in_buffer               <= 264;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 329 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(264 downto 0)    <= buf_input_r(328 downto 64);
            bits_in_buffer               <= 265;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 330 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(265 downto 0)    <= buf_input_r(329 downto 64);
            bits_in_buffer               <= 266;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 331 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(266 downto 0)    <= buf_input_r(330 downto 64);
            bits_in_buffer               <= 267;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 332 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(267 downto 0)    <= buf_input_r(331 downto 64);
            bits_in_buffer               <= 268;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 333 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(268 downto 0)    <= buf_input_r(332 downto 64);
            bits_in_buffer               <= 269;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 334 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(269 downto 0)    <= buf_input_r(333 downto 64);
            bits_in_buffer               <= 270;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 335 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(270 downto 0)    <= buf_input_r(334 downto 64);
            bits_in_buffer               <= 271;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 336 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(271 downto 0)    <= buf_input_r(335 downto 64);
            bits_in_buffer               <= 272;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 337 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(272 downto 0)    <= buf_input_r(336 downto 64);
            bits_in_buffer               <= 273;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 338 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(273 downto 0)    <= buf_input_r(337 downto 64);
            bits_in_buffer               <= 274;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 339 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(274 downto 0)    <= buf_input_r(338 downto 64);
            bits_in_buffer               <= 275;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 340 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(275 downto 0)    <= buf_input_r(339 downto 64);
            bits_in_buffer               <= 276;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 341 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(276 downto 0)    <= buf_input_r(340 downto 64);
            bits_in_buffer               <= 277;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 342 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(277 downto 0)    <= buf_input_r(341 downto 64);
            bits_in_buffer               <= 278;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 343 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(278 downto 0)    <= buf_input_r(342 downto 64);
            bits_in_buffer               <= 279;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 344 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(279 downto 0)    <= buf_input_r(343 downto 64);
            bits_in_buffer               <= 280;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 345 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(280 downto 0)    <= buf_input_r(344 downto 64);
            bits_in_buffer               <= 281;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 346 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(281 downto 0)    <= buf_input_r(345 downto 64);
            bits_in_buffer               <= 282;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 347 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(282 downto 0)    <= buf_input_r(346 downto 64);
            bits_in_buffer               <= 283;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 348 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(283 downto 0)    <= buf_input_r(347 downto 64);
            bits_in_buffer               <= 284;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 349 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(284 downto 0)    <= buf_input_r(348 downto 64);
            bits_in_buffer               <= 285;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 350 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(285 downto 0)    <= buf_input_r(349 downto 64);
            bits_in_buffer               <= 286;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 351 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(286 downto 0)    <= buf_input_r(350 downto 64);
            bits_in_buffer               <= 287;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 352 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(287 downto 0)    <= buf_input_r(351 downto 64);
            bits_in_buffer               <= 288;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 353 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(288 downto 0)    <= buf_input_r(352 downto 64);
            bits_in_buffer               <= 289;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 354 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(289 downto 0)    <= buf_input_r(353 downto 64);
            bits_in_buffer               <= 290;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 355 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(290 downto 0)    <= buf_input_r(354 downto 64);
            bits_in_buffer               <= 291;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 356 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(291 downto 0)    <= buf_input_r(355 downto 64);
            bits_in_buffer               <= 292;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 357 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(292 downto 0)    <= buf_input_r(356 downto 64);
            bits_in_buffer               <= 293;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 358 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(293 downto 0)    <= buf_input_r(357 downto 64);
            bits_in_buffer               <= 294;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 359 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(294 downto 0)    <= buf_input_r(358 downto 64);
            bits_in_buffer               <= 295;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 360 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(295 downto 0)    <= buf_input_r(359 downto 64);
            bits_in_buffer               <= 296;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 361 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(296 downto 0)    <= buf_input_r(360 downto 64);
            bits_in_buffer               <= 297;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 362 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(297 downto 0)    <= buf_input_r(361 downto 64);
            bits_in_buffer               <= 298;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 363 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(298 downto 0)    <= buf_input_r(362 downto 64);
            bits_in_buffer               <= 299;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 364 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(299 downto 0)    <= buf_input_r(363 downto 64);
            bits_in_buffer               <= 300;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 365 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(300 downto 0)    <= buf_input_r(364 downto 64);
            bits_in_buffer               <= 301;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 366 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(301 downto 0)    <= buf_input_r(365 downto 64);
            bits_in_buffer               <= 302;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 367 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(302 downto 0)    <= buf_input_r(366 downto 64);
            bits_in_buffer               <= 303;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 368 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(303 downto 0)    <= buf_input_r(367 downto 64);
            bits_in_buffer               <= 304;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 369 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(304 downto 0)    <= buf_input_r(368 downto 64);
            bits_in_buffer               <= 305;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 370 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(305 downto 0)    <= buf_input_r(369 downto 64);
            bits_in_buffer               <= 306;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 371 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(306 downto 0)    <= buf_input_r(370 downto 64);
            bits_in_buffer               <= 307;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 372 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(307 downto 0)    <= buf_input_r(371 downto 64);
            bits_in_buffer               <= 308;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 373 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(308 downto 0)    <= buf_input_r(372 downto 64);
            bits_in_buffer               <= 309;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 374 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(309 downto 0)    <= buf_input_r(373 downto 64);
            bits_in_buffer               <= 310;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 375 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(310 downto 0)    <= buf_input_r(374 downto 64);
            bits_in_buffer               <= 311;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 376 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(311 downto 0)    <= buf_input_r(375 downto 64);
            bits_in_buffer               <= 312;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 377 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(312 downto 0)    <= buf_input_r(376 downto 64);
            bits_in_buffer               <= 313;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 378 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(313 downto 0)    <= buf_input_r(377 downto 64);
            bits_in_buffer               <= 314;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 379 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(314 downto 0)    <= buf_input_r(378 downto 64);
            bits_in_buffer               <= 315;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 380 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(315 downto 0)    <= buf_input_r(379 downto 64);
            bits_in_buffer               <= 316;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 381 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(316 downto 0)    <= buf_input_r(380 downto 64);
            bits_in_buffer               <= 317;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 382 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(317 downto 0)    <= buf_input_r(381 downto 64);
            bits_in_buffer               <= 318;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 383 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(318 downto 0)    <= buf_input_r(382 downto 64);
            bits_in_buffer               <= 319;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 384 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(319 downto 0)    <= buf_input_r(383 downto 64);
            bits_in_buffer               <= 320;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 385 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(320 downto 0)    <= buf_input_r(384 downto 64);
            bits_in_buffer               <= 321;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 386 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(321 downto 0)    <= buf_input_r(385 downto 64);
            bits_in_buffer               <= 322;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 387 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(322 downto 0)    <= buf_input_r(386 downto 64);
            bits_in_buffer               <= 323;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 388 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(323 downto 0)    <= buf_input_r(387 downto 64);
            bits_in_buffer               <= 324;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 389 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(324 downto 0)    <= buf_input_r(388 downto 64);
            bits_in_buffer               <= 325;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 390 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(325 downto 0)    <= buf_input_r(389 downto 64);
            bits_in_buffer               <= 326;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 391 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(326 downto 0)    <= buf_input_r(390 downto 64);
            bits_in_buffer               <= 327;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 392 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(327 downto 0)    <= buf_input_r(391 downto 64);
            bits_in_buffer               <= 328;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 393 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(328 downto 0)    <= buf_input_r(392 downto 64);
            bits_in_buffer               <= 329;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 394 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(329 downto 0)    <= buf_input_r(393 downto 64);
            bits_in_buffer               <= 330;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 395 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(330 downto 0)    <= buf_input_r(394 downto 64);
            bits_in_buffer               <= 331;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 396 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(331 downto 0)    <= buf_input_r(395 downto 64);
            bits_in_buffer               <= 332;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 397 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(332 downto 0)    <= buf_input_r(396 downto 64);
            bits_in_buffer               <= 333;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 398 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(333 downto 0)    <= buf_input_r(397 downto 64);
            bits_in_buffer               <= 334;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 399 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(334 downto 0)    <= buf_input_r(398 downto 64);
            bits_in_buffer               <= 335;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 400 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(335 downto 0)    <= buf_input_r(399 downto 64);
            bits_in_buffer               <= 336;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 401 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(336 downto 0)    <= buf_input_r(400 downto 64);
            bits_in_buffer               <= 337;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 402 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(337 downto 0)    <= buf_input_r(401 downto 64);
            bits_in_buffer               <= 338;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 403 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(338 downto 0)    <= buf_input_r(402 downto 64);
            bits_in_buffer               <= 339;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 404 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(339 downto 0)    <= buf_input_r(403 downto 64);
            bits_in_buffer               <= 340;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 405 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(340 downto 0)    <= buf_input_r(404 downto 64);
            bits_in_buffer               <= 341;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 406 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(341 downto 0)    <= buf_input_r(405 downto 64);
            bits_in_buffer               <= 342;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 407 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(342 downto 0)    <= buf_input_r(406 downto 64);
            bits_in_buffer               <= 343;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 408 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(343 downto 0)    <= buf_input_r(407 downto 64);
            bits_in_buffer               <= 344;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 409 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(344 downto 0)    <= buf_input_r(408 downto 64);
            bits_in_buffer               <= 345;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 410 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(345 downto 0)    <= buf_input_r(409 downto 64);
            bits_in_buffer               <= 346;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 411 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(346 downto 0)    <= buf_input_r(410 downto 64);
            bits_in_buffer               <= 347;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 412 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(347 downto 0)    <= buf_input_r(411 downto 64);
            bits_in_buffer               <= 348;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 413 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(348 downto 0)    <= buf_input_r(412 downto 64);
            bits_in_buffer               <= 349;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 414 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(349 downto 0)    <= buf_input_r(413 downto 64);
            bits_in_buffer               <= 350;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 415 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(350 downto 0)    <= buf_input_r(414 downto 64);
            bits_in_buffer               <= 351;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 416 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(351 downto 0)    <= buf_input_r(415 downto 64);
            bits_in_buffer               <= 352;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 417 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(352 downto 0)    <= buf_input_r(416 downto 64);
            bits_in_buffer               <= 353;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 418 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(353 downto 0)    <= buf_input_r(417 downto 64);
            bits_in_buffer               <= 354;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 419 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(354 downto 0)    <= buf_input_r(418 downto 64);
            bits_in_buffer               <= 355;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 420 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(355 downto 0)    <= buf_input_r(419 downto 64);
            bits_in_buffer               <= 356;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 421 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(356 downto 0)    <= buf_input_r(420 downto 64);
            bits_in_buffer               <= 357;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 422 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(357 downto 0)    <= buf_input_r(421 downto 64);
            bits_in_buffer               <= 358;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 423 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(358 downto 0)    <= buf_input_r(422 downto 64);
            bits_in_buffer               <= 359;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 424 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(359 downto 0)    <= buf_input_r(423 downto 64);
            bits_in_buffer               <= 360;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 425 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(360 downto 0)    <= buf_input_r(424 downto 64);
            bits_in_buffer               <= 361;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 426 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(361 downto 0)    <= buf_input_r(425 downto 64);
            bits_in_buffer               <= 362;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 427 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(362 downto 0)    <= buf_input_r(426 downto 64);
            bits_in_buffer               <= 363;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 428 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(363 downto 0)    <= buf_input_r(427 downto 64);
            bits_in_buffer               <= 364;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 429 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(364 downto 0)    <= buf_input_r(428 downto 64);
            bits_in_buffer               <= 365;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 430 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(365 downto 0)    <= buf_input_r(429 downto 64);
            bits_in_buffer               <= 366;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 431 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(366 downto 0)    <= buf_input_r(430 downto 64);
            bits_in_buffer               <= 367;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 432 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(367 downto 0)    <= buf_input_r(431 downto 64);
            bits_in_buffer               <= 368;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 433 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(368 downto 0)    <= buf_input_r(432 downto 64);
            bits_in_buffer               <= 369;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 434 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(369 downto 0)    <= buf_input_r(433 downto 64);
            bits_in_buffer               <= 370;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 435 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(370 downto 0)    <= buf_input_r(434 downto 64);
            bits_in_buffer               <= 371;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 436 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(371 downto 0)    <= buf_input_r(435 downto 64);
            bits_in_buffer               <= 372;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 437 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(372 downto 0)    <= buf_input_r(436 downto 64);
            bits_in_buffer               <= 373;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 438 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(373 downto 0)    <= buf_input_r(437 downto 64);
            bits_in_buffer               <= 374;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 439 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(374 downto 0)    <= buf_input_r(438 downto 64);
            bits_in_buffer               <= 375;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 440 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(375 downto 0)    <= buf_input_r(439 downto 64);
            bits_in_buffer               <= 376;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 441 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(376 downto 0)    <= buf_input_r(440 downto 64);
            bits_in_buffer               <= 377;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 442 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(377 downto 0)    <= buf_input_r(441 downto 64);
            bits_in_buffer               <= 378;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 443 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(378 downto 0)    <= buf_input_r(442 downto 64);
            bits_in_buffer               <= 379;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 444 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(379 downto 0)    <= buf_input_r(443 downto 64);
            bits_in_buffer               <= 380;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 445 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(380 downto 0)    <= buf_input_r(444 downto 64);
            bits_in_buffer               <= 381;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 446 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(381 downto 0)    <= buf_input_r(445 downto 64);
            bits_in_buffer               <= 382;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 447 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(382 downto 0)    <= buf_input_r(446 downto 64);
            bits_in_buffer               <= 383;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 448 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(383 downto 0)    <= buf_input_r(447 downto 64);
            bits_in_buffer               <= 384;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 449 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(384 downto 0)    <= buf_input_r(448 downto 64);
            bits_in_buffer               <= 385;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 450 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(385 downto 0)    <= buf_input_r(449 downto 64);
            bits_in_buffer               <= 386;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 451 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(386 downto 0)    <= buf_input_r(450 downto 64);
            bits_in_buffer               <= 387;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 452 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(387 downto 0)    <= buf_input_r(451 downto 64);
            bits_in_buffer               <= 388;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 453 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(388 downto 0)    <= buf_input_r(452 downto 64);
            bits_in_buffer               <= 389;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 454 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(389 downto 0)    <= buf_input_r(453 downto 64);
            bits_in_buffer               <= 390;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 455 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(390 downto 0)    <= buf_input_r(454 downto 64);
            bits_in_buffer               <= 391;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 456 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(391 downto 0)    <= buf_input_r(455 downto 64);
            bits_in_buffer               <= 392;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 457 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(392 downto 0)    <= buf_input_r(456 downto 64);
            bits_in_buffer               <= 393;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 458 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(393 downto 0)    <= buf_input_r(457 downto 64);
            bits_in_buffer               <= 394;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 459 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(394 downto 0)    <= buf_input_r(458 downto 64);
            bits_in_buffer               <= 395;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 460 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(395 downto 0)    <= buf_input_r(459 downto 64);
            bits_in_buffer               <= 396;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 461 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(396 downto 0)    <= buf_input_r(460 downto 64);
            bits_in_buffer               <= 397;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 462 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(397 downto 0)    <= buf_input_r(461 downto 64);
            bits_in_buffer               <= 398;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 463 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(398 downto 0)    <= buf_input_r(462 downto 64);
            bits_in_buffer               <= 399;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 464 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(399 downto 0)    <= buf_input_r(463 downto 64);
            bits_in_buffer               <= 400;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 465 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(400 downto 0)    <= buf_input_r(464 downto 64);
            bits_in_buffer               <= 401;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 466 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(401 downto 0)    <= buf_input_r(465 downto 64);
            bits_in_buffer               <= 402;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 467 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(402 downto 0)    <= buf_input_r(466 downto 64);
            bits_in_buffer               <= 403;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 468 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(403 downto 0)    <= buf_input_r(467 downto 64);
            bits_in_buffer               <= 404;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 469 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(404 downto 0)    <= buf_input_r(468 downto 64);
            bits_in_buffer               <= 405;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 470 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(405 downto 0)    <= buf_input_r(469 downto 64);
            bits_in_buffer               <= 406;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 471 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(406 downto 0)    <= buf_input_r(470 downto 64);
            bits_in_buffer               <= 407;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 472 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(407 downto 0)    <= buf_input_r(471 downto 64);
            bits_in_buffer               <= 408;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 473 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(408 downto 0)    <= buf_input_r(472 downto 64);
            bits_in_buffer               <= 409;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 474 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(409 downto 0)    <= buf_input_r(473 downto 64);
            bits_in_buffer               <= 410;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 475 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(410 downto 0)    <= buf_input_r(474 downto 64);
            bits_in_buffer               <= 411;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 476 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(411 downto 0)    <= buf_input_r(475 downto 64);
            bits_in_buffer               <= 412;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 477 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(412 downto 0)    <= buf_input_r(476 downto 64);
            bits_in_buffer               <= 413;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 478 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(413 downto 0)    <= buf_input_r(477 downto 64);
            bits_in_buffer               <= 414;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        end case;

        end if;
    end process the_buffing_process;
    end architecture arch_word_compressor_239IN_to_64OUT;