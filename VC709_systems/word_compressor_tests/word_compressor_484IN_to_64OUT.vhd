----------------------------------------------------------------------------------
    -- Company:  Chalmers
    -- Engineer: Fredrik Åkerlund
    -- 
    -- Create Date: Mon Jul  3 13:58:32 2017

    -- Design Name: 
    -- Module Name: word_compressor_484IN_to_64OUT - arch_word_compressor_484IN_to_64OUT
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
    entity word_compressor_484IN_to_64OUT is

    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;

        enable_in      : in  std_logic;
        congestion_out : out std_logic;

        data_in        : in  std_logic_vector(483 downto 0);
        in_rdy         : in  std_logic;

        buf_out        : out std_logic_vector(63 downto 0);
        out_rdy        : out std_logic

    );
    end word_compressor_484IN_to_64OUT;

architecture arch_word_compressor_484IN_to_64OUT of word_compressor_484IN_to_64OUT is

    -- Input registers.
    signal buf_input_r    : std_logic_vector(967 downto 0);
    signal bits_in_buffer : integer range 0 to 968;

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
                buf_input_r(419 downto 0)    <= data_in(483 downto 64);
                bits_in_buffer               <= 420;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 1 =>
            if in_rdy = '1' then
                buf_output_r(0 downto 0)     <= buf_input_r(0 downto 0);
                buf_output_r(63 downto 1)    <= data_in(62 downto 0);
                buf_input_r(420 downto 0)    <= data_in(483 downto 63);
                bits_in_buffer               <= 421;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 2 =>
            if in_rdy = '1' then
                buf_output_r(1 downto 0)     <= buf_input_r(1 downto 0);
                buf_output_r(63 downto 2)    <= data_in(61 downto 0);
                buf_input_r(421 downto 0)    <= data_in(483 downto 62);
                bits_in_buffer               <= 422;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 3 =>
            if in_rdy = '1' then
                buf_output_r(2 downto 0)     <= buf_input_r(2 downto 0);
                buf_output_r(63 downto 3)    <= data_in(60 downto 0);
                buf_input_r(422 downto 0)    <= data_in(483 downto 61);
                bits_in_buffer               <= 423;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 4 =>
            if in_rdy = '1' then
                buf_output_r(3 downto 0)     <= buf_input_r(3 downto 0);
                buf_output_r(63 downto 4)    <= data_in(59 downto 0);
                buf_input_r(423 downto 0)    <= data_in(483 downto 60);
                bits_in_buffer               <= 424;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 5 =>
            if in_rdy = '1' then
                buf_output_r(4 downto 0)     <= buf_input_r(4 downto 0);
                buf_output_r(63 downto 5)    <= data_in(58 downto 0);
                buf_input_r(424 downto 0)    <= data_in(483 downto 59);
                bits_in_buffer               <= 425;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 6 =>
            if in_rdy = '1' then
                buf_output_r(5 downto 0)     <= buf_input_r(5 downto 0);
                buf_output_r(63 downto 6)    <= data_in(57 downto 0);
                buf_input_r(425 downto 0)    <= data_in(483 downto 58);
                bits_in_buffer               <= 426;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 7 =>
            if in_rdy = '1' then
                buf_output_r(6 downto 0)     <= buf_input_r(6 downto 0);
                buf_output_r(63 downto 7)    <= data_in(56 downto 0);
                buf_input_r(426 downto 0)    <= data_in(483 downto 57);
                bits_in_buffer               <= 427;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 8 =>
            if in_rdy = '1' then
                buf_output_r(7 downto 0)     <= buf_input_r(7 downto 0);
                buf_output_r(63 downto 8)    <= data_in(55 downto 0);
                buf_input_r(427 downto 0)    <= data_in(483 downto 56);
                bits_in_buffer               <= 428;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 9 =>
            if in_rdy = '1' then
                buf_output_r(8 downto 0)     <= buf_input_r(8 downto 0);
                buf_output_r(63 downto 9)    <= data_in(54 downto 0);
                buf_input_r(428 downto 0)    <= data_in(483 downto 55);
                bits_in_buffer               <= 429;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 10 =>
            if in_rdy = '1' then
                buf_output_r(9 downto 0)     <= buf_input_r(9 downto 0);
                buf_output_r(63 downto 10)   <= data_in(53 downto 0);
                buf_input_r(429 downto 0)    <= data_in(483 downto 54);
                bits_in_buffer               <= 430;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 11 =>
            if in_rdy = '1' then
                buf_output_r(10 downto 0)    <= buf_input_r(10 downto 0);
                buf_output_r(63 downto 11)   <= data_in(52 downto 0);
                buf_input_r(430 downto 0)    <= data_in(483 downto 53);
                bits_in_buffer               <= 431;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 12 =>
            if in_rdy = '1' then
                buf_output_r(11 downto 0)    <= buf_input_r(11 downto 0);
                buf_output_r(63 downto 12)   <= data_in(51 downto 0);
                buf_input_r(431 downto 0)    <= data_in(483 downto 52);
                bits_in_buffer               <= 432;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 13 =>
            if in_rdy = '1' then
                buf_output_r(12 downto 0)    <= buf_input_r(12 downto 0);
                buf_output_r(63 downto 13)   <= data_in(50 downto 0);
                buf_input_r(432 downto 0)    <= data_in(483 downto 51);
                bits_in_buffer               <= 433;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 14 =>
            if in_rdy = '1' then
                buf_output_r(13 downto 0)    <= buf_input_r(13 downto 0);
                buf_output_r(63 downto 14)   <= data_in(49 downto 0);
                buf_input_r(433 downto 0)    <= data_in(483 downto 50);
                bits_in_buffer               <= 434;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 15 =>
            if in_rdy = '1' then
                buf_output_r(14 downto 0)    <= buf_input_r(14 downto 0);
                buf_output_r(63 downto 15)   <= data_in(48 downto 0);
                buf_input_r(434 downto 0)    <= data_in(483 downto 49);
                bits_in_buffer               <= 435;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 16 =>
            if in_rdy = '1' then
                buf_output_r(15 downto 0)    <= buf_input_r(15 downto 0);
                buf_output_r(63 downto 16)   <= data_in(47 downto 0);
                buf_input_r(435 downto 0)    <= data_in(483 downto 48);
                bits_in_buffer               <= 436;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 17 =>
            if in_rdy = '1' then
                buf_output_r(16 downto 0)    <= buf_input_r(16 downto 0);
                buf_output_r(63 downto 17)   <= data_in(46 downto 0);
                buf_input_r(436 downto 0)    <= data_in(483 downto 47);
                bits_in_buffer               <= 437;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 18 =>
            if in_rdy = '1' then
                buf_output_r(17 downto 0)    <= buf_input_r(17 downto 0);
                buf_output_r(63 downto 18)   <= data_in(45 downto 0);
                buf_input_r(437 downto 0)    <= data_in(483 downto 46);
                bits_in_buffer               <= 438;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 19 =>
            if in_rdy = '1' then
                buf_output_r(18 downto 0)    <= buf_input_r(18 downto 0);
                buf_output_r(63 downto 19)   <= data_in(44 downto 0);
                buf_input_r(438 downto 0)    <= data_in(483 downto 45);
                bits_in_buffer               <= 439;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 20 =>
            if in_rdy = '1' then
                buf_output_r(19 downto 0)    <= buf_input_r(19 downto 0);
                buf_output_r(63 downto 20)   <= data_in(43 downto 0);
                buf_input_r(439 downto 0)    <= data_in(483 downto 44);
                bits_in_buffer               <= 440;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 21 =>
            if in_rdy = '1' then
                buf_output_r(20 downto 0)    <= buf_input_r(20 downto 0);
                buf_output_r(63 downto 21)   <= data_in(42 downto 0);
                buf_input_r(440 downto 0)    <= data_in(483 downto 43);
                bits_in_buffer               <= 441;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 22 =>
            if in_rdy = '1' then
                buf_output_r(21 downto 0)    <= buf_input_r(21 downto 0);
                buf_output_r(63 downto 22)   <= data_in(41 downto 0);
                buf_input_r(441 downto 0)    <= data_in(483 downto 42);
                bits_in_buffer               <= 442;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 23 =>
            if in_rdy = '1' then
                buf_output_r(22 downto 0)    <= buf_input_r(22 downto 0);
                buf_output_r(63 downto 23)   <= data_in(40 downto 0);
                buf_input_r(442 downto 0)    <= data_in(483 downto 41);
                bits_in_buffer               <= 443;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 24 =>
            if in_rdy = '1' then
                buf_output_r(23 downto 0)    <= buf_input_r(23 downto 0);
                buf_output_r(63 downto 24)   <= data_in(39 downto 0);
                buf_input_r(443 downto 0)    <= data_in(483 downto 40);
                bits_in_buffer               <= 444;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 25 =>
            if in_rdy = '1' then
                buf_output_r(24 downto 0)    <= buf_input_r(24 downto 0);
                buf_output_r(63 downto 25)   <= data_in(38 downto 0);
                buf_input_r(444 downto 0)    <= data_in(483 downto 39);
                bits_in_buffer               <= 445;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 26 =>
            if in_rdy = '1' then
                buf_output_r(25 downto 0)    <= buf_input_r(25 downto 0);
                buf_output_r(63 downto 26)   <= data_in(37 downto 0);
                buf_input_r(445 downto 0)    <= data_in(483 downto 38);
                bits_in_buffer               <= 446;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 27 =>
            if in_rdy = '1' then
                buf_output_r(26 downto 0)    <= buf_input_r(26 downto 0);
                buf_output_r(63 downto 27)   <= data_in(36 downto 0);
                buf_input_r(446 downto 0)    <= data_in(483 downto 37);
                bits_in_buffer               <= 447;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 28 =>
            if in_rdy = '1' then
                buf_output_r(27 downto 0)    <= buf_input_r(27 downto 0);
                buf_output_r(63 downto 28)   <= data_in(35 downto 0);
                buf_input_r(447 downto 0)    <= data_in(483 downto 36);
                bits_in_buffer               <= 448;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 29 =>
            if in_rdy = '1' then
                buf_output_r(28 downto 0)    <= buf_input_r(28 downto 0);
                buf_output_r(63 downto 29)   <= data_in(34 downto 0);
                buf_input_r(448 downto 0)    <= data_in(483 downto 35);
                bits_in_buffer               <= 449;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 30 =>
            if in_rdy = '1' then
                buf_output_r(29 downto 0)    <= buf_input_r(29 downto 0);
                buf_output_r(63 downto 30)   <= data_in(33 downto 0);
                buf_input_r(449 downto 0)    <= data_in(483 downto 34);
                bits_in_buffer               <= 450;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 31 =>
            if in_rdy = '1' then
                buf_output_r(30 downto 0)    <= buf_input_r(30 downto 0);
                buf_output_r(63 downto 31)   <= data_in(32 downto 0);
                buf_input_r(450 downto 0)    <= data_in(483 downto 33);
                bits_in_buffer               <= 451;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 32 =>
            if in_rdy = '1' then
                buf_output_r(31 downto 0)    <= buf_input_r(31 downto 0);
                buf_output_r(63 downto 32)   <= data_in(31 downto 0);
                buf_input_r(451 downto 0)    <= data_in(483 downto 32);
                bits_in_buffer               <= 452;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 33 =>
            if in_rdy = '1' then
                buf_output_r(32 downto 0)    <= buf_input_r(32 downto 0);
                buf_output_r(63 downto 33)   <= data_in(30 downto 0);
                buf_input_r(452 downto 0)    <= data_in(483 downto 31);
                bits_in_buffer               <= 453;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 34 =>
            if in_rdy = '1' then
                buf_output_r(33 downto 0)    <= buf_input_r(33 downto 0);
                buf_output_r(63 downto 34)   <= data_in(29 downto 0);
                buf_input_r(453 downto 0)    <= data_in(483 downto 30);
                bits_in_buffer               <= 454;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 35 =>
            if in_rdy = '1' then
                buf_output_r(34 downto 0)    <= buf_input_r(34 downto 0);
                buf_output_r(63 downto 35)   <= data_in(28 downto 0);
                buf_input_r(454 downto 0)    <= data_in(483 downto 29);
                bits_in_buffer               <= 455;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 36 =>
            if in_rdy = '1' then
                buf_output_r(35 downto 0)    <= buf_input_r(35 downto 0);
                buf_output_r(63 downto 36)   <= data_in(27 downto 0);
                buf_input_r(455 downto 0)    <= data_in(483 downto 28);
                bits_in_buffer               <= 456;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 37 =>
            if in_rdy = '1' then
                buf_output_r(36 downto 0)    <= buf_input_r(36 downto 0);
                buf_output_r(63 downto 37)   <= data_in(26 downto 0);
                buf_input_r(456 downto 0)    <= data_in(483 downto 27);
                bits_in_buffer               <= 457;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 38 =>
            if in_rdy = '1' then
                buf_output_r(37 downto 0)    <= buf_input_r(37 downto 0);
                buf_output_r(63 downto 38)   <= data_in(25 downto 0);
                buf_input_r(457 downto 0)    <= data_in(483 downto 26);
                bits_in_buffer               <= 458;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 39 =>
            if in_rdy = '1' then
                buf_output_r(38 downto 0)    <= buf_input_r(38 downto 0);
                buf_output_r(63 downto 39)   <= data_in(24 downto 0);
                buf_input_r(458 downto 0)    <= data_in(483 downto 25);
                bits_in_buffer               <= 459;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 40 =>
            if in_rdy = '1' then
                buf_output_r(39 downto 0)    <= buf_input_r(39 downto 0);
                buf_output_r(63 downto 40)   <= data_in(23 downto 0);
                buf_input_r(459 downto 0)    <= data_in(483 downto 24);
                bits_in_buffer               <= 460;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 41 =>
            if in_rdy = '1' then
                buf_output_r(40 downto 0)    <= buf_input_r(40 downto 0);
                buf_output_r(63 downto 41)   <= data_in(22 downto 0);
                buf_input_r(460 downto 0)    <= data_in(483 downto 23);
                bits_in_buffer               <= 461;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 42 =>
            if in_rdy = '1' then
                buf_output_r(41 downto 0)    <= buf_input_r(41 downto 0);
                buf_output_r(63 downto 42)   <= data_in(21 downto 0);
                buf_input_r(461 downto 0)    <= data_in(483 downto 22);
                bits_in_buffer               <= 462;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 43 =>
            if in_rdy = '1' then
                buf_output_r(42 downto 0)    <= buf_input_r(42 downto 0);
                buf_output_r(63 downto 43)   <= data_in(20 downto 0);
                buf_input_r(462 downto 0)    <= data_in(483 downto 21);
                bits_in_buffer               <= 463;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 44 =>
            if in_rdy = '1' then
                buf_output_r(43 downto 0)    <= buf_input_r(43 downto 0);
                buf_output_r(63 downto 44)   <= data_in(19 downto 0);
                buf_input_r(463 downto 0)    <= data_in(483 downto 20);
                bits_in_buffer               <= 464;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 45 =>
            if in_rdy = '1' then
                buf_output_r(44 downto 0)    <= buf_input_r(44 downto 0);
                buf_output_r(63 downto 45)   <= data_in(18 downto 0);
                buf_input_r(464 downto 0)    <= data_in(483 downto 19);
                bits_in_buffer               <= 465;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 46 =>
            if in_rdy = '1' then
                buf_output_r(45 downto 0)    <= buf_input_r(45 downto 0);
                buf_output_r(63 downto 46)   <= data_in(17 downto 0);
                buf_input_r(465 downto 0)    <= data_in(483 downto 18);
                bits_in_buffer               <= 466;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 47 =>
            if in_rdy = '1' then
                buf_output_r(46 downto 0)    <= buf_input_r(46 downto 0);
                buf_output_r(63 downto 47)   <= data_in(16 downto 0);
                buf_input_r(466 downto 0)    <= data_in(483 downto 17);
                bits_in_buffer               <= 467;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 48 =>
            if in_rdy = '1' then
                buf_output_r(47 downto 0)    <= buf_input_r(47 downto 0);
                buf_output_r(63 downto 48)   <= data_in(15 downto 0);
                buf_input_r(467 downto 0)    <= data_in(483 downto 16);
                bits_in_buffer               <= 468;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 49 =>
            if in_rdy = '1' then
                buf_output_r(48 downto 0)    <= buf_input_r(48 downto 0);
                buf_output_r(63 downto 49)   <= data_in(14 downto 0);
                buf_input_r(468 downto 0)    <= data_in(483 downto 15);
                bits_in_buffer               <= 469;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 50 =>
            if in_rdy = '1' then
                buf_output_r(49 downto 0)    <= buf_input_r(49 downto 0);
                buf_output_r(63 downto 50)   <= data_in(13 downto 0);
                buf_input_r(469 downto 0)    <= data_in(483 downto 14);
                bits_in_buffer               <= 470;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 51 =>
            if in_rdy = '1' then
                buf_output_r(50 downto 0)    <= buf_input_r(50 downto 0);
                buf_output_r(63 downto 51)   <= data_in(12 downto 0);
                buf_input_r(470 downto 0)    <= data_in(483 downto 13);
                bits_in_buffer               <= 471;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 52 =>
            if in_rdy = '1' then
                buf_output_r(51 downto 0)    <= buf_input_r(51 downto 0);
                buf_output_r(63 downto 52)   <= data_in(11 downto 0);
                buf_input_r(471 downto 0)    <= data_in(483 downto 12);
                bits_in_buffer               <= 472;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 53 =>
            if in_rdy = '1' then
                buf_output_r(52 downto 0)    <= buf_input_r(52 downto 0);
                buf_output_r(63 downto 53)   <= data_in(10 downto 0);
                buf_input_r(472 downto 0)    <= data_in(483 downto 11);
                bits_in_buffer               <= 473;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 54 =>
            if in_rdy = '1' then
                buf_output_r(53 downto 0)    <= buf_input_r(53 downto 0);
                buf_output_r(63 downto 54)   <= data_in(9 downto 0);
                buf_input_r(473 downto 0)    <= data_in(483 downto 10);
                bits_in_buffer               <= 474;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 55 =>
            if in_rdy = '1' then
                buf_output_r(54 downto 0)    <= buf_input_r(54 downto 0);
                buf_output_r(63 downto 55)   <= data_in(8 downto 0);
                buf_input_r(474 downto 0)    <= data_in(483 downto 9);
                bits_in_buffer               <= 475;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 56 =>
            if in_rdy = '1' then
                buf_output_r(55 downto 0)    <= buf_input_r(55 downto 0);
                buf_output_r(63 downto 56)   <= data_in(7 downto 0);
                buf_input_r(475 downto 0)    <= data_in(483 downto 8);
                bits_in_buffer               <= 476;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 57 =>
            if in_rdy = '1' then
                buf_output_r(56 downto 0)    <= buf_input_r(56 downto 0);
                buf_output_r(63 downto 57)   <= data_in(6 downto 0);
                buf_input_r(476 downto 0)    <= data_in(483 downto 7);
                bits_in_buffer               <= 477;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 58 =>
            if in_rdy = '1' then
                buf_output_r(57 downto 0)    <= buf_input_r(57 downto 0);
                buf_output_r(63 downto 58)   <= data_in(5 downto 0);
                buf_input_r(477 downto 0)    <= data_in(483 downto 6);
                bits_in_buffer               <= 478;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 59 =>
            if in_rdy = '1' then
                buf_output_r(58 downto 0)    <= buf_input_r(58 downto 0);
                buf_output_r(63 downto 59)   <= data_in(4 downto 0);
                buf_input_r(478 downto 0)    <= data_in(483 downto 5);
                bits_in_buffer               <= 479;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 60 =>
            if in_rdy = '1' then
                buf_output_r(59 downto 0)    <= buf_input_r(59 downto 0);
                buf_output_r(63 downto 60)   <= data_in(3 downto 0);
                buf_input_r(479 downto 0)    <= data_in(483 downto 4);
                bits_in_buffer               <= 480;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 61 =>
            if in_rdy = '1' then
                buf_output_r(60 downto 0)    <= buf_input_r(60 downto 0);
                buf_output_r(63 downto 61)   <= data_in(2 downto 0);
                buf_input_r(480 downto 0)    <= data_in(483 downto 3);
                bits_in_buffer               <= 481;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 62 =>
            if in_rdy = '1' then
                buf_output_r(61 downto 0)    <= buf_input_r(61 downto 0);
                buf_output_r(63 downto 62)   <= data_in(1 downto 0);
                buf_input_r(481 downto 0)    <= data_in(483 downto 2);
                bits_in_buffer               <= 482;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 63 =>
            if in_rdy = '1' then
                buf_output_r(62 downto 0)    <= buf_input_r(62 downto 0);
                buf_output_r(63 downto 63)   <= data_in(0 downto 0);
                buf_input_r(482 downto 0)    <= data_in(483 downto 1);
                bits_in_buffer               <= 483;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';


        -- For this range, the buffer has enough bits saved for the output.

        when 64 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            if in_rdy = '1' then
                buf_input_r(483 downto 0)    <= data_in(483 downto 0);
                buf_input_r(967 downto 484)  <= data_in(483 downto 0);
                bits_in_buffer               <= 484;
            else
                bits_in_buffer               <= 0;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 65 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(0 downto 0)          <= buf_input_r(64 downto 64);
            if in_rdy = '1' then
                buf_input_r(484 downto 1)    <= data_in(483 downto 0);
                bits_in_buffer               <= 485;
            else
                bits_in_buffer               <= 1;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 66 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(1 downto 0)          <= buf_input_r(65 downto 64);
            if in_rdy = '1' then
                buf_input_r(485 downto 2)    <= data_in(483 downto 0);
                bits_in_buffer               <= 486;
            else
                bits_in_buffer               <= 2;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 67 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(2 downto 0)          <= buf_input_r(66 downto 64);
            if in_rdy = '1' then
                buf_input_r(486 downto 3)    <= data_in(483 downto 0);
                bits_in_buffer               <= 487;
            else
                bits_in_buffer               <= 3;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 68 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(3 downto 0)          <= buf_input_r(67 downto 64);
            if in_rdy = '1' then
                buf_input_r(487 downto 4)    <= data_in(483 downto 0);
                bits_in_buffer               <= 488;
            else
                bits_in_buffer               <= 4;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 69 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(4 downto 0)          <= buf_input_r(68 downto 64);
            if in_rdy = '1' then
                buf_input_r(488 downto 5)    <= data_in(483 downto 0);
                bits_in_buffer               <= 489;
            else
                bits_in_buffer               <= 5;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 70 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(5 downto 0)          <= buf_input_r(69 downto 64);
            if in_rdy = '1' then
                buf_input_r(489 downto 6)    <= data_in(483 downto 0);
                bits_in_buffer               <= 490;
            else
                bits_in_buffer               <= 6;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 71 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(6 downto 0)          <= buf_input_r(70 downto 64);
            if in_rdy = '1' then
                buf_input_r(490 downto 7)    <= data_in(483 downto 0);
                bits_in_buffer               <= 491;
            else
                bits_in_buffer               <= 7;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 72 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(7 downto 0)          <= buf_input_r(71 downto 64);
            if in_rdy = '1' then
                buf_input_r(491 downto 8)    <= data_in(483 downto 0);
                bits_in_buffer               <= 492;
            else
                bits_in_buffer               <= 8;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 73 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(8 downto 0)          <= buf_input_r(72 downto 64);
            if in_rdy = '1' then
                buf_input_r(492 downto 9)    <= data_in(483 downto 0);
                bits_in_buffer               <= 493;
            else
                bits_in_buffer               <= 9;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 74 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(9 downto 0)          <= buf_input_r(73 downto 64);
            if in_rdy = '1' then
                buf_input_r(493 downto 10)   <= data_in(483 downto 0);
                bits_in_buffer               <= 494;
            else
                bits_in_buffer               <= 10;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 75 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(10 downto 0)         <= buf_input_r(74 downto 64);
            if in_rdy = '1' then
                buf_input_r(494 downto 11)   <= data_in(483 downto 0);
                bits_in_buffer               <= 495;
            else
                bits_in_buffer               <= 11;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 76 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(11 downto 0)         <= buf_input_r(75 downto 64);
            if in_rdy = '1' then
                buf_input_r(495 downto 12)   <= data_in(483 downto 0);
                bits_in_buffer               <= 496;
            else
                bits_in_buffer               <= 12;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 77 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(12 downto 0)         <= buf_input_r(76 downto 64);
            if in_rdy = '1' then
                buf_input_r(496 downto 13)   <= data_in(483 downto 0);
                bits_in_buffer               <= 497;
            else
                bits_in_buffer               <= 13;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 78 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(13 downto 0)         <= buf_input_r(77 downto 64);
            if in_rdy = '1' then
                buf_input_r(497 downto 14)   <= data_in(483 downto 0);
                bits_in_buffer               <= 498;
            else
                bits_in_buffer               <= 14;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 79 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(14 downto 0)         <= buf_input_r(78 downto 64);
            if in_rdy = '1' then
                buf_input_r(498 downto 15)   <= data_in(483 downto 0);
                bits_in_buffer               <= 499;
            else
                bits_in_buffer               <= 15;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 80 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(15 downto 0)         <= buf_input_r(79 downto 64);
            if in_rdy = '1' then
                buf_input_r(499 downto 16)   <= data_in(483 downto 0);
                bits_in_buffer               <= 500;
            else
                bits_in_buffer               <= 16;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 81 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(16 downto 0)         <= buf_input_r(80 downto 64);
            if in_rdy = '1' then
                buf_input_r(500 downto 17)   <= data_in(483 downto 0);
                bits_in_buffer               <= 501;
            else
                bits_in_buffer               <= 17;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 82 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(17 downto 0)         <= buf_input_r(81 downto 64);
            if in_rdy = '1' then
                buf_input_r(501 downto 18)   <= data_in(483 downto 0);
                bits_in_buffer               <= 502;
            else
                bits_in_buffer               <= 18;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 83 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(18 downto 0)         <= buf_input_r(82 downto 64);
            if in_rdy = '1' then
                buf_input_r(502 downto 19)   <= data_in(483 downto 0);
                bits_in_buffer               <= 503;
            else
                bits_in_buffer               <= 19;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 84 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(19 downto 0)         <= buf_input_r(83 downto 64);
            if in_rdy = '1' then
                buf_input_r(503 downto 20)   <= data_in(483 downto 0);
                bits_in_buffer               <= 504;
            else
                bits_in_buffer               <= 20;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 85 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(20 downto 0)         <= buf_input_r(84 downto 64);
            if in_rdy = '1' then
                buf_input_r(504 downto 21)   <= data_in(483 downto 0);
                bits_in_buffer               <= 505;
            else
                bits_in_buffer               <= 21;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 86 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(21 downto 0)         <= buf_input_r(85 downto 64);
            if in_rdy = '1' then
                buf_input_r(505 downto 22)   <= data_in(483 downto 0);
                bits_in_buffer               <= 506;
            else
                bits_in_buffer               <= 22;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 87 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(22 downto 0)         <= buf_input_r(86 downto 64);
            if in_rdy = '1' then
                buf_input_r(506 downto 23)   <= data_in(483 downto 0);
                bits_in_buffer               <= 507;
            else
                bits_in_buffer               <= 23;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 88 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(23 downto 0)         <= buf_input_r(87 downto 64);
            if in_rdy = '1' then
                buf_input_r(507 downto 24)   <= data_in(483 downto 0);
                bits_in_buffer               <= 508;
            else
                bits_in_buffer               <= 24;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 89 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(24 downto 0)         <= buf_input_r(88 downto 64);
            if in_rdy = '1' then
                buf_input_r(508 downto 25)   <= data_in(483 downto 0);
                bits_in_buffer               <= 509;
            else
                bits_in_buffer               <= 25;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 90 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(25 downto 0)         <= buf_input_r(89 downto 64);
            if in_rdy = '1' then
                buf_input_r(509 downto 26)   <= data_in(483 downto 0);
                bits_in_buffer               <= 510;
            else
                bits_in_buffer               <= 26;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 91 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(26 downto 0)         <= buf_input_r(90 downto 64);
            if in_rdy = '1' then
                buf_input_r(510 downto 27)   <= data_in(483 downto 0);
                bits_in_buffer               <= 511;
            else
                bits_in_buffer               <= 27;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 92 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(27 downto 0)         <= buf_input_r(91 downto 64);
            if in_rdy = '1' then
                buf_input_r(511 downto 28)   <= data_in(483 downto 0);
                bits_in_buffer               <= 512;
            else
                bits_in_buffer               <= 28;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 93 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(28 downto 0)         <= buf_input_r(92 downto 64);
            if in_rdy = '1' then
                buf_input_r(512 downto 29)   <= data_in(483 downto 0);
                bits_in_buffer               <= 513;
            else
                bits_in_buffer               <= 29;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 94 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(29 downto 0)         <= buf_input_r(93 downto 64);
            if in_rdy = '1' then
                buf_input_r(513 downto 30)   <= data_in(483 downto 0);
                bits_in_buffer               <= 514;
            else
                bits_in_buffer               <= 30;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 95 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(30 downto 0)         <= buf_input_r(94 downto 64);
            if in_rdy = '1' then
                buf_input_r(514 downto 31)   <= data_in(483 downto 0);
                bits_in_buffer               <= 515;
            else
                bits_in_buffer               <= 31;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 96 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(31 downto 0)         <= buf_input_r(95 downto 64);
            if in_rdy = '1' then
                buf_input_r(515 downto 32)   <= data_in(483 downto 0);
                bits_in_buffer               <= 516;
            else
                bits_in_buffer               <= 32;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 97 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(32 downto 0)         <= buf_input_r(96 downto 64);
            if in_rdy = '1' then
                buf_input_r(516 downto 33)   <= data_in(483 downto 0);
                bits_in_buffer               <= 517;
            else
                bits_in_buffer               <= 33;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 98 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(33 downto 0)         <= buf_input_r(97 downto 64);
            if in_rdy = '1' then
                buf_input_r(517 downto 34)   <= data_in(483 downto 0);
                bits_in_buffer               <= 518;
            else
                bits_in_buffer               <= 34;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 99 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(34 downto 0)         <= buf_input_r(98 downto 64);
            if in_rdy = '1' then
                buf_input_r(518 downto 35)   <= data_in(483 downto 0);
                bits_in_buffer               <= 519;
            else
                bits_in_buffer               <= 35;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 100 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(35 downto 0)         <= buf_input_r(99 downto 64);
            if in_rdy = '1' then
                buf_input_r(519 downto 36)   <= data_in(483 downto 0);
                bits_in_buffer               <= 520;
            else
                bits_in_buffer               <= 36;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 101 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(36 downto 0)         <= buf_input_r(100 downto 64);
            if in_rdy = '1' then
                buf_input_r(520 downto 37)   <= data_in(483 downto 0);
                bits_in_buffer               <= 521;
            else
                bits_in_buffer               <= 37;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 102 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(37 downto 0)         <= buf_input_r(101 downto 64);
            if in_rdy = '1' then
                buf_input_r(521 downto 38)   <= data_in(483 downto 0);
                bits_in_buffer               <= 522;
            else
                bits_in_buffer               <= 38;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 103 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(38 downto 0)         <= buf_input_r(102 downto 64);
            if in_rdy = '1' then
                buf_input_r(522 downto 39)   <= data_in(483 downto 0);
                bits_in_buffer               <= 523;
            else
                bits_in_buffer               <= 39;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 104 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(39 downto 0)         <= buf_input_r(103 downto 64);
            if in_rdy = '1' then
                buf_input_r(523 downto 40)   <= data_in(483 downto 0);
                bits_in_buffer               <= 524;
            else
                bits_in_buffer               <= 40;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 105 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(40 downto 0)         <= buf_input_r(104 downto 64);
            if in_rdy = '1' then
                buf_input_r(524 downto 41)   <= data_in(483 downto 0);
                bits_in_buffer               <= 525;
            else
                bits_in_buffer               <= 41;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 106 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(41 downto 0)         <= buf_input_r(105 downto 64);
            if in_rdy = '1' then
                buf_input_r(525 downto 42)   <= data_in(483 downto 0);
                bits_in_buffer               <= 526;
            else
                bits_in_buffer               <= 42;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 107 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(42 downto 0)         <= buf_input_r(106 downto 64);
            if in_rdy = '1' then
                buf_input_r(526 downto 43)   <= data_in(483 downto 0);
                bits_in_buffer               <= 527;
            else
                bits_in_buffer               <= 43;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 108 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(43 downto 0)         <= buf_input_r(107 downto 64);
            if in_rdy = '1' then
                buf_input_r(527 downto 44)   <= data_in(483 downto 0);
                bits_in_buffer               <= 528;
            else
                bits_in_buffer               <= 44;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 109 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(44 downto 0)         <= buf_input_r(108 downto 64);
            if in_rdy = '1' then
                buf_input_r(528 downto 45)   <= data_in(483 downto 0);
                bits_in_buffer               <= 529;
            else
                bits_in_buffer               <= 45;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 110 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(45 downto 0)         <= buf_input_r(109 downto 64);
            if in_rdy = '1' then
                buf_input_r(529 downto 46)   <= data_in(483 downto 0);
                bits_in_buffer               <= 530;
            else
                bits_in_buffer               <= 46;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 111 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(46 downto 0)         <= buf_input_r(110 downto 64);
            if in_rdy = '1' then
                buf_input_r(530 downto 47)   <= data_in(483 downto 0);
                bits_in_buffer               <= 531;
            else
                bits_in_buffer               <= 47;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 112 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(47 downto 0)         <= buf_input_r(111 downto 64);
            if in_rdy = '1' then
                buf_input_r(531 downto 48)   <= data_in(483 downto 0);
                bits_in_buffer               <= 532;
            else
                bits_in_buffer               <= 48;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 113 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(48 downto 0)         <= buf_input_r(112 downto 64);
            if in_rdy = '1' then
                buf_input_r(532 downto 49)   <= data_in(483 downto 0);
                bits_in_buffer               <= 533;
            else
                bits_in_buffer               <= 49;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 114 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(49 downto 0)         <= buf_input_r(113 downto 64);
            if in_rdy = '1' then
                buf_input_r(533 downto 50)   <= data_in(483 downto 0);
                bits_in_buffer               <= 534;
            else
                bits_in_buffer               <= 50;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 115 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(50 downto 0)         <= buf_input_r(114 downto 64);
            if in_rdy = '1' then
                buf_input_r(534 downto 51)   <= data_in(483 downto 0);
                bits_in_buffer               <= 535;
            else
                bits_in_buffer               <= 51;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 116 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(51 downto 0)         <= buf_input_r(115 downto 64);
            if in_rdy = '1' then
                buf_input_r(535 downto 52)   <= data_in(483 downto 0);
                bits_in_buffer               <= 536;
            else
                bits_in_buffer               <= 52;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 117 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(52 downto 0)         <= buf_input_r(116 downto 64);
            if in_rdy = '1' then
                buf_input_r(536 downto 53)   <= data_in(483 downto 0);
                bits_in_buffer               <= 537;
            else
                bits_in_buffer               <= 53;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 118 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(53 downto 0)         <= buf_input_r(117 downto 64);
            if in_rdy = '1' then
                buf_input_r(537 downto 54)   <= data_in(483 downto 0);
                bits_in_buffer               <= 538;
            else
                bits_in_buffer               <= 54;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 119 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(54 downto 0)         <= buf_input_r(118 downto 64);
            if in_rdy = '1' then
                buf_input_r(538 downto 55)   <= data_in(483 downto 0);
                bits_in_buffer               <= 539;
            else
                bits_in_buffer               <= 55;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 120 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(55 downto 0)         <= buf_input_r(119 downto 64);
            if in_rdy = '1' then
                buf_input_r(539 downto 56)   <= data_in(483 downto 0);
                bits_in_buffer               <= 540;
            else
                bits_in_buffer               <= 56;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 121 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(56 downto 0)         <= buf_input_r(120 downto 64);
            if in_rdy = '1' then
                buf_input_r(540 downto 57)   <= data_in(483 downto 0);
                bits_in_buffer               <= 541;
            else
                bits_in_buffer               <= 57;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 122 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(57 downto 0)         <= buf_input_r(121 downto 64);
            if in_rdy = '1' then
                buf_input_r(541 downto 58)   <= data_in(483 downto 0);
                bits_in_buffer               <= 542;
            else
                bits_in_buffer               <= 58;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 123 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(58 downto 0)         <= buf_input_r(122 downto 64);
            if in_rdy = '1' then
                buf_input_r(542 downto 59)   <= data_in(483 downto 0);
                bits_in_buffer               <= 543;
            else
                bits_in_buffer               <= 59;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 124 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(59 downto 0)         <= buf_input_r(123 downto 64);
            if in_rdy = '1' then
                buf_input_r(543 downto 60)   <= data_in(483 downto 0);
                bits_in_buffer               <= 544;
            else
                bits_in_buffer               <= 60;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 125 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(60 downto 0)         <= buf_input_r(124 downto 64);
            if in_rdy = '1' then
                buf_input_r(544 downto 61)   <= data_in(483 downto 0);
                bits_in_buffer               <= 545;
            else
                bits_in_buffer               <= 61;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 126 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(61 downto 0)         <= buf_input_r(125 downto 64);
            if in_rdy = '1' then
                buf_input_r(545 downto 62)   <= data_in(483 downto 0);
                bits_in_buffer               <= 546;
            else
                bits_in_buffer               <= 62;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 127 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(62 downto 0)         <= buf_input_r(126 downto 64);
            if in_rdy = '1' then
                buf_input_r(546 downto 63)   <= data_in(483 downto 0);
                bits_in_buffer               <= 547;
            else
                bits_in_buffer               <= 63;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 128 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(63 downto 0)         <= buf_input_r(127 downto 64);
            if in_rdy = '1' then
                buf_input_r(547 downto 64)   <= data_in(483 downto 0);
                bits_in_buffer               <= 548;
            else
                bits_in_buffer               <= 64;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 129 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(64 downto 0)         <= buf_input_r(128 downto 64);
            if in_rdy = '1' then
                buf_input_r(548 downto 65)   <= data_in(483 downto 0);
                bits_in_buffer               <= 549;
            else
                bits_in_buffer               <= 65;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 130 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(65 downto 0)         <= buf_input_r(129 downto 64);
            if in_rdy = '1' then
                buf_input_r(549 downto 66)   <= data_in(483 downto 0);
                bits_in_buffer               <= 550;
            else
                bits_in_buffer               <= 66;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 131 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(66 downto 0)         <= buf_input_r(130 downto 64);
            if in_rdy = '1' then
                buf_input_r(550 downto 67)   <= data_in(483 downto 0);
                bits_in_buffer               <= 551;
            else
                bits_in_buffer               <= 67;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 132 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(67 downto 0)         <= buf_input_r(131 downto 64);
            if in_rdy = '1' then
                buf_input_r(551 downto 68)   <= data_in(483 downto 0);
                bits_in_buffer               <= 552;
            else
                bits_in_buffer               <= 68;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 133 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(68 downto 0)         <= buf_input_r(132 downto 64);
            if in_rdy = '1' then
                buf_input_r(552 downto 69)   <= data_in(483 downto 0);
                bits_in_buffer               <= 553;
            else
                bits_in_buffer               <= 69;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 134 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(69 downto 0)         <= buf_input_r(133 downto 64);
            if in_rdy = '1' then
                buf_input_r(553 downto 70)   <= data_in(483 downto 0);
                bits_in_buffer               <= 554;
            else
                bits_in_buffer               <= 70;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 135 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(70 downto 0)         <= buf_input_r(134 downto 64);
            if in_rdy = '1' then
                buf_input_r(554 downto 71)   <= data_in(483 downto 0);
                bits_in_buffer               <= 555;
            else
                bits_in_buffer               <= 71;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 136 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(71 downto 0)         <= buf_input_r(135 downto 64);
            if in_rdy = '1' then
                buf_input_r(555 downto 72)   <= data_in(483 downto 0);
                bits_in_buffer               <= 556;
            else
                bits_in_buffer               <= 72;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 137 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(72 downto 0)         <= buf_input_r(136 downto 64);
            if in_rdy = '1' then
                buf_input_r(556 downto 73)   <= data_in(483 downto 0);
                bits_in_buffer               <= 557;
            else
                bits_in_buffer               <= 73;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 138 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(73 downto 0)         <= buf_input_r(137 downto 64);
            if in_rdy = '1' then
                buf_input_r(557 downto 74)   <= data_in(483 downto 0);
                bits_in_buffer               <= 558;
            else
                bits_in_buffer               <= 74;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 139 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(74 downto 0)         <= buf_input_r(138 downto 64);
            if in_rdy = '1' then
                buf_input_r(558 downto 75)   <= data_in(483 downto 0);
                bits_in_buffer               <= 559;
            else
                bits_in_buffer               <= 75;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 140 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(75 downto 0)         <= buf_input_r(139 downto 64);
            if in_rdy = '1' then
                buf_input_r(559 downto 76)   <= data_in(483 downto 0);
                bits_in_buffer               <= 560;
            else
                bits_in_buffer               <= 76;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 141 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(76 downto 0)         <= buf_input_r(140 downto 64);
            if in_rdy = '1' then
                buf_input_r(560 downto 77)   <= data_in(483 downto 0);
                bits_in_buffer               <= 561;
            else
                bits_in_buffer               <= 77;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 142 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(77 downto 0)         <= buf_input_r(141 downto 64);
            if in_rdy = '1' then
                buf_input_r(561 downto 78)   <= data_in(483 downto 0);
                bits_in_buffer               <= 562;
            else
                bits_in_buffer               <= 78;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 143 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(78 downto 0)         <= buf_input_r(142 downto 64);
            if in_rdy = '1' then
                buf_input_r(562 downto 79)   <= data_in(483 downto 0);
                bits_in_buffer               <= 563;
            else
                bits_in_buffer               <= 79;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 144 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(79 downto 0)         <= buf_input_r(143 downto 64);
            if in_rdy = '1' then
                buf_input_r(563 downto 80)   <= data_in(483 downto 0);
                bits_in_buffer               <= 564;
            else
                bits_in_buffer               <= 80;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 145 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(80 downto 0)         <= buf_input_r(144 downto 64);
            if in_rdy = '1' then
                buf_input_r(564 downto 81)   <= data_in(483 downto 0);
                bits_in_buffer               <= 565;
            else
                bits_in_buffer               <= 81;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 146 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(81 downto 0)         <= buf_input_r(145 downto 64);
            if in_rdy = '1' then
                buf_input_r(565 downto 82)   <= data_in(483 downto 0);
                bits_in_buffer               <= 566;
            else
                bits_in_buffer               <= 82;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 147 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(82 downto 0)         <= buf_input_r(146 downto 64);
            if in_rdy = '1' then
                buf_input_r(566 downto 83)   <= data_in(483 downto 0);
                bits_in_buffer               <= 567;
            else
                bits_in_buffer               <= 83;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 148 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(83 downto 0)         <= buf_input_r(147 downto 64);
            if in_rdy = '1' then
                buf_input_r(567 downto 84)   <= data_in(483 downto 0);
                bits_in_buffer               <= 568;
            else
                bits_in_buffer               <= 84;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 149 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(84 downto 0)         <= buf_input_r(148 downto 64);
            if in_rdy = '1' then
                buf_input_r(568 downto 85)   <= data_in(483 downto 0);
                bits_in_buffer               <= 569;
            else
                bits_in_buffer               <= 85;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 150 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(85 downto 0)         <= buf_input_r(149 downto 64);
            if in_rdy = '1' then
                buf_input_r(569 downto 86)   <= data_in(483 downto 0);
                bits_in_buffer               <= 570;
            else
                bits_in_buffer               <= 86;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 151 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(86 downto 0)         <= buf_input_r(150 downto 64);
            if in_rdy = '1' then
                buf_input_r(570 downto 87)   <= data_in(483 downto 0);
                bits_in_buffer               <= 571;
            else
                bits_in_buffer               <= 87;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 152 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(87 downto 0)         <= buf_input_r(151 downto 64);
            if in_rdy = '1' then
                buf_input_r(571 downto 88)   <= data_in(483 downto 0);
                bits_in_buffer               <= 572;
            else
                bits_in_buffer               <= 88;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 153 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(88 downto 0)         <= buf_input_r(152 downto 64);
            if in_rdy = '1' then
                buf_input_r(572 downto 89)   <= data_in(483 downto 0);
                bits_in_buffer               <= 573;
            else
                bits_in_buffer               <= 89;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 154 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(89 downto 0)         <= buf_input_r(153 downto 64);
            if in_rdy = '1' then
                buf_input_r(573 downto 90)   <= data_in(483 downto 0);
                bits_in_buffer               <= 574;
            else
                bits_in_buffer               <= 90;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 155 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(90 downto 0)         <= buf_input_r(154 downto 64);
            if in_rdy = '1' then
                buf_input_r(574 downto 91)   <= data_in(483 downto 0);
                bits_in_buffer               <= 575;
            else
                bits_in_buffer               <= 91;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 156 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(91 downto 0)         <= buf_input_r(155 downto 64);
            if in_rdy = '1' then
                buf_input_r(575 downto 92)   <= data_in(483 downto 0);
                bits_in_buffer               <= 576;
            else
                bits_in_buffer               <= 92;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 157 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(92 downto 0)         <= buf_input_r(156 downto 64);
            if in_rdy = '1' then
                buf_input_r(576 downto 93)   <= data_in(483 downto 0);
                bits_in_buffer               <= 577;
            else
                bits_in_buffer               <= 93;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 158 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(93 downto 0)         <= buf_input_r(157 downto 64);
            if in_rdy = '1' then
                buf_input_r(577 downto 94)   <= data_in(483 downto 0);
                bits_in_buffer               <= 578;
            else
                bits_in_buffer               <= 94;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 159 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(94 downto 0)         <= buf_input_r(158 downto 64);
            if in_rdy = '1' then
                buf_input_r(578 downto 95)   <= data_in(483 downto 0);
                bits_in_buffer               <= 579;
            else
                bits_in_buffer               <= 95;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 160 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(95 downto 0)         <= buf_input_r(159 downto 64);
            if in_rdy = '1' then
                buf_input_r(579 downto 96)   <= data_in(483 downto 0);
                bits_in_buffer               <= 580;
            else
                bits_in_buffer               <= 96;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 161 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(96 downto 0)         <= buf_input_r(160 downto 64);
            if in_rdy = '1' then
                buf_input_r(580 downto 97)   <= data_in(483 downto 0);
                bits_in_buffer               <= 581;
            else
                bits_in_buffer               <= 97;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 162 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(97 downto 0)         <= buf_input_r(161 downto 64);
            if in_rdy = '1' then
                buf_input_r(581 downto 98)   <= data_in(483 downto 0);
                bits_in_buffer               <= 582;
            else
                bits_in_buffer               <= 98;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 163 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(98 downto 0)         <= buf_input_r(162 downto 64);
            if in_rdy = '1' then
                buf_input_r(582 downto 99)   <= data_in(483 downto 0);
                bits_in_buffer               <= 583;
            else
                bits_in_buffer               <= 99;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 164 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(99 downto 0)         <= buf_input_r(163 downto 64);
            if in_rdy = '1' then
                buf_input_r(583 downto 100)  <= data_in(483 downto 0);
                bits_in_buffer               <= 584;
            else
                bits_in_buffer               <= 100;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 165 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(100 downto 0)        <= buf_input_r(164 downto 64);
            if in_rdy = '1' then
                buf_input_r(584 downto 101)  <= data_in(483 downto 0);
                bits_in_buffer               <= 585;
            else
                bits_in_buffer               <= 101;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 166 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(101 downto 0)        <= buf_input_r(165 downto 64);
            if in_rdy = '1' then
                buf_input_r(585 downto 102)  <= data_in(483 downto 0);
                bits_in_buffer               <= 586;
            else
                bits_in_buffer               <= 102;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 167 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(102 downto 0)        <= buf_input_r(166 downto 64);
            if in_rdy = '1' then
                buf_input_r(586 downto 103)  <= data_in(483 downto 0);
                bits_in_buffer               <= 587;
            else
                bits_in_buffer               <= 103;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 168 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(103 downto 0)        <= buf_input_r(167 downto 64);
            if in_rdy = '1' then
                buf_input_r(587 downto 104)  <= data_in(483 downto 0);
                bits_in_buffer               <= 588;
            else
                bits_in_buffer               <= 104;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 169 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(104 downto 0)        <= buf_input_r(168 downto 64);
            if in_rdy = '1' then
                buf_input_r(588 downto 105)  <= data_in(483 downto 0);
                bits_in_buffer               <= 589;
            else
                bits_in_buffer               <= 105;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 170 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(105 downto 0)        <= buf_input_r(169 downto 64);
            if in_rdy = '1' then
                buf_input_r(589 downto 106)  <= data_in(483 downto 0);
                bits_in_buffer               <= 590;
            else
                bits_in_buffer               <= 106;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 171 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(106 downto 0)        <= buf_input_r(170 downto 64);
            if in_rdy = '1' then
                buf_input_r(590 downto 107)  <= data_in(483 downto 0);
                bits_in_buffer               <= 591;
            else
                bits_in_buffer               <= 107;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 172 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(107 downto 0)        <= buf_input_r(171 downto 64);
            if in_rdy = '1' then
                buf_input_r(591 downto 108)  <= data_in(483 downto 0);
                bits_in_buffer               <= 592;
            else
                bits_in_buffer               <= 108;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 173 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(108 downto 0)        <= buf_input_r(172 downto 64);
            if in_rdy = '1' then
                buf_input_r(592 downto 109)  <= data_in(483 downto 0);
                bits_in_buffer               <= 593;
            else
                bits_in_buffer               <= 109;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 174 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(109 downto 0)        <= buf_input_r(173 downto 64);
            if in_rdy = '1' then
                buf_input_r(593 downto 110)  <= data_in(483 downto 0);
                bits_in_buffer               <= 594;
            else
                bits_in_buffer               <= 110;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 175 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(110 downto 0)        <= buf_input_r(174 downto 64);
            if in_rdy = '1' then
                buf_input_r(594 downto 111)  <= data_in(483 downto 0);
                bits_in_buffer               <= 595;
            else
                bits_in_buffer               <= 111;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 176 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(111 downto 0)        <= buf_input_r(175 downto 64);
            if in_rdy = '1' then
                buf_input_r(595 downto 112)  <= data_in(483 downto 0);
                bits_in_buffer               <= 596;
            else
                bits_in_buffer               <= 112;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 177 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(112 downto 0)        <= buf_input_r(176 downto 64);
            if in_rdy = '1' then
                buf_input_r(596 downto 113)  <= data_in(483 downto 0);
                bits_in_buffer               <= 597;
            else
                bits_in_buffer               <= 113;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 178 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(113 downto 0)        <= buf_input_r(177 downto 64);
            if in_rdy = '1' then
                buf_input_r(597 downto 114)  <= data_in(483 downto 0);
                bits_in_buffer               <= 598;
            else
                bits_in_buffer               <= 114;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 179 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(114 downto 0)        <= buf_input_r(178 downto 64);
            if in_rdy = '1' then
                buf_input_r(598 downto 115)  <= data_in(483 downto 0);
                bits_in_buffer               <= 599;
            else
                bits_in_buffer               <= 115;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 180 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(115 downto 0)        <= buf_input_r(179 downto 64);
            if in_rdy = '1' then
                buf_input_r(599 downto 116)  <= data_in(483 downto 0);
                bits_in_buffer               <= 600;
            else
                bits_in_buffer               <= 116;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 181 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(116 downto 0)        <= buf_input_r(180 downto 64);
            if in_rdy = '1' then
                buf_input_r(600 downto 117)  <= data_in(483 downto 0);
                bits_in_buffer               <= 601;
            else
                bits_in_buffer               <= 117;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 182 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(117 downto 0)        <= buf_input_r(181 downto 64);
            if in_rdy = '1' then
                buf_input_r(601 downto 118)  <= data_in(483 downto 0);
                bits_in_buffer               <= 602;
            else
                bits_in_buffer               <= 118;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 183 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(118 downto 0)        <= buf_input_r(182 downto 64);
            if in_rdy = '1' then
                buf_input_r(602 downto 119)  <= data_in(483 downto 0);
                bits_in_buffer               <= 603;
            else
                bits_in_buffer               <= 119;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 184 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(119 downto 0)        <= buf_input_r(183 downto 64);
            if in_rdy = '1' then
                buf_input_r(603 downto 120)  <= data_in(483 downto 0);
                bits_in_buffer               <= 604;
            else
                bits_in_buffer               <= 120;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 185 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(120 downto 0)        <= buf_input_r(184 downto 64);
            if in_rdy = '1' then
                buf_input_r(604 downto 121)  <= data_in(483 downto 0);
                bits_in_buffer               <= 605;
            else
                bits_in_buffer               <= 121;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 186 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(121 downto 0)        <= buf_input_r(185 downto 64);
            if in_rdy = '1' then
                buf_input_r(605 downto 122)  <= data_in(483 downto 0);
                bits_in_buffer               <= 606;
            else
                bits_in_buffer               <= 122;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 187 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(122 downto 0)        <= buf_input_r(186 downto 64);
            if in_rdy = '1' then
                buf_input_r(606 downto 123)  <= data_in(483 downto 0);
                bits_in_buffer               <= 607;
            else
                bits_in_buffer               <= 123;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 188 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(123 downto 0)        <= buf_input_r(187 downto 64);
            if in_rdy = '1' then
                buf_input_r(607 downto 124)  <= data_in(483 downto 0);
                bits_in_buffer               <= 608;
            else
                bits_in_buffer               <= 124;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 189 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(124 downto 0)        <= buf_input_r(188 downto 64);
            if in_rdy = '1' then
                buf_input_r(608 downto 125)  <= data_in(483 downto 0);
                bits_in_buffer               <= 609;
            else
                bits_in_buffer               <= 125;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 190 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(125 downto 0)        <= buf_input_r(189 downto 64);
            if in_rdy = '1' then
                buf_input_r(609 downto 126)  <= data_in(483 downto 0);
                bits_in_buffer               <= 610;
            else
                bits_in_buffer               <= 126;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 191 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(126 downto 0)        <= buf_input_r(190 downto 64);
            if in_rdy = '1' then
                buf_input_r(610 downto 127)  <= data_in(483 downto 0);
                bits_in_buffer               <= 611;
            else
                bits_in_buffer               <= 127;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 192 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(127 downto 0)        <= buf_input_r(191 downto 64);
            if in_rdy = '1' then
                buf_input_r(611 downto 128)  <= data_in(483 downto 0);
                bits_in_buffer               <= 612;
            else
                bits_in_buffer               <= 128;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 193 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(128 downto 0)        <= buf_input_r(192 downto 64);
            if in_rdy = '1' then
                buf_input_r(612 downto 129)  <= data_in(483 downto 0);
                bits_in_buffer               <= 613;
            else
                bits_in_buffer               <= 129;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 194 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(129 downto 0)        <= buf_input_r(193 downto 64);
            if in_rdy = '1' then
                buf_input_r(613 downto 130)  <= data_in(483 downto 0);
                bits_in_buffer               <= 614;
            else
                bits_in_buffer               <= 130;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 195 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(130 downto 0)        <= buf_input_r(194 downto 64);
            if in_rdy = '1' then
                buf_input_r(614 downto 131)  <= data_in(483 downto 0);
                bits_in_buffer               <= 615;
            else
                bits_in_buffer               <= 131;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 196 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(131 downto 0)        <= buf_input_r(195 downto 64);
            if in_rdy = '1' then
                buf_input_r(615 downto 132)  <= data_in(483 downto 0);
                bits_in_buffer               <= 616;
            else
                bits_in_buffer               <= 132;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 197 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(132 downto 0)        <= buf_input_r(196 downto 64);
            if in_rdy = '1' then
                buf_input_r(616 downto 133)  <= data_in(483 downto 0);
                bits_in_buffer               <= 617;
            else
                bits_in_buffer               <= 133;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 198 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(133 downto 0)        <= buf_input_r(197 downto 64);
            if in_rdy = '1' then
                buf_input_r(617 downto 134)  <= data_in(483 downto 0);
                bits_in_buffer               <= 618;
            else
                bits_in_buffer               <= 134;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 199 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(134 downto 0)        <= buf_input_r(198 downto 64);
            if in_rdy = '1' then
                buf_input_r(618 downto 135)  <= data_in(483 downto 0);
                bits_in_buffer               <= 619;
            else
                bits_in_buffer               <= 135;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 200 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(135 downto 0)        <= buf_input_r(199 downto 64);
            if in_rdy = '1' then
                buf_input_r(619 downto 136)  <= data_in(483 downto 0);
                bits_in_buffer               <= 620;
            else
                bits_in_buffer               <= 136;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 201 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(136 downto 0)        <= buf_input_r(200 downto 64);
            if in_rdy = '1' then
                buf_input_r(620 downto 137)  <= data_in(483 downto 0);
                bits_in_buffer               <= 621;
            else
                bits_in_buffer               <= 137;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 202 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(137 downto 0)        <= buf_input_r(201 downto 64);
            if in_rdy = '1' then
                buf_input_r(621 downto 138)  <= data_in(483 downto 0);
                bits_in_buffer               <= 622;
            else
                bits_in_buffer               <= 138;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 203 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(138 downto 0)        <= buf_input_r(202 downto 64);
            if in_rdy = '1' then
                buf_input_r(622 downto 139)  <= data_in(483 downto 0);
                bits_in_buffer               <= 623;
            else
                bits_in_buffer               <= 139;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 204 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(139 downto 0)        <= buf_input_r(203 downto 64);
            if in_rdy = '1' then
                buf_input_r(623 downto 140)  <= data_in(483 downto 0);
                bits_in_buffer               <= 624;
            else
                bits_in_buffer               <= 140;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 205 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(140 downto 0)        <= buf_input_r(204 downto 64);
            if in_rdy = '1' then
                buf_input_r(624 downto 141)  <= data_in(483 downto 0);
                bits_in_buffer               <= 625;
            else
                bits_in_buffer               <= 141;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 206 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(141 downto 0)        <= buf_input_r(205 downto 64);
            if in_rdy = '1' then
                buf_input_r(625 downto 142)  <= data_in(483 downto 0);
                bits_in_buffer               <= 626;
            else
                bits_in_buffer               <= 142;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 207 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(142 downto 0)        <= buf_input_r(206 downto 64);
            if in_rdy = '1' then
                buf_input_r(626 downto 143)  <= data_in(483 downto 0);
                bits_in_buffer               <= 627;
            else
                bits_in_buffer               <= 143;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 208 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(143 downto 0)        <= buf_input_r(207 downto 64);
            if in_rdy = '1' then
                buf_input_r(627 downto 144)  <= data_in(483 downto 0);
                bits_in_buffer               <= 628;
            else
                bits_in_buffer               <= 144;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 209 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(144 downto 0)        <= buf_input_r(208 downto 64);
            if in_rdy = '1' then
                buf_input_r(628 downto 145)  <= data_in(483 downto 0);
                bits_in_buffer               <= 629;
            else
                bits_in_buffer               <= 145;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 210 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(145 downto 0)        <= buf_input_r(209 downto 64);
            if in_rdy = '1' then
                buf_input_r(629 downto 146)  <= data_in(483 downto 0);
                bits_in_buffer               <= 630;
            else
                bits_in_buffer               <= 146;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 211 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(146 downto 0)        <= buf_input_r(210 downto 64);
            if in_rdy = '1' then
                buf_input_r(630 downto 147)  <= data_in(483 downto 0);
                bits_in_buffer               <= 631;
            else
                bits_in_buffer               <= 147;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 212 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(147 downto 0)        <= buf_input_r(211 downto 64);
            if in_rdy = '1' then
                buf_input_r(631 downto 148)  <= data_in(483 downto 0);
                bits_in_buffer               <= 632;
            else
                bits_in_buffer               <= 148;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 213 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(148 downto 0)        <= buf_input_r(212 downto 64);
            if in_rdy = '1' then
                buf_input_r(632 downto 149)  <= data_in(483 downto 0);
                bits_in_buffer               <= 633;
            else
                bits_in_buffer               <= 149;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 214 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(149 downto 0)        <= buf_input_r(213 downto 64);
            if in_rdy = '1' then
                buf_input_r(633 downto 150)  <= data_in(483 downto 0);
                bits_in_buffer               <= 634;
            else
                bits_in_buffer               <= 150;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 215 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(150 downto 0)        <= buf_input_r(214 downto 64);
            if in_rdy = '1' then
                buf_input_r(634 downto 151)  <= data_in(483 downto 0);
                bits_in_buffer               <= 635;
            else
                bits_in_buffer               <= 151;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 216 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(151 downto 0)        <= buf_input_r(215 downto 64);
            if in_rdy = '1' then
                buf_input_r(635 downto 152)  <= data_in(483 downto 0);
                bits_in_buffer               <= 636;
            else
                bits_in_buffer               <= 152;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 217 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(152 downto 0)        <= buf_input_r(216 downto 64);
            if in_rdy = '1' then
                buf_input_r(636 downto 153)  <= data_in(483 downto 0);
                bits_in_buffer               <= 637;
            else
                bits_in_buffer               <= 153;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 218 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(153 downto 0)        <= buf_input_r(217 downto 64);
            if in_rdy = '1' then
                buf_input_r(637 downto 154)  <= data_in(483 downto 0);
                bits_in_buffer               <= 638;
            else
                bits_in_buffer               <= 154;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 219 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(154 downto 0)        <= buf_input_r(218 downto 64);
            if in_rdy = '1' then
                buf_input_r(638 downto 155)  <= data_in(483 downto 0);
                bits_in_buffer               <= 639;
            else
                bits_in_buffer               <= 155;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 220 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(155 downto 0)        <= buf_input_r(219 downto 64);
            if in_rdy = '1' then
                buf_input_r(639 downto 156)  <= data_in(483 downto 0);
                bits_in_buffer               <= 640;
            else
                bits_in_buffer               <= 156;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 221 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(156 downto 0)        <= buf_input_r(220 downto 64);
            if in_rdy = '1' then
                buf_input_r(640 downto 157)  <= data_in(483 downto 0);
                bits_in_buffer               <= 641;
            else
                bits_in_buffer               <= 157;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 222 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(157 downto 0)        <= buf_input_r(221 downto 64);
            if in_rdy = '1' then
                buf_input_r(641 downto 158)  <= data_in(483 downto 0);
                bits_in_buffer               <= 642;
            else
                bits_in_buffer               <= 158;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 223 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(158 downto 0)        <= buf_input_r(222 downto 64);
            if in_rdy = '1' then
                buf_input_r(642 downto 159)  <= data_in(483 downto 0);
                bits_in_buffer               <= 643;
            else
                bits_in_buffer               <= 159;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 224 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(159 downto 0)        <= buf_input_r(223 downto 64);
            if in_rdy = '1' then
                buf_input_r(643 downto 160)  <= data_in(483 downto 0);
                bits_in_buffer               <= 644;
            else
                bits_in_buffer               <= 160;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 225 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(160 downto 0)        <= buf_input_r(224 downto 64);
            if in_rdy = '1' then
                buf_input_r(644 downto 161)  <= data_in(483 downto 0);
                bits_in_buffer               <= 645;
            else
                bits_in_buffer               <= 161;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 226 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(161 downto 0)        <= buf_input_r(225 downto 64);
            if in_rdy = '1' then
                buf_input_r(645 downto 162)  <= data_in(483 downto 0);
                bits_in_buffer               <= 646;
            else
                bits_in_buffer               <= 162;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 227 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(162 downto 0)        <= buf_input_r(226 downto 64);
            if in_rdy = '1' then
                buf_input_r(646 downto 163)  <= data_in(483 downto 0);
                bits_in_buffer               <= 647;
            else
                bits_in_buffer               <= 163;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 228 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(163 downto 0)        <= buf_input_r(227 downto 64);
            if in_rdy = '1' then
                buf_input_r(647 downto 164)  <= data_in(483 downto 0);
                bits_in_buffer               <= 648;
            else
                bits_in_buffer               <= 164;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 229 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(164 downto 0)        <= buf_input_r(228 downto 64);
            if in_rdy = '1' then
                buf_input_r(648 downto 165)  <= data_in(483 downto 0);
                bits_in_buffer               <= 649;
            else
                bits_in_buffer               <= 165;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 230 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(165 downto 0)        <= buf_input_r(229 downto 64);
            if in_rdy = '1' then
                buf_input_r(649 downto 166)  <= data_in(483 downto 0);
                bits_in_buffer               <= 650;
            else
                bits_in_buffer               <= 166;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 231 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(166 downto 0)        <= buf_input_r(230 downto 64);
            if in_rdy = '1' then
                buf_input_r(650 downto 167)  <= data_in(483 downto 0);
                bits_in_buffer               <= 651;
            else
                bits_in_buffer               <= 167;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 232 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(167 downto 0)        <= buf_input_r(231 downto 64);
            if in_rdy = '1' then
                buf_input_r(651 downto 168)  <= data_in(483 downto 0);
                bits_in_buffer               <= 652;
            else
                bits_in_buffer               <= 168;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 233 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(168 downto 0)        <= buf_input_r(232 downto 64);
            if in_rdy = '1' then
                buf_input_r(652 downto 169)  <= data_in(483 downto 0);
                bits_in_buffer               <= 653;
            else
                bits_in_buffer               <= 169;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 234 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(169 downto 0)        <= buf_input_r(233 downto 64);
            if in_rdy = '1' then
                buf_input_r(653 downto 170)  <= data_in(483 downto 0);
                bits_in_buffer               <= 654;
            else
                bits_in_buffer               <= 170;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 235 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(170 downto 0)        <= buf_input_r(234 downto 64);
            if in_rdy = '1' then
                buf_input_r(654 downto 171)  <= data_in(483 downto 0);
                bits_in_buffer               <= 655;
            else
                bits_in_buffer               <= 171;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 236 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(171 downto 0)        <= buf_input_r(235 downto 64);
            if in_rdy = '1' then
                buf_input_r(655 downto 172)  <= data_in(483 downto 0);
                bits_in_buffer               <= 656;
            else
                bits_in_buffer               <= 172;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 237 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(172 downto 0)        <= buf_input_r(236 downto 64);
            if in_rdy = '1' then
                buf_input_r(656 downto 173)  <= data_in(483 downto 0);
                bits_in_buffer               <= 657;
            else
                bits_in_buffer               <= 173;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 238 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(173 downto 0)        <= buf_input_r(237 downto 64);
            if in_rdy = '1' then
                buf_input_r(657 downto 174)  <= data_in(483 downto 0);
                bits_in_buffer               <= 658;
            else
                bits_in_buffer               <= 174;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 239 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(174 downto 0)        <= buf_input_r(238 downto 64);
            if in_rdy = '1' then
                buf_input_r(658 downto 175)  <= data_in(483 downto 0);
                bits_in_buffer               <= 659;
            else
                bits_in_buffer               <= 175;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 240 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(175 downto 0)        <= buf_input_r(239 downto 64);
            if in_rdy = '1' then
                buf_input_r(659 downto 176)  <= data_in(483 downto 0);
                bits_in_buffer               <= 660;
            else
                bits_in_buffer               <= 176;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 241 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(176 downto 0)        <= buf_input_r(240 downto 64);
            if in_rdy = '1' then
                buf_input_r(660 downto 177)  <= data_in(483 downto 0);
                bits_in_buffer               <= 661;
            else
                bits_in_buffer               <= 177;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 242 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(177 downto 0)        <= buf_input_r(241 downto 64);
            if in_rdy = '1' then
                buf_input_r(661 downto 178)  <= data_in(483 downto 0);
                bits_in_buffer               <= 662;
            else
                bits_in_buffer               <= 178;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 243 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(178 downto 0)        <= buf_input_r(242 downto 64);
            if in_rdy = '1' then
                buf_input_r(662 downto 179)  <= data_in(483 downto 0);
                bits_in_buffer               <= 663;
            else
                bits_in_buffer               <= 179;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 244 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(179 downto 0)        <= buf_input_r(243 downto 64);
            if in_rdy = '1' then
                buf_input_r(663 downto 180)  <= data_in(483 downto 0);
                bits_in_buffer               <= 664;
            else
                bits_in_buffer               <= 180;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 245 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(180 downto 0)        <= buf_input_r(244 downto 64);
            if in_rdy = '1' then
                buf_input_r(664 downto 181)  <= data_in(483 downto 0);
                bits_in_buffer               <= 665;
            else
                bits_in_buffer               <= 181;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 246 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(181 downto 0)        <= buf_input_r(245 downto 64);
            if in_rdy = '1' then
                buf_input_r(665 downto 182)  <= data_in(483 downto 0);
                bits_in_buffer               <= 666;
            else
                bits_in_buffer               <= 182;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 247 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(182 downto 0)        <= buf_input_r(246 downto 64);
            if in_rdy = '1' then
                buf_input_r(666 downto 183)  <= data_in(483 downto 0);
                bits_in_buffer               <= 667;
            else
                bits_in_buffer               <= 183;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 248 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(183 downto 0)        <= buf_input_r(247 downto 64);
            if in_rdy = '1' then
                buf_input_r(667 downto 184)  <= data_in(483 downto 0);
                bits_in_buffer               <= 668;
            else
                bits_in_buffer               <= 184;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 249 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(184 downto 0)        <= buf_input_r(248 downto 64);
            if in_rdy = '1' then
                buf_input_r(668 downto 185)  <= data_in(483 downto 0);
                bits_in_buffer               <= 669;
            else
                bits_in_buffer               <= 185;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 250 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(185 downto 0)        <= buf_input_r(249 downto 64);
            if in_rdy = '1' then
                buf_input_r(669 downto 186)  <= data_in(483 downto 0);
                bits_in_buffer               <= 670;
            else
                bits_in_buffer               <= 186;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 251 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(186 downto 0)        <= buf_input_r(250 downto 64);
            if in_rdy = '1' then
                buf_input_r(670 downto 187)  <= data_in(483 downto 0);
                bits_in_buffer               <= 671;
            else
                bits_in_buffer               <= 187;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 252 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(187 downto 0)        <= buf_input_r(251 downto 64);
            if in_rdy = '1' then
                buf_input_r(671 downto 188)  <= data_in(483 downto 0);
                bits_in_buffer               <= 672;
            else
                bits_in_buffer               <= 188;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 253 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(188 downto 0)        <= buf_input_r(252 downto 64);
            if in_rdy = '1' then
                buf_input_r(672 downto 189)  <= data_in(483 downto 0);
                bits_in_buffer               <= 673;
            else
                bits_in_buffer               <= 189;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 254 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(189 downto 0)        <= buf_input_r(253 downto 64);
            if in_rdy = '1' then
                buf_input_r(673 downto 190)  <= data_in(483 downto 0);
                bits_in_buffer               <= 674;
            else
                bits_in_buffer               <= 190;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 255 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(190 downto 0)        <= buf_input_r(254 downto 64);
            if in_rdy = '1' then
                buf_input_r(674 downto 191)  <= data_in(483 downto 0);
                bits_in_buffer               <= 675;
            else
                bits_in_buffer               <= 191;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 256 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(191 downto 0)        <= buf_input_r(255 downto 64);
            if in_rdy = '1' then
                buf_input_r(675 downto 192)  <= data_in(483 downto 0);
                bits_in_buffer               <= 676;
            else
                bits_in_buffer               <= 192;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 257 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(192 downto 0)        <= buf_input_r(256 downto 64);
            if in_rdy = '1' then
                buf_input_r(676 downto 193)  <= data_in(483 downto 0);
                bits_in_buffer               <= 677;
            else
                bits_in_buffer               <= 193;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 258 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(193 downto 0)        <= buf_input_r(257 downto 64);
            if in_rdy = '1' then
                buf_input_r(677 downto 194)  <= data_in(483 downto 0);
                bits_in_buffer               <= 678;
            else
                bits_in_buffer               <= 194;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 259 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(194 downto 0)        <= buf_input_r(258 downto 64);
            if in_rdy = '1' then
                buf_input_r(678 downto 195)  <= data_in(483 downto 0);
                bits_in_buffer               <= 679;
            else
                bits_in_buffer               <= 195;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 260 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(195 downto 0)        <= buf_input_r(259 downto 64);
            if in_rdy = '1' then
                buf_input_r(679 downto 196)  <= data_in(483 downto 0);
                bits_in_buffer               <= 680;
            else
                bits_in_buffer               <= 196;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 261 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(196 downto 0)        <= buf_input_r(260 downto 64);
            if in_rdy = '1' then
                buf_input_r(680 downto 197)  <= data_in(483 downto 0);
                bits_in_buffer               <= 681;
            else
                bits_in_buffer               <= 197;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 262 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(197 downto 0)        <= buf_input_r(261 downto 64);
            if in_rdy = '1' then
                buf_input_r(681 downto 198)  <= data_in(483 downto 0);
                bits_in_buffer               <= 682;
            else
                bits_in_buffer               <= 198;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 263 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(198 downto 0)        <= buf_input_r(262 downto 64);
            if in_rdy = '1' then
                buf_input_r(682 downto 199)  <= data_in(483 downto 0);
                bits_in_buffer               <= 683;
            else
                bits_in_buffer               <= 199;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 264 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(199 downto 0)        <= buf_input_r(263 downto 64);
            if in_rdy = '1' then
                buf_input_r(683 downto 200)  <= data_in(483 downto 0);
                bits_in_buffer               <= 684;
            else
                bits_in_buffer               <= 200;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 265 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(200 downto 0)        <= buf_input_r(264 downto 64);
            if in_rdy = '1' then
                buf_input_r(684 downto 201)  <= data_in(483 downto 0);
                bits_in_buffer               <= 685;
            else
                bits_in_buffer               <= 201;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 266 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(201 downto 0)        <= buf_input_r(265 downto 64);
            if in_rdy = '1' then
                buf_input_r(685 downto 202)  <= data_in(483 downto 0);
                bits_in_buffer               <= 686;
            else
                bits_in_buffer               <= 202;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 267 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(202 downto 0)        <= buf_input_r(266 downto 64);
            if in_rdy = '1' then
                buf_input_r(686 downto 203)  <= data_in(483 downto 0);
                bits_in_buffer               <= 687;
            else
                bits_in_buffer               <= 203;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 268 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(203 downto 0)        <= buf_input_r(267 downto 64);
            if in_rdy = '1' then
                buf_input_r(687 downto 204)  <= data_in(483 downto 0);
                bits_in_buffer               <= 688;
            else
                bits_in_buffer               <= 204;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 269 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(204 downto 0)        <= buf_input_r(268 downto 64);
            if in_rdy = '1' then
                buf_input_r(688 downto 205)  <= data_in(483 downto 0);
                bits_in_buffer               <= 689;
            else
                bits_in_buffer               <= 205;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 270 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(205 downto 0)        <= buf_input_r(269 downto 64);
            if in_rdy = '1' then
                buf_input_r(689 downto 206)  <= data_in(483 downto 0);
                bits_in_buffer               <= 690;
            else
                bits_in_buffer               <= 206;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 271 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(206 downto 0)        <= buf_input_r(270 downto 64);
            if in_rdy = '1' then
                buf_input_r(690 downto 207)  <= data_in(483 downto 0);
                bits_in_buffer               <= 691;
            else
                bits_in_buffer               <= 207;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 272 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(207 downto 0)        <= buf_input_r(271 downto 64);
            if in_rdy = '1' then
                buf_input_r(691 downto 208)  <= data_in(483 downto 0);
                bits_in_buffer               <= 692;
            else
                bits_in_buffer               <= 208;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 273 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(208 downto 0)        <= buf_input_r(272 downto 64);
            if in_rdy = '1' then
                buf_input_r(692 downto 209)  <= data_in(483 downto 0);
                bits_in_buffer               <= 693;
            else
                bits_in_buffer               <= 209;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 274 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(209 downto 0)        <= buf_input_r(273 downto 64);
            if in_rdy = '1' then
                buf_input_r(693 downto 210)  <= data_in(483 downto 0);
                bits_in_buffer               <= 694;
            else
                bits_in_buffer               <= 210;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 275 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(210 downto 0)        <= buf_input_r(274 downto 64);
            if in_rdy = '1' then
                buf_input_r(694 downto 211)  <= data_in(483 downto 0);
                bits_in_buffer               <= 695;
            else
                bits_in_buffer               <= 211;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 276 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(211 downto 0)        <= buf_input_r(275 downto 64);
            if in_rdy = '1' then
                buf_input_r(695 downto 212)  <= data_in(483 downto 0);
                bits_in_buffer               <= 696;
            else
                bits_in_buffer               <= 212;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 277 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(212 downto 0)        <= buf_input_r(276 downto 64);
            if in_rdy = '1' then
                buf_input_r(696 downto 213)  <= data_in(483 downto 0);
                bits_in_buffer               <= 697;
            else
                bits_in_buffer               <= 213;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 278 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(213 downto 0)        <= buf_input_r(277 downto 64);
            if in_rdy = '1' then
                buf_input_r(697 downto 214)  <= data_in(483 downto 0);
                bits_in_buffer               <= 698;
            else
                bits_in_buffer               <= 214;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 279 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(214 downto 0)        <= buf_input_r(278 downto 64);
            if in_rdy = '1' then
                buf_input_r(698 downto 215)  <= data_in(483 downto 0);
                bits_in_buffer               <= 699;
            else
                bits_in_buffer               <= 215;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 280 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(215 downto 0)        <= buf_input_r(279 downto 64);
            if in_rdy = '1' then
                buf_input_r(699 downto 216)  <= data_in(483 downto 0);
                bits_in_buffer               <= 700;
            else
                bits_in_buffer               <= 216;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 281 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(216 downto 0)        <= buf_input_r(280 downto 64);
            if in_rdy = '1' then
                buf_input_r(700 downto 217)  <= data_in(483 downto 0);
                bits_in_buffer               <= 701;
            else
                bits_in_buffer               <= 217;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 282 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(217 downto 0)        <= buf_input_r(281 downto 64);
            if in_rdy = '1' then
                buf_input_r(701 downto 218)  <= data_in(483 downto 0);
                bits_in_buffer               <= 702;
            else
                bits_in_buffer               <= 218;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 283 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(218 downto 0)        <= buf_input_r(282 downto 64);
            if in_rdy = '1' then
                buf_input_r(702 downto 219)  <= data_in(483 downto 0);
                bits_in_buffer               <= 703;
            else
                bits_in_buffer               <= 219;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 284 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(219 downto 0)        <= buf_input_r(283 downto 64);
            if in_rdy = '1' then
                buf_input_r(703 downto 220)  <= data_in(483 downto 0);
                bits_in_buffer               <= 704;
            else
                bits_in_buffer               <= 220;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 285 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(220 downto 0)        <= buf_input_r(284 downto 64);
            if in_rdy = '1' then
                buf_input_r(704 downto 221)  <= data_in(483 downto 0);
                bits_in_buffer               <= 705;
            else
                bits_in_buffer               <= 221;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 286 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(221 downto 0)        <= buf_input_r(285 downto 64);
            if in_rdy = '1' then
                buf_input_r(705 downto 222)  <= data_in(483 downto 0);
                bits_in_buffer               <= 706;
            else
                bits_in_buffer               <= 222;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 287 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(222 downto 0)        <= buf_input_r(286 downto 64);
            if in_rdy = '1' then
                buf_input_r(706 downto 223)  <= data_in(483 downto 0);
                bits_in_buffer               <= 707;
            else
                bits_in_buffer               <= 223;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 288 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(223 downto 0)        <= buf_input_r(287 downto 64);
            if in_rdy = '1' then
                buf_input_r(707 downto 224)  <= data_in(483 downto 0);
                bits_in_buffer               <= 708;
            else
                bits_in_buffer               <= 224;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 289 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(224 downto 0)        <= buf_input_r(288 downto 64);
            if in_rdy = '1' then
                buf_input_r(708 downto 225)  <= data_in(483 downto 0);
                bits_in_buffer               <= 709;
            else
                bits_in_buffer               <= 225;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 290 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(225 downto 0)        <= buf_input_r(289 downto 64);
            if in_rdy = '1' then
                buf_input_r(709 downto 226)  <= data_in(483 downto 0);
                bits_in_buffer               <= 710;
            else
                bits_in_buffer               <= 226;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 291 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(226 downto 0)        <= buf_input_r(290 downto 64);
            if in_rdy = '1' then
                buf_input_r(710 downto 227)  <= data_in(483 downto 0);
                bits_in_buffer               <= 711;
            else
                bits_in_buffer               <= 227;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 292 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(227 downto 0)        <= buf_input_r(291 downto 64);
            if in_rdy = '1' then
                buf_input_r(711 downto 228)  <= data_in(483 downto 0);
                bits_in_buffer               <= 712;
            else
                bits_in_buffer               <= 228;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 293 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(228 downto 0)        <= buf_input_r(292 downto 64);
            if in_rdy = '1' then
                buf_input_r(712 downto 229)  <= data_in(483 downto 0);
                bits_in_buffer               <= 713;
            else
                bits_in_buffer               <= 229;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 294 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(229 downto 0)        <= buf_input_r(293 downto 64);
            if in_rdy = '1' then
                buf_input_r(713 downto 230)  <= data_in(483 downto 0);
                bits_in_buffer               <= 714;
            else
                bits_in_buffer               <= 230;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 295 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(230 downto 0)        <= buf_input_r(294 downto 64);
            if in_rdy = '1' then
                buf_input_r(714 downto 231)  <= data_in(483 downto 0);
                bits_in_buffer               <= 715;
            else
                bits_in_buffer               <= 231;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 296 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(231 downto 0)        <= buf_input_r(295 downto 64);
            if in_rdy = '1' then
                buf_input_r(715 downto 232)  <= data_in(483 downto 0);
                bits_in_buffer               <= 716;
            else
                bits_in_buffer               <= 232;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 297 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(232 downto 0)        <= buf_input_r(296 downto 64);
            if in_rdy = '1' then
                buf_input_r(716 downto 233)  <= data_in(483 downto 0);
                bits_in_buffer               <= 717;
            else
                bits_in_buffer               <= 233;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 298 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(233 downto 0)        <= buf_input_r(297 downto 64);
            if in_rdy = '1' then
                buf_input_r(717 downto 234)  <= data_in(483 downto 0);
                bits_in_buffer               <= 718;
            else
                bits_in_buffer               <= 234;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 299 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(234 downto 0)        <= buf_input_r(298 downto 64);
            if in_rdy = '1' then
                buf_input_r(718 downto 235)  <= data_in(483 downto 0);
                bits_in_buffer               <= 719;
            else
                bits_in_buffer               <= 235;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 300 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(235 downto 0)        <= buf_input_r(299 downto 64);
            if in_rdy = '1' then
                buf_input_r(719 downto 236)  <= data_in(483 downto 0);
                bits_in_buffer               <= 720;
            else
                bits_in_buffer               <= 236;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 301 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(236 downto 0)        <= buf_input_r(300 downto 64);
            if in_rdy = '1' then
                buf_input_r(720 downto 237)  <= data_in(483 downto 0);
                bits_in_buffer               <= 721;
            else
                bits_in_buffer               <= 237;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 302 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(237 downto 0)        <= buf_input_r(301 downto 64);
            if in_rdy = '1' then
                buf_input_r(721 downto 238)  <= data_in(483 downto 0);
                bits_in_buffer               <= 722;
            else
                bits_in_buffer               <= 238;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 303 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(238 downto 0)        <= buf_input_r(302 downto 64);
            if in_rdy = '1' then
                buf_input_r(722 downto 239)  <= data_in(483 downto 0);
                bits_in_buffer               <= 723;
            else
                bits_in_buffer               <= 239;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 304 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(239 downto 0)        <= buf_input_r(303 downto 64);
            if in_rdy = '1' then
                buf_input_r(723 downto 240)  <= data_in(483 downto 0);
                bits_in_buffer               <= 724;
            else
                bits_in_buffer               <= 240;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 305 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(240 downto 0)        <= buf_input_r(304 downto 64);
            if in_rdy = '1' then
                buf_input_r(724 downto 241)  <= data_in(483 downto 0);
                bits_in_buffer               <= 725;
            else
                bits_in_buffer               <= 241;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 306 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(241 downto 0)        <= buf_input_r(305 downto 64);
            if in_rdy = '1' then
                buf_input_r(725 downto 242)  <= data_in(483 downto 0);
                bits_in_buffer               <= 726;
            else
                bits_in_buffer               <= 242;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 307 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(242 downto 0)        <= buf_input_r(306 downto 64);
            if in_rdy = '1' then
                buf_input_r(726 downto 243)  <= data_in(483 downto 0);
                bits_in_buffer               <= 727;
            else
                bits_in_buffer               <= 243;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 308 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(243 downto 0)        <= buf_input_r(307 downto 64);
            if in_rdy = '1' then
                buf_input_r(727 downto 244)  <= data_in(483 downto 0);
                bits_in_buffer               <= 728;
            else
                bits_in_buffer               <= 244;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 309 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(244 downto 0)        <= buf_input_r(308 downto 64);
            if in_rdy = '1' then
                buf_input_r(728 downto 245)  <= data_in(483 downto 0);
                bits_in_buffer               <= 729;
            else
                bits_in_buffer               <= 245;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 310 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(245 downto 0)        <= buf_input_r(309 downto 64);
            if in_rdy = '1' then
                buf_input_r(729 downto 246)  <= data_in(483 downto 0);
                bits_in_buffer               <= 730;
            else
                bits_in_buffer               <= 246;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 311 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(246 downto 0)        <= buf_input_r(310 downto 64);
            if in_rdy = '1' then
                buf_input_r(730 downto 247)  <= data_in(483 downto 0);
                bits_in_buffer               <= 731;
            else
                bits_in_buffer               <= 247;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 312 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(247 downto 0)        <= buf_input_r(311 downto 64);
            if in_rdy = '1' then
                buf_input_r(731 downto 248)  <= data_in(483 downto 0);
                bits_in_buffer               <= 732;
            else
                bits_in_buffer               <= 248;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 313 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(248 downto 0)        <= buf_input_r(312 downto 64);
            if in_rdy = '1' then
                buf_input_r(732 downto 249)  <= data_in(483 downto 0);
                bits_in_buffer               <= 733;
            else
                bits_in_buffer               <= 249;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 314 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(249 downto 0)        <= buf_input_r(313 downto 64);
            if in_rdy = '1' then
                buf_input_r(733 downto 250)  <= data_in(483 downto 0);
                bits_in_buffer               <= 734;
            else
                bits_in_buffer               <= 250;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 315 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(250 downto 0)        <= buf_input_r(314 downto 64);
            if in_rdy = '1' then
                buf_input_r(734 downto 251)  <= data_in(483 downto 0);
                bits_in_buffer               <= 735;
            else
                bits_in_buffer               <= 251;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 316 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(251 downto 0)        <= buf_input_r(315 downto 64);
            if in_rdy = '1' then
                buf_input_r(735 downto 252)  <= data_in(483 downto 0);
                bits_in_buffer               <= 736;
            else
                bits_in_buffer               <= 252;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 317 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(252 downto 0)        <= buf_input_r(316 downto 64);
            if in_rdy = '1' then
                buf_input_r(736 downto 253)  <= data_in(483 downto 0);
                bits_in_buffer               <= 737;
            else
                bits_in_buffer               <= 253;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 318 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(253 downto 0)        <= buf_input_r(317 downto 64);
            if in_rdy = '1' then
                buf_input_r(737 downto 254)  <= data_in(483 downto 0);
                bits_in_buffer               <= 738;
            else
                bits_in_buffer               <= 254;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 319 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(254 downto 0)        <= buf_input_r(318 downto 64);
            if in_rdy = '1' then
                buf_input_r(738 downto 255)  <= data_in(483 downto 0);
                bits_in_buffer               <= 739;
            else
                bits_in_buffer               <= 255;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 320 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(255 downto 0)        <= buf_input_r(319 downto 64);
            if in_rdy = '1' then
                buf_input_r(739 downto 256)  <= data_in(483 downto 0);
                bits_in_buffer               <= 740;
            else
                bits_in_buffer               <= 256;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 321 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(256 downto 0)        <= buf_input_r(320 downto 64);
            if in_rdy = '1' then
                buf_input_r(740 downto 257)  <= data_in(483 downto 0);
                bits_in_buffer               <= 741;
            else
                bits_in_buffer               <= 257;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 322 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(257 downto 0)        <= buf_input_r(321 downto 64);
            if in_rdy = '1' then
                buf_input_r(741 downto 258)  <= data_in(483 downto 0);
                bits_in_buffer               <= 742;
            else
                bits_in_buffer               <= 258;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 323 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(258 downto 0)        <= buf_input_r(322 downto 64);
            if in_rdy = '1' then
                buf_input_r(742 downto 259)  <= data_in(483 downto 0);
                bits_in_buffer               <= 743;
            else
                bits_in_buffer               <= 259;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 324 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(259 downto 0)        <= buf_input_r(323 downto 64);
            if in_rdy = '1' then
                buf_input_r(743 downto 260)  <= data_in(483 downto 0);
                bits_in_buffer               <= 744;
            else
                bits_in_buffer               <= 260;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 325 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(260 downto 0)        <= buf_input_r(324 downto 64);
            if in_rdy = '1' then
                buf_input_r(744 downto 261)  <= data_in(483 downto 0);
                bits_in_buffer               <= 745;
            else
                bits_in_buffer               <= 261;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 326 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(261 downto 0)        <= buf_input_r(325 downto 64);
            if in_rdy = '1' then
                buf_input_r(745 downto 262)  <= data_in(483 downto 0);
                bits_in_buffer               <= 746;
            else
                bits_in_buffer               <= 262;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 327 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(262 downto 0)        <= buf_input_r(326 downto 64);
            if in_rdy = '1' then
                buf_input_r(746 downto 263)  <= data_in(483 downto 0);
                bits_in_buffer               <= 747;
            else
                bits_in_buffer               <= 263;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 328 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(263 downto 0)        <= buf_input_r(327 downto 64);
            if in_rdy = '1' then
                buf_input_r(747 downto 264)  <= data_in(483 downto 0);
                bits_in_buffer               <= 748;
            else
                bits_in_buffer               <= 264;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 329 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(264 downto 0)        <= buf_input_r(328 downto 64);
            if in_rdy = '1' then
                buf_input_r(748 downto 265)  <= data_in(483 downto 0);
                bits_in_buffer               <= 749;
            else
                bits_in_buffer               <= 265;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 330 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(265 downto 0)        <= buf_input_r(329 downto 64);
            if in_rdy = '1' then
                buf_input_r(749 downto 266)  <= data_in(483 downto 0);
                bits_in_buffer               <= 750;
            else
                bits_in_buffer               <= 266;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 331 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(266 downto 0)        <= buf_input_r(330 downto 64);
            if in_rdy = '1' then
                buf_input_r(750 downto 267)  <= data_in(483 downto 0);
                bits_in_buffer               <= 751;
            else
                bits_in_buffer               <= 267;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 332 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(267 downto 0)        <= buf_input_r(331 downto 64);
            if in_rdy = '1' then
                buf_input_r(751 downto 268)  <= data_in(483 downto 0);
                bits_in_buffer               <= 752;
            else
                bits_in_buffer               <= 268;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 333 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(268 downto 0)        <= buf_input_r(332 downto 64);
            if in_rdy = '1' then
                buf_input_r(752 downto 269)  <= data_in(483 downto 0);
                bits_in_buffer               <= 753;
            else
                bits_in_buffer               <= 269;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 334 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(269 downto 0)        <= buf_input_r(333 downto 64);
            if in_rdy = '1' then
                buf_input_r(753 downto 270)  <= data_in(483 downto 0);
                bits_in_buffer               <= 754;
            else
                bits_in_buffer               <= 270;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 335 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(270 downto 0)        <= buf_input_r(334 downto 64);
            if in_rdy = '1' then
                buf_input_r(754 downto 271)  <= data_in(483 downto 0);
                bits_in_buffer               <= 755;
            else
                bits_in_buffer               <= 271;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 336 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(271 downto 0)        <= buf_input_r(335 downto 64);
            if in_rdy = '1' then
                buf_input_r(755 downto 272)  <= data_in(483 downto 0);
                bits_in_buffer               <= 756;
            else
                bits_in_buffer               <= 272;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 337 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(272 downto 0)        <= buf_input_r(336 downto 64);
            if in_rdy = '1' then
                buf_input_r(756 downto 273)  <= data_in(483 downto 0);
                bits_in_buffer               <= 757;
            else
                bits_in_buffer               <= 273;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 338 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(273 downto 0)        <= buf_input_r(337 downto 64);
            if in_rdy = '1' then
                buf_input_r(757 downto 274)  <= data_in(483 downto 0);
                bits_in_buffer               <= 758;
            else
                bits_in_buffer               <= 274;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 339 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(274 downto 0)        <= buf_input_r(338 downto 64);
            if in_rdy = '1' then
                buf_input_r(758 downto 275)  <= data_in(483 downto 0);
                bits_in_buffer               <= 759;
            else
                bits_in_buffer               <= 275;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 340 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(275 downto 0)        <= buf_input_r(339 downto 64);
            if in_rdy = '1' then
                buf_input_r(759 downto 276)  <= data_in(483 downto 0);
                bits_in_buffer               <= 760;
            else
                bits_in_buffer               <= 276;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 341 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(276 downto 0)        <= buf_input_r(340 downto 64);
            if in_rdy = '1' then
                buf_input_r(760 downto 277)  <= data_in(483 downto 0);
                bits_in_buffer               <= 761;
            else
                bits_in_buffer               <= 277;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 342 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(277 downto 0)        <= buf_input_r(341 downto 64);
            if in_rdy = '1' then
                buf_input_r(761 downto 278)  <= data_in(483 downto 0);
                bits_in_buffer               <= 762;
            else
                bits_in_buffer               <= 278;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 343 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(278 downto 0)        <= buf_input_r(342 downto 64);
            if in_rdy = '1' then
                buf_input_r(762 downto 279)  <= data_in(483 downto 0);
                bits_in_buffer               <= 763;
            else
                bits_in_buffer               <= 279;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 344 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(279 downto 0)        <= buf_input_r(343 downto 64);
            if in_rdy = '1' then
                buf_input_r(763 downto 280)  <= data_in(483 downto 0);
                bits_in_buffer               <= 764;
            else
                bits_in_buffer               <= 280;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 345 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(280 downto 0)        <= buf_input_r(344 downto 64);
            if in_rdy = '1' then
                buf_input_r(764 downto 281)  <= data_in(483 downto 0);
                bits_in_buffer               <= 765;
            else
                bits_in_buffer               <= 281;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 346 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(281 downto 0)        <= buf_input_r(345 downto 64);
            if in_rdy = '1' then
                buf_input_r(765 downto 282)  <= data_in(483 downto 0);
                bits_in_buffer               <= 766;
            else
                bits_in_buffer               <= 282;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 347 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(282 downto 0)        <= buf_input_r(346 downto 64);
            if in_rdy = '1' then
                buf_input_r(766 downto 283)  <= data_in(483 downto 0);
                bits_in_buffer               <= 767;
            else
                bits_in_buffer               <= 283;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 348 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(283 downto 0)        <= buf_input_r(347 downto 64);
            if in_rdy = '1' then
                buf_input_r(767 downto 284)  <= data_in(483 downto 0);
                bits_in_buffer               <= 768;
            else
                bits_in_buffer               <= 284;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 349 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(284 downto 0)        <= buf_input_r(348 downto 64);
            if in_rdy = '1' then
                buf_input_r(768 downto 285)  <= data_in(483 downto 0);
                bits_in_buffer               <= 769;
            else
                bits_in_buffer               <= 285;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 350 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(285 downto 0)        <= buf_input_r(349 downto 64);
            if in_rdy = '1' then
                buf_input_r(769 downto 286)  <= data_in(483 downto 0);
                bits_in_buffer               <= 770;
            else
                bits_in_buffer               <= 286;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 351 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(286 downto 0)        <= buf_input_r(350 downto 64);
            if in_rdy = '1' then
                buf_input_r(770 downto 287)  <= data_in(483 downto 0);
                bits_in_buffer               <= 771;
            else
                bits_in_buffer               <= 287;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 352 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(287 downto 0)        <= buf_input_r(351 downto 64);
            if in_rdy = '1' then
                buf_input_r(771 downto 288)  <= data_in(483 downto 0);
                bits_in_buffer               <= 772;
            else
                bits_in_buffer               <= 288;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 353 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(288 downto 0)        <= buf_input_r(352 downto 64);
            if in_rdy = '1' then
                buf_input_r(772 downto 289)  <= data_in(483 downto 0);
                bits_in_buffer               <= 773;
            else
                bits_in_buffer               <= 289;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 354 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(289 downto 0)        <= buf_input_r(353 downto 64);
            if in_rdy = '1' then
                buf_input_r(773 downto 290)  <= data_in(483 downto 0);
                bits_in_buffer               <= 774;
            else
                bits_in_buffer               <= 290;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 355 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(290 downto 0)        <= buf_input_r(354 downto 64);
            if in_rdy = '1' then
                buf_input_r(774 downto 291)  <= data_in(483 downto 0);
                bits_in_buffer               <= 775;
            else
                bits_in_buffer               <= 291;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 356 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(291 downto 0)        <= buf_input_r(355 downto 64);
            if in_rdy = '1' then
                buf_input_r(775 downto 292)  <= data_in(483 downto 0);
                bits_in_buffer               <= 776;
            else
                bits_in_buffer               <= 292;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 357 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(292 downto 0)        <= buf_input_r(356 downto 64);
            if in_rdy = '1' then
                buf_input_r(776 downto 293)  <= data_in(483 downto 0);
                bits_in_buffer               <= 777;
            else
                bits_in_buffer               <= 293;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 358 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(293 downto 0)        <= buf_input_r(357 downto 64);
            if in_rdy = '1' then
                buf_input_r(777 downto 294)  <= data_in(483 downto 0);
                bits_in_buffer               <= 778;
            else
                bits_in_buffer               <= 294;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 359 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(294 downto 0)        <= buf_input_r(358 downto 64);
            if in_rdy = '1' then
                buf_input_r(778 downto 295)  <= data_in(483 downto 0);
                bits_in_buffer               <= 779;
            else
                bits_in_buffer               <= 295;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 360 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(295 downto 0)        <= buf_input_r(359 downto 64);
            if in_rdy = '1' then
                buf_input_r(779 downto 296)  <= data_in(483 downto 0);
                bits_in_buffer               <= 780;
            else
                bits_in_buffer               <= 296;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 361 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(296 downto 0)        <= buf_input_r(360 downto 64);
            if in_rdy = '1' then
                buf_input_r(780 downto 297)  <= data_in(483 downto 0);
                bits_in_buffer               <= 781;
            else
                bits_in_buffer               <= 297;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 362 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(297 downto 0)        <= buf_input_r(361 downto 64);
            if in_rdy = '1' then
                buf_input_r(781 downto 298)  <= data_in(483 downto 0);
                bits_in_buffer               <= 782;
            else
                bits_in_buffer               <= 298;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 363 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(298 downto 0)        <= buf_input_r(362 downto 64);
            if in_rdy = '1' then
                buf_input_r(782 downto 299)  <= data_in(483 downto 0);
                bits_in_buffer               <= 783;
            else
                bits_in_buffer               <= 299;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 364 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(299 downto 0)        <= buf_input_r(363 downto 64);
            if in_rdy = '1' then
                buf_input_r(783 downto 300)  <= data_in(483 downto 0);
                bits_in_buffer               <= 784;
            else
                bits_in_buffer               <= 300;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 365 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(300 downto 0)        <= buf_input_r(364 downto 64);
            if in_rdy = '1' then
                buf_input_r(784 downto 301)  <= data_in(483 downto 0);
                bits_in_buffer               <= 785;
            else
                bits_in_buffer               <= 301;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 366 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(301 downto 0)        <= buf_input_r(365 downto 64);
            if in_rdy = '1' then
                buf_input_r(785 downto 302)  <= data_in(483 downto 0);
                bits_in_buffer               <= 786;
            else
                bits_in_buffer               <= 302;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 367 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(302 downto 0)        <= buf_input_r(366 downto 64);
            if in_rdy = '1' then
                buf_input_r(786 downto 303)  <= data_in(483 downto 0);
                bits_in_buffer               <= 787;
            else
                bits_in_buffer               <= 303;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 368 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(303 downto 0)        <= buf_input_r(367 downto 64);
            if in_rdy = '1' then
                buf_input_r(787 downto 304)  <= data_in(483 downto 0);
                bits_in_buffer               <= 788;
            else
                bits_in_buffer               <= 304;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 369 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(304 downto 0)        <= buf_input_r(368 downto 64);
            if in_rdy = '1' then
                buf_input_r(788 downto 305)  <= data_in(483 downto 0);
                bits_in_buffer               <= 789;
            else
                bits_in_buffer               <= 305;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 370 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(305 downto 0)        <= buf_input_r(369 downto 64);
            if in_rdy = '1' then
                buf_input_r(789 downto 306)  <= data_in(483 downto 0);
                bits_in_buffer               <= 790;
            else
                bits_in_buffer               <= 306;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 371 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(306 downto 0)        <= buf_input_r(370 downto 64);
            if in_rdy = '1' then
                buf_input_r(790 downto 307)  <= data_in(483 downto 0);
                bits_in_buffer               <= 791;
            else
                bits_in_buffer               <= 307;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 372 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(307 downto 0)        <= buf_input_r(371 downto 64);
            if in_rdy = '1' then
                buf_input_r(791 downto 308)  <= data_in(483 downto 0);
                bits_in_buffer               <= 792;
            else
                bits_in_buffer               <= 308;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 373 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(308 downto 0)        <= buf_input_r(372 downto 64);
            if in_rdy = '1' then
                buf_input_r(792 downto 309)  <= data_in(483 downto 0);
                bits_in_buffer               <= 793;
            else
                bits_in_buffer               <= 309;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 374 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(309 downto 0)        <= buf_input_r(373 downto 64);
            if in_rdy = '1' then
                buf_input_r(793 downto 310)  <= data_in(483 downto 0);
                bits_in_buffer               <= 794;
            else
                bits_in_buffer               <= 310;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 375 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(310 downto 0)        <= buf_input_r(374 downto 64);
            if in_rdy = '1' then
                buf_input_r(794 downto 311)  <= data_in(483 downto 0);
                bits_in_buffer               <= 795;
            else
                bits_in_buffer               <= 311;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 376 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(311 downto 0)        <= buf_input_r(375 downto 64);
            if in_rdy = '1' then
                buf_input_r(795 downto 312)  <= data_in(483 downto 0);
                bits_in_buffer               <= 796;
            else
                bits_in_buffer               <= 312;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 377 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(312 downto 0)        <= buf_input_r(376 downto 64);
            if in_rdy = '1' then
                buf_input_r(796 downto 313)  <= data_in(483 downto 0);
                bits_in_buffer               <= 797;
            else
                bits_in_buffer               <= 313;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 378 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(313 downto 0)        <= buf_input_r(377 downto 64);
            if in_rdy = '1' then
                buf_input_r(797 downto 314)  <= data_in(483 downto 0);
                bits_in_buffer               <= 798;
            else
                bits_in_buffer               <= 314;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 379 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(314 downto 0)        <= buf_input_r(378 downto 64);
            if in_rdy = '1' then
                buf_input_r(798 downto 315)  <= data_in(483 downto 0);
                bits_in_buffer               <= 799;
            else
                bits_in_buffer               <= 315;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 380 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(315 downto 0)        <= buf_input_r(379 downto 64);
            if in_rdy = '1' then
                buf_input_r(799 downto 316)  <= data_in(483 downto 0);
                bits_in_buffer               <= 800;
            else
                bits_in_buffer               <= 316;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 381 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(316 downto 0)        <= buf_input_r(380 downto 64);
            if in_rdy = '1' then
                buf_input_r(800 downto 317)  <= data_in(483 downto 0);
                bits_in_buffer               <= 801;
            else
                bits_in_buffer               <= 317;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 382 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(317 downto 0)        <= buf_input_r(381 downto 64);
            if in_rdy = '1' then
                buf_input_r(801 downto 318)  <= data_in(483 downto 0);
                bits_in_buffer               <= 802;
            else
                bits_in_buffer               <= 318;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 383 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(318 downto 0)        <= buf_input_r(382 downto 64);
            if in_rdy = '1' then
                buf_input_r(802 downto 319)  <= data_in(483 downto 0);
                bits_in_buffer               <= 803;
            else
                bits_in_buffer               <= 319;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 384 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(319 downto 0)        <= buf_input_r(383 downto 64);
            if in_rdy = '1' then
                buf_input_r(803 downto 320)  <= data_in(483 downto 0);
                bits_in_buffer               <= 804;
            else
                bits_in_buffer               <= 320;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 385 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(320 downto 0)        <= buf_input_r(384 downto 64);
            if in_rdy = '1' then
                buf_input_r(804 downto 321)  <= data_in(483 downto 0);
                bits_in_buffer               <= 805;
            else
                bits_in_buffer               <= 321;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 386 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(321 downto 0)        <= buf_input_r(385 downto 64);
            if in_rdy = '1' then
                buf_input_r(805 downto 322)  <= data_in(483 downto 0);
                bits_in_buffer               <= 806;
            else
                bits_in_buffer               <= 322;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 387 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(322 downto 0)        <= buf_input_r(386 downto 64);
            if in_rdy = '1' then
                buf_input_r(806 downto 323)  <= data_in(483 downto 0);
                bits_in_buffer               <= 807;
            else
                bits_in_buffer               <= 323;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 388 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(323 downto 0)        <= buf_input_r(387 downto 64);
            if in_rdy = '1' then
                buf_input_r(807 downto 324)  <= data_in(483 downto 0);
                bits_in_buffer               <= 808;
            else
                bits_in_buffer               <= 324;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 389 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(324 downto 0)        <= buf_input_r(388 downto 64);
            if in_rdy = '1' then
                buf_input_r(808 downto 325)  <= data_in(483 downto 0);
                bits_in_buffer               <= 809;
            else
                bits_in_buffer               <= 325;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 390 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(325 downto 0)        <= buf_input_r(389 downto 64);
            if in_rdy = '1' then
                buf_input_r(809 downto 326)  <= data_in(483 downto 0);
                bits_in_buffer               <= 810;
            else
                bits_in_buffer               <= 326;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 391 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(326 downto 0)        <= buf_input_r(390 downto 64);
            if in_rdy = '1' then
                buf_input_r(810 downto 327)  <= data_in(483 downto 0);
                bits_in_buffer               <= 811;
            else
                bits_in_buffer               <= 327;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 392 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(327 downto 0)        <= buf_input_r(391 downto 64);
            if in_rdy = '1' then
                buf_input_r(811 downto 328)  <= data_in(483 downto 0);
                bits_in_buffer               <= 812;
            else
                bits_in_buffer               <= 328;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 393 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(328 downto 0)        <= buf_input_r(392 downto 64);
            if in_rdy = '1' then
                buf_input_r(812 downto 329)  <= data_in(483 downto 0);
                bits_in_buffer               <= 813;
            else
                bits_in_buffer               <= 329;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 394 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(329 downto 0)        <= buf_input_r(393 downto 64);
            if in_rdy = '1' then
                buf_input_r(813 downto 330)  <= data_in(483 downto 0);
                bits_in_buffer               <= 814;
            else
                bits_in_buffer               <= 330;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 395 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(330 downto 0)        <= buf_input_r(394 downto 64);
            if in_rdy = '1' then
                buf_input_r(814 downto 331)  <= data_in(483 downto 0);
                bits_in_buffer               <= 815;
            else
                bits_in_buffer               <= 331;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 396 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(331 downto 0)        <= buf_input_r(395 downto 64);
            if in_rdy = '1' then
                buf_input_r(815 downto 332)  <= data_in(483 downto 0);
                bits_in_buffer               <= 816;
            else
                bits_in_buffer               <= 332;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 397 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(332 downto 0)        <= buf_input_r(396 downto 64);
            if in_rdy = '1' then
                buf_input_r(816 downto 333)  <= data_in(483 downto 0);
                bits_in_buffer               <= 817;
            else
                bits_in_buffer               <= 333;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 398 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(333 downto 0)        <= buf_input_r(397 downto 64);
            if in_rdy = '1' then
                buf_input_r(817 downto 334)  <= data_in(483 downto 0);
                bits_in_buffer               <= 818;
            else
                bits_in_buffer               <= 334;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 399 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(334 downto 0)        <= buf_input_r(398 downto 64);
            if in_rdy = '1' then
                buf_input_r(818 downto 335)  <= data_in(483 downto 0);
                bits_in_buffer               <= 819;
            else
                bits_in_buffer               <= 335;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 400 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(335 downto 0)        <= buf_input_r(399 downto 64);
            if in_rdy = '1' then
                buf_input_r(819 downto 336)  <= data_in(483 downto 0);
                bits_in_buffer               <= 820;
            else
                bits_in_buffer               <= 336;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 401 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(336 downto 0)        <= buf_input_r(400 downto 64);
            if in_rdy = '1' then
                buf_input_r(820 downto 337)  <= data_in(483 downto 0);
                bits_in_buffer               <= 821;
            else
                bits_in_buffer               <= 337;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 402 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(337 downto 0)        <= buf_input_r(401 downto 64);
            if in_rdy = '1' then
                buf_input_r(821 downto 338)  <= data_in(483 downto 0);
                bits_in_buffer               <= 822;
            else
                bits_in_buffer               <= 338;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 403 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(338 downto 0)        <= buf_input_r(402 downto 64);
            if in_rdy = '1' then
                buf_input_r(822 downto 339)  <= data_in(483 downto 0);
                bits_in_buffer               <= 823;
            else
                bits_in_buffer               <= 339;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 404 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(339 downto 0)        <= buf_input_r(403 downto 64);
            if in_rdy = '1' then
                buf_input_r(823 downto 340)  <= data_in(483 downto 0);
                bits_in_buffer               <= 824;
            else
                bits_in_buffer               <= 340;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 405 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(340 downto 0)        <= buf_input_r(404 downto 64);
            if in_rdy = '1' then
                buf_input_r(824 downto 341)  <= data_in(483 downto 0);
                bits_in_buffer               <= 825;
            else
                bits_in_buffer               <= 341;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 406 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(341 downto 0)        <= buf_input_r(405 downto 64);
            if in_rdy = '1' then
                buf_input_r(825 downto 342)  <= data_in(483 downto 0);
                bits_in_buffer               <= 826;
            else
                bits_in_buffer               <= 342;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 407 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(342 downto 0)        <= buf_input_r(406 downto 64);
            if in_rdy = '1' then
                buf_input_r(826 downto 343)  <= data_in(483 downto 0);
                bits_in_buffer               <= 827;
            else
                bits_in_buffer               <= 343;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 408 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(343 downto 0)        <= buf_input_r(407 downto 64);
            if in_rdy = '1' then
                buf_input_r(827 downto 344)  <= data_in(483 downto 0);
                bits_in_buffer               <= 828;
            else
                bits_in_buffer               <= 344;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 409 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(344 downto 0)        <= buf_input_r(408 downto 64);
            if in_rdy = '1' then
                buf_input_r(828 downto 345)  <= data_in(483 downto 0);
                bits_in_buffer               <= 829;
            else
                bits_in_buffer               <= 345;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 410 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(345 downto 0)        <= buf_input_r(409 downto 64);
            if in_rdy = '1' then
                buf_input_r(829 downto 346)  <= data_in(483 downto 0);
                bits_in_buffer               <= 830;
            else
                bits_in_buffer               <= 346;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 411 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(346 downto 0)        <= buf_input_r(410 downto 64);
            if in_rdy = '1' then
                buf_input_r(830 downto 347)  <= data_in(483 downto 0);
                bits_in_buffer               <= 831;
            else
                bits_in_buffer               <= 347;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 412 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(347 downto 0)        <= buf_input_r(411 downto 64);
            if in_rdy = '1' then
                buf_input_r(831 downto 348)  <= data_in(483 downto 0);
                bits_in_buffer               <= 832;
            else
                bits_in_buffer               <= 348;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 413 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(348 downto 0)        <= buf_input_r(412 downto 64);
            if in_rdy = '1' then
                buf_input_r(832 downto 349)  <= data_in(483 downto 0);
                bits_in_buffer               <= 833;
            else
                bits_in_buffer               <= 349;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 414 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(349 downto 0)        <= buf_input_r(413 downto 64);
            if in_rdy = '1' then
                buf_input_r(833 downto 350)  <= data_in(483 downto 0);
                bits_in_buffer               <= 834;
            else
                bits_in_buffer               <= 350;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 415 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(350 downto 0)        <= buf_input_r(414 downto 64);
            if in_rdy = '1' then
                buf_input_r(834 downto 351)  <= data_in(483 downto 0);
                bits_in_buffer               <= 835;
            else
                bits_in_buffer               <= 351;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 416 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(351 downto 0)        <= buf_input_r(415 downto 64);
            if in_rdy = '1' then
                buf_input_r(835 downto 352)  <= data_in(483 downto 0);
                bits_in_buffer               <= 836;
            else
                bits_in_buffer               <= 352;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 417 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(352 downto 0)        <= buf_input_r(416 downto 64);
            if in_rdy = '1' then
                buf_input_r(836 downto 353)  <= data_in(483 downto 0);
                bits_in_buffer               <= 837;
            else
                bits_in_buffer               <= 353;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 418 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(353 downto 0)        <= buf_input_r(417 downto 64);
            if in_rdy = '1' then
                buf_input_r(837 downto 354)  <= data_in(483 downto 0);
                bits_in_buffer               <= 838;
            else
                bits_in_buffer               <= 354;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 419 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(354 downto 0)        <= buf_input_r(418 downto 64);
            if in_rdy = '1' then
                buf_input_r(838 downto 355)  <= data_in(483 downto 0);
                bits_in_buffer               <= 839;
            else
                bits_in_buffer               <= 355;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 420 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(355 downto 0)        <= buf_input_r(419 downto 64);
            if in_rdy = '1' then
                buf_input_r(839 downto 356)  <= data_in(483 downto 0);
                bits_in_buffer               <= 840;
            else
                bits_in_buffer               <= 356;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 421 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(356 downto 0)        <= buf_input_r(420 downto 64);
            if in_rdy = '1' then
                buf_input_r(840 downto 357)  <= data_in(483 downto 0);
                bits_in_buffer               <= 841;
            else
                bits_in_buffer               <= 357;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 422 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(357 downto 0)        <= buf_input_r(421 downto 64);
            if in_rdy = '1' then
                buf_input_r(841 downto 358)  <= data_in(483 downto 0);
                bits_in_buffer               <= 842;
            else
                bits_in_buffer               <= 358;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 423 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(358 downto 0)        <= buf_input_r(422 downto 64);
            if in_rdy = '1' then
                buf_input_r(842 downto 359)  <= data_in(483 downto 0);
                bits_in_buffer               <= 843;
            else
                bits_in_buffer               <= 359;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 424 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(359 downto 0)        <= buf_input_r(423 downto 64);
            if in_rdy = '1' then
                buf_input_r(843 downto 360)  <= data_in(483 downto 0);
                bits_in_buffer               <= 844;
            else
                bits_in_buffer               <= 360;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 425 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(360 downto 0)        <= buf_input_r(424 downto 64);
            if in_rdy = '1' then
                buf_input_r(844 downto 361)  <= data_in(483 downto 0);
                bits_in_buffer               <= 845;
            else
                bits_in_buffer               <= 361;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 426 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(361 downto 0)        <= buf_input_r(425 downto 64);
            if in_rdy = '1' then
                buf_input_r(845 downto 362)  <= data_in(483 downto 0);
                bits_in_buffer               <= 846;
            else
                bits_in_buffer               <= 362;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 427 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(362 downto 0)        <= buf_input_r(426 downto 64);
            if in_rdy = '1' then
                buf_input_r(846 downto 363)  <= data_in(483 downto 0);
                bits_in_buffer               <= 847;
            else
                bits_in_buffer               <= 363;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 428 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(363 downto 0)        <= buf_input_r(427 downto 64);
            if in_rdy = '1' then
                buf_input_r(847 downto 364)  <= data_in(483 downto 0);
                bits_in_buffer               <= 848;
            else
                bits_in_buffer               <= 364;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 429 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(364 downto 0)        <= buf_input_r(428 downto 64);
            if in_rdy = '1' then
                buf_input_r(848 downto 365)  <= data_in(483 downto 0);
                bits_in_buffer               <= 849;
            else
                bits_in_buffer               <= 365;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 430 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(365 downto 0)        <= buf_input_r(429 downto 64);
            if in_rdy = '1' then
                buf_input_r(849 downto 366)  <= data_in(483 downto 0);
                bits_in_buffer               <= 850;
            else
                bits_in_buffer               <= 366;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 431 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(366 downto 0)        <= buf_input_r(430 downto 64);
            if in_rdy = '1' then
                buf_input_r(850 downto 367)  <= data_in(483 downto 0);
                bits_in_buffer               <= 851;
            else
                bits_in_buffer               <= 367;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 432 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(367 downto 0)        <= buf_input_r(431 downto 64);
            if in_rdy = '1' then
                buf_input_r(851 downto 368)  <= data_in(483 downto 0);
                bits_in_buffer               <= 852;
            else
                bits_in_buffer               <= 368;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 433 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(368 downto 0)        <= buf_input_r(432 downto 64);
            if in_rdy = '1' then
                buf_input_r(852 downto 369)  <= data_in(483 downto 0);
                bits_in_buffer               <= 853;
            else
                bits_in_buffer               <= 369;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 434 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(369 downto 0)        <= buf_input_r(433 downto 64);
            if in_rdy = '1' then
                buf_input_r(853 downto 370)  <= data_in(483 downto 0);
                bits_in_buffer               <= 854;
            else
                bits_in_buffer               <= 370;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 435 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(370 downto 0)        <= buf_input_r(434 downto 64);
            if in_rdy = '1' then
                buf_input_r(854 downto 371)  <= data_in(483 downto 0);
                bits_in_buffer               <= 855;
            else
                bits_in_buffer               <= 371;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 436 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(371 downto 0)        <= buf_input_r(435 downto 64);
            if in_rdy = '1' then
                buf_input_r(855 downto 372)  <= data_in(483 downto 0);
                bits_in_buffer               <= 856;
            else
                bits_in_buffer               <= 372;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 437 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(372 downto 0)        <= buf_input_r(436 downto 64);
            if in_rdy = '1' then
                buf_input_r(856 downto 373)  <= data_in(483 downto 0);
                bits_in_buffer               <= 857;
            else
                bits_in_buffer               <= 373;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 438 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(373 downto 0)        <= buf_input_r(437 downto 64);
            if in_rdy = '1' then
                buf_input_r(857 downto 374)  <= data_in(483 downto 0);
                bits_in_buffer               <= 858;
            else
                bits_in_buffer               <= 374;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 439 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(374 downto 0)        <= buf_input_r(438 downto 64);
            if in_rdy = '1' then
                buf_input_r(858 downto 375)  <= data_in(483 downto 0);
                bits_in_buffer               <= 859;
            else
                bits_in_buffer               <= 375;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 440 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(375 downto 0)        <= buf_input_r(439 downto 64);
            if in_rdy = '1' then
                buf_input_r(859 downto 376)  <= data_in(483 downto 0);
                bits_in_buffer               <= 860;
            else
                bits_in_buffer               <= 376;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 441 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(376 downto 0)        <= buf_input_r(440 downto 64);
            if in_rdy = '1' then
                buf_input_r(860 downto 377)  <= data_in(483 downto 0);
                bits_in_buffer               <= 861;
            else
                bits_in_buffer               <= 377;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 442 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(377 downto 0)        <= buf_input_r(441 downto 64);
            if in_rdy = '1' then
                buf_input_r(861 downto 378)  <= data_in(483 downto 0);
                bits_in_buffer               <= 862;
            else
                bits_in_buffer               <= 378;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 443 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(378 downto 0)        <= buf_input_r(442 downto 64);
            if in_rdy = '1' then
                buf_input_r(862 downto 379)  <= data_in(483 downto 0);
                bits_in_buffer               <= 863;
            else
                bits_in_buffer               <= 379;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 444 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(379 downto 0)        <= buf_input_r(443 downto 64);
            if in_rdy = '1' then
                buf_input_r(863 downto 380)  <= data_in(483 downto 0);
                bits_in_buffer               <= 864;
            else
                bits_in_buffer               <= 380;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 445 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(380 downto 0)        <= buf_input_r(444 downto 64);
            if in_rdy = '1' then
                buf_input_r(864 downto 381)  <= data_in(483 downto 0);
                bits_in_buffer               <= 865;
            else
                bits_in_buffer               <= 381;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 446 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(381 downto 0)        <= buf_input_r(445 downto 64);
            if in_rdy = '1' then
                buf_input_r(865 downto 382)  <= data_in(483 downto 0);
                bits_in_buffer               <= 866;
            else
                bits_in_buffer               <= 382;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 447 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(382 downto 0)        <= buf_input_r(446 downto 64);
            if in_rdy = '1' then
                buf_input_r(866 downto 383)  <= data_in(483 downto 0);
                bits_in_buffer               <= 867;
            else
                bits_in_buffer               <= 383;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 448 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(383 downto 0)        <= buf_input_r(447 downto 64);
            if in_rdy = '1' then
                buf_input_r(867 downto 384)  <= data_in(483 downto 0);
                bits_in_buffer               <= 868;
            else
                bits_in_buffer               <= 384;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 449 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(384 downto 0)        <= buf_input_r(448 downto 64);
            if in_rdy = '1' then
                buf_input_r(868 downto 385)  <= data_in(483 downto 0);
                bits_in_buffer               <= 869;
            else
                bits_in_buffer               <= 385;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 450 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(385 downto 0)        <= buf_input_r(449 downto 64);
            if in_rdy = '1' then
                buf_input_r(869 downto 386)  <= data_in(483 downto 0);
                bits_in_buffer               <= 870;
            else
                bits_in_buffer               <= 386;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 451 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(386 downto 0)        <= buf_input_r(450 downto 64);
            if in_rdy = '1' then
                buf_input_r(870 downto 387)  <= data_in(483 downto 0);
                bits_in_buffer               <= 871;
            else
                bits_in_buffer               <= 387;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 452 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(387 downto 0)        <= buf_input_r(451 downto 64);
            if in_rdy = '1' then
                buf_input_r(871 downto 388)  <= data_in(483 downto 0);
                bits_in_buffer               <= 872;
            else
                bits_in_buffer               <= 388;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 453 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(388 downto 0)        <= buf_input_r(452 downto 64);
            if in_rdy = '1' then
                buf_input_r(872 downto 389)  <= data_in(483 downto 0);
                bits_in_buffer               <= 873;
            else
                bits_in_buffer               <= 389;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 454 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(389 downto 0)        <= buf_input_r(453 downto 64);
            if in_rdy = '1' then
                buf_input_r(873 downto 390)  <= data_in(483 downto 0);
                bits_in_buffer               <= 874;
            else
                bits_in_buffer               <= 390;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 455 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(390 downto 0)        <= buf_input_r(454 downto 64);
            if in_rdy = '1' then
                buf_input_r(874 downto 391)  <= data_in(483 downto 0);
                bits_in_buffer               <= 875;
            else
                bits_in_buffer               <= 391;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 456 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(391 downto 0)        <= buf_input_r(455 downto 64);
            if in_rdy = '1' then
                buf_input_r(875 downto 392)  <= data_in(483 downto 0);
                bits_in_buffer               <= 876;
            else
                bits_in_buffer               <= 392;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 457 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(392 downto 0)        <= buf_input_r(456 downto 64);
            if in_rdy = '1' then
                buf_input_r(876 downto 393)  <= data_in(483 downto 0);
                bits_in_buffer               <= 877;
            else
                bits_in_buffer               <= 393;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 458 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(393 downto 0)        <= buf_input_r(457 downto 64);
            if in_rdy = '1' then
                buf_input_r(877 downto 394)  <= data_in(483 downto 0);
                bits_in_buffer               <= 878;
            else
                bits_in_buffer               <= 394;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 459 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(394 downto 0)        <= buf_input_r(458 downto 64);
            if in_rdy = '1' then
                buf_input_r(878 downto 395)  <= data_in(483 downto 0);
                bits_in_buffer               <= 879;
            else
                bits_in_buffer               <= 395;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 460 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(395 downto 0)        <= buf_input_r(459 downto 64);
            if in_rdy = '1' then
                buf_input_r(879 downto 396)  <= data_in(483 downto 0);
                bits_in_buffer               <= 880;
            else
                bits_in_buffer               <= 396;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 461 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(396 downto 0)        <= buf_input_r(460 downto 64);
            if in_rdy = '1' then
                buf_input_r(880 downto 397)  <= data_in(483 downto 0);
                bits_in_buffer               <= 881;
            else
                bits_in_buffer               <= 397;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 462 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(397 downto 0)        <= buf_input_r(461 downto 64);
            if in_rdy = '1' then
                buf_input_r(881 downto 398)  <= data_in(483 downto 0);
                bits_in_buffer               <= 882;
            else
                bits_in_buffer               <= 398;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 463 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(398 downto 0)        <= buf_input_r(462 downto 64);
            if in_rdy = '1' then
                buf_input_r(882 downto 399)  <= data_in(483 downto 0);
                bits_in_buffer               <= 883;
            else
                bits_in_buffer               <= 399;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 464 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(399 downto 0)        <= buf_input_r(463 downto 64);
            if in_rdy = '1' then
                buf_input_r(883 downto 400)  <= data_in(483 downto 0);
                bits_in_buffer               <= 884;
            else
                bits_in_buffer               <= 400;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 465 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(400 downto 0)        <= buf_input_r(464 downto 64);
            if in_rdy = '1' then
                buf_input_r(884 downto 401)  <= data_in(483 downto 0);
                bits_in_buffer               <= 885;
            else
                bits_in_buffer               <= 401;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 466 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(401 downto 0)        <= buf_input_r(465 downto 64);
            if in_rdy = '1' then
                buf_input_r(885 downto 402)  <= data_in(483 downto 0);
                bits_in_buffer               <= 886;
            else
                bits_in_buffer               <= 402;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 467 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(402 downto 0)        <= buf_input_r(466 downto 64);
            if in_rdy = '1' then
                buf_input_r(886 downto 403)  <= data_in(483 downto 0);
                bits_in_buffer               <= 887;
            else
                bits_in_buffer               <= 403;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 468 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(403 downto 0)        <= buf_input_r(467 downto 64);
            if in_rdy = '1' then
                buf_input_r(887 downto 404)  <= data_in(483 downto 0);
                bits_in_buffer               <= 888;
            else
                bits_in_buffer               <= 404;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 469 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(404 downto 0)        <= buf_input_r(468 downto 64);
            if in_rdy = '1' then
                buf_input_r(888 downto 405)  <= data_in(483 downto 0);
                bits_in_buffer               <= 889;
            else
                bits_in_buffer               <= 405;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 470 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(405 downto 0)        <= buf_input_r(469 downto 64);
            if in_rdy = '1' then
                buf_input_r(889 downto 406)  <= data_in(483 downto 0);
                bits_in_buffer               <= 890;
            else
                bits_in_buffer               <= 406;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 471 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(406 downto 0)        <= buf_input_r(470 downto 64);
            if in_rdy = '1' then
                buf_input_r(890 downto 407)  <= data_in(483 downto 0);
                bits_in_buffer               <= 891;
            else
                bits_in_buffer               <= 407;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 472 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(407 downto 0)        <= buf_input_r(471 downto 64);
            if in_rdy = '1' then
                buf_input_r(891 downto 408)  <= data_in(483 downto 0);
                bits_in_buffer               <= 892;
            else
                bits_in_buffer               <= 408;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 473 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(408 downto 0)        <= buf_input_r(472 downto 64);
            if in_rdy = '1' then
                buf_input_r(892 downto 409)  <= data_in(483 downto 0);
                bits_in_buffer               <= 893;
            else
                bits_in_buffer               <= 409;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 474 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(409 downto 0)        <= buf_input_r(473 downto 64);
            if in_rdy = '1' then
                buf_input_r(893 downto 410)  <= data_in(483 downto 0);
                bits_in_buffer               <= 894;
            else
                bits_in_buffer               <= 410;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 475 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(410 downto 0)        <= buf_input_r(474 downto 64);
            if in_rdy = '1' then
                buf_input_r(894 downto 411)  <= data_in(483 downto 0);
                bits_in_buffer               <= 895;
            else
                bits_in_buffer               <= 411;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 476 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(411 downto 0)        <= buf_input_r(475 downto 64);
            if in_rdy = '1' then
                buf_input_r(895 downto 412)  <= data_in(483 downto 0);
                bits_in_buffer               <= 896;
            else
                bits_in_buffer               <= 412;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 477 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(412 downto 0)        <= buf_input_r(476 downto 64);
            if in_rdy = '1' then
                buf_input_r(896 downto 413)  <= data_in(483 downto 0);
                bits_in_buffer               <= 897;
            else
                bits_in_buffer               <= 413;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 478 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(413 downto 0)        <= buf_input_r(477 downto 64);
            if in_rdy = '1' then
                buf_input_r(897 downto 414)  <= data_in(483 downto 0);
                bits_in_buffer               <= 898;
            else
                bits_in_buffer               <= 414;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 479 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(414 downto 0)        <= buf_input_r(478 downto 64);
            if in_rdy = '1' then
                buf_input_r(898 downto 415)  <= data_in(483 downto 0);
                bits_in_buffer               <= 899;
            else
                bits_in_buffer               <= 415;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 480 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(415 downto 0)        <= buf_input_r(479 downto 64);
            if in_rdy = '1' then
                buf_input_r(899 downto 416)  <= data_in(483 downto 0);
                bits_in_buffer               <= 900;
            else
                bits_in_buffer               <= 416;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 481 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(416 downto 0)        <= buf_input_r(480 downto 64);
            if in_rdy = '1' then
                buf_input_r(900 downto 417)  <= data_in(483 downto 0);
                bits_in_buffer               <= 901;
            else
                bits_in_buffer               <= 417;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 482 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(417 downto 0)        <= buf_input_r(481 downto 64);
            if in_rdy = '1' then
                buf_input_r(901 downto 418)  <= data_in(483 downto 0);
                bits_in_buffer               <= 902;
            else
                bits_in_buffer               <= 418;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 483 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(418 downto 0)        <= buf_input_r(482 downto 64);
            if in_rdy = '1' then
                buf_input_r(902 downto 419)  <= data_in(483 downto 0);
                bits_in_buffer               <= 903;
            else
                bits_in_buffer               <= 419;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 484 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(419 downto 0)        <= buf_input_r(483 downto 64);
            if in_rdy = '1' then
                buf_input_r(903 downto 420)  <= data_in(483 downto 0);
                bits_in_buffer               <= 904;
            else
                bits_in_buffer               <= 420;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 485 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(420 downto 0)        <= buf_input_r(484 downto 64);
            if in_rdy = '1' then
                buf_input_r(904 downto 421)  <= data_in(483 downto 0);
                bits_in_buffer               <= 905;
            else
                bits_in_buffer               <= 421;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';


        -- For this range, congestion_out is asserted if in_rdy = '1'.
        -- Because the minimum bits_in_buffer here if in_rdy = '1', is 549. Maximum is 968.
        -- Therefore there is no space left for another input since; 549(in buffer) + 484(input) - 64(out) = 969 > 968(size).

        when 486 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(421 downto 0)        <= buf_input_r(485 downto 64);
            if in_rdy = '1' then
                buf_input_r(905 downto 422)  <= data_in(483 downto 0);
                bits_in_buffer               <= 906;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 422;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 487 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(422 downto 0)        <= buf_input_r(486 downto 64);
            if in_rdy = '1' then
                buf_input_r(906 downto 423)  <= data_in(483 downto 0);
                bits_in_buffer               <= 907;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 423;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 488 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(423 downto 0)        <= buf_input_r(487 downto 64);
            if in_rdy = '1' then
                buf_input_r(907 downto 424)  <= data_in(483 downto 0);
                bits_in_buffer               <= 908;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 424;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 489 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(424 downto 0)        <= buf_input_r(488 downto 64);
            if in_rdy = '1' then
                buf_input_r(908 downto 425)  <= data_in(483 downto 0);
                bits_in_buffer               <= 909;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 425;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 490 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(425 downto 0)        <= buf_input_r(489 downto 64);
            if in_rdy = '1' then
                buf_input_r(909 downto 426)  <= data_in(483 downto 0);
                bits_in_buffer               <= 910;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 426;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 491 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(426 downto 0)        <= buf_input_r(490 downto 64);
            if in_rdy = '1' then
                buf_input_r(910 downto 427)  <= data_in(483 downto 0);
                bits_in_buffer               <= 911;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 427;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 492 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(427 downto 0)        <= buf_input_r(491 downto 64);
            if in_rdy = '1' then
                buf_input_r(911 downto 428)  <= data_in(483 downto 0);
                bits_in_buffer               <= 912;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 428;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 493 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(428 downto 0)        <= buf_input_r(492 downto 64);
            if in_rdy = '1' then
                buf_input_r(912 downto 429)  <= data_in(483 downto 0);
                bits_in_buffer               <= 913;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 429;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 494 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(429 downto 0)        <= buf_input_r(493 downto 64);
            if in_rdy = '1' then
                buf_input_r(913 downto 430)  <= data_in(483 downto 0);
                bits_in_buffer               <= 914;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 430;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 495 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(430 downto 0)        <= buf_input_r(494 downto 64);
            if in_rdy = '1' then
                buf_input_r(914 downto 431)  <= data_in(483 downto 0);
                bits_in_buffer               <= 915;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 431;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 496 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(431 downto 0)        <= buf_input_r(495 downto 64);
            if in_rdy = '1' then
                buf_input_r(915 downto 432)  <= data_in(483 downto 0);
                bits_in_buffer               <= 916;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 432;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 497 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(432 downto 0)        <= buf_input_r(496 downto 64);
            if in_rdy = '1' then
                buf_input_r(916 downto 433)  <= data_in(483 downto 0);
                bits_in_buffer               <= 917;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 433;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 498 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(433 downto 0)        <= buf_input_r(497 downto 64);
            if in_rdy = '1' then
                buf_input_r(917 downto 434)  <= data_in(483 downto 0);
                bits_in_buffer               <= 918;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 434;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 499 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(434 downto 0)        <= buf_input_r(498 downto 64);
            if in_rdy = '1' then
                buf_input_r(918 downto 435)  <= data_in(483 downto 0);
                bits_in_buffer               <= 919;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 435;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 500 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(435 downto 0)        <= buf_input_r(499 downto 64);
            if in_rdy = '1' then
                buf_input_r(919 downto 436)  <= data_in(483 downto 0);
                bits_in_buffer               <= 920;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 436;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 501 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(436 downto 0)        <= buf_input_r(500 downto 64);
            if in_rdy = '1' then
                buf_input_r(920 downto 437)  <= data_in(483 downto 0);
                bits_in_buffer               <= 921;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 437;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 502 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(437 downto 0)        <= buf_input_r(501 downto 64);
            if in_rdy = '1' then
                buf_input_r(921 downto 438)  <= data_in(483 downto 0);
                bits_in_buffer               <= 922;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 438;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 503 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(438 downto 0)        <= buf_input_r(502 downto 64);
            if in_rdy = '1' then
                buf_input_r(922 downto 439)  <= data_in(483 downto 0);
                bits_in_buffer               <= 923;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 439;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 504 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(439 downto 0)        <= buf_input_r(503 downto 64);
            if in_rdy = '1' then
                buf_input_r(923 downto 440)  <= data_in(483 downto 0);
                bits_in_buffer               <= 924;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 440;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 505 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(440 downto 0)        <= buf_input_r(504 downto 64);
            if in_rdy = '1' then
                buf_input_r(924 downto 441)  <= data_in(483 downto 0);
                bits_in_buffer               <= 925;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 441;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 506 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(441 downto 0)        <= buf_input_r(505 downto 64);
            if in_rdy = '1' then
                buf_input_r(925 downto 442)  <= data_in(483 downto 0);
                bits_in_buffer               <= 926;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 442;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 507 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(442 downto 0)        <= buf_input_r(506 downto 64);
            if in_rdy = '1' then
                buf_input_r(926 downto 443)  <= data_in(483 downto 0);
                bits_in_buffer               <= 927;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 443;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 508 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(443 downto 0)        <= buf_input_r(507 downto 64);
            if in_rdy = '1' then
                buf_input_r(927 downto 444)  <= data_in(483 downto 0);
                bits_in_buffer               <= 928;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 444;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 509 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(444 downto 0)        <= buf_input_r(508 downto 64);
            if in_rdy = '1' then
                buf_input_r(928 downto 445)  <= data_in(483 downto 0);
                bits_in_buffer               <= 929;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 445;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 510 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(445 downto 0)        <= buf_input_r(509 downto 64);
            if in_rdy = '1' then
                buf_input_r(929 downto 446)  <= data_in(483 downto 0);
                bits_in_buffer               <= 930;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 446;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 511 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(446 downto 0)        <= buf_input_r(510 downto 64);
            if in_rdy = '1' then
                buf_input_r(930 downto 447)  <= data_in(483 downto 0);
                bits_in_buffer               <= 931;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 447;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 512 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(447 downto 0)        <= buf_input_r(511 downto 64);
            if in_rdy = '1' then
                buf_input_r(931 downto 448)  <= data_in(483 downto 0);
                bits_in_buffer               <= 932;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 448;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 513 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(448 downto 0)        <= buf_input_r(512 downto 64);
            if in_rdy = '1' then
                buf_input_r(932 downto 449)  <= data_in(483 downto 0);
                bits_in_buffer               <= 933;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 449;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 514 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(449 downto 0)        <= buf_input_r(513 downto 64);
            if in_rdy = '1' then
                buf_input_r(933 downto 450)  <= data_in(483 downto 0);
                bits_in_buffer               <= 934;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 450;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 515 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(450 downto 0)        <= buf_input_r(514 downto 64);
            if in_rdy = '1' then
                buf_input_r(934 downto 451)  <= data_in(483 downto 0);
                bits_in_buffer               <= 935;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 451;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 516 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(451 downto 0)        <= buf_input_r(515 downto 64);
            if in_rdy = '1' then
                buf_input_r(935 downto 452)  <= data_in(483 downto 0);
                bits_in_buffer               <= 936;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 452;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 517 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(452 downto 0)        <= buf_input_r(516 downto 64);
            if in_rdy = '1' then
                buf_input_r(936 downto 453)  <= data_in(483 downto 0);
                bits_in_buffer               <= 937;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 453;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 518 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(453 downto 0)        <= buf_input_r(517 downto 64);
            if in_rdy = '1' then
                buf_input_r(937 downto 454)  <= data_in(483 downto 0);
                bits_in_buffer               <= 938;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 454;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 519 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(454 downto 0)        <= buf_input_r(518 downto 64);
            if in_rdy = '1' then
                buf_input_r(938 downto 455)  <= data_in(483 downto 0);
                bits_in_buffer               <= 939;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 455;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 520 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(455 downto 0)        <= buf_input_r(519 downto 64);
            if in_rdy = '1' then
                buf_input_r(939 downto 456)  <= data_in(483 downto 0);
                bits_in_buffer               <= 940;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 456;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 521 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(456 downto 0)        <= buf_input_r(520 downto 64);
            if in_rdy = '1' then
                buf_input_r(940 downto 457)  <= data_in(483 downto 0);
                bits_in_buffer               <= 941;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 457;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 522 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(457 downto 0)        <= buf_input_r(521 downto 64);
            if in_rdy = '1' then
                buf_input_r(941 downto 458)  <= data_in(483 downto 0);
                bits_in_buffer               <= 942;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 458;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 523 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(458 downto 0)        <= buf_input_r(522 downto 64);
            if in_rdy = '1' then
                buf_input_r(942 downto 459)  <= data_in(483 downto 0);
                bits_in_buffer               <= 943;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 459;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 524 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(459 downto 0)        <= buf_input_r(523 downto 64);
            if in_rdy = '1' then
                buf_input_r(943 downto 460)  <= data_in(483 downto 0);
                bits_in_buffer               <= 944;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 460;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 525 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(460 downto 0)        <= buf_input_r(524 downto 64);
            if in_rdy = '1' then
                buf_input_r(944 downto 461)  <= data_in(483 downto 0);
                bits_in_buffer               <= 945;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 461;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 526 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(461 downto 0)        <= buf_input_r(525 downto 64);
            if in_rdy = '1' then
                buf_input_r(945 downto 462)  <= data_in(483 downto 0);
                bits_in_buffer               <= 946;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 462;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 527 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(462 downto 0)        <= buf_input_r(526 downto 64);
            if in_rdy = '1' then
                buf_input_r(946 downto 463)  <= data_in(483 downto 0);
                bits_in_buffer               <= 947;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 463;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 528 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(463 downto 0)        <= buf_input_r(527 downto 64);
            if in_rdy = '1' then
                buf_input_r(947 downto 464)  <= data_in(483 downto 0);
                bits_in_buffer               <= 948;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 464;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 529 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(464 downto 0)        <= buf_input_r(528 downto 64);
            if in_rdy = '1' then
                buf_input_r(948 downto 465)  <= data_in(483 downto 0);
                bits_in_buffer               <= 949;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 465;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 530 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(465 downto 0)        <= buf_input_r(529 downto 64);
            if in_rdy = '1' then
                buf_input_r(949 downto 466)  <= data_in(483 downto 0);
                bits_in_buffer               <= 950;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 466;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 531 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(466 downto 0)        <= buf_input_r(530 downto 64);
            if in_rdy = '1' then
                buf_input_r(950 downto 467)  <= data_in(483 downto 0);
                bits_in_buffer               <= 951;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 467;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 532 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(467 downto 0)        <= buf_input_r(531 downto 64);
            if in_rdy = '1' then
                buf_input_r(951 downto 468)  <= data_in(483 downto 0);
                bits_in_buffer               <= 952;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 468;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 533 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(468 downto 0)        <= buf_input_r(532 downto 64);
            if in_rdy = '1' then
                buf_input_r(952 downto 469)  <= data_in(483 downto 0);
                bits_in_buffer               <= 953;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 469;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 534 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(469 downto 0)        <= buf_input_r(533 downto 64);
            if in_rdy = '1' then
                buf_input_r(953 downto 470)  <= data_in(483 downto 0);
                bits_in_buffer               <= 954;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 470;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 535 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(470 downto 0)        <= buf_input_r(534 downto 64);
            if in_rdy = '1' then
                buf_input_r(954 downto 471)  <= data_in(483 downto 0);
                bits_in_buffer               <= 955;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 471;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 536 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(471 downto 0)        <= buf_input_r(535 downto 64);
            if in_rdy = '1' then
                buf_input_r(955 downto 472)  <= data_in(483 downto 0);
                bits_in_buffer               <= 956;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 472;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 537 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(472 downto 0)        <= buf_input_r(536 downto 64);
            if in_rdy = '1' then
                buf_input_r(956 downto 473)  <= data_in(483 downto 0);
                bits_in_buffer               <= 957;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 473;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 538 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(473 downto 0)        <= buf_input_r(537 downto 64);
            if in_rdy = '1' then
                buf_input_r(957 downto 474)  <= data_in(483 downto 0);
                bits_in_buffer               <= 958;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 474;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 539 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(474 downto 0)        <= buf_input_r(538 downto 64);
            if in_rdy = '1' then
                buf_input_r(958 downto 475)  <= data_in(483 downto 0);
                bits_in_buffer               <= 959;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 475;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 540 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(475 downto 0)        <= buf_input_r(539 downto 64);
            if in_rdy = '1' then
                buf_input_r(959 downto 476)  <= data_in(483 downto 0);
                bits_in_buffer               <= 960;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 476;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 541 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(476 downto 0)        <= buf_input_r(540 downto 64);
            if in_rdy = '1' then
                buf_input_r(960 downto 477)  <= data_in(483 downto 0);
                bits_in_buffer               <= 961;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 477;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 542 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(477 downto 0)        <= buf_input_r(541 downto 64);
            if in_rdy = '1' then
                buf_input_r(961 downto 478)  <= data_in(483 downto 0);
                bits_in_buffer               <= 962;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 478;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 543 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(478 downto 0)        <= buf_input_r(542 downto 64);
            if in_rdy = '1' then
                buf_input_r(962 downto 479)  <= data_in(483 downto 0);
                bits_in_buffer               <= 963;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 479;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 544 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(479 downto 0)        <= buf_input_r(543 downto 64);
            if in_rdy = '1' then
                buf_input_r(963 downto 480)  <= data_in(483 downto 0);
                bits_in_buffer               <= 964;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 480;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 545 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(480 downto 0)        <= buf_input_r(544 downto 64);
            if in_rdy = '1' then
                buf_input_r(964 downto 481)  <= data_in(483 downto 0);
                bits_in_buffer               <= 965;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 481;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 546 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(481 downto 0)        <= buf_input_r(545 downto 64);
            if in_rdy = '1' then
                buf_input_r(965 downto 482)  <= data_in(483 downto 0);
                bits_in_buffer               <= 966;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 482;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 547 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(482 downto 0)        <= buf_input_r(546 downto 64);
            if in_rdy = '1' then
                buf_input_r(966 downto 483)  <= data_in(483 downto 0);
                bits_in_buffer               <= 967;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 483;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 548 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(483 downto 0)        <= buf_input_r(547 downto 64);
            if in_rdy = '1' then
                buf_input_r(967 downto 484)  <= data_in(483 downto 0);
                bits_in_buffer               <= 968;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 484;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';


        -- For this range, the buffer contains to many bits to receieve another input.
        -- That is why the congestion_out was asserted high in the previous range, and set low here.

        when 549 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(484 downto 0)    <= buf_input_r(548 downto 64);
            bits_in_buffer               <= 485;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 550 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(485 downto 0)    <= buf_input_r(549 downto 64);
            bits_in_buffer               <= 486;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 551 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(486 downto 0)    <= buf_input_r(550 downto 64);
            bits_in_buffer               <= 487;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 552 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(487 downto 0)    <= buf_input_r(551 downto 64);
            bits_in_buffer               <= 488;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 553 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(488 downto 0)    <= buf_input_r(552 downto 64);
            bits_in_buffer               <= 489;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 554 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(489 downto 0)    <= buf_input_r(553 downto 64);
            bits_in_buffer               <= 490;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 555 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(490 downto 0)    <= buf_input_r(554 downto 64);
            bits_in_buffer               <= 491;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 556 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(491 downto 0)    <= buf_input_r(555 downto 64);
            bits_in_buffer               <= 492;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 557 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(492 downto 0)    <= buf_input_r(556 downto 64);
            bits_in_buffer               <= 493;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 558 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(493 downto 0)    <= buf_input_r(557 downto 64);
            bits_in_buffer               <= 494;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 559 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(494 downto 0)    <= buf_input_r(558 downto 64);
            bits_in_buffer               <= 495;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 560 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(495 downto 0)    <= buf_input_r(559 downto 64);
            bits_in_buffer               <= 496;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 561 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(496 downto 0)    <= buf_input_r(560 downto 64);
            bits_in_buffer               <= 497;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 562 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(497 downto 0)    <= buf_input_r(561 downto 64);
            bits_in_buffer               <= 498;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 563 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(498 downto 0)    <= buf_input_r(562 downto 64);
            bits_in_buffer               <= 499;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 564 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(499 downto 0)    <= buf_input_r(563 downto 64);
            bits_in_buffer               <= 500;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 565 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(500 downto 0)    <= buf_input_r(564 downto 64);
            bits_in_buffer               <= 501;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 566 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(501 downto 0)    <= buf_input_r(565 downto 64);
            bits_in_buffer               <= 502;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 567 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(502 downto 0)    <= buf_input_r(566 downto 64);
            bits_in_buffer               <= 503;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 568 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(503 downto 0)    <= buf_input_r(567 downto 64);
            bits_in_buffer               <= 504;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 569 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(504 downto 0)    <= buf_input_r(568 downto 64);
            bits_in_buffer               <= 505;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 570 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(505 downto 0)    <= buf_input_r(569 downto 64);
            bits_in_buffer               <= 506;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 571 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(506 downto 0)    <= buf_input_r(570 downto 64);
            bits_in_buffer               <= 507;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 572 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(507 downto 0)    <= buf_input_r(571 downto 64);
            bits_in_buffer               <= 508;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 573 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(508 downto 0)    <= buf_input_r(572 downto 64);
            bits_in_buffer               <= 509;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 574 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(509 downto 0)    <= buf_input_r(573 downto 64);
            bits_in_buffer               <= 510;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 575 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(510 downto 0)    <= buf_input_r(574 downto 64);
            bits_in_buffer               <= 511;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 576 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(511 downto 0)    <= buf_input_r(575 downto 64);
            bits_in_buffer               <= 512;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 577 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(512 downto 0)    <= buf_input_r(576 downto 64);
            bits_in_buffer               <= 513;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 578 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(513 downto 0)    <= buf_input_r(577 downto 64);
            bits_in_buffer               <= 514;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 579 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(514 downto 0)    <= buf_input_r(578 downto 64);
            bits_in_buffer               <= 515;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 580 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(515 downto 0)    <= buf_input_r(579 downto 64);
            bits_in_buffer               <= 516;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 581 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(516 downto 0)    <= buf_input_r(580 downto 64);
            bits_in_buffer               <= 517;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 582 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(517 downto 0)    <= buf_input_r(581 downto 64);
            bits_in_buffer               <= 518;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 583 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(518 downto 0)    <= buf_input_r(582 downto 64);
            bits_in_buffer               <= 519;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 584 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(519 downto 0)    <= buf_input_r(583 downto 64);
            bits_in_buffer               <= 520;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 585 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(520 downto 0)    <= buf_input_r(584 downto 64);
            bits_in_buffer               <= 521;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 586 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(521 downto 0)    <= buf_input_r(585 downto 64);
            bits_in_buffer               <= 522;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 587 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(522 downto 0)    <= buf_input_r(586 downto 64);
            bits_in_buffer               <= 523;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 588 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(523 downto 0)    <= buf_input_r(587 downto 64);
            bits_in_buffer               <= 524;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 589 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(524 downto 0)    <= buf_input_r(588 downto 64);
            bits_in_buffer               <= 525;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 590 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(525 downto 0)    <= buf_input_r(589 downto 64);
            bits_in_buffer               <= 526;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 591 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(526 downto 0)    <= buf_input_r(590 downto 64);
            bits_in_buffer               <= 527;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 592 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(527 downto 0)    <= buf_input_r(591 downto 64);
            bits_in_buffer               <= 528;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 593 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(528 downto 0)    <= buf_input_r(592 downto 64);
            bits_in_buffer               <= 529;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 594 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(529 downto 0)    <= buf_input_r(593 downto 64);
            bits_in_buffer               <= 530;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 595 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(530 downto 0)    <= buf_input_r(594 downto 64);
            bits_in_buffer               <= 531;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 596 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(531 downto 0)    <= buf_input_r(595 downto 64);
            bits_in_buffer               <= 532;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 597 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(532 downto 0)    <= buf_input_r(596 downto 64);
            bits_in_buffer               <= 533;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 598 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(533 downto 0)    <= buf_input_r(597 downto 64);
            bits_in_buffer               <= 534;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 599 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(534 downto 0)    <= buf_input_r(598 downto 64);
            bits_in_buffer               <= 535;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 600 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(535 downto 0)    <= buf_input_r(599 downto 64);
            bits_in_buffer               <= 536;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 601 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(536 downto 0)    <= buf_input_r(600 downto 64);
            bits_in_buffer               <= 537;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 602 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(537 downto 0)    <= buf_input_r(601 downto 64);
            bits_in_buffer               <= 538;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 603 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(538 downto 0)    <= buf_input_r(602 downto 64);
            bits_in_buffer               <= 539;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 604 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(539 downto 0)    <= buf_input_r(603 downto 64);
            bits_in_buffer               <= 540;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 605 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(540 downto 0)    <= buf_input_r(604 downto 64);
            bits_in_buffer               <= 541;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 606 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(541 downto 0)    <= buf_input_r(605 downto 64);
            bits_in_buffer               <= 542;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 607 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(542 downto 0)    <= buf_input_r(606 downto 64);
            bits_in_buffer               <= 543;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 608 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(543 downto 0)    <= buf_input_r(607 downto 64);
            bits_in_buffer               <= 544;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 609 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(544 downto 0)    <= buf_input_r(608 downto 64);
            bits_in_buffer               <= 545;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 610 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(545 downto 0)    <= buf_input_r(609 downto 64);
            bits_in_buffer               <= 546;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 611 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(546 downto 0)    <= buf_input_r(610 downto 64);
            bits_in_buffer               <= 547;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 612 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(547 downto 0)    <= buf_input_r(611 downto 64);
            bits_in_buffer               <= 548;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 613 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(548 downto 0)    <= buf_input_r(612 downto 64);
            bits_in_buffer               <= 549;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 614 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(549 downto 0)    <= buf_input_r(613 downto 64);
            bits_in_buffer               <= 550;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 615 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(550 downto 0)    <= buf_input_r(614 downto 64);
            bits_in_buffer               <= 551;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 616 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(551 downto 0)    <= buf_input_r(615 downto 64);
            bits_in_buffer               <= 552;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 617 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(552 downto 0)    <= buf_input_r(616 downto 64);
            bits_in_buffer               <= 553;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 618 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(553 downto 0)    <= buf_input_r(617 downto 64);
            bits_in_buffer               <= 554;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 619 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(554 downto 0)    <= buf_input_r(618 downto 64);
            bits_in_buffer               <= 555;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 620 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(555 downto 0)    <= buf_input_r(619 downto 64);
            bits_in_buffer               <= 556;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 621 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(556 downto 0)    <= buf_input_r(620 downto 64);
            bits_in_buffer               <= 557;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 622 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(557 downto 0)    <= buf_input_r(621 downto 64);
            bits_in_buffer               <= 558;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 623 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(558 downto 0)    <= buf_input_r(622 downto 64);
            bits_in_buffer               <= 559;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 624 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(559 downto 0)    <= buf_input_r(623 downto 64);
            bits_in_buffer               <= 560;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 625 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(560 downto 0)    <= buf_input_r(624 downto 64);
            bits_in_buffer               <= 561;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 626 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(561 downto 0)    <= buf_input_r(625 downto 64);
            bits_in_buffer               <= 562;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 627 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(562 downto 0)    <= buf_input_r(626 downto 64);
            bits_in_buffer               <= 563;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 628 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(563 downto 0)    <= buf_input_r(627 downto 64);
            bits_in_buffer               <= 564;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 629 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(564 downto 0)    <= buf_input_r(628 downto 64);
            bits_in_buffer               <= 565;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 630 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(565 downto 0)    <= buf_input_r(629 downto 64);
            bits_in_buffer               <= 566;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 631 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(566 downto 0)    <= buf_input_r(630 downto 64);
            bits_in_buffer               <= 567;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 632 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(567 downto 0)    <= buf_input_r(631 downto 64);
            bits_in_buffer               <= 568;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 633 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(568 downto 0)    <= buf_input_r(632 downto 64);
            bits_in_buffer               <= 569;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 634 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(569 downto 0)    <= buf_input_r(633 downto 64);
            bits_in_buffer               <= 570;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 635 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(570 downto 0)    <= buf_input_r(634 downto 64);
            bits_in_buffer               <= 571;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 636 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(571 downto 0)    <= buf_input_r(635 downto 64);
            bits_in_buffer               <= 572;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 637 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(572 downto 0)    <= buf_input_r(636 downto 64);
            bits_in_buffer               <= 573;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 638 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(573 downto 0)    <= buf_input_r(637 downto 64);
            bits_in_buffer               <= 574;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 639 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(574 downto 0)    <= buf_input_r(638 downto 64);
            bits_in_buffer               <= 575;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 640 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(575 downto 0)    <= buf_input_r(639 downto 64);
            bits_in_buffer               <= 576;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 641 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(576 downto 0)    <= buf_input_r(640 downto 64);
            bits_in_buffer               <= 577;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 642 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(577 downto 0)    <= buf_input_r(641 downto 64);
            bits_in_buffer               <= 578;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 643 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(578 downto 0)    <= buf_input_r(642 downto 64);
            bits_in_buffer               <= 579;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 644 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(579 downto 0)    <= buf_input_r(643 downto 64);
            bits_in_buffer               <= 580;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 645 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(580 downto 0)    <= buf_input_r(644 downto 64);
            bits_in_buffer               <= 581;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 646 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(581 downto 0)    <= buf_input_r(645 downto 64);
            bits_in_buffer               <= 582;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 647 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(582 downto 0)    <= buf_input_r(646 downto 64);
            bits_in_buffer               <= 583;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 648 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(583 downto 0)    <= buf_input_r(647 downto 64);
            bits_in_buffer               <= 584;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 649 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(584 downto 0)    <= buf_input_r(648 downto 64);
            bits_in_buffer               <= 585;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 650 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(585 downto 0)    <= buf_input_r(649 downto 64);
            bits_in_buffer               <= 586;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 651 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(586 downto 0)    <= buf_input_r(650 downto 64);
            bits_in_buffer               <= 587;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 652 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(587 downto 0)    <= buf_input_r(651 downto 64);
            bits_in_buffer               <= 588;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 653 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(588 downto 0)    <= buf_input_r(652 downto 64);
            bits_in_buffer               <= 589;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 654 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(589 downto 0)    <= buf_input_r(653 downto 64);
            bits_in_buffer               <= 590;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 655 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(590 downto 0)    <= buf_input_r(654 downto 64);
            bits_in_buffer               <= 591;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 656 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(591 downto 0)    <= buf_input_r(655 downto 64);
            bits_in_buffer               <= 592;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 657 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(592 downto 0)    <= buf_input_r(656 downto 64);
            bits_in_buffer               <= 593;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 658 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(593 downto 0)    <= buf_input_r(657 downto 64);
            bits_in_buffer               <= 594;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 659 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(594 downto 0)    <= buf_input_r(658 downto 64);
            bits_in_buffer               <= 595;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 660 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(595 downto 0)    <= buf_input_r(659 downto 64);
            bits_in_buffer               <= 596;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 661 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(596 downto 0)    <= buf_input_r(660 downto 64);
            bits_in_buffer               <= 597;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 662 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(597 downto 0)    <= buf_input_r(661 downto 64);
            bits_in_buffer               <= 598;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 663 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(598 downto 0)    <= buf_input_r(662 downto 64);
            bits_in_buffer               <= 599;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 664 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(599 downto 0)    <= buf_input_r(663 downto 64);
            bits_in_buffer               <= 600;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 665 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(600 downto 0)    <= buf_input_r(664 downto 64);
            bits_in_buffer               <= 601;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 666 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(601 downto 0)    <= buf_input_r(665 downto 64);
            bits_in_buffer               <= 602;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 667 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(602 downto 0)    <= buf_input_r(666 downto 64);
            bits_in_buffer               <= 603;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 668 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(603 downto 0)    <= buf_input_r(667 downto 64);
            bits_in_buffer               <= 604;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 669 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(604 downto 0)    <= buf_input_r(668 downto 64);
            bits_in_buffer               <= 605;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 670 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(605 downto 0)    <= buf_input_r(669 downto 64);
            bits_in_buffer               <= 606;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 671 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(606 downto 0)    <= buf_input_r(670 downto 64);
            bits_in_buffer               <= 607;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 672 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(607 downto 0)    <= buf_input_r(671 downto 64);
            bits_in_buffer               <= 608;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 673 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(608 downto 0)    <= buf_input_r(672 downto 64);
            bits_in_buffer               <= 609;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 674 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(609 downto 0)    <= buf_input_r(673 downto 64);
            bits_in_buffer               <= 610;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 675 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(610 downto 0)    <= buf_input_r(674 downto 64);
            bits_in_buffer               <= 611;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 676 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(611 downto 0)    <= buf_input_r(675 downto 64);
            bits_in_buffer               <= 612;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 677 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(612 downto 0)    <= buf_input_r(676 downto 64);
            bits_in_buffer               <= 613;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 678 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(613 downto 0)    <= buf_input_r(677 downto 64);
            bits_in_buffer               <= 614;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 679 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(614 downto 0)    <= buf_input_r(678 downto 64);
            bits_in_buffer               <= 615;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 680 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(615 downto 0)    <= buf_input_r(679 downto 64);
            bits_in_buffer               <= 616;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 681 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(616 downto 0)    <= buf_input_r(680 downto 64);
            bits_in_buffer               <= 617;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 682 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(617 downto 0)    <= buf_input_r(681 downto 64);
            bits_in_buffer               <= 618;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 683 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(618 downto 0)    <= buf_input_r(682 downto 64);
            bits_in_buffer               <= 619;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 684 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(619 downto 0)    <= buf_input_r(683 downto 64);
            bits_in_buffer               <= 620;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 685 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(620 downto 0)    <= buf_input_r(684 downto 64);
            bits_in_buffer               <= 621;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 686 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(621 downto 0)    <= buf_input_r(685 downto 64);
            bits_in_buffer               <= 622;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 687 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(622 downto 0)    <= buf_input_r(686 downto 64);
            bits_in_buffer               <= 623;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 688 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(623 downto 0)    <= buf_input_r(687 downto 64);
            bits_in_buffer               <= 624;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 689 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(624 downto 0)    <= buf_input_r(688 downto 64);
            bits_in_buffer               <= 625;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 690 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(625 downto 0)    <= buf_input_r(689 downto 64);
            bits_in_buffer               <= 626;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 691 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(626 downto 0)    <= buf_input_r(690 downto 64);
            bits_in_buffer               <= 627;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 692 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(627 downto 0)    <= buf_input_r(691 downto 64);
            bits_in_buffer               <= 628;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 693 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(628 downto 0)    <= buf_input_r(692 downto 64);
            bits_in_buffer               <= 629;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 694 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(629 downto 0)    <= buf_input_r(693 downto 64);
            bits_in_buffer               <= 630;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 695 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(630 downto 0)    <= buf_input_r(694 downto 64);
            bits_in_buffer               <= 631;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 696 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(631 downto 0)    <= buf_input_r(695 downto 64);
            bits_in_buffer               <= 632;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 697 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(632 downto 0)    <= buf_input_r(696 downto 64);
            bits_in_buffer               <= 633;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 698 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(633 downto 0)    <= buf_input_r(697 downto 64);
            bits_in_buffer               <= 634;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 699 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(634 downto 0)    <= buf_input_r(698 downto 64);
            bits_in_buffer               <= 635;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 700 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(635 downto 0)    <= buf_input_r(699 downto 64);
            bits_in_buffer               <= 636;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 701 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(636 downto 0)    <= buf_input_r(700 downto 64);
            bits_in_buffer               <= 637;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 702 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(637 downto 0)    <= buf_input_r(701 downto 64);
            bits_in_buffer               <= 638;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 703 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(638 downto 0)    <= buf_input_r(702 downto 64);
            bits_in_buffer               <= 639;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 704 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(639 downto 0)    <= buf_input_r(703 downto 64);
            bits_in_buffer               <= 640;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 705 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(640 downto 0)    <= buf_input_r(704 downto 64);
            bits_in_buffer               <= 641;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 706 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(641 downto 0)    <= buf_input_r(705 downto 64);
            bits_in_buffer               <= 642;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 707 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(642 downto 0)    <= buf_input_r(706 downto 64);
            bits_in_buffer               <= 643;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 708 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(643 downto 0)    <= buf_input_r(707 downto 64);
            bits_in_buffer               <= 644;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 709 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(644 downto 0)    <= buf_input_r(708 downto 64);
            bits_in_buffer               <= 645;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 710 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(645 downto 0)    <= buf_input_r(709 downto 64);
            bits_in_buffer               <= 646;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 711 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(646 downto 0)    <= buf_input_r(710 downto 64);
            bits_in_buffer               <= 647;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 712 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(647 downto 0)    <= buf_input_r(711 downto 64);
            bits_in_buffer               <= 648;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 713 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(648 downto 0)    <= buf_input_r(712 downto 64);
            bits_in_buffer               <= 649;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 714 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(649 downto 0)    <= buf_input_r(713 downto 64);
            bits_in_buffer               <= 650;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 715 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(650 downto 0)    <= buf_input_r(714 downto 64);
            bits_in_buffer               <= 651;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 716 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(651 downto 0)    <= buf_input_r(715 downto 64);
            bits_in_buffer               <= 652;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 717 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(652 downto 0)    <= buf_input_r(716 downto 64);
            bits_in_buffer               <= 653;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 718 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(653 downto 0)    <= buf_input_r(717 downto 64);
            bits_in_buffer               <= 654;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 719 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(654 downto 0)    <= buf_input_r(718 downto 64);
            bits_in_buffer               <= 655;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 720 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(655 downto 0)    <= buf_input_r(719 downto 64);
            bits_in_buffer               <= 656;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 721 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(656 downto 0)    <= buf_input_r(720 downto 64);
            bits_in_buffer               <= 657;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 722 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(657 downto 0)    <= buf_input_r(721 downto 64);
            bits_in_buffer               <= 658;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 723 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(658 downto 0)    <= buf_input_r(722 downto 64);
            bits_in_buffer               <= 659;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 724 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(659 downto 0)    <= buf_input_r(723 downto 64);
            bits_in_buffer               <= 660;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 725 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(660 downto 0)    <= buf_input_r(724 downto 64);
            bits_in_buffer               <= 661;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 726 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(661 downto 0)    <= buf_input_r(725 downto 64);
            bits_in_buffer               <= 662;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 727 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(662 downto 0)    <= buf_input_r(726 downto 64);
            bits_in_buffer               <= 663;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 728 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(663 downto 0)    <= buf_input_r(727 downto 64);
            bits_in_buffer               <= 664;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 729 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(664 downto 0)    <= buf_input_r(728 downto 64);
            bits_in_buffer               <= 665;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 730 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(665 downto 0)    <= buf_input_r(729 downto 64);
            bits_in_buffer               <= 666;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 731 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(666 downto 0)    <= buf_input_r(730 downto 64);
            bits_in_buffer               <= 667;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 732 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(667 downto 0)    <= buf_input_r(731 downto 64);
            bits_in_buffer               <= 668;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 733 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(668 downto 0)    <= buf_input_r(732 downto 64);
            bits_in_buffer               <= 669;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 734 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(669 downto 0)    <= buf_input_r(733 downto 64);
            bits_in_buffer               <= 670;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 735 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(670 downto 0)    <= buf_input_r(734 downto 64);
            bits_in_buffer               <= 671;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 736 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(671 downto 0)    <= buf_input_r(735 downto 64);
            bits_in_buffer               <= 672;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 737 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(672 downto 0)    <= buf_input_r(736 downto 64);
            bits_in_buffer               <= 673;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 738 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(673 downto 0)    <= buf_input_r(737 downto 64);
            bits_in_buffer               <= 674;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 739 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(674 downto 0)    <= buf_input_r(738 downto 64);
            bits_in_buffer               <= 675;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 740 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(675 downto 0)    <= buf_input_r(739 downto 64);
            bits_in_buffer               <= 676;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 741 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(676 downto 0)    <= buf_input_r(740 downto 64);
            bits_in_buffer               <= 677;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 742 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(677 downto 0)    <= buf_input_r(741 downto 64);
            bits_in_buffer               <= 678;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 743 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(678 downto 0)    <= buf_input_r(742 downto 64);
            bits_in_buffer               <= 679;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 744 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(679 downto 0)    <= buf_input_r(743 downto 64);
            bits_in_buffer               <= 680;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 745 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(680 downto 0)    <= buf_input_r(744 downto 64);
            bits_in_buffer               <= 681;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 746 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(681 downto 0)    <= buf_input_r(745 downto 64);
            bits_in_buffer               <= 682;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 747 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(682 downto 0)    <= buf_input_r(746 downto 64);
            bits_in_buffer               <= 683;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 748 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(683 downto 0)    <= buf_input_r(747 downto 64);
            bits_in_buffer               <= 684;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 749 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(684 downto 0)    <= buf_input_r(748 downto 64);
            bits_in_buffer               <= 685;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 750 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(685 downto 0)    <= buf_input_r(749 downto 64);
            bits_in_buffer               <= 686;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 751 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(686 downto 0)    <= buf_input_r(750 downto 64);
            bits_in_buffer               <= 687;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 752 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(687 downto 0)    <= buf_input_r(751 downto 64);
            bits_in_buffer               <= 688;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 753 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(688 downto 0)    <= buf_input_r(752 downto 64);
            bits_in_buffer               <= 689;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 754 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(689 downto 0)    <= buf_input_r(753 downto 64);
            bits_in_buffer               <= 690;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 755 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(690 downto 0)    <= buf_input_r(754 downto 64);
            bits_in_buffer               <= 691;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 756 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(691 downto 0)    <= buf_input_r(755 downto 64);
            bits_in_buffer               <= 692;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 757 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(692 downto 0)    <= buf_input_r(756 downto 64);
            bits_in_buffer               <= 693;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 758 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(693 downto 0)    <= buf_input_r(757 downto 64);
            bits_in_buffer               <= 694;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 759 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(694 downto 0)    <= buf_input_r(758 downto 64);
            bits_in_buffer               <= 695;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 760 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(695 downto 0)    <= buf_input_r(759 downto 64);
            bits_in_buffer               <= 696;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 761 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(696 downto 0)    <= buf_input_r(760 downto 64);
            bits_in_buffer               <= 697;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 762 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(697 downto 0)    <= buf_input_r(761 downto 64);
            bits_in_buffer               <= 698;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 763 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(698 downto 0)    <= buf_input_r(762 downto 64);
            bits_in_buffer               <= 699;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 764 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(699 downto 0)    <= buf_input_r(763 downto 64);
            bits_in_buffer               <= 700;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 765 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(700 downto 0)    <= buf_input_r(764 downto 64);
            bits_in_buffer               <= 701;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 766 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(701 downto 0)    <= buf_input_r(765 downto 64);
            bits_in_buffer               <= 702;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 767 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(702 downto 0)    <= buf_input_r(766 downto 64);
            bits_in_buffer               <= 703;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 768 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(703 downto 0)    <= buf_input_r(767 downto 64);
            bits_in_buffer               <= 704;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 769 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(704 downto 0)    <= buf_input_r(768 downto 64);
            bits_in_buffer               <= 705;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 770 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(705 downto 0)    <= buf_input_r(769 downto 64);
            bits_in_buffer               <= 706;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 771 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(706 downto 0)    <= buf_input_r(770 downto 64);
            bits_in_buffer               <= 707;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 772 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(707 downto 0)    <= buf_input_r(771 downto 64);
            bits_in_buffer               <= 708;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 773 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(708 downto 0)    <= buf_input_r(772 downto 64);
            bits_in_buffer               <= 709;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 774 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(709 downto 0)    <= buf_input_r(773 downto 64);
            bits_in_buffer               <= 710;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 775 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(710 downto 0)    <= buf_input_r(774 downto 64);
            bits_in_buffer               <= 711;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 776 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(711 downto 0)    <= buf_input_r(775 downto 64);
            bits_in_buffer               <= 712;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 777 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(712 downto 0)    <= buf_input_r(776 downto 64);
            bits_in_buffer               <= 713;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 778 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(713 downto 0)    <= buf_input_r(777 downto 64);
            bits_in_buffer               <= 714;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 779 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(714 downto 0)    <= buf_input_r(778 downto 64);
            bits_in_buffer               <= 715;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 780 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(715 downto 0)    <= buf_input_r(779 downto 64);
            bits_in_buffer               <= 716;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 781 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(716 downto 0)    <= buf_input_r(780 downto 64);
            bits_in_buffer               <= 717;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 782 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(717 downto 0)    <= buf_input_r(781 downto 64);
            bits_in_buffer               <= 718;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 783 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(718 downto 0)    <= buf_input_r(782 downto 64);
            bits_in_buffer               <= 719;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 784 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(719 downto 0)    <= buf_input_r(783 downto 64);
            bits_in_buffer               <= 720;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 785 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(720 downto 0)    <= buf_input_r(784 downto 64);
            bits_in_buffer               <= 721;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 786 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(721 downto 0)    <= buf_input_r(785 downto 64);
            bits_in_buffer               <= 722;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 787 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(722 downto 0)    <= buf_input_r(786 downto 64);
            bits_in_buffer               <= 723;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 788 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(723 downto 0)    <= buf_input_r(787 downto 64);
            bits_in_buffer               <= 724;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 789 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(724 downto 0)    <= buf_input_r(788 downto 64);
            bits_in_buffer               <= 725;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 790 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(725 downto 0)    <= buf_input_r(789 downto 64);
            bits_in_buffer               <= 726;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 791 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(726 downto 0)    <= buf_input_r(790 downto 64);
            bits_in_buffer               <= 727;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 792 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(727 downto 0)    <= buf_input_r(791 downto 64);
            bits_in_buffer               <= 728;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 793 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(728 downto 0)    <= buf_input_r(792 downto 64);
            bits_in_buffer               <= 729;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 794 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(729 downto 0)    <= buf_input_r(793 downto 64);
            bits_in_buffer               <= 730;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 795 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(730 downto 0)    <= buf_input_r(794 downto 64);
            bits_in_buffer               <= 731;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 796 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(731 downto 0)    <= buf_input_r(795 downto 64);
            bits_in_buffer               <= 732;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 797 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(732 downto 0)    <= buf_input_r(796 downto 64);
            bits_in_buffer               <= 733;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 798 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(733 downto 0)    <= buf_input_r(797 downto 64);
            bits_in_buffer               <= 734;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 799 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(734 downto 0)    <= buf_input_r(798 downto 64);
            bits_in_buffer               <= 735;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 800 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(735 downto 0)    <= buf_input_r(799 downto 64);
            bits_in_buffer               <= 736;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 801 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(736 downto 0)    <= buf_input_r(800 downto 64);
            bits_in_buffer               <= 737;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 802 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(737 downto 0)    <= buf_input_r(801 downto 64);
            bits_in_buffer               <= 738;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 803 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(738 downto 0)    <= buf_input_r(802 downto 64);
            bits_in_buffer               <= 739;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 804 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(739 downto 0)    <= buf_input_r(803 downto 64);
            bits_in_buffer               <= 740;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 805 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(740 downto 0)    <= buf_input_r(804 downto 64);
            bits_in_buffer               <= 741;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 806 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(741 downto 0)    <= buf_input_r(805 downto 64);
            bits_in_buffer               <= 742;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 807 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(742 downto 0)    <= buf_input_r(806 downto 64);
            bits_in_buffer               <= 743;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 808 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(743 downto 0)    <= buf_input_r(807 downto 64);
            bits_in_buffer               <= 744;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 809 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(744 downto 0)    <= buf_input_r(808 downto 64);
            bits_in_buffer               <= 745;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 810 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(745 downto 0)    <= buf_input_r(809 downto 64);
            bits_in_buffer               <= 746;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 811 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(746 downto 0)    <= buf_input_r(810 downto 64);
            bits_in_buffer               <= 747;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 812 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(747 downto 0)    <= buf_input_r(811 downto 64);
            bits_in_buffer               <= 748;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 813 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(748 downto 0)    <= buf_input_r(812 downto 64);
            bits_in_buffer               <= 749;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 814 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(749 downto 0)    <= buf_input_r(813 downto 64);
            bits_in_buffer               <= 750;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 815 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(750 downto 0)    <= buf_input_r(814 downto 64);
            bits_in_buffer               <= 751;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 816 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(751 downto 0)    <= buf_input_r(815 downto 64);
            bits_in_buffer               <= 752;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 817 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(752 downto 0)    <= buf_input_r(816 downto 64);
            bits_in_buffer               <= 753;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 818 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(753 downto 0)    <= buf_input_r(817 downto 64);
            bits_in_buffer               <= 754;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 819 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(754 downto 0)    <= buf_input_r(818 downto 64);
            bits_in_buffer               <= 755;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 820 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(755 downto 0)    <= buf_input_r(819 downto 64);
            bits_in_buffer               <= 756;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 821 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(756 downto 0)    <= buf_input_r(820 downto 64);
            bits_in_buffer               <= 757;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 822 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(757 downto 0)    <= buf_input_r(821 downto 64);
            bits_in_buffer               <= 758;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 823 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(758 downto 0)    <= buf_input_r(822 downto 64);
            bits_in_buffer               <= 759;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 824 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(759 downto 0)    <= buf_input_r(823 downto 64);
            bits_in_buffer               <= 760;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 825 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(760 downto 0)    <= buf_input_r(824 downto 64);
            bits_in_buffer               <= 761;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 826 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(761 downto 0)    <= buf_input_r(825 downto 64);
            bits_in_buffer               <= 762;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 827 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(762 downto 0)    <= buf_input_r(826 downto 64);
            bits_in_buffer               <= 763;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 828 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(763 downto 0)    <= buf_input_r(827 downto 64);
            bits_in_buffer               <= 764;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 829 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(764 downto 0)    <= buf_input_r(828 downto 64);
            bits_in_buffer               <= 765;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 830 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(765 downto 0)    <= buf_input_r(829 downto 64);
            bits_in_buffer               <= 766;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 831 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(766 downto 0)    <= buf_input_r(830 downto 64);
            bits_in_buffer               <= 767;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 832 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(767 downto 0)    <= buf_input_r(831 downto 64);
            bits_in_buffer               <= 768;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 833 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(768 downto 0)    <= buf_input_r(832 downto 64);
            bits_in_buffer               <= 769;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 834 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(769 downto 0)    <= buf_input_r(833 downto 64);
            bits_in_buffer               <= 770;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 835 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(770 downto 0)    <= buf_input_r(834 downto 64);
            bits_in_buffer               <= 771;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 836 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(771 downto 0)    <= buf_input_r(835 downto 64);
            bits_in_buffer               <= 772;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 837 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(772 downto 0)    <= buf_input_r(836 downto 64);
            bits_in_buffer               <= 773;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 838 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(773 downto 0)    <= buf_input_r(837 downto 64);
            bits_in_buffer               <= 774;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 839 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(774 downto 0)    <= buf_input_r(838 downto 64);
            bits_in_buffer               <= 775;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 840 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(775 downto 0)    <= buf_input_r(839 downto 64);
            bits_in_buffer               <= 776;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 841 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(776 downto 0)    <= buf_input_r(840 downto 64);
            bits_in_buffer               <= 777;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 842 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(777 downto 0)    <= buf_input_r(841 downto 64);
            bits_in_buffer               <= 778;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 843 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(778 downto 0)    <= buf_input_r(842 downto 64);
            bits_in_buffer               <= 779;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 844 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(779 downto 0)    <= buf_input_r(843 downto 64);
            bits_in_buffer               <= 780;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 845 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(780 downto 0)    <= buf_input_r(844 downto 64);
            bits_in_buffer               <= 781;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 846 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(781 downto 0)    <= buf_input_r(845 downto 64);
            bits_in_buffer               <= 782;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 847 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(782 downto 0)    <= buf_input_r(846 downto 64);
            bits_in_buffer               <= 783;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 848 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(783 downto 0)    <= buf_input_r(847 downto 64);
            bits_in_buffer               <= 784;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 849 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(784 downto 0)    <= buf_input_r(848 downto 64);
            bits_in_buffer               <= 785;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 850 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(785 downto 0)    <= buf_input_r(849 downto 64);
            bits_in_buffer               <= 786;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 851 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(786 downto 0)    <= buf_input_r(850 downto 64);
            bits_in_buffer               <= 787;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 852 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(787 downto 0)    <= buf_input_r(851 downto 64);
            bits_in_buffer               <= 788;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 853 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(788 downto 0)    <= buf_input_r(852 downto 64);
            bits_in_buffer               <= 789;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 854 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(789 downto 0)    <= buf_input_r(853 downto 64);
            bits_in_buffer               <= 790;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 855 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(790 downto 0)    <= buf_input_r(854 downto 64);
            bits_in_buffer               <= 791;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 856 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(791 downto 0)    <= buf_input_r(855 downto 64);
            bits_in_buffer               <= 792;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 857 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(792 downto 0)    <= buf_input_r(856 downto 64);
            bits_in_buffer               <= 793;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 858 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(793 downto 0)    <= buf_input_r(857 downto 64);
            bits_in_buffer               <= 794;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 859 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(794 downto 0)    <= buf_input_r(858 downto 64);
            bits_in_buffer               <= 795;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 860 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(795 downto 0)    <= buf_input_r(859 downto 64);
            bits_in_buffer               <= 796;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 861 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(796 downto 0)    <= buf_input_r(860 downto 64);
            bits_in_buffer               <= 797;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 862 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(797 downto 0)    <= buf_input_r(861 downto 64);
            bits_in_buffer               <= 798;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 863 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(798 downto 0)    <= buf_input_r(862 downto 64);
            bits_in_buffer               <= 799;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 864 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(799 downto 0)    <= buf_input_r(863 downto 64);
            bits_in_buffer               <= 800;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 865 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(800 downto 0)    <= buf_input_r(864 downto 64);
            bits_in_buffer               <= 801;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 866 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(801 downto 0)    <= buf_input_r(865 downto 64);
            bits_in_buffer               <= 802;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 867 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(802 downto 0)    <= buf_input_r(866 downto 64);
            bits_in_buffer               <= 803;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 868 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(803 downto 0)    <= buf_input_r(867 downto 64);
            bits_in_buffer               <= 804;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 869 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(804 downto 0)    <= buf_input_r(868 downto 64);
            bits_in_buffer               <= 805;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 870 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(805 downto 0)    <= buf_input_r(869 downto 64);
            bits_in_buffer               <= 806;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 871 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(806 downto 0)    <= buf_input_r(870 downto 64);
            bits_in_buffer               <= 807;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 872 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(807 downto 0)    <= buf_input_r(871 downto 64);
            bits_in_buffer               <= 808;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 873 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(808 downto 0)    <= buf_input_r(872 downto 64);
            bits_in_buffer               <= 809;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 874 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(809 downto 0)    <= buf_input_r(873 downto 64);
            bits_in_buffer               <= 810;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 875 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(810 downto 0)    <= buf_input_r(874 downto 64);
            bits_in_buffer               <= 811;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 876 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(811 downto 0)    <= buf_input_r(875 downto 64);
            bits_in_buffer               <= 812;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 877 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(812 downto 0)    <= buf_input_r(876 downto 64);
            bits_in_buffer               <= 813;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 878 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(813 downto 0)    <= buf_input_r(877 downto 64);
            bits_in_buffer               <= 814;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 879 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(814 downto 0)    <= buf_input_r(878 downto 64);
            bits_in_buffer               <= 815;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 880 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(815 downto 0)    <= buf_input_r(879 downto 64);
            bits_in_buffer               <= 816;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 881 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(816 downto 0)    <= buf_input_r(880 downto 64);
            bits_in_buffer               <= 817;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 882 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(817 downto 0)    <= buf_input_r(881 downto 64);
            bits_in_buffer               <= 818;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 883 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(818 downto 0)    <= buf_input_r(882 downto 64);
            bits_in_buffer               <= 819;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 884 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(819 downto 0)    <= buf_input_r(883 downto 64);
            bits_in_buffer               <= 820;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 885 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(820 downto 0)    <= buf_input_r(884 downto 64);
            bits_in_buffer               <= 821;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 886 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(821 downto 0)    <= buf_input_r(885 downto 64);
            bits_in_buffer               <= 822;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 887 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(822 downto 0)    <= buf_input_r(886 downto 64);
            bits_in_buffer               <= 823;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 888 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(823 downto 0)    <= buf_input_r(887 downto 64);
            bits_in_buffer               <= 824;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 889 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(824 downto 0)    <= buf_input_r(888 downto 64);
            bits_in_buffer               <= 825;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 890 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(825 downto 0)    <= buf_input_r(889 downto 64);
            bits_in_buffer               <= 826;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 891 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(826 downto 0)    <= buf_input_r(890 downto 64);
            bits_in_buffer               <= 827;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 892 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(827 downto 0)    <= buf_input_r(891 downto 64);
            bits_in_buffer               <= 828;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 893 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(828 downto 0)    <= buf_input_r(892 downto 64);
            bits_in_buffer               <= 829;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 894 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(829 downto 0)    <= buf_input_r(893 downto 64);
            bits_in_buffer               <= 830;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 895 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(830 downto 0)    <= buf_input_r(894 downto 64);
            bits_in_buffer               <= 831;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 896 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(831 downto 0)    <= buf_input_r(895 downto 64);
            bits_in_buffer               <= 832;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 897 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(832 downto 0)    <= buf_input_r(896 downto 64);
            bits_in_buffer               <= 833;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 898 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(833 downto 0)    <= buf_input_r(897 downto 64);
            bits_in_buffer               <= 834;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 899 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(834 downto 0)    <= buf_input_r(898 downto 64);
            bits_in_buffer               <= 835;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 900 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(835 downto 0)    <= buf_input_r(899 downto 64);
            bits_in_buffer               <= 836;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 901 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(836 downto 0)    <= buf_input_r(900 downto 64);
            bits_in_buffer               <= 837;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 902 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(837 downto 0)    <= buf_input_r(901 downto 64);
            bits_in_buffer               <= 838;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 903 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(838 downto 0)    <= buf_input_r(902 downto 64);
            bits_in_buffer               <= 839;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 904 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(839 downto 0)    <= buf_input_r(903 downto 64);
            bits_in_buffer               <= 840;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 905 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(840 downto 0)    <= buf_input_r(904 downto 64);
            bits_in_buffer               <= 841;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 906 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(841 downto 0)    <= buf_input_r(905 downto 64);
            bits_in_buffer               <= 842;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 907 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(842 downto 0)    <= buf_input_r(906 downto 64);
            bits_in_buffer               <= 843;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 908 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(843 downto 0)    <= buf_input_r(907 downto 64);
            bits_in_buffer               <= 844;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 909 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(844 downto 0)    <= buf_input_r(908 downto 64);
            bits_in_buffer               <= 845;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 910 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(845 downto 0)    <= buf_input_r(909 downto 64);
            bits_in_buffer               <= 846;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 911 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(846 downto 0)    <= buf_input_r(910 downto 64);
            bits_in_buffer               <= 847;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 912 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(847 downto 0)    <= buf_input_r(911 downto 64);
            bits_in_buffer               <= 848;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 913 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(848 downto 0)    <= buf_input_r(912 downto 64);
            bits_in_buffer               <= 849;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 914 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(849 downto 0)    <= buf_input_r(913 downto 64);
            bits_in_buffer               <= 850;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 915 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(850 downto 0)    <= buf_input_r(914 downto 64);
            bits_in_buffer               <= 851;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 916 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(851 downto 0)    <= buf_input_r(915 downto 64);
            bits_in_buffer               <= 852;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 917 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(852 downto 0)    <= buf_input_r(916 downto 64);
            bits_in_buffer               <= 853;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 918 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(853 downto 0)    <= buf_input_r(917 downto 64);
            bits_in_buffer               <= 854;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 919 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(854 downto 0)    <= buf_input_r(918 downto 64);
            bits_in_buffer               <= 855;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 920 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(855 downto 0)    <= buf_input_r(919 downto 64);
            bits_in_buffer               <= 856;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 921 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(856 downto 0)    <= buf_input_r(920 downto 64);
            bits_in_buffer               <= 857;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 922 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(857 downto 0)    <= buf_input_r(921 downto 64);
            bits_in_buffer               <= 858;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 923 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(858 downto 0)    <= buf_input_r(922 downto 64);
            bits_in_buffer               <= 859;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 924 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(859 downto 0)    <= buf_input_r(923 downto 64);
            bits_in_buffer               <= 860;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 925 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(860 downto 0)    <= buf_input_r(924 downto 64);
            bits_in_buffer               <= 861;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 926 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(861 downto 0)    <= buf_input_r(925 downto 64);
            bits_in_buffer               <= 862;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 927 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(862 downto 0)    <= buf_input_r(926 downto 64);
            bits_in_buffer               <= 863;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 928 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(863 downto 0)    <= buf_input_r(927 downto 64);
            bits_in_buffer               <= 864;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 929 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(864 downto 0)    <= buf_input_r(928 downto 64);
            bits_in_buffer               <= 865;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 930 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(865 downto 0)    <= buf_input_r(929 downto 64);
            bits_in_buffer               <= 866;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 931 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(866 downto 0)    <= buf_input_r(930 downto 64);
            bits_in_buffer               <= 867;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 932 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(867 downto 0)    <= buf_input_r(931 downto 64);
            bits_in_buffer               <= 868;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 933 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(868 downto 0)    <= buf_input_r(932 downto 64);
            bits_in_buffer               <= 869;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 934 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(869 downto 0)    <= buf_input_r(933 downto 64);
            bits_in_buffer               <= 870;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 935 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(870 downto 0)    <= buf_input_r(934 downto 64);
            bits_in_buffer               <= 871;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 936 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(871 downto 0)    <= buf_input_r(935 downto 64);
            bits_in_buffer               <= 872;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 937 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(872 downto 0)    <= buf_input_r(936 downto 64);
            bits_in_buffer               <= 873;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 938 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(873 downto 0)    <= buf_input_r(937 downto 64);
            bits_in_buffer               <= 874;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 939 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(874 downto 0)    <= buf_input_r(938 downto 64);
            bits_in_buffer               <= 875;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 940 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(875 downto 0)    <= buf_input_r(939 downto 64);
            bits_in_buffer               <= 876;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 941 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(876 downto 0)    <= buf_input_r(940 downto 64);
            bits_in_buffer               <= 877;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 942 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(877 downto 0)    <= buf_input_r(941 downto 64);
            bits_in_buffer               <= 878;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 943 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(878 downto 0)    <= buf_input_r(942 downto 64);
            bits_in_buffer               <= 879;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 944 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(879 downto 0)    <= buf_input_r(943 downto 64);
            bits_in_buffer               <= 880;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 945 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(880 downto 0)    <= buf_input_r(944 downto 64);
            bits_in_buffer               <= 881;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 946 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(881 downto 0)    <= buf_input_r(945 downto 64);
            bits_in_buffer               <= 882;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 947 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(882 downto 0)    <= buf_input_r(946 downto 64);
            bits_in_buffer               <= 883;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 948 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(883 downto 0)    <= buf_input_r(947 downto 64);
            bits_in_buffer               <= 884;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 949 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(884 downto 0)    <= buf_input_r(948 downto 64);
            bits_in_buffer               <= 885;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 950 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(885 downto 0)    <= buf_input_r(949 downto 64);
            bits_in_buffer               <= 886;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 951 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(886 downto 0)    <= buf_input_r(950 downto 64);
            bits_in_buffer               <= 887;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 952 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(887 downto 0)    <= buf_input_r(951 downto 64);
            bits_in_buffer               <= 888;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 953 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(888 downto 0)    <= buf_input_r(952 downto 64);
            bits_in_buffer               <= 889;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 954 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(889 downto 0)    <= buf_input_r(953 downto 64);
            bits_in_buffer               <= 890;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 955 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(890 downto 0)    <= buf_input_r(954 downto 64);
            bits_in_buffer               <= 891;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 956 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(891 downto 0)    <= buf_input_r(955 downto 64);
            bits_in_buffer               <= 892;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 957 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(892 downto 0)    <= buf_input_r(956 downto 64);
            bits_in_buffer               <= 893;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 958 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(893 downto 0)    <= buf_input_r(957 downto 64);
            bits_in_buffer               <= 894;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 959 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(894 downto 0)    <= buf_input_r(958 downto 64);
            bits_in_buffer               <= 895;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 960 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(895 downto 0)    <= buf_input_r(959 downto 64);
            bits_in_buffer               <= 896;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 961 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(896 downto 0)    <= buf_input_r(960 downto 64);
            bits_in_buffer               <= 897;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 962 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(897 downto 0)    <= buf_input_r(961 downto 64);
            bits_in_buffer               <= 898;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 963 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(898 downto 0)    <= buf_input_r(962 downto 64);
            bits_in_buffer               <= 899;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 964 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(899 downto 0)    <= buf_input_r(963 downto 64);
            bits_in_buffer               <= 900;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 965 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(900 downto 0)    <= buf_input_r(964 downto 64);
            bits_in_buffer               <= 901;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 966 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(901 downto 0)    <= buf_input_r(965 downto 64);
            bits_in_buffer               <= 902;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 967 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(902 downto 0)    <= buf_input_r(966 downto 64);
            bits_in_buffer               <= 903;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 968 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(903 downto 0)    <= buf_input_r(967 downto 64);
            bits_in_buffer               <= 904;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        end case;

        end if;
    end process the_buffing_process;
    end architecture arch_word_compressor_484IN_to_64OUT;