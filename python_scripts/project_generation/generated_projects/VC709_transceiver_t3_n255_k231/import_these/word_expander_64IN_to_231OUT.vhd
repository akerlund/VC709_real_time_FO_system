----------------------------------------------------------------------------------
    -- Company:  Chalmers
    -- Engineer: Fredrik Åkerlund
    -- 
    -- Create Date: Mon Jul 24 13:30:05 2017

    -- Design Name: 
    -- Module Name: word_expander_64IN_to_231OUT - arch_word_expander_64IN_to_231OUT
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
    entity word_expander_64IN_to_231OUT is

    generic(
        IN_WIDTH  : integer := 64;
        OUT_WIDTH : integer := 231
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
    end word_expander_64IN_to_231OUT;
architecture arch_word_expander_64IN_to_231OUT of word_expander_64IN_to_231OUT is

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
            if bits_in_buffer >= 167 then
                out_rdy_r <= '1';
                case bits_in_buffer is
                    when 167 =>
                        buf_output_r(166 downto 0)   <= buf_input_r(166 downto 0);
                        buf_output_r(230 downto 167) <= data_in(63 downto 0);
                        buf_input_r                  <= (others=>'0');
                        bits_in_buffer               <= 0;
                    when 168 =>
                        buf_output_r(167 downto 0)   <= buf_input_r(167 downto 0);
                        buf_output_r(230 downto 168) <= data_in(62 downto 0);
                        buf_input_r (0 downto 0)     <= data_in(63 downto 63);
                        bits_in_buffer               <= 1;
                    when 169 =>
                        buf_output_r(168 downto 0)   <= buf_input_r(168 downto 0);
                        buf_output_r(230 downto 169) <= data_in(61 downto 0);
                        buf_input_r (1 downto 0)     <= data_in(63 downto 62);
                        bits_in_buffer               <= 2;
                    when 170 =>
                        buf_output_r(169 downto 0)   <= buf_input_r(169 downto 0);
                        buf_output_r(230 downto 170) <= data_in(60 downto 0);
                        buf_input_r (2 downto 0)     <= data_in(63 downto 61);
                        bits_in_buffer               <= 3;
                    when 171 =>
                        buf_output_r(170 downto 0)   <= buf_input_r(170 downto 0);
                        buf_output_r(230 downto 171) <= data_in(59 downto 0);
                        buf_input_r (3 downto 0)     <= data_in(63 downto 60);
                        bits_in_buffer               <= 4;
                    when 172 =>
                        buf_output_r(171 downto 0)   <= buf_input_r(171 downto 0);
                        buf_output_r(230 downto 172) <= data_in(58 downto 0);
                        buf_input_r (4 downto 0)     <= data_in(63 downto 59);
                        bits_in_buffer               <= 5;
                    when 173 =>
                        buf_output_r(172 downto 0)   <= buf_input_r(172 downto 0);
                        buf_output_r(230 downto 173) <= data_in(57 downto 0);
                        buf_input_r (5 downto 0)     <= data_in(63 downto 58);
                        bits_in_buffer               <= 6;
                    when 174 =>
                        buf_output_r(173 downto 0)   <= buf_input_r(173 downto 0);
                        buf_output_r(230 downto 174) <= data_in(56 downto 0);
                        buf_input_r (6 downto 0)     <= data_in(63 downto 57);
                        bits_in_buffer               <= 7;
                    when 175 =>
                        buf_output_r(174 downto 0)   <= buf_input_r(174 downto 0);
                        buf_output_r(230 downto 175) <= data_in(55 downto 0);
                        buf_input_r (7 downto 0)     <= data_in(63 downto 56);
                        bits_in_buffer               <= 8;
                    when 176 =>
                        buf_output_r(175 downto 0)   <= buf_input_r(175 downto 0);
                        buf_output_r(230 downto 176) <= data_in(54 downto 0);
                        buf_input_r (8 downto 0)     <= data_in(63 downto 55);
                        bits_in_buffer               <= 9;
                    when 177 =>
                        buf_output_r(176 downto 0)   <= buf_input_r(176 downto 0);
                        buf_output_r(230 downto 177) <= data_in(53 downto 0);
                        buf_input_r (9 downto 0)     <= data_in(63 downto 54);
                        bits_in_buffer               <= 10;
                    when 178 =>
                        buf_output_r(177 downto 0)   <= buf_input_r(177 downto 0);
                        buf_output_r(230 downto 178) <= data_in(52 downto 0);
                        buf_input_r (10 downto 0)    <= data_in(63 downto 53);
                        bits_in_buffer               <= 11;
                    when 179 =>
                        buf_output_r(178 downto 0)   <= buf_input_r(178 downto 0);
                        buf_output_r(230 downto 179) <= data_in(51 downto 0);
                        buf_input_r (11 downto 0)    <= data_in(63 downto 52);
                        bits_in_buffer               <= 12;
                    when 180 =>
                        buf_output_r(179 downto 0)   <= buf_input_r(179 downto 0);
                        buf_output_r(230 downto 180) <= data_in(50 downto 0);
                        buf_input_r (12 downto 0)    <= data_in(63 downto 51);
                        bits_in_buffer               <= 13;
                    when 181 =>
                        buf_output_r(180 downto 0)   <= buf_input_r(180 downto 0);
                        buf_output_r(230 downto 181) <= data_in(49 downto 0);
                        buf_input_r (13 downto 0)    <= data_in(63 downto 50);
                        bits_in_buffer               <= 14;
                    when 182 =>
                        buf_output_r(181 downto 0)   <= buf_input_r(181 downto 0);
                        buf_output_r(230 downto 182) <= data_in(48 downto 0);
                        buf_input_r (14 downto 0)    <= data_in(63 downto 49);
                        bits_in_buffer               <= 15;
                    when 183 =>
                        buf_output_r(182 downto 0)   <= buf_input_r(182 downto 0);
                        buf_output_r(230 downto 183) <= data_in(47 downto 0);
                        buf_input_r (15 downto 0)    <= data_in(63 downto 48);
                        bits_in_buffer               <= 16;
                    when 184 =>
                        buf_output_r(183 downto 0)   <= buf_input_r(183 downto 0);
                        buf_output_r(230 downto 184) <= data_in(46 downto 0);
                        buf_input_r (16 downto 0)    <= data_in(63 downto 47);
                        bits_in_buffer               <= 17;
                    when 185 =>
                        buf_output_r(184 downto 0)   <= buf_input_r(184 downto 0);
                        buf_output_r(230 downto 185) <= data_in(45 downto 0);
                        buf_input_r (17 downto 0)    <= data_in(63 downto 46);
                        bits_in_buffer               <= 18;
                    when 186 =>
                        buf_output_r(185 downto 0)   <= buf_input_r(185 downto 0);
                        buf_output_r(230 downto 186) <= data_in(44 downto 0);
                        buf_input_r (18 downto 0)    <= data_in(63 downto 45);
                        bits_in_buffer               <= 19;
                    when 187 =>
                        buf_output_r(186 downto 0)   <= buf_input_r(186 downto 0);
                        buf_output_r(230 downto 187) <= data_in(43 downto 0);
                        buf_input_r (19 downto 0)    <= data_in(63 downto 44);
                        bits_in_buffer               <= 20;
                    when 188 =>
                        buf_output_r(187 downto 0)   <= buf_input_r(187 downto 0);
                        buf_output_r(230 downto 188) <= data_in(42 downto 0);
                        buf_input_r (20 downto 0)    <= data_in(63 downto 43);
                        bits_in_buffer               <= 21;
                    when 189 =>
                        buf_output_r(188 downto 0)   <= buf_input_r(188 downto 0);
                        buf_output_r(230 downto 189) <= data_in(41 downto 0);
                        buf_input_r (21 downto 0)    <= data_in(63 downto 42);
                        bits_in_buffer               <= 22;
                    when 190 =>
                        buf_output_r(189 downto 0)   <= buf_input_r(189 downto 0);
                        buf_output_r(230 downto 190) <= data_in(40 downto 0);
                        buf_input_r (22 downto 0)    <= data_in(63 downto 41);
                        bits_in_buffer               <= 23;
                    when 191 =>
                        buf_output_r(190 downto 0)   <= buf_input_r(190 downto 0);
                        buf_output_r(230 downto 191) <= data_in(39 downto 0);
                        buf_input_r (23 downto 0)    <= data_in(63 downto 40);
                        bits_in_buffer               <= 24;
                    when 192 =>
                        buf_output_r(191 downto 0)   <= buf_input_r(191 downto 0);
                        buf_output_r(230 downto 192) <= data_in(38 downto 0);
                        buf_input_r (24 downto 0)    <= data_in(63 downto 39);
                        bits_in_buffer               <= 25;
                    when 193 =>
                        buf_output_r(192 downto 0)   <= buf_input_r(192 downto 0);
                        buf_output_r(230 downto 193) <= data_in(37 downto 0);
                        buf_input_r (25 downto 0)    <= data_in(63 downto 38);
                        bits_in_buffer               <= 26;
                    when 194 =>
                        buf_output_r(193 downto 0)   <= buf_input_r(193 downto 0);
                        buf_output_r(230 downto 194) <= data_in(36 downto 0);
                        buf_input_r (26 downto 0)    <= data_in(63 downto 37);
                        bits_in_buffer               <= 27;
                    when 195 =>
                        buf_output_r(194 downto 0)   <= buf_input_r(194 downto 0);
                        buf_output_r(230 downto 195) <= data_in(35 downto 0);
                        buf_input_r (27 downto 0)    <= data_in(63 downto 36);
                        bits_in_buffer               <= 28;
                    when 196 =>
                        buf_output_r(195 downto 0)   <= buf_input_r(195 downto 0);
                        buf_output_r(230 downto 196) <= data_in(34 downto 0);
                        buf_input_r (28 downto 0)    <= data_in(63 downto 35);
                        bits_in_buffer               <= 29;
                    when 197 =>
                        buf_output_r(196 downto 0)   <= buf_input_r(196 downto 0);
                        buf_output_r(230 downto 197) <= data_in(33 downto 0);
                        buf_input_r (29 downto 0)    <= data_in(63 downto 34);
                        bits_in_buffer               <= 30;
                    when 198 =>
                        buf_output_r(197 downto 0)   <= buf_input_r(197 downto 0);
                        buf_output_r(230 downto 198) <= data_in(32 downto 0);
                        buf_input_r (30 downto 0)    <= data_in(63 downto 33);
                        bits_in_buffer               <= 31;
                    when 199 =>
                        buf_output_r(198 downto 0)   <= buf_input_r(198 downto 0);
                        buf_output_r(230 downto 199) <= data_in(31 downto 0);
                        buf_input_r (31 downto 0)    <= data_in(63 downto 32);
                        bits_in_buffer               <= 32;
                    when 200 =>
                        buf_output_r(199 downto 0)   <= buf_input_r(199 downto 0);
                        buf_output_r(230 downto 200) <= data_in(30 downto 0);
                        buf_input_r (32 downto 0)    <= data_in(63 downto 31);
                        bits_in_buffer               <= 33;
                    when 201 =>
                        buf_output_r(200 downto 0)   <= buf_input_r(200 downto 0);
                        buf_output_r(230 downto 201) <= data_in(29 downto 0);
                        buf_input_r (33 downto 0)    <= data_in(63 downto 30);
                        bits_in_buffer               <= 34;
                    when 202 =>
                        buf_output_r(201 downto 0)   <= buf_input_r(201 downto 0);
                        buf_output_r(230 downto 202) <= data_in(28 downto 0);
                        buf_input_r (34 downto 0)    <= data_in(63 downto 29);
                        bits_in_buffer               <= 35;
                    when 203 =>
                        buf_output_r(202 downto 0)   <= buf_input_r(202 downto 0);
                        buf_output_r(230 downto 203) <= data_in(27 downto 0);
                        buf_input_r (35 downto 0)    <= data_in(63 downto 28);
                        bits_in_buffer               <= 36;
                    when 204 =>
                        buf_output_r(203 downto 0)   <= buf_input_r(203 downto 0);
                        buf_output_r(230 downto 204) <= data_in(26 downto 0);
                        buf_input_r (36 downto 0)    <= data_in(63 downto 27);
                        bits_in_buffer               <= 37;
                    when 205 =>
                        buf_output_r(204 downto 0)   <= buf_input_r(204 downto 0);
                        buf_output_r(230 downto 205) <= data_in(25 downto 0);
                        buf_input_r (37 downto 0)    <= data_in(63 downto 26);
                        bits_in_buffer               <= 38;
                    when 206 =>
                        buf_output_r(205 downto 0)   <= buf_input_r(205 downto 0);
                        buf_output_r(230 downto 206) <= data_in(24 downto 0);
                        buf_input_r (38 downto 0)    <= data_in(63 downto 25);
                        bits_in_buffer               <= 39;
                    when 207 =>
                        buf_output_r(206 downto 0)   <= buf_input_r(206 downto 0);
                        buf_output_r(230 downto 207) <= data_in(23 downto 0);
                        buf_input_r (39 downto 0)    <= data_in(63 downto 24);
                        bits_in_buffer               <= 40;
                    when 208 =>
                        buf_output_r(207 downto 0)   <= buf_input_r(207 downto 0);
                        buf_output_r(230 downto 208) <= data_in(22 downto 0);
                        buf_input_r (40 downto 0)    <= data_in(63 downto 23);
                        bits_in_buffer               <= 41;
                    when 209 =>
                        buf_output_r(208 downto 0)   <= buf_input_r(208 downto 0);
                        buf_output_r(230 downto 209) <= data_in(21 downto 0);
                        buf_input_r (41 downto 0)    <= data_in(63 downto 22);
                        bits_in_buffer               <= 42;
                    when 210 =>
                        buf_output_r(209 downto 0)   <= buf_input_r(209 downto 0);
                        buf_output_r(230 downto 210) <= data_in(20 downto 0);
                        buf_input_r (42 downto 0)    <= data_in(63 downto 21);
                        bits_in_buffer               <= 43;
                    when 211 =>
                        buf_output_r(210 downto 0)   <= buf_input_r(210 downto 0);
                        buf_output_r(230 downto 211) <= data_in(19 downto 0);
                        buf_input_r (43 downto 0)    <= data_in(63 downto 20);
                        bits_in_buffer               <= 44;
                    when 212 =>
                        buf_output_r(211 downto 0)   <= buf_input_r(211 downto 0);
                        buf_output_r(230 downto 212) <= data_in(18 downto 0);
                        buf_input_r (44 downto 0)    <= data_in(63 downto 19);
                        bits_in_buffer               <= 45;
                    when 213 =>
                        buf_output_r(212 downto 0)   <= buf_input_r(212 downto 0);
                        buf_output_r(230 downto 213) <= data_in(17 downto 0);
                        buf_input_r (45 downto 0)    <= data_in(63 downto 18);
                        bits_in_buffer               <= 46;
                    when 214 =>
                        buf_output_r(213 downto 0)   <= buf_input_r(213 downto 0);
                        buf_output_r(230 downto 214) <= data_in(16 downto 0);
                        buf_input_r (46 downto 0)    <= data_in(63 downto 17);
                        bits_in_buffer               <= 47;
                    when 215 =>
                        buf_output_r(214 downto 0)   <= buf_input_r(214 downto 0);
                        buf_output_r(230 downto 215) <= data_in(15 downto 0);
                        buf_input_r (47 downto 0)    <= data_in(63 downto 16);
                        bits_in_buffer               <= 48;
                    when 216 =>
                        buf_output_r(215 downto 0)   <= buf_input_r(215 downto 0);
                        buf_output_r(230 downto 216) <= data_in(14 downto 0);
                        buf_input_r (48 downto 0)    <= data_in(63 downto 15);
                        bits_in_buffer               <= 49;
                    when 217 =>
                        buf_output_r(216 downto 0)   <= buf_input_r(216 downto 0);
                        buf_output_r(230 downto 217) <= data_in(13 downto 0);
                        buf_input_r (49 downto 0)    <= data_in(63 downto 14);
                        bits_in_buffer               <= 50;
                    when 218 =>
                        buf_output_r(217 downto 0)   <= buf_input_r(217 downto 0);
                        buf_output_r(230 downto 218) <= data_in(12 downto 0);
                        buf_input_r (50 downto 0)    <= data_in(63 downto 13);
                        bits_in_buffer               <= 51;
                    when 219 =>
                        buf_output_r(218 downto 0)   <= buf_input_r(218 downto 0);
                        buf_output_r(230 downto 219) <= data_in(11 downto 0);
                        buf_input_r (51 downto 0)    <= data_in(63 downto 12);
                        bits_in_buffer               <= 52;
                    when 220 =>
                        buf_output_r(219 downto 0)   <= buf_input_r(219 downto 0);
                        buf_output_r(230 downto 220) <= data_in(10 downto 0);
                        buf_input_r (52 downto 0)    <= data_in(63 downto 11);
                        bits_in_buffer               <= 53;
                    when 221 =>
                        buf_output_r(220 downto 0)   <= buf_input_r(220 downto 0);
                        buf_output_r(230 downto 221) <= data_in(9 downto 0);
                        buf_input_r (53 downto 0)    <= data_in(63 downto 10);
                        bits_in_buffer               <= 54;
                    when 222 =>
                        buf_output_r(221 downto 0)   <= buf_input_r(221 downto 0);
                        buf_output_r(230 downto 222) <= data_in(8 downto 0);
                        buf_input_r (54 downto 0)    <= data_in(63 downto 9);
                        bits_in_buffer               <= 55;
                    when 223 =>
                        buf_output_r(222 downto 0)   <= buf_input_r(222 downto 0);
                        buf_output_r(230 downto 223) <= data_in(7 downto 0);
                        buf_input_r (55 downto 0)    <= data_in(63 downto 8);
                        bits_in_buffer               <= 56;
                    when 224 =>
                        buf_output_r(223 downto 0)   <= buf_input_r(223 downto 0);
                        buf_output_r(230 downto 224) <= data_in(6 downto 0);
                        buf_input_r (56 downto 0)    <= data_in(63 downto 7);
                        bits_in_buffer               <= 57;
                    when 225 =>
                        buf_output_r(224 downto 0)   <= buf_input_r(224 downto 0);
                        buf_output_r(230 downto 225) <= data_in(5 downto 0);
                        buf_input_r (57 downto 0)    <= data_in(63 downto 6);
                        bits_in_buffer               <= 58;
                    when 226 =>
                        buf_output_r(225 downto 0)   <= buf_input_r(225 downto 0);
                        buf_output_r(230 downto 226) <= data_in(4 downto 0);
                        buf_input_r (58 downto 0)    <= data_in(63 downto 5);
                        bits_in_buffer               <= 59;
                    when 227 =>
                        buf_output_r(226 downto 0)   <= buf_input_r(226 downto 0);
                        buf_output_r(230 downto 227) <= data_in(3 downto 0);
                        buf_input_r (59 downto 0)    <= data_in(63 downto 4);
                        bits_in_buffer               <= 60;
                    when 228 =>
                        buf_output_r(227 downto 0)   <= buf_input_r(227 downto 0);
                        buf_output_r(230 downto 228) <= data_in(2 downto 0);
                        buf_input_r (60 downto 0)    <= data_in(63 downto 3);
                        bits_in_buffer               <= 61;
                    when 229 =>
                        buf_output_r(228 downto 0)   <= buf_input_r(228 downto 0);
                        buf_output_r(230 downto 229) <= data_in(1 downto 0);
                        buf_input_r (61 downto 0)    <= data_in(63 downto 2);
                        bits_in_buffer               <= 62;
                    when 230 =>
                        buf_output_r(229 downto 0)   <= buf_input_r(229 downto 0);
                        buf_output_r(230 downto 230) <= data_in(0 downto 0);
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
                    when 49 =>
                        buf_input_r (112 downto 49)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 113;
                    when 50 =>
                        buf_input_r (113 downto 50)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 114;
                    when 51 =>
                        buf_input_r (114 downto 51)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 115;
                    when 52 =>
                        buf_input_r (115 downto 52)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 116;
                    when 53 =>
                        buf_input_r (116 downto 53)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 117;
                    when 54 =>
                        buf_input_r (117 downto 54)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 118;
                    when 55 =>
                        buf_input_r (118 downto 55)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 119;
                    when 56 =>
                        buf_input_r (119 downto 56)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 120;
                    when 57 =>
                        buf_input_r (120 downto 57)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 121;
                    when 58 =>
                        buf_input_r (121 downto 58)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 122;
                    when 59 =>
                        buf_input_r (122 downto 59)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 123;
                    when 60 =>
                        buf_input_r (123 downto 60)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 124;
                    when 61 =>
                        buf_input_r (124 downto 61)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 125;
                    when 62 =>
                        buf_input_r (125 downto 62)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 126;
                    when 63 =>
                        buf_input_r (126 downto 63)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 127;
                    when 64 =>
                        buf_input_r (127 downto 64)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 128;
                    when 65 =>
                        buf_input_r (128 downto 65)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 129;
                    when 66 =>
                        buf_input_r (129 downto 66)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 130;
                    when 67 =>
                        buf_input_r (130 downto 67)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 131;
                    when 68 =>
                        buf_input_r (131 downto 68)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 132;
                    when 69 =>
                        buf_input_r (132 downto 69)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 133;
                    when 70 =>
                        buf_input_r (133 downto 70)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 134;
                    when 71 =>
                        buf_input_r (134 downto 71)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 135;
                    when 72 =>
                        buf_input_r (135 downto 72)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 136;
                    when 73 =>
                        buf_input_r (136 downto 73)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 137;
                    when 74 =>
                        buf_input_r (137 downto 74)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 138;
                    when 75 =>
                        buf_input_r (138 downto 75)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 139;
                    when 76 =>
                        buf_input_r (139 downto 76)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 140;
                    when 77 =>
                        buf_input_r (140 downto 77)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 141;
                    when 78 =>
                        buf_input_r (141 downto 78)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 142;
                    when 79 =>
                        buf_input_r (142 downto 79)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 143;
                    when 80 =>
                        buf_input_r (143 downto 80)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 144;
                    when 81 =>
                        buf_input_r (144 downto 81)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 145;
                    when 82 =>
                        buf_input_r (145 downto 82)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 146;
                    when 83 =>
                        buf_input_r (146 downto 83)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 147;
                    when 84 =>
                        buf_input_r (147 downto 84)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 148;
                    when 85 =>
                        buf_input_r (148 downto 85)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 149;
                    when 86 =>
                        buf_input_r (149 downto 86)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 150;
                    when 87 =>
                        buf_input_r (150 downto 87)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 151;
                    when 88 =>
                        buf_input_r (151 downto 88)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 152;
                    when 89 =>
                        buf_input_r (152 downto 89)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 153;
                    when 90 =>
                        buf_input_r (153 downto 90)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 154;
                    when 91 =>
                        buf_input_r (154 downto 91)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 155;
                    when 92 =>
                        buf_input_r (155 downto 92)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 156;
                    when 93 =>
                        buf_input_r (156 downto 93)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 157;
                    when 94 =>
                        buf_input_r (157 downto 94)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 158;
                    when 95 =>
                        buf_input_r (158 downto 95)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 159;
                    when 96 =>
                        buf_input_r (159 downto 96)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 160;
                    when 97 =>
                        buf_input_r (160 downto 97)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 161;
                    when 98 =>
                        buf_input_r (161 downto 98)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 162;
                    when 99 =>
                        buf_input_r (162 downto 99)  <= data_in(63 downto 0);
                        bits_in_buffer               <= 163;
                    when 100 =>
                        buf_input_r (163 downto 100) <= data_in(63 downto 0);
                        bits_in_buffer               <= 164;
                    when 101 =>
                        buf_input_r (164 downto 101) <= data_in(63 downto 0);
                        bits_in_buffer               <= 165;
                    when 102 =>
                        buf_input_r (165 downto 102) <= data_in(63 downto 0);
                        bits_in_buffer               <= 166;
                    when 103 =>
                        buf_input_r (166 downto 103) <= data_in(63 downto 0);
                        bits_in_buffer               <= 167;
                    when 104 =>
                        buf_input_r (167 downto 104) <= data_in(63 downto 0);
                        bits_in_buffer               <= 168;
                    when 105 =>
                        buf_input_r (168 downto 105) <= data_in(63 downto 0);
                        bits_in_buffer               <= 169;
                    when 106 =>
                        buf_input_r (169 downto 106) <= data_in(63 downto 0);
                        bits_in_buffer               <= 170;
                    when 107 =>
                        buf_input_r (170 downto 107) <= data_in(63 downto 0);
                        bits_in_buffer               <= 171;
                    when 108 =>
                        buf_input_r (171 downto 108) <= data_in(63 downto 0);
                        bits_in_buffer               <= 172;
                    when 109 =>
                        buf_input_r (172 downto 109) <= data_in(63 downto 0);
                        bits_in_buffer               <= 173;
                    when 110 =>
                        buf_input_r (173 downto 110) <= data_in(63 downto 0);
                        bits_in_buffer               <= 174;
                    when 111 =>
                        buf_input_r (174 downto 111) <= data_in(63 downto 0);
                        bits_in_buffer               <= 175;
                    when 112 =>
                        buf_input_r (175 downto 112) <= data_in(63 downto 0);
                        bits_in_buffer               <= 176;
                    when 113 =>
                        buf_input_r (176 downto 113) <= data_in(63 downto 0);
                        bits_in_buffer               <= 177;
                    when 114 =>
                        buf_input_r (177 downto 114) <= data_in(63 downto 0);
                        bits_in_buffer               <= 178;
                    when 115 =>
                        buf_input_r (178 downto 115) <= data_in(63 downto 0);
                        bits_in_buffer               <= 179;
                    when 116 =>
                        buf_input_r (179 downto 116) <= data_in(63 downto 0);
                        bits_in_buffer               <= 180;
                    when 117 =>
                        buf_input_r (180 downto 117) <= data_in(63 downto 0);
                        bits_in_buffer               <= 181;
                    when 118 =>
                        buf_input_r (181 downto 118) <= data_in(63 downto 0);
                        bits_in_buffer               <= 182;
                    when 119 =>
                        buf_input_r (182 downto 119) <= data_in(63 downto 0);
                        bits_in_buffer               <= 183;
                    when 120 =>
                        buf_input_r (183 downto 120) <= data_in(63 downto 0);
                        bits_in_buffer               <= 184;
                    when 121 =>
                        buf_input_r (184 downto 121) <= data_in(63 downto 0);
                        bits_in_buffer               <= 185;
                    when 122 =>
                        buf_input_r (185 downto 122) <= data_in(63 downto 0);
                        bits_in_buffer               <= 186;
                    when 123 =>
                        buf_input_r (186 downto 123) <= data_in(63 downto 0);
                        bits_in_buffer               <= 187;
                    when 124 =>
                        buf_input_r (187 downto 124) <= data_in(63 downto 0);
                        bits_in_buffer               <= 188;
                    when 125 =>
                        buf_input_r (188 downto 125) <= data_in(63 downto 0);
                        bits_in_buffer               <= 189;
                    when 126 =>
                        buf_input_r (189 downto 126) <= data_in(63 downto 0);
                        bits_in_buffer               <= 190;
                    when 127 =>
                        buf_input_r (190 downto 127) <= data_in(63 downto 0);
                        bits_in_buffer               <= 191;
                    when 128 =>
                        buf_input_r (191 downto 128) <= data_in(63 downto 0);
                        bits_in_buffer               <= 192;
                    when 129 =>
                        buf_input_r (192 downto 129) <= data_in(63 downto 0);
                        bits_in_buffer               <= 193;
                    when 130 =>
                        buf_input_r (193 downto 130) <= data_in(63 downto 0);
                        bits_in_buffer               <= 194;
                    when 131 =>
                        buf_input_r (194 downto 131) <= data_in(63 downto 0);
                        bits_in_buffer               <= 195;
                    when 132 =>
                        buf_input_r (195 downto 132) <= data_in(63 downto 0);
                        bits_in_buffer               <= 196;
                    when 133 =>
                        buf_input_r (196 downto 133) <= data_in(63 downto 0);
                        bits_in_buffer               <= 197;
                    when 134 =>
                        buf_input_r (197 downto 134) <= data_in(63 downto 0);
                        bits_in_buffer               <= 198;
                    when 135 =>
                        buf_input_r (198 downto 135) <= data_in(63 downto 0);
                        bits_in_buffer               <= 199;
                    when 136 =>
                        buf_input_r (199 downto 136) <= data_in(63 downto 0);
                        bits_in_buffer               <= 200;
                    when 137 =>
                        buf_input_r (200 downto 137) <= data_in(63 downto 0);
                        bits_in_buffer               <= 201;
                    when 138 =>
                        buf_input_r (201 downto 138) <= data_in(63 downto 0);
                        bits_in_buffer               <= 202;
                    when 139 =>
                        buf_input_r (202 downto 139) <= data_in(63 downto 0);
                        bits_in_buffer               <= 203;
                    when 140 =>
                        buf_input_r (203 downto 140) <= data_in(63 downto 0);
                        bits_in_buffer               <= 204;
                    when 141 =>
                        buf_input_r (204 downto 141) <= data_in(63 downto 0);
                        bits_in_buffer               <= 205;
                    when 142 =>
                        buf_input_r (205 downto 142) <= data_in(63 downto 0);
                        bits_in_buffer               <= 206;
                    when 143 =>
                        buf_input_r (206 downto 143) <= data_in(63 downto 0);
                        bits_in_buffer               <= 207;
                    when 144 =>
                        buf_input_r (207 downto 144) <= data_in(63 downto 0);
                        bits_in_buffer               <= 208;
                    when 145 =>
                        buf_input_r (208 downto 145) <= data_in(63 downto 0);
                        bits_in_buffer               <= 209;
                    when 146 =>
                        buf_input_r (209 downto 146) <= data_in(63 downto 0);
                        bits_in_buffer               <= 210;
                    when 147 =>
                        buf_input_r (210 downto 147) <= data_in(63 downto 0);
                        bits_in_buffer               <= 211;
                    when 148 =>
                        buf_input_r (211 downto 148) <= data_in(63 downto 0);
                        bits_in_buffer               <= 212;
                    when 149 =>
                        buf_input_r (212 downto 149) <= data_in(63 downto 0);
                        bits_in_buffer               <= 213;
                    when 150 =>
                        buf_input_r (213 downto 150) <= data_in(63 downto 0);
                        bits_in_buffer               <= 214;
                    when 151 =>
                        buf_input_r (214 downto 151) <= data_in(63 downto 0);
                        bits_in_buffer               <= 215;
                    when 152 =>
                        buf_input_r (215 downto 152) <= data_in(63 downto 0);
                        bits_in_buffer               <= 216;
                    when 153 =>
                        buf_input_r (216 downto 153) <= data_in(63 downto 0);
                        bits_in_buffer               <= 217;
                    when 154 =>
                        buf_input_r (217 downto 154) <= data_in(63 downto 0);
                        bits_in_buffer               <= 218;
                    when 155 =>
                        buf_input_r (218 downto 155) <= data_in(63 downto 0);
                        bits_in_buffer               <= 219;
                    when 156 =>
                        buf_input_r (219 downto 156) <= data_in(63 downto 0);
                        bits_in_buffer               <= 220;
                    when 157 =>
                        buf_input_r (220 downto 157) <= data_in(63 downto 0);
                        bits_in_buffer               <= 221;
                    when 158 =>
                        buf_input_r (221 downto 158) <= data_in(63 downto 0);
                        bits_in_buffer               <= 222;
                    when 159 =>
                        buf_input_r (222 downto 159) <= data_in(63 downto 0);
                        bits_in_buffer               <= 223;
                    when 160 =>
                        buf_input_r (223 downto 160) <= data_in(63 downto 0);
                        bits_in_buffer               <= 224;
                    when 161 =>
                        buf_input_r (224 downto 161) <= data_in(63 downto 0);
                        bits_in_buffer               <= 225;
                    when 162 =>
                        buf_input_r (225 downto 162) <= data_in(63 downto 0);
                        bits_in_buffer               <= 226;
                    when 163 =>
                        buf_input_r (226 downto 163) <= data_in(63 downto 0);
                        bits_in_buffer               <= 227;
                    when 164 =>
                        buf_input_r (227 downto 164) <= data_in(63 downto 0);
                        bits_in_buffer               <= 228;
                    when 165 =>
                        buf_input_r (228 downto 165) <= data_in(63 downto 0);
                        bits_in_buffer               <= 229;
                    when 166 =>
                        buf_input_r (229 downto 166) <= data_in(63 downto 0);
                        bits_in_buffer               <= 230;
                    when others =>
                end case;
            end if;
        --else
                --out_rdy_r <= '0';
        end if;
    end if;
end process;
end arch_word_expander_64IN_to_231OUT;