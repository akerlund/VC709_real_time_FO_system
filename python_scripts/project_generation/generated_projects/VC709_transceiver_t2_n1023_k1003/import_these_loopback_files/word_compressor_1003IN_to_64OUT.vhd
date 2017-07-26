----------------------------------------------------------------------------------
    -- Company:  Chalmers
    -- Engineer: Fredrik Åkerlund
    -- 
    -- Create Date: Mon Jul 24 13:30:05 2017

    -- Design Name: 
    -- Module Name: word_compressor_1003IN_to_64OUT - arch_word_compressor_1003IN_to_64OUT
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
    entity word_compressor_1003IN_to_64OUT is

    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;

        enable_in      : in  std_logic;
        congestion_out : out std_logic;

        data_in        : in  std_logic_vector(1002 downto 0);
        in_rdy         : in  std_logic;

        buf_out        : out std_logic_vector(63 downto 0);
        out_rdy        : out std_logic

    );
    end word_compressor_1003IN_to_64OUT;

architecture arch_word_compressor_1003IN_to_64OUT of word_compressor_1003IN_to_64OUT is

    -- Input registers.
    signal buf_input_r    : std_logic_vector(2005 downto 0);
    signal bits_in_buffer : integer range 0 to 2006;

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

        --elsif rising_edge(user_clk) then
        elsif rising_edge(user_clk) and enable_in = '1' then

    

        -- If bits_in_buffer is less than 64, the output will consist
        --   of both the input and the buffer.

        case bits_in_buffer is
        when 0 =>
            if in_rdy = '1' then
                buf_output_r(63 downto 0)    <= data_in(63 downto 0);
                buf_input_r(938 downto 0)    <= data_in(1002 downto 64);
                bits_in_buffer               <= 939;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 1 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(0 downto 0)     <= buf_input_r(0 downto 0);
                buf_output_r(63 downto 1)    <= data_in(62 downto 0);
                buf_input_r(939 downto 0)    <= data_in(1002 downto 63);
                bits_in_buffer               <= 940;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 2 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(1 downto 0)     <= buf_input_r(1 downto 0);
                buf_output_r(63 downto 2)    <= data_in(61 downto 0);
                buf_input_r(940 downto 0)    <= data_in(1002 downto 62);
                bits_in_buffer               <= 941;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 3 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(2 downto 0)     <= buf_input_r(2 downto 0);
                buf_output_r(63 downto 3)    <= data_in(60 downto 0);
                buf_input_r(941 downto 0)    <= data_in(1002 downto 61);
                bits_in_buffer               <= 942;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 4 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(3 downto 0)     <= buf_input_r(3 downto 0);
                buf_output_r(63 downto 4)    <= data_in(59 downto 0);
                buf_input_r(942 downto 0)    <= data_in(1002 downto 60);
                bits_in_buffer               <= 943;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 5 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(4 downto 0)     <= buf_input_r(4 downto 0);
                buf_output_r(63 downto 5)    <= data_in(58 downto 0);
                buf_input_r(943 downto 0)    <= data_in(1002 downto 59);
                bits_in_buffer               <= 944;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 6 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(5 downto 0)     <= buf_input_r(5 downto 0);
                buf_output_r(63 downto 6)    <= data_in(57 downto 0);
                buf_input_r(944 downto 0)    <= data_in(1002 downto 58);
                bits_in_buffer               <= 945;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 7 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(6 downto 0)     <= buf_input_r(6 downto 0);
                buf_output_r(63 downto 7)    <= data_in(56 downto 0);
                buf_input_r(945 downto 0)    <= data_in(1002 downto 57);
                bits_in_buffer               <= 946;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 8 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(7 downto 0)     <= buf_input_r(7 downto 0);
                buf_output_r(63 downto 8)    <= data_in(55 downto 0);
                buf_input_r(946 downto 0)    <= data_in(1002 downto 56);
                bits_in_buffer               <= 947;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 9 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(8 downto 0)     <= buf_input_r(8 downto 0);
                buf_output_r(63 downto 9)    <= data_in(54 downto 0);
                buf_input_r(947 downto 0)    <= data_in(1002 downto 55);
                bits_in_buffer               <= 948;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 10 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(9 downto 0)     <= buf_input_r(9 downto 0);
                buf_output_r(63 downto 10)   <= data_in(53 downto 0);
                buf_input_r(948 downto 0)    <= data_in(1002 downto 54);
                bits_in_buffer               <= 949;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 11 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(10 downto 0)    <= buf_input_r(10 downto 0);
                buf_output_r(63 downto 11)   <= data_in(52 downto 0);
                buf_input_r(949 downto 0)    <= data_in(1002 downto 53);
                bits_in_buffer               <= 950;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 12 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(11 downto 0)    <= buf_input_r(11 downto 0);
                buf_output_r(63 downto 12)   <= data_in(51 downto 0);
                buf_input_r(950 downto 0)    <= data_in(1002 downto 52);
                bits_in_buffer               <= 951;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 13 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(12 downto 0)    <= buf_input_r(12 downto 0);
                buf_output_r(63 downto 13)   <= data_in(50 downto 0);
                buf_input_r(951 downto 0)    <= data_in(1002 downto 51);
                bits_in_buffer               <= 952;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 14 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(13 downto 0)    <= buf_input_r(13 downto 0);
                buf_output_r(63 downto 14)   <= data_in(49 downto 0);
                buf_input_r(952 downto 0)    <= data_in(1002 downto 50);
                bits_in_buffer               <= 953;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 15 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(14 downto 0)    <= buf_input_r(14 downto 0);
                buf_output_r(63 downto 15)   <= data_in(48 downto 0);
                buf_input_r(953 downto 0)    <= data_in(1002 downto 49);
                bits_in_buffer               <= 954;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 16 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(15 downto 0)    <= buf_input_r(15 downto 0);
                buf_output_r(63 downto 16)   <= data_in(47 downto 0);
                buf_input_r(954 downto 0)    <= data_in(1002 downto 48);
                bits_in_buffer               <= 955;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 17 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(16 downto 0)    <= buf_input_r(16 downto 0);
                buf_output_r(63 downto 17)   <= data_in(46 downto 0);
                buf_input_r(955 downto 0)    <= data_in(1002 downto 47);
                bits_in_buffer               <= 956;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 18 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(17 downto 0)    <= buf_input_r(17 downto 0);
                buf_output_r(63 downto 18)   <= data_in(45 downto 0);
                buf_input_r(956 downto 0)    <= data_in(1002 downto 46);
                bits_in_buffer               <= 957;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 19 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(18 downto 0)    <= buf_input_r(18 downto 0);
                buf_output_r(63 downto 19)   <= data_in(44 downto 0);
                buf_input_r(957 downto 0)    <= data_in(1002 downto 45);
                bits_in_buffer               <= 958;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 20 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(19 downto 0)    <= buf_input_r(19 downto 0);
                buf_output_r(63 downto 20)   <= data_in(43 downto 0);
                buf_input_r(958 downto 0)    <= data_in(1002 downto 44);
                bits_in_buffer               <= 959;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 21 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(20 downto 0)    <= buf_input_r(20 downto 0);
                buf_output_r(63 downto 21)   <= data_in(42 downto 0);
                buf_input_r(959 downto 0)    <= data_in(1002 downto 43);
                bits_in_buffer               <= 960;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 22 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(21 downto 0)    <= buf_input_r(21 downto 0);
                buf_output_r(63 downto 22)   <= data_in(41 downto 0);
                buf_input_r(960 downto 0)    <= data_in(1002 downto 42);
                bits_in_buffer               <= 961;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 23 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(22 downto 0)    <= buf_input_r(22 downto 0);
                buf_output_r(63 downto 23)   <= data_in(40 downto 0);
                buf_input_r(961 downto 0)    <= data_in(1002 downto 41);
                bits_in_buffer               <= 962;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 24 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(23 downto 0)    <= buf_input_r(23 downto 0);
                buf_output_r(63 downto 24)   <= data_in(39 downto 0);
                buf_input_r(962 downto 0)    <= data_in(1002 downto 40);
                bits_in_buffer               <= 963;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 25 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(24 downto 0)    <= buf_input_r(24 downto 0);
                buf_output_r(63 downto 25)   <= data_in(38 downto 0);
                buf_input_r(963 downto 0)    <= data_in(1002 downto 39);
                bits_in_buffer               <= 964;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 26 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(25 downto 0)    <= buf_input_r(25 downto 0);
                buf_output_r(63 downto 26)   <= data_in(37 downto 0);
                buf_input_r(964 downto 0)    <= data_in(1002 downto 38);
                bits_in_buffer               <= 965;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 27 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(26 downto 0)    <= buf_input_r(26 downto 0);
                buf_output_r(63 downto 27)   <= data_in(36 downto 0);
                buf_input_r(965 downto 0)    <= data_in(1002 downto 37);
                bits_in_buffer               <= 966;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 28 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(27 downto 0)    <= buf_input_r(27 downto 0);
                buf_output_r(63 downto 28)   <= data_in(35 downto 0);
                buf_input_r(966 downto 0)    <= data_in(1002 downto 36);
                bits_in_buffer               <= 967;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 29 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(28 downto 0)    <= buf_input_r(28 downto 0);
                buf_output_r(63 downto 29)   <= data_in(34 downto 0);
                buf_input_r(967 downto 0)    <= data_in(1002 downto 35);
                bits_in_buffer               <= 968;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 30 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(29 downto 0)    <= buf_input_r(29 downto 0);
                buf_output_r(63 downto 30)   <= data_in(33 downto 0);
                buf_input_r(968 downto 0)    <= data_in(1002 downto 34);
                bits_in_buffer               <= 969;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 31 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(30 downto 0)    <= buf_input_r(30 downto 0);
                buf_output_r(63 downto 31)   <= data_in(32 downto 0);
                buf_input_r(969 downto 0)    <= data_in(1002 downto 33);
                bits_in_buffer               <= 970;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 32 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(31 downto 0)    <= buf_input_r(31 downto 0);
                buf_output_r(63 downto 32)   <= data_in(31 downto 0);
                buf_input_r(970 downto 0)    <= data_in(1002 downto 32);
                bits_in_buffer               <= 971;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 33 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(32 downto 0)    <= buf_input_r(32 downto 0);
                buf_output_r(63 downto 33)   <= data_in(30 downto 0);
                buf_input_r(971 downto 0)    <= data_in(1002 downto 31);
                bits_in_buffer               <= 972;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 34 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(33 downto 0)    <= buf_input_r(33 downto 0);
                buf_output_r(63 downto 34)   <= data_in(29 downto 0);
                buf_input_r(972 downto 0)    <= data_in(1002 downto 30);
                bits_in_buffer               <= 973;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 35 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(34 downto 0)    <= buf_input_r(34 downto 0);
                buf_output_r(63 downto 35)   <= data_in(28 downto 0);
                buf_input_r(973 downto 0)    <= data_in(1002 downto 29);
                bits_in_buffer               <= 974;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 36 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(35 downto 0)    <= buf_input_r(35 downto 0);
                buf_output_r(63 downto 36)   <= data_in(27 downto 0);
                buf_input_r(974 downto 0)    <= data_in(1002 downto 28);
                bits_in_buffer               <= 975;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 37 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(36 downto 0)    <= buf_input_r(36 downto 0);
                buf_output_r(63 downto 37)   <= data_in(26 downto 0);
                buf_input_r(975 downto 0)    <= data_in(1002 downto 27);
                bits_in_buffer               <= 976;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 38 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(37 downto 0)    <= buf_input_r(37 downto 0);
                buf_output_r(63 downto 38)   <= data_in(25 downto 0);
                buf_input_r(976 downto 0)    <= data_in(1002 downto 26);
                bits_in_buffer               <= 977;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 39 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(38 downto 0)    <= buf_input_r(38 downto 0);
                buf_output_r(63 downto 39)   <= data_in(24 downto 0);
                buf_input_r(977 downto 0)    <= data_in(1002 downto 25);
                bits_in_buffer               <= 978;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 40 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(39 downto 0)    <= buf_input_r(39 downto 0);
                buf_output_r(63 downto 40)   <= data_in(23 downto 0);
                buf_input_r(978 downto 0)    <= data_in(1002 downto 24);
                bits_in_buffer               <= 979;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 41 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(40 downto 0)    <= buf_input_r(40 downto 0);
                buf_output_r(63 downto 41)   <= data_in(22 downto 0);
                buf_input_r(979 downto 0)    <= data_in(1002 downto 23);
                bits_in_buffer               <= 980;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 42 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(41 downto 0)    <= buf_input_r(41 downto 0);
                buf_output_r(63 downto 42)   <= data_in(21 downto 0);
                buf_input_r(980 downto 0)    <= data_in(1002 downto 22);
                bits_in_buffer               <= 981;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 43 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(42 downto 0)    <= buf_input_r(42 downto 0);
                buf_output_r(63 downto 43)   <= data_in(20 downto 0);
                buf_input_r(981 downto 0)    <= data_in(1002 downto 21);
                bits_in_buffer               <= 982;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 44 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(43 downto 0)    <= buf_input_r(43 downto 0);
                buf_output_r(63 downto 44)   <= data_in(19 downto 0);
                buf_input_r(982 downto 0)    <= data_in(1002 downto 20);
                bits_in_buffer               <= 983;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 45 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(44 downto 0)    <= buf_input_r(44 downto 0);
                buf_output_r(63 downto 45)   <= data_in(18 downto 0);
                buf_input_r(983 downto 0)    <= data_in(1002 downto 19);
                bits_in_buffer               <= 984;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 46 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(45 downto 0)    <= buf_input_r(45 downto 0);
                buf_output_r(63 downto 46)   <= data_in(17 downto 0);
                buf_input_r(984 downto 0)    <= data_in(1002 downto 18);
                bits_in_buffer               <= 985;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 47 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(46 downto 0)    <= buf_input_r(46 downto 0);
                buf_output_r(63 downto 47)   <= data_in(16 downto 0);
                buf_input_r(985 downto 0)    <= data_in(1002 downto 17);
                bits_in_buffer               <= 986;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 48 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(47 downto 0)    <= buf_input_r(47 downto 0);
                buf_output_r(63 downto 48)   <= data_in(15 downto 0);
                buf_input_r(986 downto 0)    <= data_in(1002 downto 16);
                bits_in_buffer               <= 987;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 49 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(48 downto 0)    <= buf_input_r(48 downto 0);
                buf_output_r(63 downto 49)   <= data_in(14 downto 0);
                buf_input_r(987 downto 0)    <= data_in(1002 downto 15);
                bits_in_buffer               <= 988;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 50 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(49 downto 0)    <= buf_input_r(49 downto 0);
                buf_output_r(63 downto 50)   <= data_in(13 downto 0);
                buf_input_r(988 downto 0)    <= data_in(1002 downto 14);
                bits_in_buffer               <= 989;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 51 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(50 downto 0)    <= buf_input_r(50 downto 0);
                buf_output_r(63 downto 51)   <= data_in(12 downto 0);
                buf_input_r(989 downto 0)    <= data_in(1002 downto 13);
                bits_in_buffer               <= 990;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 52 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(51 downto 0)    <= buf_input_r(51 downto 0);
                buf_output_r(63 downto 52)   <= data_in(11 downto 0);
                buf_input_r(990 downto 0)    <= data_in(1002 downto 12);
                bits_in_buffer               <= 991;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 53 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(52 downto 0)    <= buf_input_r(52 downto 0);
                buf_output_r(63 downto 53)   <= data_in(10 downto 0);
                buf_input_r(991 downto 0)    <= data_in(1002 downto 11);
                bits_in_buffer               <= 992;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 54 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(53 downto 0)    <= buf_input_r(53 downto 0);
                buf_output_r(63 downto 54)   <= data_in(9 downto 0);
                buf_input_r(992 downto 0)    <= data_in(1002 downto 10);
                bits_in_buffer               <= 993;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 55 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(54 downto 0)    <= buf_input_r(54 downto 0);
                buf_output_r(63 downto 55)   <= data_in(8 downto 0);
                buf_input_r(993 downto 0)    <= data_in(1002 downto 9);
                bits_in_buffer               <= 994;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 56 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(55 downto 0)    <= buf_input_r(55 downto 0);
                buf_output_r(63 downto 56)   <= data_in(7 downto 0);
                buf_input_r(994 downto 0)    <= data_in(1002 downto 8);
                bits_in_buffer               <= 995;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 57 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(56 downto 0)    <= buf_input_r(56 downto 0);
                buf_output_r(63 downto 57)   <= data_in(6 downto 0);
                buf_input_r(995 downto 0)    <= data_in(1002 downto 7);
                bits_in_buffer               <= 996;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 58 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(57 downto 0)    <= buf_input_r(57 downto 0);
                buf_output_r(63 downto 58)   <= data_in(5 downto 0);
                buf_input_r(996 downto 0)    <= data_in(1002 downto 6);
                bits_in_buffer               <= 997;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 59 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(58 downto 0)    <= buf_input_r(58 downto 0);
                buf_output_r(63 downto 59)   <= data_in(4 downto 0);
                buf_input_r(997 downto 0)    <= data_in(1002 downto 5);
                bits_in_buffer               <= 998;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 60 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(59 downto 0)    <= buf_input_r(59 downto 0);
                buf_output_r(63 downto 60)   <= data_in(3 downto 0);
                buf_input_r(998 downto 0)    <= data_in(1002 downto 4);
                bits_in_buffer               <= 999;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 61 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(60 downto 0)    <= buf_input_r(60 downto 0);
                buf_output_r(63 downto 61)   <= data_in(2 downto 0);
                buf_input_r(999 downto 0)    <= data_in(1002 downto 3);
                bits_in_buffer               <= 1000;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 62 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(61 downto 0)    <= buf_input_r(61 downto 0);
                buf_output_r(63 downto 62)   <= data_in(1 downto 0);
                buf_input_r(1000 downto 0)   <= data_in(1002 downto 2);
                bits_in_buffer               <= 1001;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 63 =>
            if in_rdy = '1' and enable_in = '1' then
                buf_output_r(62 downto 0)    <= buf_input_r(62 downto 0);
                buf_output_r(63 downto 63)   <= data_in(0 downto 0);
                buf_input_r(1001 downto 0)   <= data_in(1002 downto 1);
                bits_in_buffer               <= 1002;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';


        -- For this range, the buffer has enough bits saved for the output.

        when 64 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            if in_rdy = '1' then
                buf_input_r(1002 downto 0)   <= data_in(1002 downto 0);
                buf_input_r(2005 downto 1003) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1003;
            else
                bits_in_buffer               <= 0;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 65 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(0 downto 0)          <= buf_input_r(64 downto 64);
            if in_rdy = '1' then
                buf_input_r(1003 downto 1)   <= data_in(1002 downto 0);
                bits_in_buffer               <= 1004;
            else
                bits_in_buffer               <= 1;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 66 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(1 downto 0)          <= buf_input_r(65 downto 64);
            if in_rdy = '1' then
                buf_input_r(1004 downto 2)   <= data_in(1002 downto 0);
                bits_in_buffer               <= 1005;
            else
                bits_in_buffer               <= 2;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 67 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(2 downto 0)          <= buf_input_r(66 downto 64);
            if in_rdy = '1' then
                buf_input_r(1005 downto 3)   <= data_in(1002 downto 0);
                bits_in_buffer               <= 1006;
            else
                bits_in_buffer               <= 3;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 68 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(3 downto 0)          <= buf_input_r(67 downto 64);
            if in_rdy = '1' then
                buf_input_r(1006 downto 4)   <= data_in(1002 downto 0);
                bits_in_buffer               <= 1007;
            else
                bits_in_buffer               <= 4;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 69 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(4 downto 0)          <= buf_input_r(68 downto 64);
            if in_rdy = '1' then
                buf_input_r(1007 downto 5)   <= data_in(1002 downto 0);
                bits_in_buffer               <= 1008;
            else
                bits_in_buffer               <= 5;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 70 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(5 downto 0)          <= buf_input_r(69 downto 64);
            if in_rdy = '1' then
                buf_input_r(1008 downto 6)   <= data_in(1002 downto 0);
                bits_in_buffer               <= 1009;
            else
                bits_in_buffer               <= 6;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 71 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(6 downto 0)          <= buf_input_r(70 downto 64);
            if in_rdy = '1' then
                buf_input_r(1009 downto 7)   <= data_in(1002 downto 0);
                bits_in_buffer               <= 1010;
            else
                bits_in_buffer               <= 7;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 72 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(7 downto 0)          <= buf_input_r(71 downto 64);
            if in_rdy = '1' then
                buf_input_r(1010 downto 8)   <= data_in(1002 downto 0);
                bits_in_buffer               <= 1011;
            else
                bits_in_buffer               <= 8;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 73 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(8 downto 0)          <= buf_input_r(72 downto 64);
            if in_rdy = '1' then
                buf_input_r(1011 downto 9)   <= data_in(1002 downto 0);
                bits_in_buffer               <= 1012;
            else
                bits_in_buffer               <= 9;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 74 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(9 downto 0)          <= buf_input_r(73 downto 64);
            if in_rdy = '1' then
                buf_input_r(1012 downto 10)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1013;
            else
                bits_in_buffer               <= 10;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 75 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(10 downto 0)         <= buf_input_r(74 downto 64);
            if in_rdy = '1' then
                buf_input_r(1013 downto 11)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1014;
            else
                bits_in_buffer               <= 11;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 76 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(11 downto 0)         <= buf_input_r(75 downto 64);
            if in_rdy = '1' then
                buf_input_r(1014 downto 12)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1015;
            else
                bits_in_buffer               <= 12;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 77 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(12 downto 0)         <= buf_input_r(76 downto 64);
            if in_rdy = '1' then
                buf_input_r(1015 downto 13)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1016;
            else
                bits_in_buffer               <= 13;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 78 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(13 downto 0)         <= buf_input_r(77 downto 64);
            if in_rdy = '1' then
                buf_input_r(1016 downto 14)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1017;
            else
                bits_in_buffer               <= 14;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 79 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(14 downto 0)         <= buf_input_r(78 downto 64);
            if in_rdy = '1' then
                buf_input_r(1017 downto 15)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1018;
            else
                bits_in_buffer               <= 15;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 80 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(15 downto 0)         <= buf_input_r(79 downto 64);
            if in_rdy = '1' then
                buf_input_r(1018 downto 16)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1019;
            else
                bits_in_buffer               <= 16;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 81 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(16 downto 0)         <= buf_input_r(80 downto 64);
            if in_rdy = '1' then
                buf_input_r(1019 downto 17)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1020;
            else
                bits_in_buffer               <= 17;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 82 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(17 downto 0)         <= buf_input_r(81 downto 64);
            if in_rdy = '1' then
                buf_input_r(1020 downto 18)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1021;
            else
                bits_in_buffer               <= 18;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 83 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(18 downto 0)         <= buf_input_r(82 downto 64);
            if in_rdy = '1' then
                buf_input_r(1021 downto 19)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1022;
            else
                bits_in_buffer               <= 19;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 84 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(19 downto 0)         <= buf_input_r(83 downto 64);
            if in_rdy = '1' then
                buf_input_r(1022 downto 20)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1023;
            else
                bits_in_buffer               <= 20;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 85 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(20 downto 0)         <= buf_input_r(84 downto 64);
            if in_rdy = '1' then
                buf_input_r(1023 downto 21)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1024;
            else
                bits_in_buffer               <= 21;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 86 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(21 downto 0)         <= buf_input_r(85 downto 64);
            if in_rdy = '1' then
                buf_input_r(1024 downto 22)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1025;
            else
                bits_in_buffer               <= 22;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 87 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(22 downto 0)         <= buf_input_r(86 downto 64);
            if in_rdy = '1' then
                buf_input_r(1025 downto 23)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1026;
            else
                bits_in_buffer               <= 23;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 88 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(23 downto 0)         <= buf_input_r(87 downto 64);
            if in_rdy = '1' then
                buf_input_r(1026 downto 24)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1027;
            else
                bits_in_buffer               <= 24;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 89 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(24 downto 0)         <= buf_input_r(88 downto 64);
            if in_rdy = '1' then
                buf_input_r(1027 downto 25)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1028;
            else
                bits_in_buffer               <= 25;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 90 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(25 downto 0)         <= buf_input_r(89 downto 64);
            if in_rdy = '1' then
                buf_input_r(1028 downto 26)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1029;
            else
                bits_in_buffer               <= 26;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 91 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(26 downto 0)         <= buf_input_r(90 downto 64);
            if in_rdy = '1' then
                buf_input_r(1029 downto 27)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1030;
            else
                bits_in_buffer               <= 27;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 92 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(27 downto 0)         <= buf_input_r(91 downto 64);
            if in_rdy = '1' then
                buf_input_r(1030 downto 28)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1031;
            else
                bits_in_buffer               <= 28;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 93 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(28 downto 0)         <= buf_input_r(92 downto 64);
            if in_rdy = '1' then
                buf_input_r(1031 downto 29)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1032;
            else
                bits_in_buffer               <= 29;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 94 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(29 downto 0)         <= buf_input_r(93 downto 64);
            if in_rdy = '1' then
                buf_input_r(1032 downto 30)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1033;
            else
                bits_in_buffer               <= 30;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 95 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(30 downto 0)         <= buf_input_r(94 downto 64);
            if in_rdy = '1' then
                buf_input_r(1033 downto 31)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1034;
            else
                bits_in_buffer               <= 31;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 96 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(31 downto 0)         <= buf_input_r(95 downto 64);
            if in_rdy = '1' then
                buf_input_r(1034 downto 32)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1035;
            else
                bits_in_buffer               <= 32;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 97 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(32 downto 0)         <= buf_input_r(96 downto 64);
            if in_rdy = '1' then
                buf_input_r(1035 downto 33)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1036;
            else
                bits_in_buffer               <= 33;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 98 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(33 downto 0)         <= buf_input_r(97 downto 64);
            if in_rdy = '1' then
                buf_input_r(1036 downto 34)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1037;
            else
                bits_in_buffer               <= 34;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 99 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(34 downto 0)         <= buf_input_r(98 downto 64);
            if in_rdy = '1' then
                buf_input_r(1037 downto 35)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1038;
            else
                bits_in_buffer               <= 35;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 100 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(35 downto 0)         <= buf_input_r(99 downto 64);
            if in_rdy = '1' then
                buf_input_r(1038 downto 36)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1039;
            else
                bits_in_buffer               <= 36;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 101 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(36 downto 0)         <= buf_input_r(100 downto 64);
            if in_rdy = '1' then
                buf_input_r(1039 downto 37)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1040;
            else
                bits_in_buffer               <= 37;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 102 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(37 downto 0)         <= buf_input_r(101 downto 64);
            if in_rdy = '1' then
                buf_input_r(1040 downto 38)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1041;
            else
                bits_in_buffer               <= 38;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 103 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(38 downto 0)         <= buf_input_r(102 downto 64);
            if in_rdy = '1' then
                buf_input_r(1041 downto 39)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1042;
            else
                bits_in_buffer               <= 39;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 104 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(39 downto 0)         <= buf_input_r(103 downto 64);
            if in_rdy = '1' then
                buf_input_r(1042 downto 40)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1043;
            else
                bits_in_buffer               <= 40;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 105 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(40 downto 0)         <= buf_input_r(104 downto 64);
            if in_rdy = '1' then
                buf_input_r(1043 downto 41)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1044;
            else
                bits_in_buffer               <= 41;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 106 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(41 downto 0)         <= buf_input_r(105 downto 64);
            if in_rdy = '1' then
                buf_input_r(1044 downto 42)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1045;
            else
                bits_in_buffer               <= 42;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 107 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(42 downto 0)         <= buf_input_r(106 downto 64);
            if in_rdy = '1' then
                buf_input_r(1045 downto 43)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1046;
            else
                bits_in_buffer               <= 43;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 108 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(43 downto 0)         <= buf_input_r(107 downto 64);
            if in_rdy = '1' then
                buf_input_r(1046 downto 44)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1047;
            else
                bits_in_buffer               <= 44;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 109 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(44 downto 0)         <= buf_input_r(108 downto 64);
            if in_rdy = '1' then
                buf_input_r(1047 downto 45)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1048;
            else
                bits_in_buffer               <= 45;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 110 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(45 downto 0)         <= buf_input_r(109 downto 64);
            if in_rdy = '1' then
                buf_input_r(1048 downto 46)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1049;
            else
                bits_in_buffer               <= 46;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 111 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(46 downto 0)         <= buf_input_r(110 downto 64);
            if in_rdy = '1' then
                buf_input_r(1049 downto 47)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1050;
            else
                bits_in_buffer               <= 47;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 112 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(47 downto 0)         <= buf_input_r(111 downto 64);
            if in_rdy = '1' then
                buf_input_r(1050 downto 48)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1051;
            else
                bits_in_buffer               <= 48;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 113 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(48 downto 0)         <= buf_input_r(112 downto 64);
            if in_rdy = '1' then
                buf_input_r(1051 downto 49)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1052;
            else
                bits_in_buffer               <= 49;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 114 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(49 downto 0)         <= buf_input_r(113 downto 64);
            if in_rdy = '1' then
                buf_input_r(1052 downto 50)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1053;
            else
                bits_in_buffer               <= 50;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 115 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(50 downto 0)         <= buf_input_r(114 downto 64);
            if in_rdy = '1' then
                buf_input_r(1053 downto 51)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1054;
            else
                bits_in_buffer               <= 51;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 116 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(51 downto 0)         <= buf_input_r(115 downto 64);
            if in_rdy = '1' then
                buf_input_r(1054 downto 52)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1055;
            else
                bits_in_buffer               <= 52;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 117 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(52 downto 0)         <= buf_input_r(116 downto 64);
            if in_rdy = '1' then
                buf_input_r(1055 downto 53)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1056;
            else
                bits_in_buffer               <= 53;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 118 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(53 downto 0)         <= buf_input_r(117 downto 64);
            if in_rdy = '1' then
                buf_input_r(1056 downto 54)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1057;
            else
                bits_in_buffer               <= 54;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 119 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(54 downto 0)         <= buf_input_r(118 downto 64);
            if in_rdy = '1' then
                buf_input_r(1057 downto 55)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1058;
            else
                bits_in_buffer               <= 55;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 120 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(55 downto 0)         <= buf_input_r(119 downto 64);
            if in_rdy = '1' then
                buf_input_r(1058 downto 56)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1059;
            else
                bits_in_buffer               <= 56;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 121 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(56 downto 0)         <= buf_input_r(120 downto 64);
            if in_rdy = '1' then
                buf_input_r(1059 downto 57)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1060;
            else
                bits_in_buffer               <= 57;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 122 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(57 downto 0)         <= buf_input_r(121 downto 64);
            if in_rdy = '1' then
                buf_input_r(1060 downto 58)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1061;
            else
                bits_in_buffer               <= 58;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 123 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(58 downto 0)         <= buf_input_r(122 downto 64);
            if in_rdy = '1' then
                buf_input_r(1061 downto 59)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1062;
            else
                bits_in_buffer               <= 59;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 124 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(59 downto 0)         <= buf_input_r(123 downto 64);
            if in_rdy = '1' then
                buf_input_r(1062 downto 60)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1063;
            else
                bits_in_buffer               <= 60;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 125 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(60 downto 0)         <= buf_input_r(124 downto 64);
            if in_rdy = '1' then
                buf_input_r(1063 downto 61)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1064;
            else
                bits_in_buffer               <= 61;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 126 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(61 downto 0)         <= buf_input_r(125 downto 64);
            if in_rdy = '1' then
                buf_input_r(1064 downto 62)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1065;
            else
                bits_in_buffer               <= 62;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 127 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(62 downto 0)         <= buf_input_r(126 downto 64);
            if in_rdy = '1' then
                buf_input_r(1065 downto 63)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1066;
            else
                bits_in_buffer               <= 63;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 128 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(63 downto 0)         <= buf_input_r(127 downto 64);
            if in_rdy = '1' then
                buf_input_r(1066 downto 64)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1067;
            else
                bits_in_buffer               <= 64;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 129 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(64 downto 0)         <= buf_input_r(128 downto 64);
            if in_rdy = '1' then
                buf_input_r(1067 downto 65)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1068;
            else
                bits_in_buffer               <= 65;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 130 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(65 downto 0)         <= buf_input_r(129 downto 64);
            if in_rdy = '1' then
                buf_input_r(1068 downto 66)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1069;
            else
                bits_in_buffer               <= 66;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 131 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(66 downto 0)         <= buf_input_r(130 downto 64);
            if in_rdy = '1' then
                buf_input_r(1069 downto 67)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1070;
            else
                bits_in_buffer               <= 67;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 132 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(67 downto 0)         <= buf_input_r(131 downto 64);
            if in_rdy = '1' then
                buf_input_r(1070 downto 68)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1071;
            else
                bits_in_buffer               <= 68;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 133 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(68 downto 0)         <= buf_input_r(132 downto 64);
            if in_rdy = '1' then
                buf_input_r(1071 downto 69)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1072;
            else
                bits_in_buffer               <= 69;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 134 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(69 downto 0)         <= buf_input_r(133 downto 64);
            if in_rdy = '1' then
                buf_input_r(1072 downto 70)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1073;
            else
                bits_in_buffer               <= 70;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 135 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(70 downto 0)         <= buf_input_r(134 downto 64);
            if in_rdy = '1' then
                buf_input_r(1073 downto 71)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1074;
            else
                bits_in_buffer               <= 71;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 136 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(71 downto 0)         <= buf_input_r(135 downto 64);
            if in_rdy = '1' then
                buf_input_r(1074 downto 72)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1075;
            else
                bits_in_buffer               <= 72;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 137 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(72 downto 0)         <= buf_input_r(136 downto 64);
            if in_rdy = '1' then
                buf_input_r(1075 downto 73)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1076;
            else
                bits_in_buffer               <= 73;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 138 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(73 downto 0)         <= buf_input_r(137 downto 64);
            if in_rdy = '1' then
                buf_input_r(1076 downto 74)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1077;
            else
                bits_in_buffer               <= 74;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 139 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(74 downto 0)         <= buf_input_r(138 downto 64);
            if in_rdy = '1' then
                buf_input_r(1077 downto 75)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1078;
            else
                bits_in_buffer               <= 75;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 140 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(75 downto 0)         <= buf_input_r(139 downto 64);
            if in_rdy = '1' then
                buf_input_r(1078 downto 76)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1079;
            else
                bits_in_buffer               <= 76;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 141 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(76 downto 0)         <= buf_input_r(140 downto 64);
            if in_rdy = '1' then
                buf_input_r(1079 downto 77)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1080;
            else
                bits_in_buffer               <= 77;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 142 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(77 downto 0)         <= buf_input_r(141 downto 64);
            if in_rdy = '1' then
                buf_input_r(1080 downto 78)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1081;
            else
                bits_in_buffer               <= 78;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 143 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(78 downto 0)         <= buf_input_r(142 downto 64);
            if in_rdy = '1' then
                buf_input_r(1081 downto 79)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1082;
            else
                bits_in_buffer               <= 79;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 144 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(79 downto 0)         <= buf_input_r(143 downto 64);
            if in_rdy = '1' then
                buf_input_r(1082 downto 80)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1083;
            else
                bits_in_buffer               <= 80;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 145 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(80 downto 0)         <= buf_input_r(144 downto 64);
            if in_rdy = '1' then
                buf_input_r(1083 downto 81)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1084;
            else
                bits_in_buffer               <= 81;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 146 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(81 downto 0)         <= buf_input_r(145 downto 64);
            if in_rdy = '1' then
                buf_input_r(1084 downto 82)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1085;
            else
                bits_in_buffer               <= 82;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 147 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(82 downto 0)         <= buf_input_r(146 downto 64);
            if in_rdy = '1' then
                buf_input_r(1085 downto 83)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1086;
            else
                bits_in_buffer               <= 83;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 148 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(83 downto 0)         <= buf_input_r(147 downto 64);
            if in_rdy = '1' then
                buf_input_r(1086 downto 84)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1087;
            else
                bits_in_buffer               <= 84;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 149 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(84 downto 0)         <= buf_input_r(148 downto 64);
            if in_rdy = '1' then
                buf_input_r(1087 downto 85)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1088;
            else
                bits_in_buffer               <= 85;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 150 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(85 downto 0)         <= buf_input_r(149 downto 64);
            if in_rdy = '1' then
                buf_input_r(1088 downto 86)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1089;
            else
                bits_in_buffer               <= 86;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 151 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(86 downto 0)         <= buf_input_r(150 downto 64);
            if in_rdy = '1' then
                buf_input_r(1089 downto 87)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1090;
            else
                bits_in_buffer               <= 87;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 152 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(87 downto 0)         <= buf_input_r(151 downto 64);
            if in_rdy = '1' then
                buf_input_r(1090 downto 88)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1091;
            else
                bits_in_buffer               <= 88;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 153 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(88 downto 0)         <= buf_input_r(152 downto 64);
            if in_rdy = '1' then
                buf_input_r(1091 downto 89)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1092;
            else
                bits_in_buffer               <= 89;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 154 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(89 downto 0)         <= buf_input_r(153 downto 64);
            if in_rdy = '1' then
                buf_input_r(1092 downto 90)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1093;
            else
                bits_in_buffer               <= 90;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 155 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(90 downto 0)         <= buf_input_r(154 downto 64);
            if in_rdy = '1' then
                buf_input_r(1093 downto 91)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1094;
            else
                bits_in_buffer               <= 91;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 156 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(91 downto 0)         <= buf_input_r(155 downto 64);
            if in_rdy = '1' then
                buf_input_r(1094 downto 92)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1095;
            else
                bits_in_buffer               <= 92;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 157 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(92 downto 0)         <= buf_input_r(156 downto 64);
            if in_rdy = '1' then
                buf_input_r(1095 downto 93)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1096;
            else
                bits_in_buffer               <= 93;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 158 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(93 downto 0)         <= buf_input_r(157 downto 64);
            if in_rdy = '1' then
                buf_input_r(1096 downto 94)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1097;
            else
                bits_in_buffer               <= 94;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 159 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(94 downto 0)         <= buf_input_r(158 downto 64);
            if in_rdy = '1' then
                buf_input_r(1097 downto 95)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1098;
            else
                bits_in_buffer               <= 95;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 160 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(95 downto 0)         <= buf_input_r(159 downto 64);
            if in_rdy = '1' then
                buf_input_r(1098 downto 96)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1099;
            else
                bits_in_buffer               <= 96;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 161 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(96 downto 0)         <= buf_input_r(160 downto 64);
            if in_rdy = '1' then
                buf_input_r(1099 downto 97)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1100;
            else
                bits_in_buffer               <= 97;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 162 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(97 downto 0)         <= buf_input_r(161 downto 64);
            if in_rdy = '1' then
                buf_input_r(1100 downto 98)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1101;
            else
                bits_in_buffer               <= 98;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 163 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(98 downto 0)         <= buf_input_r(162 downto 64);
            if in_rdy = '1' then
                buf_input_r(1101 downto 99)  <= data_in(1002 downto 0);
                bits_in_buffer               <= 1102;
            else
                bits_in_buffer               <= 99;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 164 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(99 downto 0)         <= buf_input_r(163 downto 64);
            if in_rdy = '1' then
                buf_input_r(1102 downto 100) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1103;
            else
                bits_in_buffer               <= 100;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 165 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(100 downto 0)        <= buf_input_r(164 downto 64);
            if in_rdy = '1' then
                buf_input_r(1103 downto 101) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1104;
            else
                bits_in_buffer               <= 101;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 166 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(101 downto 0)        <= buf_input_r(165 downto 64);
            if in_rdy = '1' then
                buf_input_r(1104 downto 102) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1105;
            else
                bits_in_buffer               <= 102;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 167 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(102 downto 0)        <= buf_input_r(166 downto 64);
            if in_rdy = '1' then
                buf_input_r(1105 downto 103) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1106;
            else
                bits_in_buffer               <= 103;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 168 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(103 downto 0)        <= buf_input_r(167 downto 64);
            if in_rdy = '1' then
                buf_input_r(1106 downto 104) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1107;
            else
                bits_in_buffer               <= 104;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 169 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(104 downto 0)        <= buf_input_r(168 downto 64);
            if in_rdy = '1' then
                buf_input_r(1107 downto 105) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1108;
            else
                bits_in_buffer               <= 105;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 170 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(105 downto 0)        <= buf_input_r(169 downto 64);
            if in_rdy = '1' then
                buf_input_r(1108 downto 106) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1109;
            else
                bits_in_buffer               <= 106;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 171 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(106 downto 0)        <= buf_input_r(170 downto 64);
            if in_rdy = '1' then
                buf_input_r(1109 downto 107) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1110;
            else
                bits_in_buffer               <= 107;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 172 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(107 downto 0)        <= buf_input_r(171 downto 64);
            if in_rdy = '1' then
                buf_input_r(1110 downto 108) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1111;
            else
                bits_in_buffer               <= 108;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 173 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(108 downto 0)        <= buf_input_r(172 downto 64);
            if in_rdy = '1' then
                buf_input_r(1111 downto 109) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1112;
            else
                bits_in_buffer               <= 109;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 174 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(109 downto 0)        <= buf_input_r(173 downto 64);
            if in_rdy = '1' then
                buf_input_r(1112 downto 110) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1113;
            else
                bits_in_buffer               <= 110;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 175 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(110 downto 0)        <= buf_input_r(174 downto 64);
            if in_rdy = '1' then
                buf_input_r(1113 downto 111) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1114;
            else
                bits_in_buffer               <= 111;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 176 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(111 downto 0)        <= buf_input_r(175 downto 64);
            if in_rdy = '1' then
                buf_input_r(1114 downto 112) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1115;
            else
                bits_in_buffer               <= 112;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 177 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(112 downto 0)        <= buf_input_r(176 downto 64);
            if in_rdy = '1' then
                buf_input_r(1115 downto 113) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1116;
            else
                bits_in_buffer               <= 113;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 178 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(113 downto 0)        <= buf_input_r(177 downto 64);
            if in_rdy = '1' then
                buf_input_r(1116 downto 114) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1117;
            else
                bits_in_buffer               <= 114;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 179 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(114 downto 0)        <= buf_input_r(178 downto 64);
            if in_rdy = '1' then
                buf_input_r(1117 downto 115) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1118;
            else
                bits_in_buffer               <= 115;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 180 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(115 downto 0)        <= buf_input_r(179 downto 64);
            if in_rdy = '1' then
                buf_input_r(1118 downto 116) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1119;
            else
                bits_in_buffer               <= 116;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 181 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(116 downto 0)        <= buf_input_r(180 downto 64);
            if in_rdy = '1' then
                buf_input_r(1119 downto 117) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1120;
            else
                bits_in_buffer               <= 117;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 182 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(117 downto 0)        <= buf_input_r(181 downto 64);
            if in_rdy = '1' then
                buf_input_r(1120 downto 118) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1121;
            else
                bits_in_buffer               <= 118;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 183 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(118 downto 0)        <= buf_input_r(182 downto 64);
            if in_rdy = '1' then
                buf_input_r(1121 downto 119) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1122;
            else
                bits_in_buffer               <= 119;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 184 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(119 downto 0)        <= buf_input_r(183 downto 64);
            if in_rdy = '1' then
                buf_input_r(1122 downto 120) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1123;
            else
                bits_in_buffer               <= 120;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 185 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(120 downto 0)        <= buf_input_r(184 downto 64);
            if in_rdy = '1' then
                buf_input_r(1123 downto 121) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1124;
            else
                bits_in_buffer               <= 121;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 186 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(121 downto 0)        <= buf_input_r(185 downto 64);
            if in_rdy = '1' then
                buf_input_r(1124 downto 122) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1125;
            else
                bits_in_buffer               <= 122;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 187 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(122 downto 0)        <= buf_input_r(186 downto 64);
            if in_rdy = '1' then
                buf_input_r(1125 downto 123) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1126;
            else
                bits_in_buffer               <= 123;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 188 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(123 downto 0)        <= buf_input_r(187 downto 64);
            if in_rdy = '1' then
                buf_input_r(1126 downto 124) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1127;
            else
                bits_in_buffer               <= 124;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 189 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(124 downto 0)        <= buf_input_r(188 downto 64);
            if in_rdy = '1' then
                buf_input_r(1127 downto 125) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1128;
            else
                bits_in_buffer               <= 125;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 190 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(125 downto 0)        <= buf_input_r(189 downto 64);
            if in_rdy = '1' then
                buf_input_r(1128 downto 126) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1129;
            else
                bits_in_buffer               <= 126;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 191 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(126 downto 0)        <= buf_input_r(190 downto 64);
            if in_rdy = '1' then
                buf_input_r(1129 downto 127) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1130;
            else
                bits_in_buffer               <= 127;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 192 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(127 downto 0)        <= buf_input_r(191 downto 64);
            if in_rdy = '1' then
                buf_input_r(1130 downto 128) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1131;
            else
                bits_in_buffer               <= 128;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 193 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(128 downto 0)        <= buf_input_r(192 downto 64);
            if in_rdy = '1' then
                buf_input_r(1131 downto 129) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1132;
            else
                bits_in_buffer               <= 129;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 194 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(129 downto 0)        <= buf_input_r(193 downto 64);
            if in_rdy = '1' then
                buf_input_r(1132 downto 130) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1133;
            else
                bits_in_buffer               <= 130;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 195 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(130 downto 0)        <= buf_input_r(194 downto 64);
            if in_rdy = '1' then
                buf_input_r(1133 downto 131) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1134;
            else
                bits_in_buffer               <= 131;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 196 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(131 downto 0)        <= buf_input_r(195 downto 64);
            if in_rdy = '1' then
                buf_input_r(1134 downto 132) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1135;
            else
                bits_in_buffer               <= 132;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 197 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(132 downto 0)        <= buf_input_r(196 downto 64);
            if in_rdy = '1' then
                buf_input_r(1135 downto 133) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1136;
            else
                bits_in_buffer               <= 133;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 198 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(133 downto 0)        <= buf_input_r(197 downto 64);
            if in_rdy = '1' then
                buf_input_r(1136 downto 134) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1137;
            else
                bits_in_buffer               <= 134;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 199 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(134 downto 0)        <= buf_input_r(198 downto 64);
            if in_rdy = '1' then
                buf_input_r(1137 downto 135) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1138;
            else
                bits_in_buffer               <= 135;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 200 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(135 downto 0)        <= buf_input_r(199 downto 64);
            if in_rdy = '1' then
                buf_input_r(1138 downto 136) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1139;
            else
                bits_in_buffer               <= 136;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 201 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(136 downto 0)        <= buf_input_r(200 downto 64);
            if in_rdy = '1' then
                buf_input_r(1139 downto 137) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1140;
            else
                bits_in_buffer               <= 137;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 202 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(137 downto 0)        <= buf_input_r(201 downto 64);
            if in_rdy = '1' then
                buf_input_r(1140 downto 138) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1141;
            else
                bits_in_buffer               <= 138;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 203 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(138 downto 0)        <= buf_input_r(202 downto 64);
            if in_rdy = '1' then
                buf_input_r(1141 downto 139) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1142;
            else
                bits_in_buffer               <= 139;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 204 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(139 downto 0)        <= buf_input_r(203 downto 64);
            if in_rdy = '1' then
                buf_input_r(1142 downto 140) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1143;
            else
                bits_in_buffer               <= 140;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 205 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(140 downto 0)        <= buf_input_r(204 downto 64);
            if in_rdy = '1' then
                buf_input_r(1143 downto 141) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1144;
            else
                bits_in_buffer               <= 141;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 206 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(141 downto 0)        <= buf_input_r(205 downto 64);
            if in_rdy = '1' then
                buf_input_r(1144 downto 142) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1145;
            else
                bits_in_buffer               <= 142;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 207 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(142 downto 0)        <= buf_input_r(206 downto 64);
            if in_rdy = '1' then
                buf_input_r(1145 downto 143) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1146;
            else
                bits_in_buffer               <= 143;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 208 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(143 downto 0)        <= buf_input_r(207 downto 64);
            if in_rdy = '1' then
                buf_input_r(1146 downto 144) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1147;
            else
                bits_in_buffer               <= 144;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 209 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(144 downto 0)        <= buf_input_r(208 downto 64);
            if in_rdy = '1' then
                buf_input_r(1147 downto 145) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1148;
            else
                bits_in_buffer               <= 145;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 210 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(145 downto 0)        <= buf_input_r(209 downto 64);
            if in_rdy = '1' then
                buf_input_r(1148 downto 146) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1149;
            else
                bits_in_buffer               <= 146;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 211 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(146 downto 0)        <= buf_input_r(210 downto 64);
            if in_rdy = '1' then
                buf_input_r(1149 downto 147) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1150;
            else
                bits_in_buffer               <= 147;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 212 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(147 downto 0)        <= buf_input_r(211 downto 64);
            if in_rdy = '1' then
                buf_input_r(1150 downto 148) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1151;
            else
                bits_in_buffer               <= 148;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 213 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(148 downto 0)        <= buf_input_r(212 downto 64);
            if in_rdy = '1' then
                buf_input_r(1151 downto 149) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1152;
            else
                bits_in_buffer               <= 149;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 214 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(149 downto 0)        <= buf_input_r(213 downto 64);
            if in_rdy = '1' then
                buf_input_r(1152 downto 150) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1153;
            else
                bits_in_buffer               <= 150;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 215 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(150 downto 0)        <= buf_input_r(214 downto 64);
            if in_rdy = '1' then
                buf_input_r(1153 downto 151) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1154;
            else
                bits_in_buffer               <= 151;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 216 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(151 downto 0)        <= buf_input_r(215 downto 64);
            if in_rdy = '1' then
                buf_input_r(1154 downto 152) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1155;
            else
                bits_in_buffer               <= 152;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 217 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(152 downto 0)        <= buf_input_r(216 downto 64);
            if in_rdy = '1' then
                buf_input_r(1155 downto 153) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1156;
            else
                bits_in_buffer               <= 153;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 218 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(153 downto 0)        <= buf_input_r(217 downto 64);
            if in_rdy = '1' then
                buf_input_r(1156 downto 154) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1157;
            else
                bits_in_buffer               <= 154;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 219 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(154 downto 0)        <= buf_input_r(218 downto 64);
            if in_rdy = '1' then
                buf_input_r(1157 downto 155) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1158;
            else
                bits_in_buffer               <= 155;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 220 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(155 downto 0)        <= buf_input_r(219 downto 64);
            if in_rdy = '1' then
                buf_input_r(1158 downto 156) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1159;
            else
                bits_in_buffer               <= 156;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 221 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(156 downto 0)        <= buf_input_r(220 downto 64);
            if in_rdy = '1' then
                buf_input_r(1159 downto 157) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1160;
            else
                bits_in_buffer               <= 157;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 222 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(157 downto 0)        <= buf_input_r(221 downto 64);
            if in_rdy = '1' then
                buf_input_r(1160 downto 158) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1161;
            else
                bits_in_buffer               <= 158;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 223 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(158 downto 0)        <= buf_input_r(222 downto 64);
            if in_rdy = '1' then
                buf_input_r(1161 downto 159) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1162;
            else
                bits_in_buffer               <= 159;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 224 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(159 downto 0)        <= buf_input_r(223 downto 64);
            if in_rdy = '1' then
                buf_input_r(1162 downto 160) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1163;
            else
                bits_in_buffer               <= 160;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 225 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(160 downto 0)        <= buf_input_r(224 downto 64);
            if in_rdy = '1' then
                buf_input_r(1163 downto 161) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1164;
            else
                bits_in_buffer               <= 161;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 226 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(161 downto 0)        <= buf_input_r(225 downto 64);
            if in_rdy = '1' then
                buf_input_r(1164 downto 162) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1165;
            else
                bits_in_buffer               <= 162;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 227 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(162 downto 0)        <= buf_input_r(226 downto 64);
            if in_rdy = '1' then
                buf_input_r(1165 downto 163) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1166;
            else
                bits_in_buffer               <= 163;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 228 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(163 downto 0)        <= buf_input_r(227 downto 64);
            if in_rdy = '1' then
                buf_input_r(1166 downto 164) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1167;
            else
                bits_in_buffer               <= 164;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 229 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(164 downto 0)        <= buf_input_r(228 downto 64);
            if in_rdy = '1' then
                buf_input_r(1167 downto 165) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1168;
            else
                bits_in_buffer               <= 165;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 230 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(165 downto 0)        <= buf_input_r(229 downto 64);
            if in_rdy = '1' then
                buf_input_r(1168 downto 166) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1169;
            else
                bits_in_buffer               <= 166;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 231 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(166 downto 0)        <= buf_input_r(230 downto 64);
            if in_rdy = '1' then
                buf_input_r(1169 downto 167) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1170;
            else
                bits_in_buffer               <= 167;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 232 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(167 downto 0)        <= buf_input_r(231 downto 64);
            if in_rdy = '1' then
                buf_input_r(1170 downto 168) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1171;
            else
                bits_in_buffer               <= 168;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 233 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(168 downto 0)        <= buf_input_r(232 downto 64);
            if in_rdy = '1' then
                buf_input_r(1171 downto 169) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1172;
            else
                bits_in_buffer               <= 169;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 234 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(169 downto 0)        <= buf_input_r(233 downto 64);
            if in_rdy = '1' then
                buf_input_r(1172 downto 170) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1173;
            else
                bits_in_buffer               <= 170;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 235 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(170 downto 0)        <= buf_input_r(234 downto 64);
            if in_rdy = '1' then
                buf_input_r(1173 downto 171) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1174;
            else
                bits_in_buffer               <= 171;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 236 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(171 downto 0)        <= buf_input_r(235 downto 64);
            if in_rdy = '1' then
                buf_input_r(1174 downto 172) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1175;
            else
                bits_in_buffer               <= 172;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 237 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(172 downto 0)        <= buf_input_r(236 downto 64);
            if in_rdy = '1' then
                buf_input_r(1175 downto 173) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1176;
            else
                bits_in_buffer               <= 173;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 238 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(173 downto 0)        <= buf_input_r(237 downto 64);
            if in_rdy = '1' then
                buf_input_r(1176 downto 174) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1177;
            else
                bits_in_buffer               <= 174;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 239 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(174 downto 0)        <= buf_input_r(238 downto 64);
            if in_rdy = '1' then
                buf_input_r(1177 downto 175) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1178;
            else
                bits_in_buffer               <= 175;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 240 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(175 downto 0)        <= buf_input_r(239 downto 64);
            if in_rdy = '1' then
                buf_input_r(1178 downto 176) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1179;
            else
                bits_in_buffer               <= 176;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 241 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(176 downto 0)        <= buf_input_r(240 downto 64);
            if in_rdy = '1' then
                buf_input_r(1179 downto 177) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1180;
            else
                bits_in_buffer               <= 177;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 242 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(177 downto 0)        <= buf_input_r(241 downto 64);
            if in_rdy = '1' then
                buf_input_r(1180 downto 178) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1181;
            else
                bits_in_buffer               <= 178;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 243 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(178 downto 0)        <= buf_input_r(242 downto 64);
            if in_rdy = '1' then
                buf_input_r(1181 downto 179) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1182;
            else
                bits_in_buffer               <= 179;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 244 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(179 downto 0)        <= buf_input_r(243 downto 64);
            if in_rdy = '1' then
                buf_input_r(1182 downto 180) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1183;
            else
                bits_in_buffer               <= 180;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 245 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(180 downto 0)        <= buf_input_r(244 downto 64);
            if in_rdy = '1' then
                buf_input_r(1183 downto 181) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1184;
            else
                bits_in_buffer               <= 181;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 246 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(181 downto 0)        <= buf_input_r(245 downto 64);
            if in_rdy = '1' then
                buf_input_r(1184 downto 182) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1185;
            else
                bits_in_buffer               <= 182;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 247 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(182 downto 0)        <= buf_input_r(246 downto 64);
            if in_rdy = '1' then
                buf_input_r(1185 downto 183) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1186;
            else
                bits_in_buffer               <= 183;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 248 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(183 downto 0)        <= buf_input_r(247 downto 64);
            if in_rdy = '1' then
                buf_input_r(1186 downto 184) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1187;
            else
                bits_in_buffer               <= 184;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 249 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(184 downto 0)        <= buf_input_r(248 downto 64);
            if in_rdy = '1' then
                buf_input_r(1187 downto 185) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1188;
            else
                bits_in_buffer               <= 185;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 250 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(185 downto 0)        <= buf_input_r(249 downto 64);
            if in_rdy = '1' then
                buf_input_r(1188 downto 186) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1189;
            else
                bits_in_buffer               <= 186;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 251 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(186 downto 0)        <= buf_input_r(250 downto 64);
            if in_rdy = '1' then
                buf_input_r(1189 downto 187) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1190;
            else
                bits_in_buffer               <= 187;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 252 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(187 downto 0)        <= buf_input_r(251 downto 64);
            if in_rdy = '1' then
                buf_input_r(1190 downto 188) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1191;
            else
                bits_in_buffer               <= 188;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 253 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(188 downto 0)        <= buf_input_r(252 downto 64);
            if in_rdy = '1' then
                buf_input_r(1191 downto 189) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1192;
            else
                bits_in_buffer               <= 189;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 254 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(189 downto 0)        <= buf_input_r(253 downto 64);
            if in_rdy = '1' then
                buf_input_r(1192 downto 190) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1193;
            else
                bits_in_buffer               <= 190;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 255 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(190 downto 0)        <= buf_input_r(254 downto 64);
            if in_rdy = '1' then
                buf_input_r(1193 downto 191) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1194;
            else
                bits_in_buffer               <= 191;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 256 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(191 downto 0)        <= buf_input_r(255 downto 64);
            if in_rdy = '1' then
                buf_input_r(1194 downto 192) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1195;
            else
                bits_in_buffer               <= 192;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 257 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(192 downto 0)        <= buf_input_r(256 downto 64);
            if in_rdy = '1' then
                buf_input_r(1195 downto 193) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1196;
            else
                bits_in_buffer               <= 193;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 258 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(193 downto 0)        <= buf_input_r(257 downto 64);
            if in_rdy = '1' then
                buf_input_r(1196 downto 194) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1197;
            else
                bits_in_buffer               <= 194;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 259 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(194 downto 0)        <= buf_input_r(258 downto 64);
            if in_rdy = '1' then
                buf_input_r(1197 downto 195) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1198;
            else
                bits_in_buffer               <= 195;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 260 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(195 downto 0)        <= buf_input_r(259 downto 64);
            if in_rdy = '1' then
                buf_input_r(1198 downto 196) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1199;
            else
                bits_in_buffer               <= 196;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 261 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(196 downto 0)        <= buf_input_r(260 downto 64);
            if in_rdy = '1' then
                buf_input_r(1199 downto 197) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1200;
            else
                bits_in_buffer               <= 197;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 262 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(197 downto 0)        <= buf_input_r(261 downto 64);
            if in_rdy = '1' then
                buf_input_r(1200 downto 198) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1201;
            else
                bits_in_buffer               <= 198;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 263 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(198 downto 0)        <= buf_input_r(262 downto 64);
            if in_rdy = '1' then
                buf_input_r(1201 downto 199) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1202;
            else
                bits_in_buffer               <= 199;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 264 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(199 downto 0)        <= buf_input_r(263 downto 64);
            if in_rdy = '1' then
                buf_input_r(1202 downto 200) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1203;
            else
                bits_in_buffer               <= 200;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 265 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(200 downto 0)        <= buf_input_r(264 downto 64);
            if in_rdy = '1' then
                buf_input_r(1203 downto 201) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1204;
            else
                bits_in_buffer               <= 201;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 266 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(201 downto 0)        <= buf_input_r(265 downto 64);
            if in_rdy = '1' then
                buf_input_r(1204 downto 202) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1205;
            else
                bits_in_buffer               <= 202;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 267 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(202 downto 0)        <= buf_input_r(266 downto 64);
            if in_rdy = '1' then
                buf_input_r(1205 downto 203) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1206;
            else
                bits_in_buffer               <= 203;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 268 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(203 downto 0)        <= buf_input_r(267 downto 64);
            if in_rdy = '1' then
                buf_input_r(1206 downto 204) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1207;
            else
                bits_in_buffer               <= 204;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 269 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(204 downto 0)        <= buf_input_r(268 downto 64);
            if in_rdy = '1' then
                buf_input_r(1207 downto 205) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1208;
            else
                bits_in_buffer               <= 205;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 270 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(205 downto 0)        <= buf_input_r(269 downto 64);
            if in_rdy = '1' then
                buf_input_r(1208 downto 206) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1209;
            else
                bits_in_buffer               <= 206;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 271 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(206 downto 0)        <= buf_input_r(270 downto 64);
            if in_rdy = '1' then
                buf_input_r(1209 downto 207) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1210;
            else
                bits_in_buffer               <= 207;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 272 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(207 downto 0)        <= buf_input_r(271 downto 64);
            if in_rdy = '1' then
                buf_input_r(1210 downto 208) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1211;
            else
                bits_in_buffer               <= 208;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 273 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(208 downto 0)        <= buf_input_r(272 downto 64);
            if in_rdy = '1' then
                buf_input_r(1211 downto 209) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1212;
            else
                bits_in_buffer               <= 209;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 274 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(209 downto 0)        <= buf_input_r(273 downto 64);
            if in_rdy = '1' then
                buf_input_r(1212 downto 210) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1213;
            else
                bits_in_buffer               <= 210;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 275 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(210 downto 0)        <= buf_input_r(274 downto 64);
            if in_rdy = '1' then
                buf_input_r(1213 downto 211) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1214;
            else
                bits_in_buffer               <= 211;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 276 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(211 downto 0)        <= buf_input_r(275 downto 64);
            if in_rdy = '1' then
                buf_input_r(1214 downto 212) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1215;
            else
                bits_in_buffer               <= 212;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 277 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(212 downto 0)        <= buf_input_r(276 downto 64);
            if in_rdy = '1' then
                buf_input_r(1215 downto 213) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1216;
            else
                bits_in_buffer               <= 213;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 278 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(213 downto 0)        <= buf_input_r(277 downto 64);
            if in_rdy = '1' then
                buf_input_r(1216 downto 214) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1217;
            else
                bits_in_buffer               <= 214;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 279 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(214 downto 0)        <= buf_input_r(278 downto 64);
            if in_rdy = '1' then
                buf_input_r(1217 downto 215) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1218;
            else
                bits_in_buffer               <= 215;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 280 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(215 downto 0)        <= buf_input_r(279 downto 64);
            if in_rdy = '1' then
                buf_input_r(1218 downto 216) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1219;
            else
                bits_in_buffer               <= 216;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 281 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(216 downto 0)        <= buf_input_r(280 downto 64);
            if in_rdy = '1' then
                buf_input_r(1219 downto 217) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1220;
            else
                bits_in_buffer               <= 217;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 282 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(217 downto 0)        <= buf_input_r(281 downto 64);
            if in_rdy = '1' then
                buf_input_r(1220 downto 218) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1221;
            else
                bits_in_buffer               <= 218;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 283 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(218 downto 0)        <= buf_input_r(282 downto 64);
            if in_rdy = '1' then
                buf_input_r(1221 downto 219) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1222;
            else
                bits_in_buffer               <= 219;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 284 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(219 downto 0)        <= buf_input_r(283 downto 64);
            if in_rdy = '1' then
                buf_input_r(1222 downto 220) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1223;
            else
                bits_in_buffer               <= 220;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 285 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(220 downto 0)        <= buf_input_r(284 downto 64);
            if in_rdy = '1' then
                buf_input_r(1223 downto 221) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1224;
            else
                bits_in_buffer               <= 221;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 286 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(221 downto 0)        <= buf_input_r(285 downto 64);
            if in_rdy = '1' then
                buf_input_r(1224 downto 222) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1225;
            else
                bits_in_buffer               <= 222;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 287 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(222 downto 0)        <= buf_input_r(286 downto 64);
            if in_rdy = '1' then
                buf_input_r(1225 downto 223) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1226;
            else
                bits_in_buffer               <= 223;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 288 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(223 downto 0)        <= buf_input_r(287 downto 64);
            if in_rdy = '1' then
                buf_input_r(1226 downto 224) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1227;
            else
                bits_in_buffer               <= 224;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 289 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(224 downto 0)        <= buf_input_r(288 downto 64);
            if in_rdy = '1' then
                buf_input_r(1227 downto 225) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1228;
            else
                bits_in_buffer               <= 225;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 290 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(225 downto 0)        <= buf_input_r(289 downto 64);
            if in_rdy = '1' then
                buf_input_r(1228 downto 226) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1229;
            else
                bits_in_buffer               <= 226;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 291 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(226 downto 0)        <= buf_input_r(290 downto 64);
            if in_rdy = '1' then
                buf_input_r(1229 downto 227) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1230;
            else
                bits_in_buffer               <= 227;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 292 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(227 downto 0)        <= buf_input_r(291 downto 64);
            if in_rdy = '1' then
                buf_input_r(1230 downto 228) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1231;
            else
                bits_in_buffer               <= 228;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 293 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(228 downto 0)        <= buf_input_r(292 downto 64);
            if in_rdy = '1' then
                buf_input_r(1231 downto 229) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1232;
            else
                bits_in_buffer               <= 229;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 294 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(229 downto 0)        <= buf_input_r(293 downto 64);
            if in_rdy = '1' then
                buf_input_r(1232 downto 230) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1233;
            else
                bits_in_buffer               <= 230;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 295 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(230 downto 0)        <= buf_input_r(294 downto 64);
            if in_rdy = '1' then
                buf_input_r(1233 downto 231) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1234;
            else
                bits_in_buffer               <= 231;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 296 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(231 downto 0)        <= buf_input_r(295 downto 64);
            if in_rdy = '1' then
                buf_input_r(1234 downto 232) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1235;
            else
                bits_in_buffer               <= 232;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 297 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(232 downto 0)        <= buf_input_r(296 downto 64);
            if in_rdy = '1' then
                buf_input_r(1235 downto 233) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1236;
            else
                bits_in_buffer               <= 233;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 298 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(233 downto 0)        <= buf_input_r(297 downto 64);
            if in_rdy = '1' then
                buf_input_r(1236 downto 234) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1237;
            else
                bits_in_buffer               <= 234;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 299 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(234 downto 0)        <= buf_input_r(298 downto 64);
            if in_rdy = '1' then
                buf_input_r(1237 downto 235) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1238;
            else
                bits_in_buffer               <= 235;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 300 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(235 downto 0)        <= buf_input_r(299 downto 64);
            if in_rdy = '1' then
                buf_input_r(1238 downto 236) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1239;
            else
                bits_in_buffer               <= 236;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 301 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(236 downto 0)        <= buf_input_r(300 downto 64);
            if in_rdy = '1' then
                buf_input_r(1239 downto 237) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1240;
            else
                bits_in_buffer               <= 237;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 302 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(237 downto 0)        <= buf_input_r(301 downto 64);
            if in_rdy = '1' then
                buf_input_r(1240 downto 238) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1241;
            else
                bits_in_buffer               <= 238;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 303 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(238 downto 0)        <= buf_input_r(302 downto 64);
            if in_rdy = '1' then
                buf_input_r(1241 downto 239) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1242;
            else
                bits_in_buffer               <= 239;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 304 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(239 downto 0)        <= buf_input_r(303 downto 64);
            if in_rdy = '1' then
                buf_input_r(1242 downto 240) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1243;
            else
                bits_in_buffer               <= 240;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 305 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(240 downto 0)        <= buf_input_r(304 downto 64);
            if in_rdy = '1' then
                buf_input_r(1243 downto 241) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1244;
            else
                bits_in_buffer               <= 241;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 306 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(241 downto 0)        <= buf_input_r(305 downto 64);
            if in_rdy = '1' then
                buf_input_r(1244 downto 242) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1245;
            else
                bits_in_buffer               <= 242;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 307 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(242 downto 0)        <= buf_input_r(306 downto 64);
            if in_rdy = '1' then
                buf_input_r(1245 downto 243) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1246;
            else
                bits_in_buffer               <= 243;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 308 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(243 downto 0)        <= buf_input_r(307 downto 64);
            if in_rdy = '1' then
                buf_input_r(1246 downto 244) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1247;
            else
                bits_in_buffer               <= 244;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 309 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(244 downto 0)        <= buf_input_r(308 downto 64);
            if in_rdy = '1' then
                buf_input_r(1247 downto 245) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1248;
            else
                bits_in_buffer               <= 245;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 310 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(245 downto 0)        <= buf_input_r(309 downto 64);
            if in_rdy = '1' then
                buf_input_r(1248 downto 246) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1249;
            else
                bits_in_buffer               <= 246;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 311 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(246 downto 0)        <= buf_input_r(310 downto 64);
            if in_rdy = '1' then
                buf_input_r(1249 downto 247) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1250;
            else
                bits_in_buffer               <= 247;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 312 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(247 downto 0)        <= buf_input_r(311 downto 64);
            if in_rdy = '1' then
                buf_input_r(1250 downto 248) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1251;
            else
                bits_in_buffer               <= 248;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 313 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(248 downto 0)        <= buf_input_r(312 downto 64);
            if in_rdy = '1' then
                buf_input_r(1251 downto 249) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1252;
            else
                bits_in_buffer               <= 249;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 314 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(249 downto 0)        <= buf_input_r(313 downto 64);
            if in_rdy = '1' then
                buf_input_r(1252 downto 250) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1253;
            else
                bits_in_buffer               <= 250;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 315 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(250 downto 0)        <= buf_input_r(314 downto 64);
            if in_rdy = '1' then
                buf_input_r(1253 downto 251) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1254;
            else
                bits_in_buffer               <= 251;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 316 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(251 downto 0)        <= buf_input_r(315 downto 64);
            if in_rdy = '1' then
                buf_input_r(1254 downto 252) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1255;
            else
                bits_in_buffer               <= 252;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 317 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(252 downto 0)        <= buf_input_r(316 downto 64);
            if in_rdy = '1' then
                buf_input_r(1255 downto 253) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1256;
            else
                bits_in_buffer               <= 253;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 318 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(253 downto 0)        <= buf_input_r(317 downto 64);
            if in_rdy = '1' then
                buf_input_r(1256 downto 254) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1257;
            else
                bits_in_buffer               <= 254;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 319 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(254 downto 0)        <= buf_input_r(318 downto 64);
            if in_rdy = '1' then
                buf_input_r(1257 downto 255) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1258;
            else
                bits_in_buffer               <= 255;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 320 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(255 downto 0)        <= buf_input_r(319 downto 64);
            if in_rdy = '1' then
                buf_input_r(1258 downto 256) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1259;
            else
                bits_in_buffer               <= 256;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 321 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(256 downto 0)        <= buf_input_r(320 downto 64);
            if in_rdy = '1' then
                buf_input_r(1259 downto 257) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1260;
            else
                bits_in_buffer               <= 257;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 322 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(257 downto 0)        <= buf_input_r(321 downto 64);
            if in_rdy = '1' then
                buf_input_r(1260 downto 258) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1261;
            else
                bits_in_buffer               <= 258;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 323 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(258 downto 0)        <= buf_input_r(322 downto 64);
            if in_rdy = '1' then
                buf_input_r(1261 downto 259) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1262;
            else
                bits_in_buffer               <= 259;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 324 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(259 downto 0)        <= buf_input_r(323 downto 64);
            if in_rdy = '1' then
                buf_input_r(1262 downto 260) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1263;
            else
                bits_in_buffer               <= 260;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 325 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(260 downto 0)        <= buf_input_r(324 downto 64);
            if in_rdy = '1' then
                buf_input_r(1263 downto 261) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1264;
            else
                bits_in_buffer               <= 261;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 326 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(261 downto 0)        <= buf_input_r(325 downto 64);
            if in_rdy = '1' then
                buf_input_r(1264 downto 262) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1265;
            else
                bits_in_buffer               <= 262;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 327 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(262 downto 0)        <= buf_input_r(326 downto 64);
            if in_rdy = '1' then
                buf_input_r(1265 downto 263) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1266;
            else
                bits_in_buffer               <= 263;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 328 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(263 downto 0)        <= buf_input_r(327 downto 64);
            if in_rdy = '1' then
                buf_input_r(1266 downto 264) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1267;
            else
                bits_in_buffer               <= 264;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 329 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(264 downto 0)        <= buf_input_r(328 downto 64);
            if in_rdy = '1' then
                buf_input_r(1267 downto 265) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1268;
            else
                bits_in_buffer               <= 265;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 330 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(265 downto 0)        <= buf_input_r(329 downto 64);
            if in_rdy = '1' then
                buf_input_r(1268 downto 266) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1269;
            else
                bits_in_buffer               <= 266;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 331 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(266 downto 0)        <= buf_input_r(330 downto 64);
            if in_rdy = '1' then
                buf_input_r(1269 downto 267) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1270;
            else
                bits_in_buffer               <= 267;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 332 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(267 downto 0)        <= buf_input_r(331 downto 64);
            if in_rdy = '1' then
                buf_input_r(1270 downto 268) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1271;
            else
                bits_in_buffer               <= 268;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 333 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(268 downto 0)        <= buf_input_r(332 downto 64);
            if in_rdy = '1' then
                buf_input_r(1271 downto 269) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1272;
            else
                bits_in_buffer               <= 269;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 334 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(269 downto 0)        <= buf_input_r(333 downto 64);
            if in_rdy = '1' then
                buf_input_r(1272 downto 270) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1273;
            else
                bits_in_buffer               <= 270;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 335 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(270 downto 0)        <= buf_input_r(334 downto 64);
            if in_rdy = '1' then
                buf_input_r(1273 downto 271) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1274;
            else
                bits_in_buffer               <= 271;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 336 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(271 downto 0)        <= buf_input_r(335 downto 64);
            if in_rdy = '1' then
                buf_input_r(1274 downto 272) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1275;
            else
                bits_in_buffer               <= 272;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 337 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(272 downto 0)        <= buf_input_r(336 downto 64);
            if in_rdy = '1' then
                buf_input_r(1275 downto 273) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1276;
            else
                bits_in_buffer               <= 273;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 338 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(273 downto 0)        <= buf_input_r(337 downto 64);
            if in_rdy = '1' then
                buf_input_r(1276 downto 274) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1277;
            else
                bits_in_buffer               <= 274;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 339 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(274 downto 0)        <= buf_input_r(338 downto 64);
            if in_rdy = '1' then
                buf_input_r(1277 downto 275) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1278;
            else
                bits_in_buffer               <= 275;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 340 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(275 downto 0)        <= buf_input_r(339 downto 64);
            if in_rdy = '1' then
                buf_input_r(1278 downto 276) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1279;
            else
                bits_in_buffer               <= 276;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 341 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(276 downto 0)        <= buf_input_r(340 downto 64);
            if in_rdy = '1' then
                buf_input_r(1279 downto 277) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1280;
            else
                bits_in_buffer               <= 277;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 342 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(277 downto 0)        <= buf_input_r(341 downto 64);
            if in_rdy = '1' then
                buf_input_r(1280 downto 278) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1281;
            else
                bits_in_buffer               <= 278;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 343 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(278 downto 0)        <= buf_input_r(342 downto 64);
            if in_rdy = '1' then
                buf_input_r(1281 downto 279) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1282;
            else
                bits_in_buffer               <= 279;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 344 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(279 downto 0)        <= buf_input_r(343 downto 64);
            if in_rdy = '1' then
                buf_input_r(1282 downto 280) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1283;
            else
                bits_in_buffer               <= 280;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 345 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(280 downto 0)        <= buf_input_r(344 downto 64);
            if in_rdy = '1' then
                buf_input_r(1283 downto 281) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1284;
            else
                bits_in_buffer               <= 281;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 346 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(281 downto 0)        <= buf_input_r(345 downto 64);
            if in_rdy = '1' then
                buf_input_r(1284 downto 282) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1285;
            else
                bits_in_buffer               <= 282;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 347 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(282 downto 0)        <= buf_input_r(346 downto 64);
            if in_rdy = '1' then
                buf_input_r(1285 downto 283) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1286;
            else
                bits_in_buffer               <= 283;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 348 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(283 downto 0)        <= buf_input_r(347 downto 64);
            if in_rdy = '1' then
                buf_input_r(1286 downto 284) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1287;
            else
                bits_in_buffer               <= 284;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 349 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(284 downto 0)        <= buf_input_r(348 downto 64);
            if in_rdy = '1' then
                buf_input_r(1287 downto 285) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1288;
            else
                bits_in_buffer               <= 285;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 350 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(285 downto 0)        <= buf_input_r(349 downto 64);
            if in_rdy = '1' then
                buf_input_r(1288 downto 286) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1289;
            else
                bits_in_buffer               <= 286;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 351 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(286 downto 0)        <= buf_input_r(350 downto 64);
            if in_rdy = '1' then
                buf_input_r(1289 downto 287) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1290;
            else
                bits_in_buffer               <= 287;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 352 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(287 downto 0)        <= buf_input_r(351 downto 64);
            if in_rdy = '1' then
                buf_input_r(1290 downto 288) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1291;
            else
                bits_in_buffer               <= 288;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 353 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(288 downto 0)        <= buf_input_r(352 downto 64);
            if in_rdy = '1' then
                buf_input_r(1291 downto 289) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1292;
            else
                bits_in_buffer               <= 289;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 354 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(289 downto 0)        <= buf_input_r(353 downto 64);
            if in_rdy = '1' then
                buf_input_r(1292 downto 290) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1293;
            else
                bits_in_buffer               <= 290;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 355 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(290 downto 0)        <= buf_input_r(354 downto 64);
            if in_rdy = '1' then
                buf_input_r(1293 downto 291) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1294;
            else
                bits_in_buffer               <= 291;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 356 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(291 downto 0)        <= buf_input_r(355 downto 64);
            if in_rdy = '1' then
                buf_input_r(1294 downto 292) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1295;
            else
                bits_in_buffer               <= 292;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 357 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(292 downto 0)        <= buf_input_r(356 downto 64);
            if in_rdy = '1' then
                buf_input_r(1295 downto 293) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1296;
            else
                bits_in_buffer               <= 293;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 358 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(293 downto 0)        <= buf_input_r(357 downto 64);
            if in_rdy = '1' then
                buf_input_r(1296 downto 294) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1297;
            else
                bits_in_buffer               <= 294;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 359 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(294 downto 0)        <= buf_input_r(358 downto 64);
            if in_rdy = '1' then
                buf_input_r(1297 downto 295) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1298;
            else
                bits_in_buffer               <= 295;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 360 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(295 downto 0)        <= buf_input_r(359 downto 64);
            if in_rdy = '1' then
                buf_input_r(1298 downto 296) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1299;
            else
                bits_in_buffer               <= 296;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 361 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(296 downto 0)        <= buf_input_r(360 downto 64);
            if in_rdy = '1' then
                buf_input_r(1299 downto 297) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1300;
            else
                bits_in_buffer               <= 297;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 362 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(297 downto 0)        <= buf_input_r(361 downto 64);
            if in_rdy = '1' then
                buf_input_r(1300 downto 298) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1301;
            else
                bits_in_buffer               <= 298;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 363 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(298 downto 0)        <= buf_input_r(362 downto 64);
            if in_rdy = '1' then
                buf_input_r(1301 downto 299) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1302;
            else
                bits_in_buffer               <= 299;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 364 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(299 downto 0)        <= buf_input_r(363 downto 64);
            if in_rdy = '1' then
                buf_input_r(1302 downto 300) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1303;
            else
                bits_in_buffer               <= 300;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 365 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(300 downto 0)        <= buf_input_r(364 downto 64);
            if in_rdy = '1' then
                buf_input_r(1303 downto 301) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1304;
            else
                bits_in_buffer               <= 301;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 366 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(301 downto 0)        <= buf_input_r(365 downto 64);
            if in_rdy = '1' then
                buf_input_r(1304 downto 302) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1305;
            else
                bits_in_buffer               <= 302;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 367 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(302 downto 0)        <= buf_input_r(366 downto 64);
            if in_rdy = '1' then
                buf_input_r(1305 downto 303) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1306;
            else
                bits_in_buffer               <= 303;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 368 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(303 downto 0)        <= buf_input_r(367 downto 64);
            if in_rdy = '1' then
                buf_input_r(1306 downto 304) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1307;
            else
                bits_in_buffer               <= 304;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 369 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(304 downto 0)        <= buf_input_r(368 downto 64);
            if in_rdy = '1' then
                buf_input_r(1307 downto 305) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1308;
            else
                bits_in_buffer               <= 305;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 370 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(305 downto 0)        <= buf_input_r(369 downto 64);
            if in_rdy = '1' then
                buf_input_r(1308 downto 306) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1309;
            else
                bits_in_buffer               <= 306;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 371 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(306 downto 0)        <= buf_input_r(370 downto 64);
            if in_rdy = '1' then
                buf_input_r(1309 downto 307) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1310;
            else
                bits_in_buffer               <= 307;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 372 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(307 downto 0)        <= buf_input_r(371 downto 64);
            if in_rdy = '1' then
                buf_input_r(1310 downto 308) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1311;
            else
                bits_in_buffer               <= 308;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 373 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(308 downto 0)        <= buf_input_r(372 downto 64);
            if in_rdy = '1' then
                buf_input_r(1311 downto 309) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1312;
            else
                bits_in_buffer               <= 309;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 374 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(309 downto 0)        <= buf_input_r(373 downto 64);
            if in_rdy = '1' then
                buf_input_r(1312 downto 310) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1313;
            else
                bits_in_buffer               <= 310;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 375 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(310 downto 0)        <= buf_input_r(374 downto 64);
            if in_rdy = '1' then
                buf_input_r(1313 downto 311) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1314;
            else
                bits_in_buffer               <= 311;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 376 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(311 downto 0)        <= buf_input_r(375 downto 64);
            if in_rdy = '1' then
                buf_input_r(1314 downto 312) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1315;
            else
                bits_in_buffer               <= 312;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 377 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(312 downto 0)        <= buf_input_r(376 downto 64);
            if in_rdy = '1' then
                buf_input_r(1315 downto 313) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1316;
            else
                bits_in_buffer               <= 313;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 378 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(313 downto 0)        <= buf_input_r(377 downto 64);
            if in_rdy = '1' then
                buf_input_r(1316 downto 314) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1317;
            else
                bits_in_buffer               <= 314;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 379 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(314 downto 0)        <= buf_input_r(378 downto 64);
            if in_rdy = '1' then
                buf_input_r(1317 downto 315) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1318;
            else
                bits_in_buffer               <= 315;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 380 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(315 downto 0)        <= buf_input_r(379 downto 64);
            if in_rdy = '1' then
                buf_input_r(1318 downto 316) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1319;
            else
                bits_in_buffer               <= 316;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 381 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(316 downto 0)        <= buf_input_r(380 downto 64);
            if in_rdy = '1' then
                buf_input_r(1319 downto 317) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1320;
            else
                bits_in_buffer               <= 317;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 382 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(317 downto 0)        <= buf_input_r(381 downto 64);
            if in_rdy = '1' then
                buf_input_r(1320 downto 318) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1321;
            else
                bits_in_buffer               <= 318;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 383 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(318 downto 0)        <= buf_input_r(382 downto 64);
            if in_rdy = '1' then
                buf_input_r(1321 downto 319) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1322;
            else
                bits_in_buffer               <= 319;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 384 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(319 downto 0)        <= buf_input_r(383 downto 64);
            if in_rdy = '1' then
                buf_input_r(1322 downto 320) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1323;
            else
                bits_in_buffer               <= 320;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 385 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(320 downto 0)        <= buf_input_r(384 downto 64);
            if in_rdy = '1' then
                buf_input_r(1323 downto 321) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1324;
            else
                bits_in_buffer               <= 321;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 386 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(321 downto 0)        <= buf_input_r(385 downto 64);
            if in_rdy = '1' then
                buf_input_r(1324 downto 322) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1325;
            else
                bits_in_buffer               <= 322;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 387 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(322 downto 0)        <= buf_input_r(386 downto 64);
            if in_rdy = '1' then
                buf_input_r(1325 downto 323) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1326;
            else
                bits_in_buffer               <= 323;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 388 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(323 downto 0)        <= buf_input_r(387 downto 64);
            if in_rdy = '1' then
                buf_input_r(1326 downto 324) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1327;
            else
                bits_in_buffer               <= 324;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 389 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(324 downto 0)        <= buf_input_r(388 downto 64);
            if in_rdy = '1' then
                buf_input_r(1327 downto 325) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1328;
            else
                bits_in_buffer               <= 325;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 390 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(325 downto 0)        <= buf_input_r(389 downto 64);
            if in_rdy = '1' then
                buf_input_r(1328 downto 326) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1329;
            else
                bits_in_buffer               <= 326;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 391 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(326 downto 0)        <= buf_input_r(390 downto 64);
            if in_rdy = '1' then
                buf_input_r(1329 downto 327) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1330;
            else
                bits_in_buffer               <= 327;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 392 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(327 downto 0)        <= buf_input_r(391 downto 64);
            if in_rdy = '1' then
                buf_input_r(1330 downto 328) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1331;
            else
                bits_in_buffer               <= 328;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 393 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(328 downto 0)        <= buf_input_r(392 downto 64);
            if in_rdy = '1' then
                buf_input_r(1331 downto 329) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1332;
            else
                bits_in_buffer               <= 329;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 394 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(329 downto 0)        <= buf_input_r(393 downto 64);
            if in_rdy = '1' then
                buf_input_r(1332 downto 330) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1333;
            else
                bits_in_buffer               <= 330;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 395 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(330 downto 0)        <= buf_input_r(394 downto 64);
            if in_rdy = '1' then
                buf_input_r(1333 downto 331) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1334;
            else
                bits_in_buffer               <= 331;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 396 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(331 downto 0)        <= buf_input_r(395 downto 64);
            if in_rdy = '1' then
                buf_input_r(1334 downto 332) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1335;
            else
                bits_in_buffer               <= 332;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 397 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(332 downto 0)        <= buf_input_r(396 downto 64);
            if in_rdy = '1' then
                buf_input_r(1335 downto 333) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1336;
            else
                bits_in_buffer               <= 333;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 398 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(333 downto 0)        <= buf_input_r(397 downto 64);
            if in_rdy = '1' then
                buf_input_r(1336 downto 334) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1337;
            else
                bits_in_buffer               <= 334;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 399 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(334 downto 0)        <= buf_input_r(398 downto 64);
            if in_rdy = '1' then
                buf_input_r(1337 downto 335) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1338;
            else
                bits_in_buffer               <= 335;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 400 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(335 downto 0)        <= buf_input_r(399 downto 64);
            if in_rdy = '1' then
                buf_input_r(1338 downto 336) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1339;
            else
                bits_in_buffer               <= 336;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 401 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(336 downto 0)        <= buf_input_r(400 downto 64);
            if in_rdy = '1' then
                buf_input_r(1339 downto 337) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1340;
            else
                bits_in_buffer               <= 337;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 402 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(337 downto 0)        <= buf_input_r(401 downto 64);
            if in_rdy = '1' then
                buf_input_r(1340 downto 338) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1341;
            else
                bits_in_buffer               <= 338;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 403 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(338 downto 0)        <= buf_input_r(402 downto 64);
            if in_rdy = '1' then
                buf_input_r(1341 downto 339) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1342;
            else
                bits_in_buffer               <= 339;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 404 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(339 downto 0)        <= buf_input_r(403 downto 64);
            if in_rdy = '1' then
                buf_input_r(1342 downto 340) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1343;
            else
                bits_in_buffer               <= 340;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 405 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(340 downto 0)        <= buf_input_r(404 downto 64);
            if in_rdy = '1' then
                buf_input_r(1343 downto 341) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1344;
            else
                bits_in_buffer               <= 341;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 406 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(341 downto 0)        <= buf_input_r(405 downto 64);
            if in_rdy = '1' then
                buf_input_r(1344 downto 342) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1345;
            else
                bits_in_buffer               <= 342;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 407 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(342 downto 0)        <= buf_input_r(406 downto 64);
            if in_rdy = '1' then
                buf_input_r(1345 downto 343) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1346;
            else
                bits_in_buffer               <= 343;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 408 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(343 downto 0)        <= buf_input_r(407 downto 64);
            if in_rdy = '1' then
                buf_input_r(1346 downto 344) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1347;
            else
                bits_in_buffer               <= 344;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 409 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(344 downto 0)        <= buf_input_r(408 downto 64);
            if in_rdy = '1' then
                buf_input_r(1347 downto 345) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1348;
            else
                bits_in_buffer               <= 345;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 410 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(345 downto 0)        <= buf_input_r(409 downto 64);
            if in_rdy = '1' then
                buf_input_r(1348 downto 346) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1349;
            else
                bits_in_buffer               <= 346;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 411 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(346 downto 0)        <= buf_input_r(410 downto 64);
            if in_rdy = '1' then
                buf_input_r(1349 downto 347) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1350;
            else
                bits_in_buffer               <= 347;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 412 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(347 downto 0)        <= buf_input_r(411 downto 64);
            if in_rdy = '1' then
                buf_input_r(1350 downto 348) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1351;
            else
                bits_in_buffer               <= 348;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 413 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(348 downto 0)        <= buf_input_r(412 downto 64);
            if in_rdy = '1' then
                buf_input_r(1351 downto 349) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1352;
            else
                bits_in_buffer               <= 349;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 414 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(349 downto 0)        <= buf_input_r(413 downto 64);
            if in_rdy = '1' then
                buf_input_r(1352 downto 350) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1353;
            else
                bits_in_buffer               <= 350;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 415 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(350 downto 0)        <= buf_input_r(414 downto 64);
            if in_rdy = '1' then
                buf_input_r(1353 downto 351) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1354;
            else
                bits_in_buffer               <= 351;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 416 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(351 downto 0)        <= buf_input_r(415 downto 64);
            if in_rdy = '1' then
                buf_input_r(1354 downto 352) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1355;
            else
                bits_in_buffer               <= 352;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 417 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(352 downto 0)        <= buf_input_r(416 downto 64);
            if in_rdy = '1' then
                buf_input_r(1355 downto 353) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1356;
            else
                bits_in_buffer               <= 353;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 418 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(353 downto 0)        <= buf_input_r(417 downto 64);
            if in_rdy = '1' then
                buf_input_r(1356 downto 354) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1357;
            else
                bits_in_buffer               <= 354;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 419 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(354 downto 0)        <= buf_input_r(418 downto 64);
            if in_rdy = '1' then
                buf_input_r(1357 downto 355) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1358;
            else
                bits_in_buffer               <= 355;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 420 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(355 downto 0)        <= buf_input_r(419 downto 64);
            if in_rdy = '1' then
                buf_input_r(1358 downto 356) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1359;
            else
                bits_in_buffer               <= 356;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 421 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(356 downto 0)        <= buf_input_r(420 downto 64);
            if in_rdy = '1' then
                buf_input_r(1359 downto 357) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1360;
            else
                bits_in_buffer               <= 357;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 422 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(357 downto 0)        <= buf_input_r(421 downto 64);
            if in_rdy = '1' then
                buf_input_r(1360 downto 358) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1361;
            else
                bits_in_buffer               <= 358;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 423 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(358 downto 0)        <= buf_input_r(422 downto 64);
            if in_rdy = '1' then
                buf_input_r(1361 downto 359) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1362;
            else
                bits_in_buffer               <= 359;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 424 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(359 downto 0)        <= buf_input_r(423 downto 64);
            if in_rdy = '1' then
                buf_input_r(1362 downto 360) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1363;
            else
                bits_in_buffer               <= 360;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 425 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(360 downto 0)        <= buf_input_r(424 downto 64);
            if in_rdy = '1' then
                buf_input_r(1363 downto 361) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1364;
            else
                bits_in_buffer               <= 361;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 426 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(361 downto 0)        <= buf_input_r(425 downto 64);
            if in_rdy = '1' then
                buf_input_r(1364 downto 362) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1365;
            else
                bits_in_buffer               <= 362;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 427 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(362 downto 0)        <= buf_input_r(426 downto 64);
            if in_rdy = '1' then
                buf_input_r(1365 downto 363) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1366;
            else
                bits_in_buffer               <= 363;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 428 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(363 downto 0)        <= buf_input_r(427 downto 64);
            if in_rdy = '1' then
                buf_input_r(1366 downto 364) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1367;
            else
                bits_in_buffer               <= 364;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 429 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(364 downto 0)        <= buf_input_r(428 downto 64);
            if in_rdy = '1' then
                buf_input_r(1367 downto 365) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1368;
            else
                bits_in_buffer               <= 365;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 430 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(365 downto 0)        <= buf_input_r(429 downto 64);
            if in_rdy = '1' then
                buf_input_r(1368 downto 366) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1369;
            else
                bits_in_buffer               <= 366;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 431 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(366 downto 0)        <= buf_input_r(430 downto 64);
            if in_rdy = '1' then
                buf_input_r(1369 downto 367) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1370;
            else
                bits_in_buffer               <= 367;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 432 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(367 downto 0)        <= buf_input_r(431 downto 64);
            if in_rdy = '1' then
                buf_input_r(1370 downto 368) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1371;
            else
                bits_in_buffer               <= 368;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 433 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(368 downto 0)        <= buf_input_r(432 downto 64);
            if in_rdy = '1' then
                buf_input_r(1371 downto 369) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1372;
            else
                bits_in_buffer               <= 369;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 434 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(369 downto 0)        <= buf_input_r(433 downto 64);
            if in_rdy = '1' then
                buf_input_r(1372 downto 370) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1373;
            else
                bits_in_buffer               <= 370;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 435 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(370 downto 0)        <= buf_input_r(434 downto 64);
            if in_rdy = '1' then
                buf_input_r(1373 downto 371) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1374;
            else
                bits_in_buffer               <= 371;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 436 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(371 downto 0)        <= buf_input_r(435 downto 64);
            if in_rdy = '1' then
                buf_input_r(1374 downto 372) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1375;
            else
                bits_in_buffer               <= 372;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 437 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(372 downto 0)        <= buf_input_r(436 downto 64);
            if in_rdy = '1' then
                buf_input_r(1375 downto 373) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1376;
            else
                bits_in_buffer               <= 373;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 438 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(373 downto 0)        <= buf_input_r(437 downto 64);
            if in_rdy = '1' then
                buf_input_r(1376 downto 374) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1377;
            else
                bits_in_buffer               <= 374;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 439 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(374 downto 0)        <= buf_input_r(438 downto 64);
            if in_rdy = '1' then
                buf_input_r(1377 downto 375) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1378;
            else
                bits_in_buffer               <= 375;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 440 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(375 downto 0)        <= buf_input_r(439 downto 64);
            if in_rdy = '1' then
                buf_input_r(1378 downto 376) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1379;
            else
                bits_in_buffer               <= 376;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 441 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(376 downto 0)        <= buf_input_r(440 downto 64);
            if in_rdy = '1' then
                buf_input_r(1379 downto 377) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1380;
            else
                bits_in_buffer               <= 377;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 442 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(377 downto 0)        <= buf_input_r(441 downto 64);
            if in_rdy = '1' then
                buf_input_r(1380 downto 378) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1381;
            else
                bits_in_buffer               <= 378;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 443 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(378 downto 0)        <= buf_input_r(442 downto 64);
            if in_rdy = '1' then
                buf_input_r(1381 downto 379) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1382;
            else
                bits_in_buffer               <= 379;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 444 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(379 downto 0)        <= buf_input_r(443 downto 64);
            if in_rdy = '1' then
                buf_input_r(1382 downto 380) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1383;
            else
                bits_in_buffer               <= 380;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 445 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(380 downto 0)        <= buf_input_r(444 downto 64);
            if in_rdy = '1' then
                buf_input_r(1383 downto 381) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1384;
            else
                bits_in_buffer               <= 381;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 446 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(381 downto 0)        <= buf_input_r(445 downto 64);
            if in_rdy = '1' then
                buf_input_r(1384 downto 382) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1385;
            else
                bits_in_buffer               <= 382;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 447 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(382 downto 0)        <= buf_input_r(446 downto 64);
            if in_rdy = '1' then
                buf_input_r(1385 downto 383) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1386;
            else
                bits_in_buffer               <= 383;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 448 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(383 downto 0)        <= buf_input_r(447 downto 64);
            if in_rdy = '1' then
                buf_input_r(1386 downto 384) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1387;
            else
                bits_in_buffer               <= 384;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 449 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(384 downto 0)        <= buf_input_r(448 downto 64);
            if in_rdy = '1' then
                buf_input_r(1387 downto 385) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1388;
            else
                bits_in_buffer               <= 385;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 450 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(385 downto 0)        <= buf_input_r(449 downto 64);
            if in_rdy = '1' then
                buf_input_r(1388 downto 386) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1389;
            else
                bits_in_buffer               <= 386;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 451 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(386 downto 0)        <= buf_input_r(450 downto 64);
            if in_rdy = '1' then
                buf_input_r(1389 downto 387) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1390;
            else
                bits_in_buffer               <= 387;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 452 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(387 downto 0)        <= buf_input_r(451 downto 64);
            if in_rdy = '1' then
                buf_input_r(1390 downto 388) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1391;
            else
                bits_in_buffer               <= 388;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 453 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(388 downto 0)        <= buf_input_r(452 downto 64);
            if in_rdy = '1' then
                buf_input_r(1391 downto 389) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1392;
            else
                bits_in_buffer               <= 389;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 454 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(389 downto 0)        <= buf_input_r(453 downto 64);
            if in_rdy = '1' then
                buf_input_r(1392 downto 390) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1393;
            else
                bits_in_buffer               <= 390;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 455 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(390 downto 0)        <= buf_input_r(454 downto 64);
            if in_rdy = '1' then
                buf_input_r(1393 downto 391) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1394;
            else
                bits_in_buffer               <= 391;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 456 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(391 downto 0)        <= buf_input_r(455 downto 64);
            if in_rdy = '1' then
                buf_input_r(1394 downto 392) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1395;
            else
                bits_in_buffer               <= 392;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 457 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(392 downto 0)        <= buf_input_r(456 downto 64);
            if in_rdy = '1' then
                buf_input_r(1395 downto 393) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1396;
            else
                bits_in_buffer               <= 393;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 458 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(393 downto 0)        <= buf_input_r(457 downto 64);
            if in_rdy = '1' then
                buf_input_r(1396 downto 394) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1397;
            else
                bits_in_buffer               <= 394;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 459 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(394 downto 0)        <= buf_input_r(458 downto 64);
            if in_rdy = '1' then
                buf_input_r(1397 downto 395) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1398;
            else
                bits_in_buffer               <= 395;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 460 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(395 downto 0)        <= buf_input_r(459 downto 64);
            if in_rdy = '1' then
                buf_input_r(1398 downto 396) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1399;
            else
                bits_in_buffer               <= 396;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 461 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(396 downto 0)        <= buf_input_r(460 downto 64);
            if in_rdy = '1' then
                buf_input_r(1399 downto 397) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1400;
            else
                bits_in_buffer               <= 397;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 462 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(397 downto 0)        <= buf_input_r(461 downto 64);
            if in_rdy = '1' then
                buf_input_r(1400 downto 398) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1401;
            else
                bits_in_buffer               <= 398;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 463 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(398 downto 0)        <= buf_input_r(462 downto 64);
            if in_rdy = '1' then
                buf_input_r(1401 downto 399) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1402;
            else
                bits_in_buffer               <= 399;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 464 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(399 downto 0)        <= buf_input_r(463 downto 64);
            if in_rdy = '1' then
                buf_input_r(1402 downto 400) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1403;
            else
                bits_in_buffer               <= 400;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 465 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(400 downto 0)        <= buf_input_r(464 downto 64);
            if in_rdy = '1' then
                buf_input_r(1403 downto 401) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1404;
            else
                bits_in_buffer               <= 401;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 466 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(401 downto 0)        <= buf_input_r(465 downto 64);
            if in_rdy = '1' then
                buf_input_r(1404 downto 402) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1405;
            else
                bits_in_buffer               <= 402;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 467 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(402 downto 0)        <= buf_input_r(466 downto 64);
            if in_rdy = '1' then
                buf_input_r(1405 downto 403) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1406;
            else
                bits_in_buffer               <= 403;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 468 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(403 downto 0)        <= buf_input_r(467 downto 64);
            if in_rdy = '1' then
                buf_input_r(1406 downto 404) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1407;
            else
                bits_in_buffer               <= 404;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 469 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(404 downto 0)        <= buf_input_r(468 downto 64);
            if in_rdy = '1' then
                buf_input_r(1407 downto 405) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1408;
            else
                bits_in_buffer               <= 405;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 470 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(405 downto 0)        <= buf_input_r(469 downto 64);
            if in_rdy = '1' then
                buf_input_r(1408 downto 406) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1409;
            else
                bits_in_buffer               <= 406;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 471 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(406 downto 0)        <= buf_input_r(470 downto 64);
            if in_rdy = '1' then
                buf_input_r(1409 downto 407) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1410;
            else
                bits_in_buffer               <= 407;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 472 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(407 downto 0)        <= buf_input_r(471 downto 64);
            if in_rdy = '1' then
                buf_input_r(1410 downto 408) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1411;
            else
                bits_in_buffer               <= 408;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 473 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(408 downto 0)        <= buf_input_r(472 downto 64);
            if in_rdy = '1' then
                buf_input_r(1411 downto 409) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1412;
            else
                bits_in_buffer               <= 409;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 474 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(409 downto 0)        <= buf_input_r(473 downto 64);
            if in_rdy = '1' then
                buf_input_r(1412 downto 410) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1413;
            else
                bits_in_buffer               <= 410;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 475 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(410 downto 0)        <= buf_input_r(474 downto 64);
            if in_rdy = '1' then
                buf_input_r(1413 downto 411) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1414;
            else
                bits_in_buffer               <= 411;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 476 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(411 downto 0)        <= buf_input_r(475 downto 64);
            if in_rdy = '1' then
                buf_input_r(1414 downto 412) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1415;
            else
                bits_in_buffer               <= 412;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 477 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(412 downto 0)        <= buf_input_r(476 downto 64);
            if in_rdy = '1' then
                buf_input_r(1415 downto 413) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1416;
            else
                bits_in_buffer               <= 413;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 478 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(413 downto 0)        <= buf_input_r(477 downto 64);
            if in_rdy = '1' then
                buf_input_r(1416 downto 414) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1417;
            else
                bits_in_buffer               <= 414;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 479 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(414 downto 0)        <= buf_input_r(478 downto 64);
            if in_rdy = '1' then
                buf_input_r(1417 downto 415) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1418;
            else
                bits_in_buffer               <= 415;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 480 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(415 downto 0)        <= buf_input_r(479 downto 64);
            if in_rdy = '1' then
                buf_input_r(1418 downto 416) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1419;
            else
                bits_in_buffer               <= 416;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 481 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(416 downto 0)        <= buf_input_r(480 downto 64);
            if in_rdy = '1' then
                buf_input_r(1419 downto 417) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1420;
            else
                bits_in_buffer               <= 417;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 482 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(417 downto 0)        <= buf_input_r(481 downto 64);
            if in_rdy = '1' then
                buf_input_r(1420 downto 418) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1421;
            else
                bits_in_buffer               <= 418;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 483 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(418 downto 0)        <= buf_input_r(482 downto 64);
            if in_rdy = '1' then
                buf_input_r(1421 downto 419) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1422;
            else
                bits_in_buffer               <= 419;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 484 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(419 downto 0)        <= buf_input_r(483 downto 64);
            if in_rdy = '1' then
                buf_input_r(1422 downto 420) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1423;
            else
                bits_in_buffer               <= 420;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 485 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(420 downto 0)        <= buf_input_r(484 downto 64);
            if in_rdy = '1' then
                buf_input_r(1423 downto 421) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1424;
            else
                bits_in_buffer               <= 421;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 486 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(421 downto 0)        <= buf_input_r(485 downto 64);
            if in_rdy = '1' then
                buf_input_r(1424 downto 422) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1425;
            else
                bits_in_buffer               <= 422;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 487 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(422 downto 0)        <= buf_input_r(486 downto 64);
            if in_rdy = '1' then
                buf_input_r(1425 downto 423) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1426;
            else
                bits_in_buffer               <= 423;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 488 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(423 downto 0)        <= buf_input_r(487 downto 64);
            if in_rdy = '1' then
                buf_input_r(1426 downto 424) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1427;
            else
                bits_in_buffer               <= 424;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 489 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(424 downto 0)        <= buf_input_r(488 downto 64);
            if in_rdy = '1' then
                buf_input_r(1427 downto 425) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1428;
            else
                bits_in_buffer               <= 425;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 490 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(425 downto 0)        <= buf_input_r(489 downto 64);
            if in_rdy = '1' then
                buf_input_r(1428 downto 426) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1429;
            else
                bits_in_buffer               <= 426;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 491 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(426 downto 0)        <= buf_input_r(490 downto 64);
            if in_rdy = '1' then
                buf_input_r(1429 downto 427) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1430;
            else
                bits_in_buffer               <= 427;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 492 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(427 downto 0)        <= buf_input_r(491 downto 64);
            if in_rdy = '1' then
                buf_input_r(1430 downto 428) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1431;
            else
                bits_in_buffer               <= 428;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 493 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(428 downto 0)        <= buf_input_r(492 downto 64);
            if in_rdy = '1' then
                buf_input_r(1431 downto 429) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1432;
            else
                bits_in_buffer               <= 429;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 494 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(429 downto 0)        <= buf_input_r(493 downto 64);
            if in_rdy = '1' then
                buf_input_r(1432 downto 430) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1433;
            else
                bits_in_buffer               <= 430;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 495 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(430 downto 0)        <= buf_input_r(494 downto 64);
            if in_rdy = '1' then
                buf_input_r(1433 downto 431) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1434;
            else
                bits_in_buffer               <= 431;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 496 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(431 downto 0)        <= buf_input_r(495 downto 64);
            if in_rdy = '1' then
                buf_input_r(1434 downto 432) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1435;
            else
                bits_in_buffer               <= 432;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 497 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(432 downto 0)        <= buf_input_r(496 downto 64);
            if in_rdy = '1' then
                buf_input_r(1435 downto 433) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1436;
            else
                bits_in_buffer               <= 433;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 498 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(433 downto 0)        <= buf_input_r(497 downto 64);
            if in_rdy = '1' then
                buf_input_r(1436 downto 434) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1437;
            else
                bits_in_buffer               <= 434;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 499 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(434 downto 0)        <= buf_input_r(498 downto 64);
            if in_rdy = '1' then
                buf_input_r(1437 downto 435) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1438;
            else
                bits_in_buffer               <= 435;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 500 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(435 downto 0)        <= buf_input_r(499 downto 64);
            if in_rdy = '1' then
                buf_input_r(1438 downto 436) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1439;
            else
                bits_in_buffer               <= 436;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 501 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(436 downto 0)        <= buf_input_r(500 downto 64);
            if in_rdy = '1' then
                buf_input_r(1439 downto 437) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1440;
            else
                bits_in_buffer               <= 437;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 502 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(437 downto 0)        <= buf_input_r(501 downto 64);
            if in_rdy = '1' then
                buf_input_r(1440 downto 438) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1441;
            else
                bits_in_buffer               <= 438;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 503 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(438 downto 0)        <= buf_input_r(502 downto 64);
            if in_rdy = '1' then
                buf_input_r(1441 downto 439) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1442;
            else
                bits_in_buffer               <= 439;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 504 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(439 downto 0)        <= buf_input_r(503 downto 64);
            if in_rdy = '1' then
                buf_input_r(1442 downto 440) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1443;
            else
                bits_in_buffer               <= 440;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 505 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(440 downto 0)        <= buf_input_r(504 downto 64);
            if in_rdy = '1' then
                buf_input_r(1443 downto 441) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1444;
            else
                bits_in_buffer               <= 441;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 506 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(441 downto 0)        <= buf_input_r(505 downto 64);
            if in_rdy = '1' then
                buf_input_r(1444 downto 442) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1445;
            else
                bits_in_buffer               <= 442;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 507 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(442 downto 0)        <= buf_input_r(506 downto 64);
            if in_rdy = '1' then
                buf_input_r(1445 downto 443) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1446;
            else
                bits_in_buffer               <= 443;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 508 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(443 downto 0)        <= buf_input_r(507 downto 64);
            if in_rdy = '1' then
                buf_input_r(1446 downto 444) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1447;
            else
                bits_in_buffer               <= 444;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 509 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(444 downto 0)        <= buf_input_r(508 downto 64);
            if in_rdy = '1' then
                buf_input_r(1447 downto 445) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1448;
            else
                bits_in_buffer               <= 445;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 510 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(445 downto 0)        <= buf_input_r(509 downto 64);
            if in_rdy = '1' then
                buf_input_r(1448 downto 446) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1449;
            else
                bits_in_buffer               <= 446;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 511 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(446 downto 0)        <= buf_input_r(510 downto 64);
            if in_rdy = '1' then
                buf_input_r(1449 downto 447) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1450;
            else
                bits_in_buffer               <= 447;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 512 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(447 downto 0)        <= buf_input_r(511 downto 64);
            if in_rdy = '1' then
                buf_input_r(1450 downto 448) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1451;
            else
                bits_in_buffer               <= 448;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 513 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(448 downto 0)        <= buf_input_r(512 downto 64);
            if in_rdy = '1' then
                buf_input_r(1451 downto 449) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1452;
            else
                bits_in_buffer               <= 449;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 514 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(449 downto 0)        <= buf_input_r(513 downto 64);
            if in_rdy = '1' then
                buf_input_r(1452 downto 450) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1453;
            else
                bits_in_buffer               <= 450;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 515 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(450 downto 0)        <= buf_input_r(514 downto 64);
            if in_rdy = '1' then
                buf_input_r(1453 downto 451) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1454;
            else
                bits_in_buffer               <= 451;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 516 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(451 downto 0)        <= buf_input_r(515 downto 64);
            if in_rdy = '1' then
                buf_input_r(1454 downto 452) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1455;
            else
                bits_in_buffer               <= 452;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 517 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(452 downto 0)        <= buf_input_r(516 downto 64);
            if in_rdy = '1' then
                buf_input_r(1455 downto 453) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1456;
            else
                bits_in_buffer               <= 453;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 518 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(453 downto 0)        <= buf_input_r(517 downto 64);
            if in_rdy = '1' then
                buf_input_r(1456 downto 454) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1457;
            else
                bits_in_buffer               <= 454;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 519 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(454 downto 0)        <= buf_input_r(518 downto 64);
            if in_rdy = '1' then
                buf_input_r(1457 downto 455) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1458;
            else
                bits_in_buffer               <= 455;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 520 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(455 downto 0)        <= buf_input_r(519 downto 64);
            if in_rdy = '1' then
                buf_input_r(1458 downto 456) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1459;
            else
                bits_in_buffer               <= 456;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 521 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(456 downto 0)        <= buf_input_r(520 downto 64);
            if in_rdy = '1' then
                buf_input_r(1459 downto 457) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1460;
            else
                bits_in_buffer               <= 457;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 522 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(457 downto 0)        <= buf_input_r(521 downto 64);
            if in_rdy = '1' then
                buf_input_r(1460 downto 458) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1461;
            else
                bits_in_buffer               <= 458;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 523 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(458 downto 0)        <= buf_input_r(522 downto 64);
            if in_rdy = '1' then
                buf_input_r(1461 downto 459) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1462;
            else
                bits_in_buffer               <= 459;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 524 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(459 downto 0)        <= buf_input_r(523 downto 64);
            if in_rdy = '1' then
                buf_input_r(1462 downto 460) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1463;
            else
                bits_in_buffer               <= 460;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 525 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(460 downto 0)        <= buf_input_r(524 downto 64);
            if in_rdy = '1' then
                buf_input_r(1463 downto 461) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1464;
            else
                bits_in_buffer               <= 461;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 526 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(461 downto 0)        <= buf_input_r(525 downto 64);
            if in_rdy = '1' then
                buf_input_r(1464 downto 462) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1465;
            else
                bits_in_buffer               <= 462;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 527 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(462 downto 0)        <= buf_input_r(526 downto 64);
            if in_rdy = '1' then
                buf_input_r(1465 downto 463) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1466;
            else
                bits_in_buffer               <= 463;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 528 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(463 downto 0)        <= buf_input_r(527 downto 64);
            if in_rdy = '1' then
                buf_input_r(1466 downto 464) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1467;
            else
                bits_in_buffer               <= 464;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 529 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(464 downto 0)        <= buf_input_r(528 downto 64);
            if in_rdy = '1' then
                buf_input_r(1467 downto 465) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1468;
            else
                bits_in_buffer               <= 465;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 530 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(465 downto 0)        <= buf_input_r(529 downto 64);
            if in_rdy = '1' then
                buf_input_r(1468 downto 466) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1469;
            else
                bits_in_buffer               <= 466;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 531 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(466 downto 0)        <= buf_input_r(530 downto 64);
            if in_rdy = '1' then
                buf_input_r(1469 downto 467) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1470;
            else
                bits_in_buffer               <= 467;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 532 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(467 downto 0)        <= buf_input_r(531 downto 64);
            if in_rdy = '1' then
                buf_input_r(1470 downto 468) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1471;
            else
                bits_in_buffer               <= 468;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 533 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(468 downto 0)        <= buf_input_r(532 downto 64);
            if in_rdy = '1' then
                buf_input_r(1471 downto 469) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1472;
            else
                bits_in_buffer               <= 469;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 534 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(469 downto 0)        <= buf_input_r(533 downto 64);
            if in_rdy = '1' then
                buf_input_r(1472 downto 470) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1473;
            else
                bits_in_buffer               <= 470;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 535 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(470 downto 0)        <= buf_input_r(534 downto 64);
            if in_rdy = '1' then
                buf_input_r(1473 downto 471) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1474;
            else
                bits_in_buffer               <= 471;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 536 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(471 downto 0)        <= buf_input_r(535 downto 64);
            if in_rdy = '1' then
                buf_input_r(1474 downto 472) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1475;
            else
                bits_in_buffer               <= 472;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 537 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(472 downto 0)        <= buf_input_r(536 downto 64);
            if in_rdy = '1' then
                buf_input_r(1475 downto 473) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1476;
            else
                bits_in_buffer               <= 473;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 538 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(473 downto 0)        <= buf_input_r(537 downto 64);
            if in_rdy = '1' then
                buf_input_r(1476 downto 474) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1477;
            else
                bits_in_buffer               <= 474;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 539 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(474 downto 0)        <= buf_input_r(538 downto 64);
            if in_rdy = '1' then
                buf_input_r(1477 downto 475) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1478;
            else
                bits_in_buffer               <= 475;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 540 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(475 downto 0)        <= buf_input_r(539 downto 64);
            if in_rdy = '1' then
                buf_input_r(1478 downto 476) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1479;
            else
                bits_in_buffer               <= 476;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 541 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(476 downto 0)        <= buf_input_r(540 downto 64);
            if in_rdy = '1' then
                buf_input_r(1479 downto 477) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1480;
            else
                bits_in_buffer               <= 477;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 542 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(477 downto 0)        <= buf_input_r(541 downto 64);
            if in_rdy = '1' then
                buf_input_r(1480 downto 478) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1481;
            else
                bits_in_buffer               <= 478;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 543 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(478 downto 0)        <= buf_input_r(542 downto 64);
            if in_rdy = '1' then
                buf_input_r(1481 downto 479) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1482;
            else
                bits_in_buffer               <= 479;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 544 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(479 downto 0)        <= buf_input_r(543 downto 64);
            if in_rdy = '1' then
                buf_input_r(1482 downto 480) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1483;
            else
                bits_in_buffer               <= 480;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 545 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(480 downto 0)        <= buf_input_r(544 downto 64);
            if in_rdy = '1' then
                buf_input_r(1483 downto 481) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1484;
            else
                bits_in_buffer               <= 481;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 546 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(481 downto 0)        <= buf_input_r(545 downto 64);
            if in_rdy = '1' then
                buf_input_r(1484 downto 482) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1485;
            else
                bits_in_buffer               <= 482;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 547 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(482 downto 0)        <= buf_input_r(546 downto 64);
            if in_rdy = '1' then
                buf_input_r(1485 downto 483) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1486;
            else
                bits_in_buffer               <= 483;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 548 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(483 downto 0)        <= buf_input_r(547 downto 64);
            if in_rdy = '1' then
                buf_input_r(1486 downto 484) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1487;
            else
                bits_in_buffer               <= 484;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 549 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(484 downto 0)        <= buf_input_r(548 downto 64);
            if in_rdy = '1' then
                buf_input_r(1487 downto 485) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1488;
            else
                bits_in_buffer               <= 485;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 550 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(485 downto 0)        <= buf_input_r(549 downto 64);
            if in_rdy = '1' then
                buf_input_r(1488 downto 486) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1489;
            else
                bits_in_buffer               <= 486;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 551 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(486 downto 0)        <= buf_input_r(550 downto 64);
            if in_rdy = '1' then
                buf_input_r(1489 downto 487) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1490;
            else
                bits_in_buffer               <= 487;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 552 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(487 downto 0)        <= buf_input_r(551 downto 64);
            if in_rdy = '1' then
                buf_input_r(1490 downto 488) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1491;
            else
                bits_in_buffer               <= 488;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 553 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(488 downto 0)        <= buf_input_r(552 downto 64);
            if in_rdy = '1' then
                buf_input_r(1491 downto 489) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1492;
            else
                bits_in_buffer               <= 489;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 554 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(489 downto 0)        <= buf_input_r(553 downto 64);
            if in_rdy = '1' then
                buf_input_r(1492 downto 490) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1493;
            else
                bits_in_buffer               <= 490;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 555 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(490 downto 0)        <= buf_input_r(554 downto 64);
            if in_rdy = '1' then
                buf_input_r(1493 downto 491) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1494;
            else
                bits_in_buffer               <= 491;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 556 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(491 downto 0)        <= buf_input_r(555 downto 64);
            if in_rdy = '1' then
                buf_input_r(1494 downto 492) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1495;
            else
                bits_in_buffer               <= 492;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 557 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(492 downto 0)        <= buf_input_r(556 downto 64);
            if in_rdy = '1' then
                buf_input_r(1495 downto 493) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1496;
            else
                bits_in_buffer               <= 493;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 558 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(493 downto 0)        <= buf_input_r(557 downto 64);
            if in_rdy = '1' then
                buf_input_r(1496 downto 494) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1497;
            else
                bits_in_buffer               <= 494;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 559 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(494 downto 0)        <= buf_input_r(558 downto 64);
            if in_rdy = '1' then
                buf_input_r(1497 downto 495) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1498;
            else
                bits_in_buffer               <= 495;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 560 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(495 downto 0)        <= buf_input_r(559 downto 64);
            if in_rdy = '1' then
                buf_input_r(1498 downto 496) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1499;
            else
                bits_in_buffer               <= 496;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 561 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(496 downto 0)        <= buf_input_r(560 downto 64);
            if in_rdy = '1' then
                buf_input_r(1499 downto 497) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1500;
            else
                bits_in_buffer               <= 497;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 562 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(497 downto 0)        <= buf_input_r(561 downto 64);
            if in_rdy = '1' then
                buf_input_r(1500 downto 498) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1501;
            else
                bits_in_buffer               <= 498;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 563 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(498 downto 0)        <= buf_input_r(562 downto 64);
            if in_rdy = '1' then
                buf_input_r(1501 downto 499) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1502;
            else
                bits_in_buffer               <= 499;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 564 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(499 downto 0)        <= buf_input_r(563 downto 64);
            if in_rdy = '1' then
                buf_input_r(1502 downto 500) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1503;
            else
                bits_in_buffer               <= 500;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 565 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(500 downto 0)        <= buf_input_r(564 downto 64);
            if in_rdy = '1' then
                buf_input_r(1503 downto 501) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1504;
            else
                bits_in_buffer               <= 501;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 566 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(501 downto 0)        <= buf_input_r(565 downto 64);
            if in_rdy = '1' then
                buf_input_r(1504 downto 502) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1505;
            else
                bits_in_buffer               <= 502;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 567 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(502 downto 0)        <= buf_input_r(566 downto 64);
            if in_rdy = '1' then
                buf_input_r(1505 downto 503) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1506;
            else
                bits_in_buffer               <= 503;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 568 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(503 downto 0)        <= buf_input_r(567 downto 64);
            if in_rdy = '1' then
                buf_input_r(1506 downto 504) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1507;
            else
                bits_in_buffer               <= 504;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 569 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(504 downto 0)        <= buf_input_r(568 downto 64);
            if in_rdy = '1' then
                buf_input_r(1507 downto 505) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1508;
            else
                bits_in_buffer               <= 505;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 570 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(505 downto 0)        <= buf_input_r(569 downto 64);
            if in_rdy = '1' then
                buf_input_r(1508 downto 506) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1509;
            else
                bits_in_buffer               <= 506;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 571 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(506 downto 0)        <= buf_input_r(570 downto 64);
            if in_rdy = '1' then
                buf_input_r(1509 downto 507) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1510;
            else
                bits_in_buffer               <= 507;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 572 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(507 downto 0)        <= buf_input_r(571 downto 64);
            if in_rdy = '1' then
                buf_input_r(1510 downto 508) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1511;
            else
                bits_in_buffer               <= 508;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 573 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(508 downto 0)        <= buf_input_r(572 downto 64);
            if in_rdy = '1' then
                buf_input_r(1511 downto 509) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1512;
            else
                bits_in_buffer               <= 509;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 574 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(509 downto 0)        <= buf_input_r(573 downto 64);
            if in_rdy = '1' then
                buf_input_r(1512 downto 510) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1513;
            else
                bits_in_buffer               <= 510;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 575 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(510 downto 0)        <= buf_input_r(574 downto 64);
            if in_rdy = '1' then
                buf_input_r(1513 downto 511) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1514;
            else
                bits_in_buffer               <= 511;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 576 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(511 downto 0)        <= buf_input_r(575 downto 64);
            if in_rdy = '1' then
                buf_input_r(1514 downto 512) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1515;
            else
                bits_in_buffer               <= 512;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 577 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(512 downto 0)        <= buf_input_r(576 downto 64);
            if in_rdy = '1' then
                buf_input_r(1515 downto 513) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1516;
            else
                bits_in_buffer               <= 513;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 578 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(513 downto 0)        <= buf_input_r(577 downto 64);
            if in_rdy = '1' then
                buf_input_r(1516 downto 514) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1517;
            else
                bits_in_buffer               <= 514;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 579 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(514 downto 0)        <= buf_input_r(578 downto 64);
            if in_rdy = '1' then
                buf_input_r(1517 downto 515) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1518;
            else
                bits_in_buffer               <= 515;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 580 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(515 downto 0)        <= buf_input_r(579 downto 64);
            if in_rdy = '1' then
                buf_input_r(1518 downto 516) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1519;
            else
                bits_in_buffer               <= 516;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 581 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(516 downto 0)        <= buf_input_r(580 downto 64);
            if in_rdy = '1' then
                buf_input_r(1519 downto 517) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1520;
            else
                bits_in_buffer               <= 517;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 582 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(517 downto 0)        <= buf_input_r(581 downto 64);
            if in_rdy = '1' then
                buf_input_r(1520 downto 518) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1521;
            else
                bits_in_buffer               <= 518;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 583 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(518 downto 0)        <= buf_input_r(582 downto 64);
            if in_rdy = '1' then
                buf_input_r(1521 downto 519) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1522;
            else
                bits_in_buffer               <= 519;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 584 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(519 downto 0)        <= buf_input_r(583 downto 64);
            if in_rdy = '1' then
                buf_input_r(1522 downto 520) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1523;
            else
                bits_in_buffer               <= 520;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 585 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(520 downto 0)        <= buf_input_r(584 downto 64);
            if in_rdy = '1' then
                buf_input_r(1523 downto 521) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1524;
            else
                bits_in_buffer               <= 521;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 586 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(521 downto 0)        <= buf_input_r(585 downto 64);
            if in_rdy = '1' then
                buf_input_r(1524 downto 522) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1525;
            else
                bits_in_buffer               <= 522;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 587 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(522 downto 0)        <= buf_input_r(586 downto 64);
            if in_rdy = '1' then
                buf_input_r(1525 downto 523) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1526;
            else
                bits_in_buffer               <= 523;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 588 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(523 downto 0)        <= buf_input_r(587 downto 64);
            if in_rdy = '1' then
                buf_input_r(1526 downto 524) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1527;
            else
                bits_in_buffer               <= 524;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 589 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(524 downto 0)        <= buf_input_r(588 downto 64);
            if in_rdy = '1' then
                buf_input_r(1527 downto 525) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1528;
            else
                bits_in_buffer               <= 525;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 590 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(525 downto 0)        <= buf_input_r(589 downto 64);
            if in_rdy = '1' then
                buf_input_r(1528 downto 526) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1529;
            else
                bits_in_buffer               <= 526;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 591 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(526 downto 0)        <= buf_input_r(590 downto 64);
            if in_rdy = '1' then
                buf_input_r(1529 downto 527) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1530;
            else
                bits_in_buffer               <= 527;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 592 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(527 downto 0)        <= buf_input_r(591 downto 64);
            if in_rdy = '1' then
                buf_input_r(1530 downto 528) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1531;
            else
                bits_in_buffer               <= 528;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 593 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(528 downto 0)        <= buf_input_r(592 downto 64);
            if in_rdy = '1' then
                buf_input_r(1531 downto 529) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1532;
            else
                bits_in_buffer               <= 529;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 594 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(529 downto 0)        <= buf_input_r(593 downto 64);
            if in_rdy = '1' then
                buf_input_r(1532 downto 530) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1533;
            else
                bits_in_buffer               <= 530;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 595 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(530 downto 0)        <= buf_input_r(594 downto 64);
            if in_rdy = '1' then
                buf_input_r(1533 downto 531) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1534;
            else
                bits_in_buffer               <= 531;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 596 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(531 downto 0)        <= buf_input_r(595 downto 64);
            if in_rdy = '1' then
                buf_input_r(1534 downto 532) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1535;
            else
                bits_in_buffer               <= 532;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 597 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(532 downto 0)        <= buf_input_r(596 downto 64);
            if in_rdy = '1' then
                buf_input_r(1535 downto 533) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1536;
            else
                bits_in_buffer               <= 533;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 598 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(533 downto 0)        <= buf_input_r(597 downto 64);
            if in_rdy = '1' then
                buf_input_r(1536 downto 534) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1537;
            else
                bits_in_buffer               <= 534;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 599 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(534 downto 0)        <= buf_input_r(598 downto 64);
            if in_rdy = '1' then
                buf_input_r(1537 downto 535) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1538;
            else
                bits_in_buffer               <= 535;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 600 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(535 downto 0)        <= buf_input_r(599 downto 64);
            if in_rdy = '1' then
                buf_input_r(1538 downto 536) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1539;
            else
                bits_in_buffer               <= 536;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 601 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(536 downto 0)        <= buf_input_r(600 downto 64);
            if in_rdy = '1' then
                buf_input_r(1539 downto 537) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1540;
            else
                bits_in_buffer               <= 537;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 602 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(537 downto 0)        <= buf_input_r(601 downto 64);
            if in_rdy = '1' then
                buf_input_r(1540 downto 538) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1541;
            else
                bits_in_buffer               <= 538;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 603 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(538 downto 0)        <= buf_input_r(602 downto 64);
            if in_rdy = '1' then
                buf_input_r(1541 downto 539) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1542;
            else
                bits_in_buffer               <= 539;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 604 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(539 downto 0)        <= buf_input_r(603 downto 64);
            if in_rdy = '1' then
                buf_input_r(1542 downto 540) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1543;
            else
                bits_in_buffer               <= 540;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 605 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(540 downto 0)        <= buf_input_r(604 downto 64);
            if in_rdy = '1' then
                buf_input_r(1543 downto 541) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1544;
            else
                bits_in_buffer               <= 541;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 606 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(541 downto 0)        <= buf_input_r(605 downto 64);
            if in_rdy = '1' then
                buf_input_r(1544 downto 542) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1545;
            else
                bits_in_buffer               <= 542;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 607 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(542 downto 0)        <= buf_input_r(606 downto 64);
            if in_rdy = '1' then
                buf_input_r(1545 downto 543) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1546;
            else
                bits_in_buffer               <= 543;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 608 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(543 downto 0)        <= buf_input_r(607 downto 64);
            if in_rdy = '1' then
                buf_input_r(1546 downto 544) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1547;
            else
                bits_in_buffer               <= 544;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 609 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(544 downto 0)        <= buf_input_r(608 downto 64);
            if in_rdy = '1' then
                buf_input_r(1547 downto 545) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1548;
            else
                bits_in_buffer               <= 545;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 610 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(545 downto 0)        <= buf_input_r(609 downto 64);
            if in_rdy = '1' then
                buf_input_r(1548 downto 546) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1549;
            else
                bits_in_buffer               <= 546;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 611 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(546 downto 0)        <= buf_input_r(610 downto 64);
            if in_rdy = '1' then
                buf_input_r(1549 downto 547) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1550;
            else
                bits_in_buffer               <= 547;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 612 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(547 downto 0)        <= buf_input_r(611 downto 64);
            if in_rdy = '1' then
                buf_input_r(1550 downto 548) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1551;
            else
                bits_in_buffer               <= 548;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 613 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(548 downto 0)        <= buf_input_r(612 downto 64);
            if in_rdy = '1' then
                buf_input_r(1551 downto 549) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1552;
            else
                bits_in_buffer               <= 549;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 614 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(549 downto 0)        <= buf_input_r(613 downto 64);
            if in_rdy = '1' then
                buf_input_r(1552 downto 550) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1553;
            else
                bits_in_buffer               <= 550;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 615 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(550 downto 0)        <= buf_input_r(614 downto 64);
            if in_rdy = '1' then
                buf_input_r(1553 downto 551) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1554;
            else
                bits_in_buffer               <= 551;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 616 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(551 downto 0)        <= buf_input_r(615 downto 64);
            if in_rdy = '1' then
                buf_input_r(1554 downto 552) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1555;
            else
                bits_in_buffer               <= 552;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 617 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(552 downto 0)        <= buf_input_r(616 downto 64);
            if in_rdy = '1' then
                buf_input_r(1555 downto 553) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1556;
            else
                bits_in_buffer               <= 553;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 618 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(553 downto 0)        <= buf_input_r(617 downto 64);
            if in_rdy = '1' then
                buf_input_r(1556 downto 554) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1557;
            else
                bits_in_buffer               <= 554;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 619 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(554 downto 0)        <= buf_input_r(618 downto 64);
            if in_rdy = '1' then
                buf_input_r(1557 downto 555) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1558;
            else
                bits_in_buffer               <= 555;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 620 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(555 downto 0)        <= buf_input_r(619 downto 64);
            if in_rdy = '1' then
                buf_input_r(1558 downto 556) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1559;
            else
                bits_in_buffer               <= 556;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 621 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(556 downto 0)        <= buf_input_r(620 downto 64);
            if in_rdy = '1' then
                buf_input_r(1559 downto 557) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1560;
            else
                bits_in_buffer               <= 557;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 622 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(557 downto 0)        <= buf_input_r(621 downto 64);
            if in_rdy = '1' then
                buf_input_r(1560 downto 558) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1561;
            else
                bits_in_buffer               <= 558;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 623 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(558 downto 0)        <= buf_input_r(622 downto 64);
            if in_rdy = '1' then
                buf_input_r(1561 downto 559) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1562;
            else
                bits_in_buffer               <= 559;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 624 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(559 downto 0)        <= buf_input_r(623 downto 64);
            if in_rdy = '1' then
                buf_input_r(1562 downto 560) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1563;
            else
                bits_in_buffer               <= 560;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 625 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(560 downto 0)        <= buf_input_r(624 downto 64);
            if in_rdy = '1' then
                buf_input_r(1563 downto 561) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1564;
            else
                bits_in_buffer               <= 561;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 626 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(561 downto 0)        <= buf_input_r(625 downto 64);
            if in_rdy = '1' then
                buf_input_r(1564 downto 562) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1565;
            else
                bits_in_buffer               <= 562;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 627 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(562 downto 0)        <= buf_input_r(626 downto 64);
            if in_rdy = '1' then
                buf_input_r(1565 downto 563) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1566;
            else
                bits_in_buffer               <= 563;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 628 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(563 downto 0)        <= buf_input_r(627 downto 64);
            if in_rdy = '1' then
                buf_input_r(1566 downto 564) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1567;
            else
                bits_in_buffer               <= 564;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 629 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(564 downto 0)        <= buf_input_r(628 downto 64);
            if in_rdy = '1' then
                buf_input_r(1567 downto 565) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1568;
            else
                bits_in_buffer               <= 565;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 630 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(565 downto 0)        <= buf_input_r(629 downto 64);
            if in_rdy = '1' then
                buf_input_r(1568 downto 566) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1569;
            else
                bits_in_buffer               <= 566;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 631 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(566 downto 0)        <= buf_input_r(630 downto 64);
            if in_rdy = '1' then
                buf_input_r(1569 downto 567) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1570;
            else
                bits_in_buffer               <= 567;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 632 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(567 downto 0)        <= buf_input_r(631 downto 64);
            if in_rdy = '1' then
                buf_input_r(1570 downto 568) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1571;
            else
                bits_in_buffer               <= 568;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 633 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(568 downto 0)        <= buf_input_r(632 downto 64);
            if in_rdy = '1' then
                buf_input_r(1571 downto 569) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1572;
            else
                bits_in_buffer               <= 569;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 634 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(569 downto 0)        <= buf_input_r(633 downto 64);
            if in_rdy = '1' then
                buf_input_r(1572 downto 570) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1573;
            else
                bits_in_buffer               <= 570;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 635 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(570 downto 0)        <= buf_input_r(634 downto 64);
            if in_rdy = '1' then
                buf_input_r(1573 downto 571) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1574;
            else
                bits_in_buffer               <= 571;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 636 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(571 downto 0)        <= buf_input_r(635 downto 64);
            if in_rdy = '1' then
                buf_input_r(1574 downto 572) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1575;
            else
                bits_in_buffer               <= 572;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 637 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(572 downto 0)        <= buf_input_r(636 downto 64);
            if in_rdy = '1' then
                buf_input_r(1575 downto 573) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1576;
            else
                bits_in_buffer               <= 573;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 638 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(573 downto 0)        <= buf_input_r(637 downto 64);
            if in_rdy = '1' then
                buf_input_r(1576 downto 574) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1577;
            else
                bits_in_buffer               <= 574;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 639 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(574 downto 0)        <= buf_input_r(638 downto 64);
            if in_rdy = '1' then
                buf_input_r(1577 downto 575) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1578;
            else
                bits_in_buffer               <= 575;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 640 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(575 downto 0)        <= buf_input_r(639 downto 64);
            if in_rdy = '1' then
                buf_input_r(1578 downto 576) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1579;
            else
                bits_in_buffer               <= 576;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 641 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(576 downto 0)        <= buf_input_r(640 downto 64);
            if in_rdy = '1' then
                buf_input_r(1579 downto 577) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1580;
            else
                bits_in_buffer               <= 577;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 642 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(577 downto 0)        <= buf_input_r(641 downto 64);
            if in_rdy = '1' then
                buf_input_r(1580 downto 578) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1581;
            else
                bits_in_buffer               <= 578;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 643 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(578 downto 0)        <= buf_input_r(642 downto 64);
            if in_rdy = '1' then
                buf_input_r(1581 downto 579) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1582;
            else
                bits_in_buffer               <= 579;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 644 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(579 downto 0)        <= buf_input_r(643 downto 64);
            if in_rdy = '1' then
                buf_input_r(1582 downto 580) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1583;
            else
                bits_in_buffer               <= 580;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 645 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(580 downto 0)        <= buf_input_r(644 downto 64);
            if in_rdy = '1' then
                buf_input_r(1583 downto 581) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1584;
            else
                bits_in_buffer               <= 581;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 646 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(581 downto 0)        <= buf_input_r(645 downto 64);
            if in_rdy = '1' then
                buf_input_r(1584 downto 582) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1585;
            else
                bits_in_buffer               <= 582;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 647 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(582 downto 0)        <= buf_input_r(646 downto 64);
            if in_rdy = '1' then
                buf_input_r(1585 downto 583) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1586;
            else
                bits_in_buffer               <= 583;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 648 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(583 downto 0)        <= buf_input_r(647 downto 64);
            if in_rdy = '1' then
                buf_input_r(1586 downto 584) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1587;
            else
                bits_in_buffer               <= 584;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 649 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(584 downto 0)        <= buf_input_r(648 downto 64);
            if in_rdy = '1' then
                buf_input_r(1587 downto 585) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1588;
            else
                bits_in_buffer               <= 585;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 650 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(585 downto 0)        <= buf_input_r(649 downto 64);
            if in_rdy = '1' then
                buf_input_r(1588 downto 586) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1589;
            else
                bits_in_buffer               <= 586;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 651 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(586 downto 0)        <= buf_input_r(650 downto 64);
            if in_rdy = '1' then
                buf_input_r(1589 downto 587) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1590;
            else
                bits_in_buffer               <= 587;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 652 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(587 downto 0)        <= buf_input_r(651 downto 64);
            if in_rdy = '1' then
                buf_input_r(1590 downto 588) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1591;
            else
                bits_in_buffer               <= 588;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 653 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(588 downto 0)        <= buf_input_r(652 downto 64);
            if in_rdy = '1' then
                buf_input_r(1591 downto 589) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1592;
            else
                bits_in_buffer               <= 589;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 654 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(589 downto 0)        <= buf_input_r(653 downto 64);
            if in_rdy = '1' then
                buf_input_r(1592 downto 590) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1593;
            else
                bits_in_buffer               <= 590;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 655 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(590 downto 0)        <= buf_input_r(654 downto 64);
            if in_rdy = '1' then
                buf_input_r(1593 downto 591) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1594;
            else
                bits_in_buffer               <= 591;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 656 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(591 downto 0)        <= buf_input_r(655 downto 64);
            if in_rdy = '1' then
                buf_input_r(1594 downto 592) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1595;
            else
                bits_in_buffer               <= 592;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 657 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(592 downto 0)        <= buf_input_r(656 downto 64);
            if in_rdy = '1' then
                buf_input_r(1595 downto 593) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1596;
            else
                bits_in_buffer               <= 593;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 658 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(593 downto 0)        <= buf_input_r(657 downto 64);
            if in_rdy = '1' then
                buf_input_r(1596 downto 594) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1597;
            else
                bits_in_buffer               <= 594;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 659 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(594 downto 0)        <= buf_input_r(658 downto 64);
            if in_rdy = '1' then
                buf_input_r(1597 downto 595) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1598;
            else
                bits_in_buffer               <= 595;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 660 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(595 downto 0)        <= buf_input_r(659 downto 64);
            if in_rdy = '1' then
                buf_input_r(1598 downto 596) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1599;
            else
                bits_in_buffer               <= 596;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 661 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(596 downto 0)        <= buf_input_r(660 downto 64);
            if in_rdy = '1' then
                buf_input_r(1599 downto 597) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1600;
            else
                bits_in_buffer               <= 597;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 662 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(597 downto 0)        <= buf_input_r(661 downto 64);
            if in_rdy = '1' then
                buf_input_r(1600 downto 598) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1601;
            else
                bits_in_buffer               <= 598;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 663 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(598 downto 0)        <= buf_input_r(662 downto 64);
            if in_rdy = '1' then
                buf_input_r(1601 downto 599) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1602;
            else
                bits_in_buffer               <= 599;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 664 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(599 downto 0)        <= buf_input_r(663 downto 64);
            if in_rdy = '1' then
                buf_input_r(1602 downto 600) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1603;
            else
                bits_in_buffer               <= 600;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 665 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(600 downto 0)        <= buf_input_r(664 downto 64);
            if in_rdy = '1' then
                buf_input_r(1603 downto 601) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1604;
            else
                bits_in_buffer               <= 601;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 666 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(601 downto 0)        <= buf_input_r(665 downto 64);
            if in_rdy = '1' then
                buf_input_r(1604 downto 602) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1605;
            else
                bits_in_buffer               <= 602;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 667 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(602 downto 0)        <= buf_input_r(666 downto 64);
            if in_rdy = '1' then
                buf_input_r(1605 downto 603) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1606;
            else
                bits_in_buffer               <= 603;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 668 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(603 downto 0)        <= buf_input_r(667 downto 64);
            if in_rdy = '1' then
                buf_input_r(1606 downto 604) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1607;
            else
                bits_in_buffer               <= 604;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 669 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(604 downto 0)        <= buf_input_r(668 downto 64);
            if in_rdy = '1' then
                buf_input_r(1607 downto 605) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1608;
            else
                bits_in_buffer               <= 605;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 670 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(605 downto 0)        <= buf_input_r(669 downto 64);
            if in_rdy = '1' then
                buf_input_r(1608 downto 606) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1609;
            else
                bits_in_buffer               <= 606;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 671 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(606 downto 0)        <= buf_input_r(670 downto 64);
            if in_rdy = '1' then
                buf_input_r(1609 downto 607) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1610;
            else
                bits_in_buffer               <= 607;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 672 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(607 downto 0)        <= buf_input_r(671 downto 64);
            if in_rdy = '1' then
                buf_input_r(1610 downto 608) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1611;
            else
                bits_in_buffer               <= 608;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 673 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(608 downto 0)        <= buf_input_r(672 downto 64);
            if in_rdy = '1' then
                buf_input_r(1611 downto 609) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1612;
            else
                bits_in_buffer               <= 609;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 674 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(609 downto 0)        <= buf_input_r(673 downto 64);
            if in_rdy = '1' then
                buf_input_r(1612 downto 610) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1613;
            else
                bits_in_buffer               <= 610;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 675 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(610 downto 0)        <= buf_input_r(674 downto 64);
            if in_rdy = '1' then
                buf_input_r(1613 downto 611) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1614;
            else
                bits_in_buffer               <= 611;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 676 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(611 downto 0)        <= buf_input_r(675 downto 64);
            if in_rdy = '1' then
                buf_input_r(1614 downto 612) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1615;
            else
                bits_in_buffer               <= 612;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 677 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(612 downto 0)        <= buf_input_r(676 downto 64);
            if in_rdy = '1' then
                buf_input_r(1615 downto 613) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1616;
            else
                bits_in_buffer               <= 613;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 678 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(613 downto 0)        <= buf_input_r(677 downto 64);
            if in_rdy = '1' then
                buf_input_r(1616 downto 614) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1617;
            else
                bits_in_buffer               <= 614;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 679 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(614 downto 0)        <= buf_input_r(678 downto 64);
            if in_rdy = '1' then
                buf_input_r(1617 downto 615) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1618;
            else
                bits_in_buffer               <= 615;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 680 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(615 downto 0)        <= buf_input_r(679 downto 64);
            if in_rdy = '1' then
                buf_input_r(1618 downto 616) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1619;
            else
                bits_in_buffer               <= 616;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 681 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(616 downto 0)        <= buf_input_r(680 downto 64);
            if in_rdy = '1' then
                buf_input_r(1619 downto 617) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1620;
            else
                bits_in_buffer               <= 617;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 682 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(617 downto 0)        <= buf_input_r(681 downto 64);
            if in_rdy = '1' then
                buf_input_r(1620 downto 618) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1621;
            else
                bits_in_buffer               <= 618;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 683 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(618 downto 0)        <= buf_input_r(682 downto 64);
            if in_rdy = '1' then
                buf_input_r(1621 downto 619) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1622;
            else
                bits_in_buffer               <= 619;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 684 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(619 downto 0)        <= buf_input_r(683 downto 64);
            if in_rdy = '1' then
                buf_input_r(1622 downto 620) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1623;
            else
                bits_in_buffer               <= 620;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 685 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(620 downto 0)        <= buf_input_r(684 downto 64);
            if in_rdy = '1' then
                buf_input_r(1623 downto 621) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1624;
            else
                bits_in_buffer               <= 621;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 686 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(621 downto 0)        <= buf_input_r(685 downto 64);
            if in_rdy = '1' then
                buf_input_r(1624 downto 622) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1625;
            else
                bits_in_buffer               <= 622;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 687 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(622 downto 0)        <= buf_input_r(686 downto 64);
            if in_rdy = '1' then
                buf_input_r(1625 downto 623) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1626;
            else
                bits_in_buffer               <= 623;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 688 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(623 downto 0)        <= buf_input_r(687 downto 64);
            if in_rdy = '1' then
                buf_input_r(1626 downto 624) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1627;
            else
                bits_in_buffer               <= 624;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 689 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(624 downto 0)        <= buf_input_r(688 downto 64);
            if in_rdy = '1' then
                buf_input_r(1627 downto 625) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1628;
            else
                bits_in_buffer               <= 625;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 690 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(625 downto 0)        <= buf_input_r(689 downto 64);
            if in_rdy = '1' then
                buf_input_r(1628 downto 626) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1629;
            else
                bits_in_buffer               <= 626;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 691 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(626 downto 0)        <= buf_input_r(690 downto 64);
            if in_rdy = '1' then
                buf_input_r(1629 downto 627) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1630;
            else
                bits_in_buffer               <= 627;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 692 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(627 downto 0)        <= buf_input_r(691 downto 64);
            if in_rdy = '1' then
                buf_input_r(1630 downto 628) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1631;
            else
                bits_in_buffer               <= 628;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 693 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(628 downto 0)        <= buf_input_r(692 downto 64);
            if in_rdy = '1' then
                buf_input_r(1631 downto 629) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1632;
            else
                bits_in_buffer               <= 629;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 694 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(629 downto 0)        <= buf_input_r(693 downto 64);
            if in_rdy = '1' then
                buf_input_r(1632 downto 630) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1633;
            else
                bits_in_buffer               <= 630;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 695 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(630 downto 0)        <= buf_input_r(694 downto 64);
            if in_rdy = '1' then
                buf_input_r(1633 downto 631) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1634;
            else
                bits_in_buffer               <= 631;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 696 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(631 downto 0)        <= buf_input_r(695 downto 64);
            if in_rdy = '1' then
                buf_input_r(1634 downto 632) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1635;
            else
                bits_in_buffer               <= 632;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 697 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(632 downto 0)        <= buf_input_r(696 downto 64);
            if in_rdy = '1' then
                buf_input_r(1635 downto 633) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1636;
            else
                bits_in_buffer               <= 633;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 698 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(633 downto 0)        <= buf_input_r(697 downto 64);
            if in_rdy = '1' then
                buf_input_r(1636 downto 634) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1637;
            else
                bits_in_buffer               <= 634;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 699 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(634 downto 0)        <= buf_input_r(698 downto 64);
            if in_rdy = '1' then
                buf_input_r(1637 downto 635) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1638;
            else
                bits_in_buffer               <= 635;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 700 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(635 downto 0)        <= buf_input_r(699 downto 64);
            if in_rdy = '1' then
                buf_input_r(1638 downto 636) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1639;
            else
                bits_in_buffer               <= 636;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 701 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(636 downto 0)        <= buf_input_r(700 downto 64);
            if in_rdy = '1' then
                buf_input_r(1639 downto 637) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1640;
            else
                bits_in_buffer               <= 637;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 702 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(637 downto 0)        <= buf_input_r(701 downto 64);
            if in_rdy = '1' then
                buf_input_r(1640 downto 638) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1641;
            else
                bits_in_buffer               <= 638;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 703 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(638 downto 0)        <= buf_input_r(702 downto 64);
            if in_rdy = '1' then
                buf_input_r(1641 downto 639) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1642;
            else
                bits_in_buffer               <= 639;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 704 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(639 downto 0)        <= buf_input_r(703 downto 64);
            if in_rdy = '1' then
                buf_input_r(1642 downto 640) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1643;
            else
                bits_in_buffer               <= 640;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 705 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(640 downto 0)        <= buf_input_r(704 downto 64);
            if in_rdy = '1' then
                buf_input_r(1643 downto 641) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1644;
            else
                bits_in_buffer               <= 641;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 706 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(641 downto 0)        <= buf_input_r(705 downto 64);
            if in_rdy = '1' then
                buf_input_r(1644 downto 642) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1645;
            else
                bits_in_buffer               <= 642;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 707 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(642 downto 0)        <= buf_input_r(706 downto 64);
            if in_rdy = '1' then
                buf_input_r(1645 downto 643) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1646;
            else
                bits_in_buffer               <= 643;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 708 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(643 downto 0)        <= buf_input_r(707 downto 64);
            if in_rdy = '1' then
                buf_input_r(1646 downto 644) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1647;
            else
                bits_in_buffer               <= 644;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 709 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(644 downto 0)        <= buf_input_r(708 downto 64);
            if in_rdy = '1' then
                buf_input_r(1647 downto 645) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1648;
            else
                bits_in_buffer               <= 645;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 710 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(645 downto 0)        <= buf_input_r(709 downto 64);
            if in_rdy = '1' then
                buf_input_r(1648 downto 646) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1649;
            else
                bits_in_buffer               <= 646;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 711 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(646 downto 0)        <= buf_input_r(710 downto 64);
            if in_rdy = '1' then
                buf_input_r(1649 downto 647) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1650;
            else
                bits_in_buffer               <= 647;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 712 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(647 downto 0)        <= buf_input_r(711 downto 64);
            if in_rdy = '1' then
                buf_input_r(1650 downto 648) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1651;
            else
                bits_in_buffer               <= 648;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 713 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(648 downto 0)        <= buf_input_r(712 downto 64);
            if in_rdy = '1' then
                buf_input_r(1651 downto 649) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1652;
            else
                bits_in_buffer               <= 649;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 714 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(649 downto 0)        <= buf_input_r(713 downto 64);
            if in_rdy = '1' then
                buf_input_r(1652 downto 650) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1653;
            else
                bits_in_buffer               <= 650;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 715 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(650 downto 0)        <= buf_input_r(714 downto 64);
            if in_rdy = '1' then
                buf_input_r(1653 downto 651) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1654;
            else
                bits_in_buffer               <= 651;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 716 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(651 downto 0)        <= buf_input_r(715 downto 64);
            if in_rdy = '1' then
                buf_input_r(1654 downto 652) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1655;
            else
                bits_in_buffer               <= 652;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 717 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(652 downto 0)        <= buf_input_r(716 downto 64);
            if in_rdy = '1' then
                buf_input_r(1655 downto 653) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1656;
            else
                bits_in_buffer               <= 653;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 718 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(653 downto 0)        <= buf_input_r(717 downto 64);
            if in_rdy = '1' then
                buf_input_r(1656 downto 654) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1657;
            else
                bits_in_buffer               <= 654;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 719 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(654 downto 0)        <= buf_input_r(718 downto 64);
            if in_rdy = '1' then
                buf_input_r(1657 downto 655) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1658;
            else
                bits_in_buffer               <= 655;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 720 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(655 downto 0)        <= buf_input_r(719 downto 64);
            if in_rdy = '1' then
                buf_input_r(1658 downto 656) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1659;
            else
                bits_in_buffer               <= 656;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 721 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(656 downto 0)        <= buf_input_r(720 downto 64);
            if in_rdy = '1' then
                buf_input_r(1659 downto 657) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1660;
            else
                bits_in_buffer               <= 657;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 722 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(657 downto 0)        <= buf_input_r(721 downto 64);
            if in_rdy = '1' then
                buf_input_r(1660 downto 658) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1661;
            else
                bits_in_buffer               <= 658;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 723 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(658 downto 0)        <= buf_input_r(722 downto 64);
            if in_rdy = '1' then
                buf_input_r(1661 downto 659) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1662;
            else
                bits_in_buffer               <= 659;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 724 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(659 downto 0)        <= buf_input_r(723 downto 64);
            if in_rdy = '1' then
                buf_input_r(1662 downto 660) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1663;
            else
                bits_in_buffer               <= 660;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 725 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(660 downto 0)        <= buf_input_r(724 downto 64);
            if in_rdy = '1' then
                buf_input_r(1663 downto 661) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1664;
            else
                bits_in_buffer               <= 661;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 726 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(661 downto 0)        <= buf_input_r(725 downto 64);
            if in_rdy = '1' then
                buf_input_r(1664 downto 662) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1665;
            else
                bits_in_buffer               <= 662;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 727 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(662 downto 0)        <= buf_input_r(726 downto 64);
            if in_rdy = '1' then
                buf_input_r(1665 downto 663) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1666;
            else
                bits_in_buffer               <= 663;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 728 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(663 downto 0)        <= buf_input_r(727 downto 64);
            if in_rdy = '1' then
                buf_input_r(1666 downto 664) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1667;
            else
                bits_in_buffer               <= 664;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 729 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(664 downto 0)        <= buf_input_r(728 downto 64);
            if in_rdy = '1' then
                buf_input_r(1667 downto 665) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1668;
            else
                bits_in_buffer               <= 665;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 730 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(665 downto 0)        <= buf_input_r(729 downto 64);
            if in_rdy = '1' then
                buf_input_r(1668 downto 666) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1669;
            else
                bits_in_buffer               <= 666;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 731 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(666 downto 0)        <= buf_input_r(730 downto 64);
            if in_rdy = '1' then
                buf_input_r(1669 downto 667) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1670;
            else
                bits_in_buffer               <= 667;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 732 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(667 downto 0)        <= buf_input_r(731 downto 64);
            if in_rdy = '1' then
                buf_input_r(1670 downto 668) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1671;
            else
                bits_in_buffer               <= 668;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 733 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(668 downto 0)        <= buf_input_r(732 downto 64);
            if in_rdy = '1' then
                buf_input_r(1671 downto 669) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1672;
            else
                bits_in_buffer               <= 669;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 734 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(669 downto 0)        <= buf_input_r(733 downto 64);
            if in_rdy = '1' then
                buf_input_r(1672 downto 670) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1673;
            else
                bits_in_buffer               <= 670;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 735 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(670 downto 0)        <= buf_input_r(734 downto 64);
            if in_rdy = '1' then
                buf_input_r(1673 downto 671) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1674;
            else
                bits_in_buffer               <= 671;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 736 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(671 downto 0)        <= buf_input_r(735 downto 64);
            if in_rdy = '1' then
                buf_input_r(1674 downto 672) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1675;
            else
                bits_in_buffer               <= 672;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 737 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(672 downto 0)        <= buf_input_r(736 downto 64);
            if in_rdy = '1' then
                buf_input_r(1675 downto 673) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1676;
            else
                bits_in_buffer               <= 673;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 738 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(673 downto 0)        <= buf_input_r(737 downto 64);
            if in_rdy = '1' then
                buf_input_r(1676 downto 674) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1677;
            else
                bits_in_buffer               <= 674;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 739 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(674 downto 0)        <= buf_input_r(738 downto 64);
            if in_rdy = '1' then
                buf_input_r(1677 downto 675) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1678;
            else
                bits_in_buffer               <= 675;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 740 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(675 downto 0)        <= buf_input_r(739 downto 64);
            if in_rdy = '1' then
                buf_input_r(1678 downto 676) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1679;
            else
                bits_in_buffer               <= 676;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 741 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(676 downto 0)        <= buf_input_r(740 downto 64);
            if in_rdy = '1' then
                buf_input_r(1679 downto 677) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1680;
            else
                bits_in_buffer               <= 677;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 742 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(677 downto 0)        <= buf_input_r(741 downto 64);
            if in_rdy = '1' then
                buf_input_r(1680 downto 678) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1681;
            else
                bits_in_buffer               <= 678;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 743 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(678 downto 0)        <= buf_input_r(742 downto 64);
            if in_rdy = '1' then
                buf_input_r(1681 downto 679) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1682;
            else
                bits_in_buffer               <= 679;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 744 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(679 downto 0)        <= buf_input_r(743 downto 64);
            if in_rdy = '1' then
                buf_input_r(1682 downto 680) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1683;
            else
                bits_in_buffer               <= 680;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 745 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(680 downto 0)        <= buf_input_r(744 downto 64);
            if in_rdy = '1' then
                buf_input_r(1683 downto 681) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1684;
            else
                bits_in_buffer               <= 681;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 746 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(681 downto 0)        <= buf_input_r(745 downto 64);
            if in_rdy = '1' then
                buf_input_r(1684 downto 682) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1685;
            else
                bits_in_buffer               <= 682;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 747 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(682 downto 0)        <= buf_input_r(746 downto 64);
            if in_rdy = '1' then
                buf_input_r(1685 downto 683) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1686;
            else
                bits_in_buffer               <= 683;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 748 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(683 downto 0)        <= buf_input_r(747 downto 64);
            if in_rdy = '1' then
                buf_input_r(1686 downto 684) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1687;
            else
                bits_in_buffer               <= 684;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 749 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(684 downto 0)        <= buf_input_r(748 downto 64);
            if in_rdy = '1' then
                buf_input_r(1687 downto 685) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1688;
            else
                bits_in_buffer               <= 685;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 750 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(685 downto 0)        <= buf_input_r(749 downto 64);
            if in_rdy = '1' then
                buf_input_r(1688 downto 686) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1689;
            else
                bits_in_buffer               <= 686;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 751 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(686 downto 0)        <= buf_input_r(750 downto 64);
            if in_rdy = '1' then
                buf_input_r(1689 downto 687) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1690;
            else
                bits_in_buffer               <= 687;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 752 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(687 downto 0)        <= buf_input_r(751 downto 64);
            if in_rdy = '1' then
                buf_input_r(1690 downto 688) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1691;
            else
                bits_in_buffer               <= 688;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 753 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(688 downto 0)        <= buf_input_r(752 downto 64);
            if in_rdy = '1' then
                buf_input_r(1691 downto 689) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1692;
            else
                bits_in_buffer               <= 689;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 754 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(689 downto 0)        <= buf_input_r(753 downto 64);
            if in_rdy = '1' then
                buf_input_r(1692 downto 690) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1693;
            else
                bits_in_buffer               <= 690;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 755 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(690 downto 0)        <= buf_input_r(754 downto 64);
            if in_rdy = '1' then
                buf_input_r(1693 downto 691) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1694;
            else
                bits_in_buffer               <= 691;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 756 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(691 downto 0)        <= buf_input_r(755 downto 64);
            if in_rdy = '1' then
                buf_input_r(1694 downto 692) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1695;
            else
                bits_in_buffer               <= 692;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 757 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(692 downto 0)        <= buf_input_r(756 downto 64);
            if in_rdy = '1' then
                buf_input_r(1695 downto 693) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1696;
            else
                bits_in_buffer               <= 693;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 758 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(693 downto 0)        <= buf_input_r(757 downto 64);
            if in_rdy = '1' then
                buf_input_r(1696 downto 694) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1697;
            else
                bits_in_buffer               <= 694;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 759 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(694 downto 0)        <= buf_input_r(758 downto 64);
            if in_rdy = '1' then
                buf_input_r(1697 downto 695) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1698;
            else
                bits_in_buffer               <= 695;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 760 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(695 downto 0)        <= buf_input_r(759 downto 64);
            if in_rdy = '1' then
                buf_input_r(1698 downto 696) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1699;
            else
                bits_in_buffer               <= 696;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 761 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(696 downto 0)        <= buf_input_r(760 downto 64);
            if in_rdy = '1' then
                buf_input_r(1699 downto 697) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1700;
            else
                bits_in_buffer               <= 697;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 762 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(697 downto 0)        <= buf_input_r(761 downto 64);
            if in_rdy = '1' then
                buf_input_r(1700 downto 698) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1701;
            else
                bits_in_buffer               <= 698;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 763 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(698 downto 0)        <= buf_input_r(762 downto 64);
            if in_rdy = '1' then
                buf_input_r(1701 downto 699) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1702;
            else
                bits_in_buffer               <= 699;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 764 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(699 downto 0)        <= buf_input_r(763 downto 64);
            if in_rdy = '1' then
                buf_input_r(1702 downto 700) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1703;
            else
                bits_in_buffer               <= 700;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 765 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(700 downto 0)        <= buf_input_r(764 downto 64);
            if in_rdy = '1' then
                buf_input_r(1703 downto 701) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1704;
            else
                bits_in_buffer               <= 701;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 766 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(701 downto 0)        <= buf_input_r(765 downto 64);
            if in_rdy = '1' then
                buf_input_r(1704 downto 702) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1705;
            else
                bits_in_buffer               <= 702;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 767 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(702 downto 0)        <= buf_input_r(766 downto 64);
            if in_rdy = '1' then
                buf_input_r(1705 downto 703) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1706;
            else
                bits_in_buffer               <= 703;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 768 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(703 downto 0)        <= buf_input_r(767 downto 64);
            if in_rdy = '1' then
                buf_input_r(1706 downto 704) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1707;
            else
                bits_in_buffer               <= 704;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 769 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(704 downto 0)        <= buf_input_r(768 downto 64);
            if in_rdy = '1' then
                buf_input_r(1707 downto 705) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1708;
            else
                bits_in_buffer               <= 705;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 770 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(705 downto 0)        <= buf_input_r(769 downto 64);
            if in_rdy = '1' then
                buf_input_r(1708 downto 706) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1709;
            else
                bits_in_buffer               <= 706;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 771 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(706 downto 0)        <= buf_input_r(770 downto 64);
            if in_rdy = '1' then
                buf_input_r(1709 downto 707) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1710;
            else
                bits_in_buffer               <= 707;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 772 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(707 downto 0)        <= buf_input_r(771 downto 64);
            if in_rdy = '1' then
                buf_input_r(1710 downto 708) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1711;
            else
                bits_in_buffer               <= 708;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 773 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(708 downto 0)        <= buf_input_r(772 downto 64);
            if in_rdy = '1' then
                buf_input_r(1711 downto 709) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1712;
            else
                bits_in_buffer               <= 709;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 774 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(709 downto 0)        <= buf_input_r(773 downto 64);
            if in_rdy = '1' then
                buf_input_r(1712 downto 710) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1713;
            else
                bits_in_buffer               <= 710;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 775 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(710 downto 0)        <= buf_input_r(774 downto 64);
            if in_rdy = '1' then
                buf_input_r(1713 downto 711) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1714;
            else
                bits_in_buffer               <= 711;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 776 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(711 downto 0)        <= buf_input_r(775 downto 64);
            if in_rdy = '1' then
                buf_input_r(1714 downto 712) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1715;
            else
                bits_in_buffer               <= 712;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 777 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(712 downto 0)        <= buf_input_r(776 downto 64);
            if in_rdy = '1' then
                buf_input_r(1715 downto 713) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1716;
            else
                bits_in_buffer               <= 713;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 778 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(713 downto 0)        <= buf_input_r(777 downto 64);
            if in_rdy = '1' then
                buf_input_r(1716 downto 714) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1717;
            else
                bits_in_buffer               <= 714;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 779 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(714 downto 0)        <= buf_input_r(778 downto 64);
            if in_rdy = '1' then
                buf_input_r(1717 downto 715) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1718;
            else
                bits_in_buffer               <= 715;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 780 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(715 downto 0)        <= buf_input_r(779 downto 64);
            if in_rdy = '1' then
                buf_input_r(1718 downto 716) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1719;
            else
                bits_in_buffer               <= 716;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 781 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(716 downto 0)        <= buf_input_r(780 downto 64);
            if in_rdy = '1' then
                buf_input_r(1719 downto 717) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1720;
            else
                bits_in_buffer               <= 717;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 782 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(717 downto 0)        <= buf_input_r(781 downto 64);
            if in_rdy = '1' then
                buf_input_r(1720 downto 718) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1721;
            else
                bits_in_buffer               <= 718;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 783 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(718 downto 0)        <= buf_input_r(782 downto 64);
            if in_rdy = '1' then
                buf_input_r(1721 downto 719) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1722;
            else
                bits_in_buffer               <= 719;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 784 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(719 downto 0)        <= buf_input_r(783 downto 64);
            if in_rdy = '1' then
                buf_input_r(1722 downto 720) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1723;
            else
                bits_in_buffer               <= 720;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 785 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(720 downto 0)        <= buf_input_r(784 downto 64);
            if in_rdy = '1' then
                buf_input_r(1723 downto 721) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1724;
            else
                bits_in_buffer               <= 721;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 786 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(721 downto 0)        <= buf_input_r(785 downto 64);
            if in_rdy = '1' then
                buf_input_r(1724 downto 722) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1725;
            else
                bits_in_buffer               <= 722;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 787 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(722 downto 0)        <= buf_input_r(786 downto 64);
            if in_rdy = '1' then
                buf_input_r(1725 downto 723) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1726;
            else
                bits_in_buffer               <= 723;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 788 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(723 downto 0)        <= buf_input_r(787 downto 64);
            if in_rdy = '1' then
                buf_input_r(1726 downto 724) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1727;
            else
                bits_in_buffer               <= 724;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 789 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(724 downto 0)        <= buf_input_r(788 downto 64);
            if in_rdy = '1' then
                buf_input_r(1727 downto 725) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1728;
            else
                bits_in_buffer               <= 725;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 790 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(725 downto 0)        <= buf_input_r(789 downto 64);
            if in_rdy = '1' then
                buf_input_r(1728 downto 726) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1729;
            else
                bits_in_buffer               <= 726;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 791 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(726 downto 0)        <= buf_input_r(790 downto 64);
            if in_rdy = '1' then
                buf_input_r(1729 downto 727) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1730;
            else
                bits_in_buffer               <= 727;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 792 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(727 downto 0)        <= buf_input_r(791 downto 64);
            if in_rdy = '1' then
                buf_input_r(1730 downto 728) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1731;
            else
                bits_in_buffer               <= 728;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 793 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(728 downto 0)        <= buf_input_r(792 downto 64);
            if in_rdy = '1' then
                buf_input_r(1731 downto 729) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1732;
            else
                bits_in_buffer               <= 729;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 794 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(729 downto 0)        <= buf_input_r(793 downto 64);
            if in_rdy = '1' then
                buf_input_r(1732 downto 730) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1733;
            else
                bits_in_buffer               <= 730;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 795 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(730 downto 0)        <= buf_input_r(794 downto 64);
            if in_rdy = '1' then
                buf_input_r(1733 downto 731) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1734;
            else
                bits_in_buffer               <= 731;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 796 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(731 downto 0)        <= buf_input_r(795 downto 64);
            if in_rdy = '1' then
                buf_input_r(1734 downto 732) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1735;
            else
                bits_in_buffer               <= 732;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 797 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(732 downto 0)        <= buf_input_r(796 downto 64);
            if in_rdy = '1' then
                buf_input_r(1735 downto 733) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1736;
            else
                bits_in_buffer               <= 733;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 798 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(733 downto 0)        <= buf_input_r(797 downto 64);
            if in_rdy = '1' then
                buf_input_r(1736 downto 734) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1737;
            else
                bits_in_buffer               <= 734;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 799 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(734 downto 0)        <= buf_input_r(798 downto 64);
            if in_rdy = '1' then
                buf_input_r(1737 downto 735) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1738;
            else
                bits_in_buffer               <= 735;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 800 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(735 downto 0)        <= buf_input_r(799 downto 64);
            if in_rdy = '1' then
                buf_input_r(1738 downto 736) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1739;
            else
                bits_in_buffer               <= 736;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 801 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(736 downto 0)        <= buf_input_r(800 downto 64);
            if in_rdy = '1' then
                buf_input_r(1739 downto 737) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1740;
            else
                bits_in_buffer               <= 737;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 802 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(737 downto 0)        <= buf_input_r(801 downto 64);
            if in_rdy = '1' then
                buf_input_r(1740 downto 738) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1741;
            else
                bits_in_buffer               <= 738;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 803 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(738 downto 0)        <= buf_input_r(802 downto 64);
            if in_rdy = '1' then
                buf_input_r(1741 downto 739) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1742;
            else
                bits_in_buffer               <= 739;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 804 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(739 downto 0)        <= buf_input_r(803 downto 64);
            if in_rdy = '1' then
                buf_input_r(1742 downto 740) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1743;
            else
                bits_in_buffer               <= 740;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 805 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(740 downto 0)        <= buf_input_r(804 downto 64);
            if in_rdy = '1' then
                buf_input_r(1743 downto 741) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1744;
            else
                bits_in_buffer               <= 741;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 806 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(741 downto 0)        <= buf_input_r(805 downto 64);
            if in_rdy = '1' then
                buf_input_r(1744 downto 742) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1745;
            else
                bits_in_buffer               <= 742;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 807 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(742 downto 0)        <= buf_input_r(806 downto 64);
            if in_rdy = '1' then
                buf_input_r(1745 downto 743) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1746;
            else
                bits_in_buffer               <= 743;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 808 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(743 downto 0)        <= buf_input_r(807 downto 64);
            if in_rdy = '1' then
                buf_input_r(1746 downto 744) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1747;
            else
                bits_in_buffer               <= 744;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 809 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(744 downto 0)        <= buf_input_r(808 downto 64);
            if in_rdy = '1' then
                buf_input_r(1747 downto 745) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1748;
            else
                bits_in_buffer               <= 745;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 810 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(745 downto 0)        <= buf_input_r(809 downto 64);
            if in_rdy = '1' then
                buf_input_r(1748 downto 746) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1749;
            else
                bits_in_buffer               <= 746;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 811 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(746 downto 0)        <= buf_input_r(810 downto 64);
            if in_rdy = '1' then
                buf_input_r(1749 downto 747) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1750;
            else
                bits_in_buffer               <= 747;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 812 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(747 downto 0)        <= buf_input_r(811 downto 64);
            if in_rdy = '1' then
                buf_input_r(1750 downto 748) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1751;
            else
                bits_in_buffer               <= 748;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 813 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(748 downto 0)        <= buf_input_r(812 downto 64);
            if in_rdy = '1' then
                buf_input_r(1751 downto 749) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1752;
            else
                bits_in_buffer               <= 749;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 814 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(749 downto 0)        <= buf_input_r(813 downto 64);
            if in_rdy = '1' then
                buf_input_r(1752 downto 750) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1753;
            else
                bits_in_buffer               <= 750;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 815 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(750 downto 0)        <= buf_input_r(814 downto 64);
            if in_rdy = '1' then
                buf_input_r(1753 downto 751) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1754;
            else
                bits_in_buffer               <= 751;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 816 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(751 downto 0)        <= buf_input_r(815 downto 64);
            if in_rdy = '1' then
                buf_input_r(1754 downto 752) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1755;
            else
                bits_in_buffer               <= 752;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 817 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(752 downto 0)        <= buf_input_r(816 downto 64);
            if in_rdy = '1' then
                buf_input_r(1755 downto 753) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1756;
            else
                bits_in_buffer               <= 753;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 818 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(753 downto 0)        <= buf_input_r(817 downto 64);
            if in_rdy = '1' then
                buf_input_r(1756 downto 754) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1757;
            else
                bits_in_buffer               <= 754;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 819 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(754 downto 0)        <= buf_input_r(818 downto 64);
            if in_rdy = '1' then
                buf_input_r(1757 downto 755) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1758;
            else
                bits_in_buffer               <= 755;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 820 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(755 downto 0)        <= buf_input_r(819 downto 64);
            if in_rdy = '1' then
                buf_input_r(1758 downto 756) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1759;
            else
                bits_in_buffer               <= 756;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 821 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(756 downto 0)        <= buf_input_r(820 downto 64);
            if in_rdy = '1' then
                buf_input_r(1759 downto 757) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1760;
            else
                bits_in_buffer               <= 757;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 822 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(757 downto 0)        <= buf_input_r(821 downto 64);
            if in_rdy = '1' then
                buf_input_r(1760 downto 758) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1761;
            else
                bits_in_buffer               <= 758;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 823 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(758 downto 0)        <= buf_input_r(822 downto 64);
            if in_rdy = '1' then
                buf_input_r(1761 downto 759) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1762;
            else
                bits_in_buffer               <= 759;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 824 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(759 downto 0)        <= buf_input_r(823 downto 64);
            if in_rdy = '1' then
                buf_input_r(1762 downto 760) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1763;
            else
                bits_in_buffer               <= 760;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 825 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(760 downto 0)        <= buf_input_r(824 downto 64);
            if in_rdy = '1' then
                buf_input_r(1763 downto 761) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1764;
            else
                bits_in_buffer               <= 761;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 826 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(761 downto 0)        <= buf_input_r(825 downto 64);
            if in_rdy = '1' then
                buf_input_r(1764 downto 762) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1765;
            else
                bits_in_buffer               <= 762;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 827 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(762 downto 0)        <= buf_input_r(826 downto 64);
            if in_rdy = '1' then
                buf_input_r(1765 downto 763) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1766;
            else
                bits_in_buffer               <= 763;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 828 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(763 downto 0)        <= buf_input_r(827 downto 64);
            if in_rdy = '1' then
                buf_input_r(1766 downto 764) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1767;
            else
                bits_in_buffer               <= 764;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 829 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(764 downto 0)        <= buf_input_r(828 downto 64);
            if in_rdy = '1' then
                buf_input_r(1767 downto 765) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1768;
            else
                bits_in_buffer               <= 765;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 830 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(765 downto 0)        <= buf_input_r(829 downto 64);
            if in_rdy = '1' then
                buf_input_r(1768 downto 766) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1769;
            else
                bits_in_buffer               <= 766;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 831 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(766 downto 0)        <= buf_input_r(830 downto 64);
            if in_rdy = '1' then
                buf_input_r(1769 downto 767) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1770;
            else
                bits_in_buffer               <= 767;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 832 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(767 downto 0)        <= buf_input_r(831 downto 64);
            if in_rdy = '1' then
                buf_input_r(1770 downto 768) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1771;
            else
                bits_in_buffer               <= 768;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 833 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(768 downto 0)        <= buf_input_r(832 downto 64);
            if in_rdy = '1' then
                buf_input_r(1771 downto 769) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1772;
            else
                bits_in_buffer               <= 769;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 834 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(769 downto 0)        <= buf_input_r(833 downto 64);
            if in_rdy = '1' then
                buf_input_r(1772 downto 770) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1773;
            else
                bits_in_buffer               <= 770;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 835 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(770 downto 0)        <= buf_input_r(834 downto 64);
            if in_rdy = '1' then
                buf_input_r(1773 downto 771) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1774;
            else
                bits_in_buffer               <= 771;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 836 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(771 downto 0)        <= buf_input_r(835 downto 64);
            if in_rdy = '1' then
                buf_input_r(1774 downto 772) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1775;
            else
                bits_in_buffer               <= 772;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 837 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(772 downto 0)        <= buf_input_r(836 downto 64);
            if in_rdy = '1' then
                buf_input_r(1775 downto 773) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1776;
            else
                bits_in_buffer               <= 773;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 838 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(773 downto 0)        <= buf_input_r(837 downto 64);
            if in_rdy = '1' then
                buf_input_r(1776 downto 774) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1777;
            else
                bits_in_buffer               <= 774;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 839 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(774 downto 0)        <= buf_input_r(838 downto 64);
            if in_rdy = '1' then
                buf_input_r(1777 downto 775) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1778;
            else
                bits_in_buffer               <= 775;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 840 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(775 downto 0)        <= buf_input_r(839 downto 64);
            if in_rdy = '1' then
                buf_input_r(1778 downto 776) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1779;
            else
                bits_in_buffer               <= 776;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 841 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(776 downto 0)        <= buf_input_r(840 downto 64);
            if in_rdy = '1' then
                buf_input_r(1779 downto 777) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1780;
            else
                bits_in_buffer               <= 777;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 842 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(777 downto 0)        <= buf_input_r(841 downto 64);
            if in_rdy = '1' then
                buf_input_r(1780 downto 778) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1781;
            else
                bits_in_buffer               <= 778;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 843 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(778 downto 0)        <= buf_input_r(842 downto 64);
            if in_rdy = '1' then
                buf_input_r(1781 downto 779) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1782;
            else
                bits_in_buffer               <= 779;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 844 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(779 downto 0)        <= buf_input_r(843 downto 64);
            if in_rdy = '1' then
                buf_input_r(1782 downto 780) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1783;
            else
                bits_in_buffer               <= 780;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 845 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(780 downto 0)        <= buf_input_r(844 downto 64);
            if in_rdy = '1' then
                buf_input_r(1783 downto 781) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1784;
            else
                bits_in_buffer               <= 781;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 846 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(781 downto 0)        <= buf_input_r(845 downto 64);
            if in_rdy = '1' then
                buf_input_r(1784 downto 782) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1785;
            else
                bits_in_buffer               <= 782;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 847 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(782 downto 0)        <= buf_input_r(846 downto 64);
            if in_rdy = '1' then
                buf_input_r(1785 downto 783) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1786;
            else
                bits_in_buffer               <= 783;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 848 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(783 downto 0)        <= buf_input_r(847 downto 64);
            if in_rdy = '1' then
                buf_input_r(1786 downto 784) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1787;
            else
                bits_in_buffer               <= 784;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 849 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(784 downto 0)        <= buf_input_r(848 downto 64);
            if in_rdy = '1' then
                buf_input_r(1787 downto 785) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1788;
            else
                bits_in_buffer               <= 785;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 850 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(785 downto 0)        <= buf_input_r(849 downto 64);
            if in_rdy = '1' then
                buf_input_r(1788 downto 786) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1789;
            else
                bits_in_buffer               <= 786;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 851 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(786 downto 0)        <= buf_input_r(850 downto 64);
            if in_rdy = '1' then
                buf_input_r(1789 downto 787) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1790;
            else
                bits_in_buffer               <= 787;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 852 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(787 downto 0)        <= buf_input_r(851 downto 64);
            if in_rdy = '1' then
                buf_input_r(1790 downto 788) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1791;
            else
                bits_in_buffer               <= 788;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 853 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(788 downto 0)        <= buf_input_r(852 downto 64);
            if in_rdy = '1' then
                buf_input_r(1791 downto 789) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1792;
            else
                bits_in_buffer               <= 789;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 854 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(789 downto 0)        <= buf_input_r(853 downto 64);
            if in_rdy = '1' then
                buf_input_r(1792 downto 790) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1793;
            else
                bits_in_buffer               <= 790;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 855 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(790 downto 0)        <= buf_input_r(854 downto 64);
            if in_rdy = '1' then
                buf_input_r(1793 downto 791) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1794;
            else
                bits_in_buffer               <= 791;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 856 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(791 downto 0)        <= buf_input_r(855 downto 64);
            if in_rdy = '1' then
                buf_input_r(1794 downto 792) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1795;
            else
                bits_in_buffer               <= 792;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 857 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(792 downto 0)        <= buf_input_r(856 downto 64);
            if in_rdy = '1' then
                buf_input_r(1795 downto 793) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1796;
            else
                bits_in_buffer               <= 793;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 858 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(793 downto 0)        <= buf_input_r(857 downto 64);
            if in_rdy = '1' then
                buf_input_r(1796 downto 794) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1797;
            else
                bits_in_buffer               <= 794;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 859 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(794 downto 0)        <= buf_input_r(858 downto 64);
            if in_rdy = '1' then
                buf_input_r(1797 downto 795) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1798;
            else
                bits_in_buffer               <= 795;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 860 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(795 downto 0)        <= buf_input_r(859 downto 64);
            if in_rdy = '1' then
                buf_input_r(1798 downto 796) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1799;
            else
                bits_in_buffer               <= 796;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 861 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(796 downto 0)        <= buf_input_r(860 downto 64);
            if in_rdy = '1' then
                buf_input_r(1799 downto 797) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1800;
            else
                bits_in_buffer               <= 797;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 862 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(797 downto 0)        <= buf_input_r(861 downto 64);
            if in_rdy = '1' then
                buf_input_r(1800 downto 798) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1801;
            else
                bits_in_buffer               <= 798;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 863 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(798 downto 0)        <= buf_input_r(862 downto 64);
            if in_rdy = '1' then
                buf_input_r(1801 downto 799) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1802;
            else
                bits_in_buffer               <= 799;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 864 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(799 downto 0)        <= buf_input_r(863 downto 64);
            if in_rdy = '1' then
                buf_input_r(1802 downto 800) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1803;
            else
                bits_in_buffer               <= 800;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 865 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(800 downto 0)        <= buf_input_r(864 downto 64);
            if in_rdy = '1' then
                buf_input_r(1803 downto 801) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1804;
            else
                bits_in_buffer               <= 801;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 866 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(801 downto 0)        <= buf_input_r(865 downto 64);
            if in_rdy = '1' then
                buf_input_r(1804 downto 802) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1805;
            else
                bits_in_buffer               <= 802;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 867 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(802 downto 0)        <= buf_input_r(866 downto 64);
            if in_rdy = '1' then
                buf_input_r(1805 downto 803) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1806;
            else
                bits_in_buffer               <= 803;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 868 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(803 downto 0)        <= buf_input_r(867 downto 64);
            if in_rdy = '1' then
                buf_input_r(1806 downto 804) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1807;
            else
                bits_in_buffer               <= 804;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 869 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(804 downto 0)        <= buf_input_r(868 downto 64);
            if in_rdy = '1' then
                buf_input_r(1807 downto 805) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1808;
            else
                bits_in_buffer               <= 805;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 870 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(805 downto 0)        <= buf_input_r(869 downto 64);
            if in_rdy = '1' then
                buf_input_r(1808 downto 806) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1809;
            else
                bits_in_buffer               <= 806;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 871 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(806 downto 0)        <= buf_input_r(870 downto 64);
            if in_rdy = '1' then
                buf_input_r(1809 downto 807) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1810;
            else
                bits_in_buffer               <= 807;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 872 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(807 downto 0)        <= buf_input_r(871 downto 64);
            if in_rdy = '1' then
                buf_input_r(1810 downto 808) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1811;
            else
                bits_in_buffer               <= 808;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 873 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(808 downto 0)        <= buf_input_r(872 downto 64);
            if in_rdy = '1' then
                buf_input_r(1811 downto 809) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1812;
            else
                bits_in_buffer               <= 809;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 874 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(809 downto 0)        <= buf_input_r(873 downto 64);
            if in_rdy = '1' then
                buf_input_r(1812 downto 810) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1813;
            else
                bits_in_buffer               <= 810;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 875 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(810 downto 0)        <= buf_input_r(874 downto 64);
            if in_rdy = '1' then
                buf_input_r(1813 downto 811) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1814;
            else
                bits_in_buffer               <= 811;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 876 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(811 downto 0)        <= buf_input_r(875 downto 64);
            if in_rdy = '1' then
                buf_input_r(1814 downto 812) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1815;
            else
                bits_in_buffer               <= 812;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 877 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(812 downto 0)        <= buf_input_r(876 downto 64);
            if in_rdy = '1' then
                buf_input_r(1815 downto 813) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1816;
            else
                bits_in_buffer               <= 813;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 878 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(813 downto 0)        <= buf_input_r(877 downto 64);
            if in_rdy = '1' then
                buf_input_r(1816 downto 814) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1817;
            else
                bits_in_buffer               <= 814;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 879 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(814 downto 0)        <= buf_input_r(878 downto 64);
            if in_rdy = '1' then
                buf_input_r(1817 downto 815) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1818;
            else
                bits_in_buffer               <= 815;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 880 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(815 downto 0)        <= buf_input_r(879 downto 64);
            if in_rdy = '1' then
                buf_input_r(1818 downto 816) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1819;
            else
                bits_in_buffer               <= 816;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 881 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(816 downto 0)        <= buf_input_r(880 downto 64);
            if in_rdy = '1' then
                buf_input_r(1819 downto 817) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1820;
            else
                bits_in_buffer               <= 817;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 882 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(817 downto 0)        <= buf_input_r(881 downto 64);
            if in_rdy = '1' then
                buf_input_r(1820 downto 818) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1821;
            else
                bits_in_buffer               <= 818;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 883 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(818 downto 0)        <= buf_input_r(882 downto 64);
            if in_rdy = '1' then
                buf_input_r(1821 downto 819) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1822;
            else
                bits_in_buffer               <= 819;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 884 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(819 downto 0)        <= buf_input_r(883 downto 64);
            if in_rdy = '1' then
                buf_input_r(1822 downto 820) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1823;
            else
                bits_in_buffer               <= 820;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 885 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(820 downto 0)        <= buf_input_r(884 downto 64);
            if in_rdy = '1' then
                buf_input_r(1823 downto 821) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1824;
            else
                bits_in_buffer               <= 821;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 886 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(821 downto 0)        <= buf_input_r(885 downto 64);
            if in_rdy = '1' then
                buf_input_r(1824 downto 822) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1825;
            else
                bits_in_buffer               <= 822;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 887 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(822 downto 0)        <= buf_input_r(886 downto 64);
            if in_rdy = '1' then
                buf_input_r(1825 downto 823) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1826;
            else
                bits_in_buffer               <= 823;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 888 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(823 downto 0)        <= buf_input_r(887 downto 64);
            if in_rdy = '1' then
                buf_input_r(1826 downto 824) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1827;
            else
                bits_in_buffer               <= 824;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 889 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(824 downto 0)        <= buf_input_r(888 downto 64);
            if in_rdy = '1' then
                buf_input_r(1827 downto 825) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1828;
            else
                bits_in_buffer               <= 825;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 890 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(825 downto 0)        <= buf_input_r(889 downto 64);
            if in_rdy = '1' then
                buf_input_r(1828 downto 826) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1829;
            else
                bits_in_buffer               <= 826;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 891 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(826 downto 0)        <= buf_input_r(890 downto 64);
            if in_rdy = '1' then
                buf_input_r(1829 downto 827) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1830;
            else
                bits_in_buffer               <= 827;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 892 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(827 downto 0)        <= buf_input_r(891 downto 64);
            if in_rdy = '1' then
                buf_input_r(1830 downto 828) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1831;
            else
                bits_in_buffer               <= 828;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 893 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(828 downto 0)        <= buf_input_r(892 downto 64);
            if in_rdy = '1' then
                buf_input_r(1831 downto 829) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1832;
            else
                bits_in_buffer               <= 829;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 894 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(829 downto 0)        <= buf_input_r(893 downto 64);
            if in_rdy = '1' then
                buf_input_r(1832 downto 830) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1833;
            else
                bits_in_buffer               <= 830;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 895 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(830 downto 0)        <= buf_input_r(894 downto 64);
            if in_rdy = '1' then
                buf_input_r(1833 downto 831) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1834;
            else
                bits_in_buffer               <= 831;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 896 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(831 downto 0)        <= buf_input_r(895 downto 64);
            if in_rdy = '1' then
                buf_input_r(1834 downto 832) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1835;
            else
                bits_in_buffer               <= 832;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 897 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(832 downto 0)        <= buf_input_r(896 downto 64);
            if in_rdy = '1' then
                buf_input_r(1835 downto 833) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1836;
            else
                bits_in_buffer               <= 833;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 898 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(833 downto 0)        <= buf_input_r(897 downto 64);
            if in_rdy = '1' then
                buf_input_r(1836 downto 834) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1837;
            else
                bits_in_buffer               <= 834;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 899 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(834 downto 0)        <= buf_input_r(898 downto 64);
            if in_rdy = '1' then
                buf_input_r(1837 downto 835) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1838;
            else
                bits_in_buffer               <= 835;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 900 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(835 downto 0)        <= buf_input_r(899 downto 64);
            if in_rdy = '1' then
                buf_input_r(1838 downto 836) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1839;
            else
                bits_in_buffer               <= 836;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 901 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(836 downto 0)        <= buf_input_r(900 downto 64);
            if in_rdy = '1' then
                buf_input_r(1839 downto 837) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1840;
            else
                bits_in_buffer               <= 837;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 902 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(837 downto 0)        <= buf_input_r(901 downto 64);
            if in_rdy = '1' then
                buf_input_r(1840 downto 838) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1841;
            else
                bits_in_buffer               <= 838;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 903 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(838 downto 0)        <= buf_input_r(902 downto 64);
            if in_rdy = '1' then
                buf_input_r(1841 downto 839) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1842;
            else
                bits_in_buffer               <= 839;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 904 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(839 downto 0)        <= buf_input_r(903 downto 64);
            if in_rdy = '1' then
                buf_input_r(1842 downto 840) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1843;
            else
                bits_in_buffer               <= 840;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 905 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(840 downto 0)        <= buf_input_r(904 downto 64);
            if in_rdy = '1' then
                buf_input_r(1843 downto 841) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1844;
            else
                bits_in_buffer               <= 841;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 906 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(841 downto 0)        <= buf_input_r(905 downto 64);
            if in_rdy = '1' then
                buf_input_r(1844 downto 842) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1845;
            else
                bits_in_buffer               <= 842;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 907 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(842 downto 0)        <= buf_input_r(906 downto 64);
            if in_rdy = '1' then
                buf_input_r(1845 downto 843) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1846;
            else
                bits_in_buffer               <= 843;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 908 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(843 downto 0)        <= buf_input_r(907 downto 64);
            if in_rdy = '1' then
                buf_input_r(1846 downto 844) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1847;
            else
                bits_in_buffer               <= 844;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 909 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(844 downto 0)        <= buf_input_r(908 downto 64);
            if in_rdy = '1' then
                buf_input_r(1847 downto 845) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1848;
            else
                bits_in_buffer               <= 845;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 910 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(845 downto 0)        <= buf_input_r(909 downto 64);
            if in_rdy = '1' then
                buf_input_r(1848 downto 846) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1849;
            else
                bits_in_buffer               <= 846;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 911 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(846 downto 0)        <= buf_input_r(910 downto 64);
            if in_rdy = '1' then
                buf_input_r(1849 downto 847) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1850;
            else
                bits_in_buffer               <= 847;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 912 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(847 downto 0)        <= buf_input_r(911 downto 64);
            if in_rdy = '1' then
                buf_input_r(1850 downto 848) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1851;
            else
                bits_in_buffer               <= 848;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 913 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(848 downto 0)        <= buf_input_r(912 downto 64);
            if in_rdy = '1' then
                buf_input_r(1851 downto 849) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1852;
            else
                bits_in_buffer               <= 849;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 914 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(849 downto 0)        <= buf_input_r(913 downto 64);
            if in_rdy = '1' then
                buf_input_r(1852 downto 850) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1853;
            else
                bits_in_buffer               <= 850;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 915 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(850 downto 0)        <= buf_input_r(914 downto 64);
            if in_rdy = '1' then
                buf_input_r(1853 downto 851) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1854;
            else
                bits_in_buffer               <= 851;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 916 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(851 downto 0)        <= buf_input_r(915 downto 64);
            if in_rdy = '1' then
                buf_input_r(1854 downto 852) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1855;
            else
                bits_in_buffer               <= 852;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 917 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(852 downto 0)        <= buf_input_r(916 downto 64);
            if in_rdy = '1' then
                buf_input_r(1855 downto 853) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1856;
            else
                bits_in_buffer               <= 853;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 918 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(853 downto 0)        <= buf_input_r(917 downto 64);
            if in_rdy = '1' then
                buf_input_r(1856 downto 854) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1857;
            else
                bits_in_buffer               <= 854;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 919 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(854 downto 0)        <= buf_input_r(918 downto 64);
            if in_rdy = '1' then
                buf_input_r(1857 downto 855) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1858;
            else
                bits_in_buffer               <= 855;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 920 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(855 downto 0)        <= buf_input_r(919 downto 64);
            if in_rdy = '1' then
                buf_input_r(1858 downto 856) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1859;
            else
                bits_in_buffer               <= 856;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 921 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(856 downto 0)        <= buf_input_r(920 downto 64);
            if in_rdy = '1' then
                buf_input_r(1859 downto 857) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1860;
            else
                bits_in_buffer               <= 857;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 922 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(857 downto 0)        <= buf_input_r(921 downto 64);
            if in_rdy = '1' then
                buf_input_r(1860 downto 858) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1861;
            else
                bits_in_buffer               <= 858;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 923 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(858 downto 0)        <= buf_input_r(922 downto 64);
            if in_rdy = '1' then
                buf_input_r(1861 downto 859) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1862;
            else
                bits_in_buffer               <= 859;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 924 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(859 downto 0)        <= buf_input_r(923 downto 64);
            if in_rdy = '1' then
                buf_input_r(1862 downto 860) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1863;
            else
                bits_in_buffer               <= 860;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 925 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(860 downto 0)        <= buf_input_r(924 downto 64);
            if in_rdy = '1' then
                buf_input_r(1863 downto 861) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1864;
            else
                bits_in_buffer               <= 861;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 926 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(861 downto 0)        <= buf_input_r(925 downto 64);
            if in_rdy = '1' then
                buf_input_r(1864 downto 862) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1865;
            else
                bits_in_buffer               <= 862;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 927 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(862 downto 0)        <= buf_input_r(926 downto 64);
            if in_rdy = '1' then
                buf_input_r(1865 downto 863) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1866;
            else
                bits_in_buffer               <= 863;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 928 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(863 downto 0)        <= buf_input_r(927 downto 64);
            if in_rdy = '1' then
                buf_input_r(1866 downto 864) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1867;
            else
                bits_in_buffer               <= 864;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 929 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(864 downto 0)        <= buf_input_r(928 downto 64);
            if in_rdy = '1' then
                buf_input_r(1867 downto 865) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1868;
            else
                bits_in_buffer               <= 865;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 930 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(865 downto 0)        <= buf_input_r(929 downto 64);
            if in_rdy = '1' then
                buf_input_r(1868 downto 866) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1869;
            else
                bits_in_buffer               <= 866;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 931 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(866 downto 0)        <= buf_input_r(930 downto 64);
            if in_rdy = '1' then
                buf_input_r(1869 downto 867) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1870;
            else
                bits_in_buffer               <= 867;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 932 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(867 downto 0)        <= buf_input_r(931 downto 64);
            if in_rdy = '1' then
                buf_input_r(1870 downto 868) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1871;
            else
                bits_in_buffer               <= 868;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 933 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(868 downto 0)        <= buf_input_r(932 downto 64);
            if in_rdy = '1' then
                buf_input_r(1871 downto 869) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1872;
            else
                bits_in_buffer               <= 869;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 934 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(869 downto 0)        <= buf_input_r(933 downto 64);
            if in_rdy = '1' then
                buf_input_r(1872 downto 870) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1873;
            else
                bits_in_buffer               <= 870;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 935 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(870 downto 0)        <= buf_input_r(934 downto 64);
            if in_rdy = '1' then
                buf_input_r(1873 downto 871) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1874;
            else
                bits_in_buffer               <= 871;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 936 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(871 downto 0)        <= buf_input_r(935 downto 64);
            if in_rdy = '1' then
                buf_input_r(1874 downto 872) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1875;
            else
                bits_in_buffer               <= 872;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 937 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(872 downto 0)        <= buf_input_r(936 downto 64);
            if in_rdy = '1' then
                buf_input_r(1875 downto 873) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1876;
            else
                bits_in_buffer               <= 873;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 938 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(873 downto 0)        <= buf_input_r(937 downto 64);
            if in_rdy = '1' then
                buf_input_r(1876 downto 874) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1877;
            else
                bits_in_buffer               <= 874;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 939 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(874 downto 0)        <= buf_input_r(938 downto 64);
            if in_rdy = '1' then
                buf_input_r(1877 downto 875) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1878;
            else
                bits_in_buffer               <= 875;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 940 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(875 downto 0)        <= buf_input_r(939 downto 64);
            if in_rdy = '1' then
                buf_input_r(1878 downto 876) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1879;
            else
                bits_in_buffer               <= 876;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 941 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(876 downto 0)        <= buf_input_r(940 downto 64);
            if in_rdy = '1' then
                buf_input_r(1879 downto 877) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1880;
            else
                bits_in_buffer               <= 877;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 942 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(877 downto 0)        <= buf_input_r(941 downto 64);
            if in_rdy = '1' then
                buf_input_r(1880 downto 878) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1881;
            else
                bits_in_buffer               <= 878;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 943 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(878 downto 0)        <= buf_input_r(942 downto 64);
            if in_rdy = '1' then
                buf_input_r(1881 downto 879) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1882;
            else
                bits_in_buffer               <= 879;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 944 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(879 downto 0)        <= buf_input_r(943 downto 64);
            if in_rdy = '1' then
                buf_input_r(1882 downto 880) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1883;
            else
                bits_in_buffer               <= 880;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 945 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(880 downto 0)        <= buf_input_r(944 downto 64);
            if in_rdy = '1' then
                buf_input_r(1883 downto 881) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1884;
            else
                bits_in_buffer               <= 881;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 946 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(881 downto 0)        <= buf_input_r(945 downto 64);
            if in_rdy = '1' then
                buf_input_r(1884 downto 882) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1885;
            else
                bits_in_buffer               <= 882;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 947 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(882 downto 0)        <= buf_input_r(946 downto 64);
            if in_rdy = '1' then
                buf_input_r(1885 downto 883) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1886;
            else
                bits_in_buffer               <= 883;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 948 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(883 downto 0)        <= buf_input_r(947 downto 64);
            if in_rdy = '1' then
                buf_input_r(1886 downto 884) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1887;
            else
                bits_in_buffer               <= 884;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 949 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(884 downto 0)        <= buf_input_r(948 downto 64);
            if in_rdy = '1' then
                buf_input_r(1887 downto 885) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1888;
            else
                bits_in_buffer               <= 885;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 950 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(885 downto 0)        <= buf_input_r(949 downto 64);
            if in_rdy = '1' then
                buf_input_r(1888 downto 886) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1889;
            else
                bits_in_buffer               <= 886;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 951 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(886 downto 0)        <= buf_input_r(950 downto 64);
            if in_rdy = '1' then
                buf_input_r(1889 downto 887) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1890;
            else
                bits_in_buffer               <= 887;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 952 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(887 downto 0)        <= buf_input_r(951 downto 64);
            if in_rdy = '1' then
                buf_input_r(1890 downto 888) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1891;
            else
                bits_in_buffer               <= 888;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 953 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(888 downto 0)        <= buf_input_r(952 downto 64);
            if in_rdy = '1' then
                buf_input_r(1891 downto 889) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1892;
            else
                bits_in_buffer               <= 889;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 954 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(889 downto 0)        <= buf_input_r(953 downto 64);
            if in_rdy = '1' then
                buf_input_r(1892 downto 890) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1893;
            else
                bits_in_buffer               <= 890;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 955 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(890 downto 0)        <= buf_input_r(954 downto 64);
            if in_rdy = '1' then
                buf_input_r(1893 downto 891) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1894;
            else
                bits_in_buffer               <= 891;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 956 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(891 downto 0)        <= buf_input_r(955 downto 64);
            if in_rdy = '1' then
                buf_input_r(1894 downto 892) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1895;
            else
                bits_in_buffer               <= 892;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 957 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(892 downto 0)        <= buf_input_r(956 downto 64);
            if in_rdy = '1' then
                buf_input_r(1895 downto 893) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1896;
            else
                bits_in_buffer               <= 893;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 958 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(893 downto 0)        <= buf_input_r(957 downto 64);
            if in_rdy = '1' then
                buf_input_r(1896 downto 894) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1897;
            else
                bits_in_buffer               <= 894;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 959 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(894 downto 0)        <= buf_input_r(958 downto 64);
            if in_rdy = '1' then
                buf_input_r(1897 downto 895) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1898;
            else
                bits_in_buffer               <= 895;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 960 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(895 downto 0)        <= buf_input_r(959 downto 64);
            if in_rdy = '1' then
                buf_input_r(1898 downto 896) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1899;
            else
                bits_in_buffer               <= 896;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 961 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(896 downto 0)        <= buf_input_r(960 downto 64);
            if in_rdy = '1' then
                buf_input_r(1899 downto 897) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1900;
            else
                bits_in_buffer               <= 897;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 962 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(897 downto 0)        <= buf_input_r(961 downto 64);
            if in_rdy = '1' then
                buf_input_r(1900 downto 898) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1901;
            else
                bits_in_buffer               <= 898;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 963 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(898 downto 0)        <= buf_input_r(962 downto 64);
            if in_rdy = '1' then
                buf_input_r(1901 downto 899) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1902;
            else
                bits_in_buffer               <= 899;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 964 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(899 downto 0)        <= buf_input_r(963 downto 64);
            if in_rdy = '1' then
                buf_input_r(1902 downto 900) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1903;
            else
                bits_in_buffer               <= 900;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 965 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(900 downto 0)        <= buf_input_r(964 downto 64);
            if in_rdy = '1' then
                buf_input_r(1903 downto 901) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1904;
            else
                bits_in_buffer               <= 901;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 966 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(901 downto 0)        <= buf_input_r(965 downto 64);
            if in_rdy = '1' then
                buf_input_r(1904 downto 902) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1905;
            else
                bits_in_buffer               <= 902;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 967 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(902 downto 0)        <= buf_input_r(966 downto 64);
            if in_rdy = '1' then
                buf_input_r(1905 downto 903) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1906;
            else
                bits_in_buffer               <= 903;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 968 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(903 downto 0)        <= buf_input_r(967 downto 64);
            if in_rdy = '1' then
                buf_input_r(1906 downto 904) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1907;
            else
                bits_in_buffer               <= 904;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 969 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(904 downto 0)        <= buf_input_r(968 downto 64);
            if in_rdy = '1' then
                buf_input_r(1907 downto 905) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1908;
            else
                bits_in_buffer               <= 905;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 970 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(905 downto 0)        <= buf_input_r(969 downto 64);
            if in_rdy = '1' then
                buf_input_r(1908 downto 906) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1909;
            else
                bits_in_buffer               <= 906;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 971 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(906 downto 0)        <= buf_input_r(970 downto 64);
            if in_rdy = '1' then
                buf_input_r(1909 downto 907) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1910;
            else
                bits_in_buffer               <= 907;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 972 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(907 downto 0)        <= buf_input_r(971 downto 64);
            if in_rdy = '1' then
                buf_input_r(1910 downto 908) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1911;
            else
                bits_in_buffer               <= 908;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 973 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(908 downto 0)        <= buf_input_r(972 downto 64);
            if in_rdy = '1' then
                buf_input_r(1911 downto 909) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1912;
            else
                bits_in_buffer               <= 909;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 974 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(909 downto 0)        <= buf_input_r(973 downto 64);
            if in_rdy = '1' then
                buf_input_r(1912 downto 910) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1913;
            else
                bits_in_buffer               <= 910;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 975 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(910 downto 0)        <= buf_input_r(974 downto 64);
            if in_rdy = '1' then
                buf_input_r(1913 downto 911) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1914;
            else
                bits_in_buffer               <= 911;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 976 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(911 downto 0)        <= buf_input_r(975 downto 64);
            if in_rdy = '1' then
                buf_input_r(1914 downto 912) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1915;
            else
                bits_in_buffer               <= 912;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 977 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(912 downto 0)        <= buf_input_r(976 downto 64);
            if in_rdy = '1' then
                buf_input_r(1915 downto 913) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1916;
            else
                bits_in_buffer               <= 913;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 978 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(913 downto 0)        <= buf_input_r(977 downto 64);
            if in_rdy = '1' then
                buf_input_r(1916 downto 914) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1917;
            else
                bits_in_buffer               <= 914;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 979 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(914 downto 0)        <= buf_input_r(978 downto 64);
            if in_rdy = '1' then
                buf_input_r(1917 downto 915) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1918;
            else
                bits_in_buffer               <= 915;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 980 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(915 downto 0)        <= buf_input_r(979 downto 64);
            if in_rdy = '1' then
                buf_input_r(1918 downto 916) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1919;
            else
                bits_in_buffer               <= 916;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 981 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(916 downto 0)        <= buf_input_r(980 downto 64);
            if in_rdy = '1' then
                buf_input_r(1919 downto 917) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1920;
            else
                bits_in_buffer               <= 917;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 982 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(917 downto 0)        <= buf_input_r(981 downto 64);
            if in_rdy = '1' then
                buf_input_r(1920 downto 918) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1921;
            else
                bits_in_buffer               <= 918;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 983 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(918 downto 0)        <= buf_input_r(982 downto 64);
            if in_rdy = '1' then
                buf_input_r(1921 downto 919) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1922;
            else
                bits_in_buffer               <= 919;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 984 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(919 downto 0)        <= buf_input_r(983 downto 64);
            if in_rdy = '1' then
                buf_input_r(1922 downto 920) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1923;
            else
                bits_in_buffer               <= 920;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 985 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(920 downto 0)        <= buf_input_r(984 downto 64);
            if in_rdy = '1' then
                buf_input_r(1923 downto 921) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1924;
            else
                bits_in_buffer               <= 921;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 986 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(921 downto 0)        <= buf_input_r(985 downto 64);
            if in_rdy = '1' then
                buf_input_r(1924 downto 922) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1925;
            else
                bits_in_buffer               <= 922;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 987 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(922 downto 0)        <= buf_input_r(986 downto 64);
            if in_rdy = '1' then
                buf_input_r(1925 downto 923) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1926;
            else
                bits_in_buffer               <= 923;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 988 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(923 downto 0)        <= buf_input_r(987 downto 64);
            if in_rdy = '1' then
                buf_input_r(1926 downto 924) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1927;
            else
                bits_in_buffer               <= 924;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 989 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(924 downto 0)        <= buf_input_r(988 downto 64);
            if in_rdy = '1' then
                buf_input_r(1927 downto 925) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1928;
            else
                bits_in_buffer               <= 925;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 990 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(925 downto 0)        <= buf_input_r(989 downto 64);
            if in_rdy = '1' then
                buf_input_r(1928 downto 926) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1929;
            else
                bits_in_buffer               <= 926;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 991 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(926 downto 0)        <= buf_input_r(990 downto 64);
            if in_rdy = '1' then
                buf_input_r(1929 downto 927) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1930;
            else
                bits_in_buffer               <= 927;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 992 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(927 downto 0)        <= buf_input_r(991 downto 64);
            if in_rdy = '1' then
                buf_input_r(1930 downto 928) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1931;
            else
                bits_in_buffer               <= 928;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 993 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(928 downto 0)        <= buf_input_r(992 downto 64);
            if in_rdy = '1' then
                buf_input_r(1931 downto 929) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1932;
            else
                bits_in_buffer               <= 929;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 994 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(929 downto 0)        <= buf_input_r(993 downto 64);
            if in_rdy = '1' then
                buf_input_r(1932 downto 930) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1933;
            else
                bits_in_buffer               <= 930;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 995 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(930 downto 0)        <= buf_input_r(994 downto 64);
            if in_rdy = '1' then
                buf_input_r(1933 downto 931) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1934;
            else
                bits_in_buffer               <= 931;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 996 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(931 downto 0)        <= buf_input_r(995 downto 64);
            if in_rdy = '1' then
                buf_input_r(1934 downto 932) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1935;
            else
                bits_in_buffer               <= 932;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 997 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(932 downto 0)        <= buf_input_r(996 downto 64);
            if in_rdy = '1' then
                buf_input_r(1935 downto 933) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1936;
            else
                bits_in_buffer               <= 933;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 998 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(933 downto 0)        <= buf_input_r(997 downto 64);
            if in_rdy = '1' then
                buf_input_r(1936 downto 934) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1937;
            else
                bits_in_buffer               <= 934;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 999 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(934 downto 0)        <= buf_input_r(998 downto 64);
            if in_rdy = '1' then
                buf_input_r(1937 downto 935) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1938;
            else
                bits_in_buffer               <= 935;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 1000 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(935 downto 0)        <= buf_input_r(999 downto 64);
            if in_rdy = '1' then
                buf_input_r(1938 downto 936) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1939;
            else
                bits_in_buffer               <= 936;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 1001 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(936 downto 0)        <= buf_input_r(1000 downto 64);
            if in_rdy = '1' then
                buf_input_r(1939 downto 937) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1940;
            else
                bits_in_buffer               <= 937;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 1002 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(937 downto 0)        <= buf_input_r(1001 downto 64);
            if in_rdy = '1' then
                buf_input_r(1940 downto 938) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1941;
            else
                bits_in_buffer               <= 938;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 1003 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(938 downto 0)        <= buf_input_r(1002 downto 64);
            if in_rdy = '1' then
                buf_input_r(1941 downto 939) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1942;
            else
                bits_in_buffer               <= 939;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 1004 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(939 downto 0)        <= buf_input_r(1003 downto 64);
            if in_rdy = '1' then
                buf_input_r(1942 downto 940) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1943;
            else
                bits_in_buffer               <= 940;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';


        -- For this range, congestion_out is asserted if in_rdy = '1'.
        -- Because the minimum bits_in_buffer here if in_rdy = '1', is 1068. Maximum is 2006.
        -- Therefore there is no space left for another input since; 1068(in buffer) + 1003(input) - 64(out) = 2007 > 2006(size).

        when 1005 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(940 downto 0)        <= buf_input_r(1004 downto 64);
            if in_rdy = '1' then
                buf_input_r(1943 downto 941) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1944;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 941;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1006 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(941 downto 0)        <= buf_input_r(1005 downto 64);
            if in_rdy = '1' then
                buf_input_r(1944 downto 942) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1945;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 942;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1007 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(942 downto 0)        <= buf_input_r(1006 downto 64);
            if in_rdy = '1' then
                buf_input_r(1945 downto 943) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1946;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 943;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1008 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(943 downto 0)        <= buf_input_r(1007 downto 64);
            if in_rdy = '1' then
                buf_input_r(1946 downto 944) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1947;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 944;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1009 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(944 downto 0)        <= buf_input_r(1008 downto 64);
            if in_rdy = '1' then
                buf_input_r(1947 downto 945) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1948;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 945;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1010 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(945 downto 0)        <= buf_input_r(1009 downto 64);
            if in_rdy = '1' then
                buf_input_r(1948 downto 946) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1949;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 946;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1011 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(946 downto 0)        <= buf_input_r(1010 downto 64);
            if in_rdy = '1' then
                buf_input_r(1949 downto 947) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1950;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 947;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1012 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(947 downto 0)        <= buf_input_r(1011 downto 64);
            if in_rdy = '1' then
                buf_input_r(1950 downto 948) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1951;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 948;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1013 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(948 downto 0)        <= buf_input_r(1012 downto 64);
            if in_rdy = '1' then
                buf_input_r(1951 downto 949) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1952;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 949;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1014 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(949 downto 0)        <= buf_input_r(1013 downto 64);
            if in_rdy = '1' then
                buf_input_r(1952 downto 950) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1953;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 950;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1015 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(950 downto 0)        <= buf_input_r(1014 downto 64);
            if in_rdy = '1' then
                buf_input_r(1953 downto 951) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1954;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 951;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1016 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(951 downto 0)        <= buf_input_r(1015 downto 64);
            if in_rdy = '1' then
                buf_input_r(1954 downto 952) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1955;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 952;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1017 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(952 downto 0)        <= buf_input_r(1016 downto 64);
            if in_rdy = '1' then
                buf_input_r(1955 downto 953) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1956;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 953;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1018 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(953 downto 0)        <= buf_input_r(1017 downto 64);
            if in_rdy = '1' then
                buf_input_r(1956 downto 954) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1957;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 954;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1019 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(954 downto 0)        <= buf_input_r(1018 downto 64);
            if in_rdy = '1' then
                buf_input_r(1957 downto 955) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1958;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 955;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1020 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(955 downto 0)        <= buf_input_r(1019 downto 64);
            if in_rdy = '1' then
                buf_input_r(1958 downto 956) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1959;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 956;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1021 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(956 downto 0)        <= buf_input_r(1020 downto 64);
            if in_rdy = '1' then
                buf_input_r(1959 downto 957) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1960;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 957;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1022 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(957 downto 0)        <= buf_input_r(1021 downto 64);
            if in_rdy = '1' then
                buf_input_r(1960 downto 958) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1961;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 958;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1023 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(958 downto 0)        <= buf_input_r(1022 downto 64);
            if in_rdy = '1' then
                buf_input_r(1961 downto 959) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1962;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 959;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1024 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(959 downto 0)        <= buf_input_r(1023 downto 64);
            if in_rdy = '1' then
                buf_input_r(1962 downto 960) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1963;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 960;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1025 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(960 downto 0)        <= buf_input_r(1024 downto 64);
            if in_rdy = '1' then
                buf_input_r(1963 downto 961) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1964;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 961;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1026 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(961 downto 0)        <= buf_input_r(1025 downto 64);
            if in_rdy = '1' then
                buf_input_r(1964 downto 962) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1965;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 962;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1027 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(962 downto 0)        <= buf_input_r(1026 downto 64);
            if in_rdy = '1' then
                buf_input_r(1965 downto 963) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1966;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 963;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1028 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(963 downto 0)        <= buf_input_r(1027 downto 64);
            if in_rdy = '1' then
                buf_input_r(1966 downto 964) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1967;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 964;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1029 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(964 downto 0)        <= buf_input_r(1028 downto 64);
            if in_rdy = '1' then
                buf_input_r(1967 downto 965) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1968;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 965;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1030 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(965 downto 0)        <= buf_input_r(1029 downto 64);
            if in_rdy = '1' then
                buf_input_r(1968 downto 966) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1969;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 966;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1031 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(966 downto 0)        <= buf_input_r(1030 downto 64);
            if in_rdy = '1' then
                buf_input_r(1969 downto 967) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1970;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 967;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1032 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(967 downto 0)        <= buf_input_r(1031 downto 64);
            if in_rdy = '1' then
                buf_input_r(1970 downto 968) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1971;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 968;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1033 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(968 downto 0)        <= buf_input_r(1032 downto 64);
            if in_rdy = '1' then
                buf_input_r(1971 downto 969) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1972;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 969;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1034 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(969 downto 0)        <= buf_input_r(1033 downto 64);
            if in_rdy = '1' then
                buf_input_r(1972 downto 970) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1973;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 970;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1035 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(970 downto 0)        <= buf_input_r(1034 downto 64);
            if in_rdy = '1' then
                buf_input_r(1973 downto 971) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1974;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 971;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1036 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(971 downto 0)        <= buf_input_r(1035 downto 64);
            if in_rdy = '1' then
                buf_input_r(1974 downto 972) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1975;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 972;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1037 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(972 downto 0)        <= buf_input_r(1036 downto 64);
            if in_rdy = '1' then
                buf_input_r(1975 downto 973) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1976;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 973;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1038 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(973 downto 0)        <= buf_input_r(1037 downto 64);
            if in_rdy = '1' then
                buf_input_r(1976 downto 974) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1977;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 974;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1039 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(974 downto 0)        <= buf_input_r(1038 downto 64);
            if in_rdy = '1' then
                buf_input_r(1977 downto 975) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1978;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 975;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1040 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(975 downto 0)        <= buf_input_r(1039 downto 64);
            if in_rdy = '1' then
                buf_input_r(1978 downto 976) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1979;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 976;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1041 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(976 downto 0)        <= buf_input_r(1040 downto 64);
            if in_rdy = '1' then
                buf_input_r(1979 downto 977) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1980;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 977;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1042 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(977 downto 0)        <= buf_input_r(1041 downto 64);
            if in_rdy = '1' then
                buf_input_r(1980 downto 978) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1981;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 978;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1043 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(978 downto 0)        <= buf_input_r(1042 downto 64);
            if in_rdy = '1' then
                buf_input_r(1981 downto 979) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1982;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 979;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1044 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(979 downto 0)        <= buf_input_r(1043 downto 64);
            if in_rdy = '1' then
                buf_input_r(1982 downto 980) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1983;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 980;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1045 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(980 downto 0)        <= buf_input_r(1044 downto 64);
            if in_rdy = '1' then
                buf_input_r(1983 downto 981) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1984;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 981;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1046 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(981 downto 0)        <= buf_input_r(1045 downto 64);
            if in_rdy = '1' then
                buf_input_r(1984 downto 982) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1985;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 982;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1047 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(982 downto 0)        <= buf_input_r(1046 downto 64);
            if in_rdy = '1' then
                buf_input_r(1985 downto 983) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1986;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 983;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1048 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(983 downto 0)        <= buf_input_r(1047 downto 64);
            if in_rdy = '1' then
                buf_input_r(1986 downto 984) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1987;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 984;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1049 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(984 downto 0)        <= buf_input_r(1048 downto 64);
            if in_rdy = '1' then
                buf_input_r(1987 downto 985) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1988;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 985;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1050 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(985 downto 0)        <= buf_input_r(1049 downto 64);
            if in_rdy = '1' then
                buf_input_r(1988 downto 986) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1989;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 986;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1051 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(986 downto 0)        <= buf_input_r(1050 downto 64);
            if in_rdy = '1' then
                buf_input_r(1989 downto 987) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1990;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 987;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1052 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(987 downto 0)        <= buf_input_r(1051 downto 64);
            if in_rdy = '1' then
                buf_input_r(1990 downto 988) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1991;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 988;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1053 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(988 downto 0)        <= buf_input_r(1052 downto 64);
            if in_rdy = '1' then
                buf_input_r(1991 downto 989) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1992;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 989;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1054 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(989 downto 0)        <= buf_input_r(1053 downto 64);
            if in_rdy = '1' then
                buf_input_r(1992 downto 990) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1993;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 990;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1055 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(990 downto 0)        <= buf_input_r(1054 downto 64);
            if in_rdy = '1' then
                buf_input_r(1993 downto 991) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1994;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 991;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1056 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(991 downto 0)        <= buf_input_r(1055 downto 64);
            if in_rdy = '1' then
                buf_input_r(1994 downto 992) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1995;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 992;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1057 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(992 downto 0)        <= buf_input_r(1056 downto 64);
            if in_rdy = '1' then
                buf_input_r(1995 downto 993) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1996;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 993;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1058 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(993 downto 0)        <= buf_input_r(1057 downto 64);
            if in_rdy = '1' then
                buf_input_r(1996 downto 994) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1997;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 994;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1059 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(994 downto 0)        <= buf_input_r(1058 downto 64);
            if in_rdy = '1' then
                buf_input_r(1997 downto 995) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1998;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 995;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1060 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(995 downto 0)        <= buf_input_r(1059 downto 64);
            if in_rdy = '1' then
                buf_input_r(1998 downto 996) <= data_in(1002 downto 0);
                bits_in_buffer               <= 1999;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 996;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1061 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(996 downto 0)        <= buf_input_r(1060 downto 64);
            if in_rdy = '1' then
                buf_input_r(1999 downto 997) <= data_in(1002 downto 0);
                bits_in_buffer               <= 2000;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 997;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1062 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(997 downto 0)        <= buf_input_r(1061 downto 64);
            if in_rdy = '1' then
                buf_input_r(2000 downto 998) <= data_in(1002 downto 0);
                bits_in_buffer               <= 2001;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 998;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1063 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(998 downto 0)        <= buf_input_r(1062 downto 64);
            if in_rdy = '1' then
                buf_input_r(2001 downto 999) <= data_in(1002 downto 0);
                bits_in_buffer               <= 2002;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 999;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1064 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(999 downto 0)        <= buf_input_r(1063 downto 64);
            if in_rdy = '1' then
                buf_input_r(2002 downto 1000) <= data_in(1002 downto 0);
                bits_in_buffer               <= 2003;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 1000;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1065 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(1000 downto 0)       <= buf_input_r(1064 downto 64);
            if in_rdy = '1' then
                buf_input_r(2003 downto 1001) <= data_in(1002 downto 0);
                bits_in_buffer               <= 2004;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 1001;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1066 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(1001 downto 0)       <= buf_input_r(1065 downto 64);
            if in_rdy = '1' then
                buf_input_r(2004 downto 1002) <= data_in(1002 downto 0);
                bits_in_buffer               <= 2005;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 1002;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 1067 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(1002 downto 0)       <= buf_input_r(1066 downto 64);
            if in_rdy = '1' then
                buf_input_r(2005 downto 1003) <= data_in(1002 downto 0);
                bits_in_buffer               <= 2006;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 1003;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';


        -- For this range, the buffer contains to many bits to receieve another input.
        -- That is why the congestion_out was asserted high in the previous range, and set low here.

        when 1068 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1003 downto 0)   <= buf_input_r(1067 downto 64);
            bits_in_buffer               <= 1004;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1069 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1004 downto 0)   <= buf_input_r(1068 downto 64);
            bits_in_buffer               <= 1005;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1070 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1005 downto 0)   <= buf_input_r(1069 downto 64);
            bits_in_buffer               <= 1006;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1071 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1006 downto 0)   <= buf_input_r(1070 downto 64);
            bits_in_buffer               <= 1007;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1072 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1007 downto 0)   <= buf_input_r(1071 downto 64);
            bits_in_buffer               <= 1008;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1073 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1008 downto 0)   <= buf_input_r(1072 downto 64);
            bits_in_buffer               <= 1009;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1074 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1009 downto 0)   <= buf_input_r(1073 downto 64);
            bits_in_buffer               <= 1010;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1075 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1010 downto 0)   <= buf_input_r(1074 downto 64);
            bits_in_buffer               <= 1011;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1076 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1011 downto 0)   <= buf_input_r(1075 downto 64);
            bits_in_buffer               <= 1012;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1077 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1012 downto 0)   <= buf_input_r(1076 downto 64);
            bits_in_buffer               <= 1013;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1078 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1013 downto 0)   <= buf_input_r(1077 downto 64);
            bits_in_buffer               <= 1014;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1079 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1014 downto 0)   <= buf_input_r(1078 downto 64);
            bits_in_buffer               <= 1015;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1080 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1015 downto 0)   <= buf_input_r(1079 downto 64);
            bits_in_buffer               <= 1016;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1081 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1016 downto 0)   <= buf_input_r(1080 downto 64);
            bits_in_buffer               <= 1017;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1082 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1017 downto 0)   <= buf_input_r(1081 downto 64);
            bits_in_buffer               <= 1018;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1083 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1018 downto 0)   <= buf_input_r(1082 downto 64);
            bits_in_buffer               <= 1019;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1084 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1019 downto 0)   <= buf_input_r(1083 downto 64);
            bits_in_buffer               <= 1020;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1085 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1020 downto 0)   <= buf_input_r(1084 downto 64);
            bits_in_buffer               <= 1021;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1086 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1021 downto 0)   <= buf_input_r(1085 downto 64);
            bits_in_buffer               <= 1022;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1087 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1022 downto 0)   <= buf_input_r(1086 downto 64);
            bits_in_buffer               <= 1023;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1088 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1023 downto 0)   <= buf_input_r(1087 downto 64);
            bits_in_buffer               <= 1024;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1089 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1024 downto 0)   <= buf_input_r(1088 downto 64);
            bits_in_buffer               <= 1025;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1090 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1025 downto 0)   <= buf_input_r(1089 downto 64);
            bits_in_buffer               <= 1026;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1091 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1026 downto 0)   <= buf_input_r(1090 downto 64);
            bits_in_buffer               <= 1027;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1092 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1027 downto 0)   <= buf_input_r(1091 downto 64);
            bits_in_buffer               <= 1028;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1093 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1028 downto 0)   <= buf_input_r(1092 downto 64);
            bits_in_buffer               <= 1029;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1094 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1029 downto 0)   <= buf_input_r(1093 downto 64);
            bits_in_buffer               <= 1030;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1095 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1030 downto 0)   <= buf_input_r(1094 downto 64);
            bits_in_buffer               <= 1031;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1096 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1031 downto 0)   <= buf_input_r(1095 downto 64);
            bits_in_buffer               <= 1032;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1097 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1032 downto 0)   <= buf_input_r(1096 downto 64);
            bits_in_buffer               <= 1033;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1098 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1033 downto 0)   <= buf_input_r(1097 downto 64);
            bits_in_buffer               <= 1034;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1099 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1034 downto 0)   <= buf_input_r(1098 downto 64);
            bits_in_buffer               <= 1035;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1100 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1035 downto 0)   <= buf_input_r(1099 downto 64);
            bits_in_buffer               <= 1036;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1101 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1036 downto 0)   <= buf_input_r(1100 downto 64);
            bits_in_buffer               <= 1037;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1102 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1037 downto 0)   <= buf_input_r(1101 downto 64);
            bits_in_buffer               <= 1038;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1103 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1038 downto 0)   <= buf_input_r(1102 downto 64);
            bits_in_buffer               <= 1039;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1104 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1039 downto 0)   <= buf_input_r(1103 downto 64);
            bits_in_buffer               <= 1040;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1105 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1040 downto 0)   <= buf_input_r(1104 downto 64);
            bits_in_buffer               <= 1041;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1106 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1041 downto 0)   <= buf_input_r(1105 downto 64);
            bits_in_buffer               <= 1042;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1107 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1042 downto 0)   <= buf_input_r(1106 downto 64);
            bits_in_buffer               <= 1043;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1108 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1043 downto 0)   <= buf_input_r(1107 downto 64);
            bits_in_buffer               <= 1044;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1109 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1044 downto 0)   <= buf_input_r(1108 downto 64);
            bits_in_buffer               <= 1045;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1110 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1045 downto 0)   <= buf_input_r(1109 downto 64);
            bits_in_buffer               <= 1046;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1111 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1046 downto 0)   <= buf_input_r(1110 downto 64);
            bits_in_buffer               <= 1047;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1112 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1047 downto 0)   <= buf_input_r(1111 downto 64);
            bits_in_buffer               <= 1048;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1113 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1048 downto 0)   <= buf_input_r(1112 downto 64);
            bits_in_buffer               <= 1049;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1114 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1049 downto 0)   <= buf_input_r(1113 downto 64);
            bits_in_buffer               <= 1050;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1115 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1050 downto 0)   <= buf_input_r(1114 downto 64);
            bits_in_buffer               <= 1051;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1116 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1051 downto 0)   <= buf_input_r(1115 downto 64);
            bits_in_buffer               <= 1052;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1117 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1052 downto 0)   <= buf_input_r(1116 downto 64);
            bits_in_buffer               <= 1053;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1118 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1053 downto 0)   <= buf_input_r(1117 downto 64);
            bits_in_buffer               <= 1054;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1119 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1054 downto 0)   <= buf_input_r(1118 downto 64);
            bits_in_buffer               <= 1055;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1120 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1055 downto 0)   <= buf_input_r(1119 downto 64);
            bits_in_buffer               <= 1056;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1121 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1056 downto 0)   <= buf_input_r(1120 downto 64);
            bits_in_buffer               <= 1057;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1122 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1057 downto 0)   <= buf_input_r(1121 downto 64);
            bits_in_buffer               <= 1058;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1123 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1058 downto 0)   <= buf_input_r(1122 downto 64);
            bits_in_buffer               <= 1059;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1124 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1059 downto 0)   <= buf_input_r(1123 downto 64);
            bits_in_buffer               <= 1060;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1125 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1060 downto 0)   <= buf_input_r(1124 downto 64);
            bits_in_buffer               <= 1061;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1126 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1061 downto 0)   <= buf_input_r(1125 downto 64);
            bits_in_buffer               <= 1062;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1127 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1062 downto 0)   <= buf_input_r(1126 downto 64);
            bits_in_buffer               <= 1063;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1128 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1063 downto 0)   <= buf_input_r(1127 downto 64);
            bits_in_buffer               <= 1064;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1129 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1064 downto 0)   <= buf_input_r(1128 downto 64);
            bits_in_buffer               <= 1065;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1130 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1065 downto 0)   <= buf_input_r(1129 downto 64);
            bits_in_buffer               <= 1066;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1131 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1066 downto 0)   <= buf_input_r(1130 downto 64);
            bits_in_buffer               <= 1067;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1132 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1067 downto 0)   <= buf_input_r(1131 downto 64);
            bits_in_buffer               <= 1068;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1133 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1068 downto 0)   <= buf_input_r(1132 downto 64);
            bits_in_buffer               <= 1069;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1134 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1069 downto 0)   <= buf_input_r(1133 downto 64);
            bits_in_buffer               <= 1070;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1135 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1070 downto 0)   <= buf_input_r(1134 downto 64);
            bits_in_buffer               <= 1071;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1136 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1071 downto 0)   <= buf_input_r(1135 downto 64);
            bits_in_buffer               <= 1072;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1137 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1072 downto 0)   <= buf_input_r(1136 downto 64);
            bits_in_buffer               <= 1073;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1138 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1073 downto 0)   <= buf_input_r(1137 downto 64);
            bits_in_buffer               <= 1074;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1139 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1074 downto 0)   <= buf_input_r(1138 downto 64);
            bits_in_buffer               <= 1075;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1140 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1075 downto 0)   <= buf_input_r(1139 downto 64);
            bits_in_buffer               <= 1076;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1141 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1076 downto 0)   <= buf_input_r(1140 downto 64);
            bits_in_buffer               <= 1077;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1142 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1077 downto 0)   <= buf_input_r(1141 downto 64);
            bits_in_buffer               <= 1078;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1143 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1078 downto 0)   <= buf_input_r(1142 downto 64);
            bits_in_buffer               <= 1079;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1144 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1079 downto 0)   <= buf_input_r(1143 downto 64);
            bits_in_buffer               <= 1080;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1145 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1080 downto 0)   <= buf_input_r(1144 downto 64);
            bits_in_buffer               <= 1081;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1146 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1081 downto 0)   <= buf_input_r(1145 downto 64);
            bits_in_buffer               <= 1082;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1147 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1082 downto 0)   <= buf_input_r(1146 downto 64);
            bits_in_buffer               <= 1083;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1148 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1083 downto 0)   <= buf_input_r(1147 downto 64);
            bits_in_buffer               <= 1084;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1149 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1084 downto 0)   <= buf_input_r(1148 downto 64);
            bits_in_buffer               <= 1085;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1150 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1085 downto 0)   <= buf_input_r(1149 downto 64);
            bits_in_buffer               <= 1086;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1151 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1086 downto 0)   <= buf_input_r(1150 downto 64);
            bits_in_buffer               <= 1087;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1152 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1087 downto 0)   <= buf_input_r(1151 downto 64);
            bits_in_buffer               <= 1088;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1153 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1088 downto 0)   <= buf_input_r(1152 downto 64);
            bits_in_buffer               <= 1089;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1154 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1089 downto 0)   <= buf_input_r(1153 downto 64);
            bits_in_buffer               <= 1090;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1155 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1090 downto 0)   <= buf_input_r(1154 downto 64);
            bits_in_buffer               <= 1091;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1156 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1091 downto 0)   <= buf_input_r(1155 downto 64);
            bits_in_buffer               <= 1092;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1157 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1092 downto 0)   <= buf_input_r(1156 downto 64);
            bits_in_buffer               <= 1093;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1158 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1093 downto 0)   <= buf_input_r(1157 downto 64);
            bits_in_buffer               <= 1094;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1159 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1094 downto 0)   <= buf_input_r(1158 downto 64);
            bits_in_buffer               <= 1095;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1160 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1095 downto 0)   <= buf_input_r(1159 downto 64);
            bits_in_buffer               <= 1096;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1161 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1096 downto 0)   <= buf_input_r(1160 downto 64);
            bits_in_buffer               <= 1097;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1162 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1097 downto 0)   <= buf_input_r(1161 downto 64);
            bits_in_buffer               <= 1098;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1163 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1098 downto 0)   <= buf_input_r(1162 downto 64);
            bits_in_buffer               <= 1099;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1164 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1099 downto 0)   <= buf_input_r(1163 downto 64);
            bits_in_buffer               <= 1100;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1165 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1100 downto 0)   <= buf_input_r(1164 downto 64);
            bits_in_buffer               <= 1101;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1166 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1101 downto 0)   <= buf_input_r(1165 downto 64);
            bits_in_buffer               <= 1102;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1167 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1102 downto 0)   <= buf_input_r(1166 downto 64);
            bits_in_buffer               <= 1103;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1168 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1103 downto 0)   <= buf_input_r(1167 downto 64);
            bits_in_buffer               <= 1104;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1169 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1104 downto 0)   <= buf_input_r(1168 downto 64);
            bits_in_buffer               <= 1105;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1170 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1105 downto 0)   <= buf_input_r(1169 downto 64);
            bits_in_buffer               <= 1106;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1171 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1106 downto 0)   <= buf_input_r(1170 downto 64);
            bits_in_buffer               <= 1107;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1172 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1107 downto 0)   <= buf_input_r(1171 downto 64);
            bits_in_buffer               <= 1108;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1173 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1108 downto 0)   <= buf_input_r(1172 downto 64);
            bits_in_buffer               <= 1109;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1174 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1109 downto 0)   <= buf_input_r(1173 downto 64);
            bits_in_buffer               <= 1110;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1175 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1110 downto 0)   <= buf_input_r(1174 downto 64);
            bits_in_buffer               <= 1111;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1176 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1111 downto 0)   <= buf_input_r(1175 downto 64);
            bits_in_buffer               <= 1112;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1177 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1112 downto 0)   <= buf_input_r(1176 downto 64);
            bits_in_buffer               <= 1113;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1178 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1113 downto 0)   <= buf_input_r(1177 downto 64);
            bits_in_buffer               <= 1114;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1179 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1114 downto 0)   <= buf_input_r(1178 downto 64);
            bits_in_buffer               <= 1115;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1180 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1115 downto 0)   <= buf_input_r(1179 downto 64);
            bits_in_buffer               <= 1116;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1181 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1116 downto 0)   <= buf_input_r(1180 downto 64);
            bits_in_buffer               <= 1117;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1182 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1117 downto 0)   <= buf_input_r(1181 downto 64);
            bits_in_buffer               <= 1118;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1183 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1118 downto 0)   <= buf_input_r(1182 downto 64);
            bits_in_buffer               <= 1119;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1184 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1119 downto 0)   <= buf_input_r(1183 downto 64);
            bits_in_buffer               <= 1120;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1185 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1120 downto 0)   <= buf_input_r(1184 downto 64);
            bits_in_buffer               <= 1121;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1186 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1121 downto 0)   <= buf_input_r(1185 downto 64);
            bits_in_buffer               <= 1122;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1187 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1122 downto 0)   <= buf_input_r(1186 downto 64);
            bits_in_buffer               <= 1123;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1188 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1123 downto 0)   <= buf_input_r(1187 downto 64);
            bits_in_buffer               <= 1124;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1189 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1124 downto 0)   <= buf_input_r(1188 downto 64);
            bits_in_buffer               <= 1125;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1190 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1125 downto 0)   <= buf_input_r(1189 downto 64);
            bits_in_buffer               <= 1126;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1191 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1126 downto 0)   <= buf_input_r(1190 downto 64);
            bits_in_buffer               <= 1127;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1192 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1127 downto 0)   <= buf_input_r(1191 downto 64);
            bits_in_buffer               <= 1128;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1193 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1128 downto 0)   <= buf_input_r(1192 downto 64);
            bits_in_buffer               <= 1129;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1194 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1129 downto 0)   <= buf_input_r(1193 downto 64);
            bits_in_buffer               <= 1130;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1195 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1130 downto 0)   <= buf_input_r(1194 downto 64);
            bits_in_buffer               <= 1131;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1196 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1131 downto 0)   <= buf_input_r(1195 downto 64);
            bits_in_buffer               <= 1132;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1197 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1132 downto 0)   <= buf_input_r(1196 downto 64);
            bits_in_buffer               <= 1133;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1198 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1133 downto 0)   <= buf_input_r(1197 downto 64);
            bits_in_buffer               <= 1134;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1199 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1134 downto 0)   <= buf_input_r(1198 downto 64);
            bits_in_buffer               <= 1135;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1200 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1135 downto 0)   <= buf_input_r(1199 downto 64);
            bits_in_buffer               <= 1136;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1201 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1136 downto 0)   <= buf_input_r(1200 downto 64);
            bits_in_buffer               <= 1137;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1202 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1137 downto 0)   <= buf_input_r(1201 downto 64);
            bits_in_buffer               <= 1138;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1203 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1138 downto 0)   <= buf_input_r(1202 downto 64);
            bits_in_buffer               <= 1139;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1204 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1139 downto 0)   <= buf_input_r(1203 downto 64);
            bits_in_buffer               <= 1140;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1205 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1140 downto 0)   <= buf_input_r(1204 downto 64);
            bits_in_buffer               <= 1141;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1206 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1141 downto 0)   <= buf_input_r(1205 downto 64);
            bits_in_buffer               <= 1142;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1207 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1142 downto 0)   <= buf_input_r(1206 downto 64);
            bits_in_buffer               <= 1143;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1208 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1143 downto 0)   <= buf_input_r(1207 downto 64);
            bits_in_buffer               <= 1144;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1209 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1144 downto 0)   <= buf_input_r(1208 downto 64);
            bits_in_buffer               <= 1145;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1210 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1145 downto 0)   <= buf_input_r(1209 downto 64);
            bits_in_buffer               <= 1146;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1211 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1146 downto 0)   <= buf_input_r(1210 downto 64);
            bits_in_buffer               <= 1147;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1212 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1147 downto 0)   <= buf_input_r(1211 downto 64);
            bits_in_buffer               <= 1148;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1213 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1148 downto 0)   <= buf_input_r(1212 downto 64);
            bits_in_buffer               <= 1149;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1214 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1149 downto 0)   <= buf_input_r(1213 downto 64);
            bits_in_buffer               <= 1150;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1215 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1150 downto 0)   <= buf_input_r(1214 downto 64);
            bits_in_buffer               <= 1151;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1216 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1151 downto 0)   <= buf_input_r(1215 downto 64);
            bits_in_buffer               <= 1152;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1217 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1152 downto 0)   <= buf_input_r(1216 downto 64);
            bits_in_buffer               <= 1153;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1218 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1153 downto 0)   <= buf_input_r(1217 downto 64);
            bits_in_buffer               <= 1154;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1219 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1154 downto 0)   <= buf_input_r(1218 downto 64);
            bits_in_buffer               <= 1155;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1220 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1155 downto 0)   <= buf_input_r(1219 downto 64);
            bits_in_buffer               <= 1156;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1221 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1156 downto 0)   <= buf_input_r(1220 downto 64);
            bits_in_buffer               <= 1157;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1222 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1157 downto 0)   <= buf_input_r(1221 downto 64);
            bits_in_buffer               <= 1158;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1223 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1158 downto 0)   <= buf_input_r(1222 downto 64);
            bits_in_buffer               <= 1159;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1224 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1159 downto 0)   <= buf_input_r(1223 downto 64);
            bits_in_buffer               <= 1160;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1225 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1160 downto 0)   <= buf_input_r(1224 downto 64);
            bits_in_buffer               <= 1161;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1226 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1161 downto 0)   <= buf_input_r(1225 downto 64);
            bits_in_buffer               <= 1162;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1227 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1162 downto 0)   <= buf_input_r(1226 downto 64);
            bits_in_buffer               <= 1163;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1228 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1163 downto 0)   <= buf_input_r(1227 downto 64);
            bits_in_buffer               <= 1164;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1229 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1164 downto 0)   <= buf_input_r(1228 downto 64);
            bits_in_buffer               <= 1165;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1230 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1165 downto 0)   <= buf_input_r(1229 downto 64);
            bits_in_buffer               <= 1166;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1231 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1166 downto 0)   <= buf_input_r(1230 downto 64);
            bits_in_buffer               <= 1167;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1232 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1167 downto 0)   <= buf_input_r(1231 downto 64);
            bits_in_buffer               <= 1168;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1233 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1168 downto 0)   <= buf_input_r(1232 downto 64);
            bits_in_buffer               <= 1169;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1234 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1169 downto 0)   <= buf_input_r(1233 downto 64);
            bits_in_buffer               <= 1170;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1235 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1170 downto 0)   <= buf_input_r(1234 downto 64);
            bits_in_buffer               <= 1171;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1236 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1171 downto 0)   <= buf_input_r(1235 downto 64);
            bits_in_buffer               <= 1172;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1237 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1172 downto 0)   <= buf_input_r(1236 downto 64);
            bits_in_buffer               <= 1173;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1238 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1173 downto 0)   <= buf_input_r(1237 downto 64);
            bits_in_buffer               <= 1174;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1239 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1174 downto 0)   <= buf_input_r(1238 downto 64);
            bits_in_buffer               <= 1175;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1240 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1175 downto 0)   <= buf_input_r(1239 downto 64);
            bits_in_buffer               <= 1176;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1241 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1176 downto 0)   <= buf_input_r(1240 downto 64);
            bits_in_buffer               <= 1177;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1242 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1177 downto 0)   <= buf_input_r(1241 downto 64);
            bits_in_buffer               <= 1178;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1243 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1178 downto 0)   <= buf_input_r(1242 downto 64);
            bits_in_buffer               <= 1179;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1244 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1179 downto 0)   <= buf_input_r(1243 downto 64);
            bits_in_buffer               <= 1180;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1245 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1180 downto 0)   <= buf_input_r(1244 downto 64);
            bits_in_buffer               <= 1181;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1246 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1181 downto 0)   <= buf_input_r(1245 downto 64);
            bits_in_buffer               <= 1182;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1247 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1182 downto 0)   <= buf_input_r(1246 downto 64);
            bits_in_buffer               <= 1183;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1248 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1183 downto 0)   <= buf_input_r(1247 downto 64);
            bits_in_buffer               <= 1184;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1249 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1184 downto 0)   <= buf_input_r(1248 downto 64);
            bits_in_buffer               <= 1185;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1250 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1185 downto 0)   <= buf_input_r(1249 downto 64);
            bits_in_buffer               <= 1186;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1251 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1186 downto 0)   <= buf_input_r(1250 downto 64);
            bits_in_buffer               <= 1187;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1252 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1187 downto 0)   <= buf_input_r(1251 downto 64);
            bits_in_buffer               <= 1188;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1253 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1188 downto 0)   <= buf_input_r(1252 downto 64);
            bits_in_buffer               <= 1189;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1254 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1189 downto 0)   <= buf_input_r(1253 downto 64);
            bits_in_buffer               <= 1190;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1255 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1190 downto 0)   <= buf_input_r(1254 downto 64);
            bits_in_buffer               <= 1191;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1256 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1191 downto 0)   <= buf_input_r(1255 downto 64);
            bits_in_buffer               <= 1192;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1257 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1192 downto 0)   <= buf_input_r(1256 downto 64);
            bits_in_buffer               <= 1193;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1258 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1193 downto 0)   <= buf_input_r(1257 downto 64);
            bits_in_buffer               <= 1194;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1259 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1194 downto 0)   <= buf_input_r(1258 downto 64);
            bits_in_buffer               <= 1195;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1260 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1195 downto 0)   <= buf_input_r(1259 downto 64);
            bits_in_buffer               <= 1196;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1261 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1196 downto 0)   <= buf_input_r(1260 downto 64);
            bits_in_buffer               <= 1197;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1262 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1197 downto 0)   <= buf_input_r(1261 downto 64);
            bits_in_buffer               <= 1198;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1263 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1198 downto 0)   <= buf_input_r(1262 downto 64);
            bits_in_buffer               <= 1199;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1264 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1199 downto 0)   <= buf_input_r(1263 downto 64);
            bits_in_buffer               <= 1200;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1265 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1200 downto 0)   <= buf_input_r(1264 downto 64);
            bits_in_buffer               <= 1201;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1266 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1201 downto 0)   <= buf_input_r(1265 downto 64);
            bits_in_buffer               <= 1202;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1267 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1202 downto 0)   <= buf_input_r(1266 downto 64);
            bits_in_buffer               <= 1203;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1268 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1203 downto 0)   <= buf_input_r(1267 downto 64);
            bits_in_buffer               <= 1204;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1269 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1204 downto 0)   <= buf_input_r(1268 downto 64);
            bits_in_buffer               <= 1205;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1270 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1205 downto 0)   <= buf_input_r(1269 downto 64);
            bits_in_buffer               <= 1206;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1271 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1206 downto 0)   <= buf_input_r(1270 downto 64);
            bits_in_buffer               <= 1207;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1272 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1207 downto 0)   <= buf_input_r(1271 downto 64);
            bits_in_buffer               <= 1208;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1273 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1208 downto 0)   <= buf_input_r(1272 downto 64);
            bits_in_buffer               <= 1209;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1274 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1209 downto 0)   <= buf_input_r(1273 downto 64);
            bits_in_buffer               <= 1210;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1275 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1210 downto 0)   <= buf_input_r(1274 downto 64);
            bits_in_buffer               <= 1211;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1276 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1211 downto 0)   <= buf_input_r(1275 downto 64);
            bits_in_buffer               <= 1212;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1277 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1212 downto 0)   <= buf_input_r(1276 downto 64);
            bits_in_buffer               <= 1213;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1278 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1213 downto 0)   <= buf_input_r(1277 downto 64);
            bits_in_buffer               <= 1214;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1279 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1214 downto 0)   <= buf_input_r(1278 downto 64);
            bits_in_buffer               <= 1215;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1280 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1215 downto 0)   <= buf_input_r(1279 downto 64);
            bits_in_buffer               <= 1216;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1281 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1216 downto 0)   <= buf_input_r(1280 downto 64);
            bits_in_buffer               <= 1217;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1282 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1217 downto 0)   <= buf_input_r(1281 downto 64);
            bits_in_buffer               <= 1218;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1283 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1218 downto 0)   <= buf_input_r(1282 downto 64);
            bits_in_buffer               <= 1219;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1284 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1219 downto 0)   <= buf_input_r(1283 downto 64);
            bits_in_buffer               <= 1220;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1285 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1220 downto 0)   <= buf_input_r(1284 downto 64);
            bits_in_buffer               <= 1221;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1286 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1221 downto 0)   <= buf_input_r(1285 downto 64);
            bits_in_buffer               <= 1222;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1287 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1222 downto 0)   <= buf_input_r(1286 downto 64);
            bits_in_buffer               <= 1223;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1288 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1223 downto 0)   <= buf_input_r(1287 downto 64);
            bits_in_buffer               <= 1224;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1289 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1224 downto 0)   <= buf_input_r(1288 downto 64);
            bits_in_buffer               <= 1225;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1290 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1225 downto 0)   <= buf_input_r(1289 downto 64);
            bits_in_buffer               <= 1226;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1291 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1226 downto 0)   <= buf_input_r(1290 downto 64);
            bits_in_buffer               <= 1227;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1292 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1227 downto 0)   <= buf_input_r(1291 downto 64);
            bits_in_buffer               <= 1228;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1293 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1228 downto 0)   <= buf_input_r(1292 downto 64);
            bits_in_buffer               <= 1229;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1294 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1229 downto 0)   <= buf_input_r(1293 downto 64);
            bits_in_buffer               <= 1230;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1295 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1230 downto 0)   <= buf_input_r(1294 downto 64);
            bits_in_buffer               <= 1231;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1296 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1231 downto 0)   <= buf_input_r(1295 downto 64);
            bits_in_buffer               <= 1232;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1297 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1232 downto 0)   <= buf_input_r(1296 downto 64);
            bits_in_buffer               <= 1233;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1298 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1233 downto 0)   <= buf_input_r(1297 downto 64);
            bits_in_buffer               <= 1234;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1299 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1234 downto 0)   <= buf_input_r(1298 downto 64);
            bits_in_buffer               <= 1235;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1300 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1235 downto 0)   <= buf_input_r(1299 downto 64);
            bits_in_buffer               <= 1236;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1301 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1236 downto 0)   <= buf_input_r(1300 downto 64);
            bits_in_buffer               <= 1237;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1302 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1237 downto 0)   <= buf_input_r(1301 downto 64);
            bits_in_buffer               <= 1238;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1303 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1238 downto 0)   <= buf_input_r(1302 downto 64);
            bits_in_buffer               <= 1239;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1304 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1239 downto 0)   <= buf_input_r(1303 downto 64);
            bits_in_buffer               <= 1240;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1305 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1240 downto 0)   <= buf_input_r(1304 downto 64);
            bits_in_buffer               <= 1241;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1306 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1241 downto 0)   <= buf_input_r(1305 downto 64);
            bits_in_buffer               <= 1242;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1307 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1242 downto 0)   <= buf_input_r(1306 downto 64);
            bits_in_buffer               <= 1243;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1308 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1243 downto 0)   <= buf_input_r(1307 downto 64);
            bits_in_buffer               <= 1244;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1309 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1244 downto 0)   <= buf_input_r(1308 downto 64);
            bits_in_buffer               <= 1245;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1310 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1245 downto 0)   <= buf_input_r(1309 downto 64);
            bits_in_buffer               <= 1246;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1311 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1246 downto 0)   <= buf_input_r(1310 downto 64);
            bits_in_buffer               <= 1247;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1312 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1247 downto 0)   <= buf_input_r(1311 downto 64);
            bits_in_buffer               <= 1248;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1313 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1248 downto 0)   <= buf_input_r(1312 downto 64);
            bits_in_buffer               <= 1249;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1314 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1249 downto 0)   <= buf_input_r(1313 downto 64);
            bits_in_buffer               <= 1250;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1315 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1250 downto 0)   <= buf_input_r(1314 downto 64);
            bits_in_buffer               <= 1251;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1316 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1251 downto 0)   <= buf_input_r(1315 downto 64);
            bits_in_buffer               <= 1252;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1317 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1252 downto 0)   <= buf_input_r(1316 downto 64);
            bits_in_buffer               <= 1253;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1318 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1253 downto 0)   <= buf_input_r(1317 downto 64);
            bits_in_buffer               <= 1254;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1319 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1254 downto 0)   <= buf_input_r(1318 downto 64);
            bits_in_buffer               <= 1255;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1320 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1255 downto 0)   <= buf_input_r(1319 downto 64);
            bits_in_buffer               <= 1256;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1321 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1256 downto 0)   <= buf_input_r(1320 downto 64);
            bits_in_buffer               <= 1257;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1322 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1257 downto 0)   <= buf_input_r(1321 downto 64);
            bits_in_buffer               <= 1258;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1323 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1258 downto 0)   <= buf_input_r(1322 downto 64);
            bits_in_buffer               <= 1259;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1324 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1259 downto 0)   <= buf_input_r(1323 downto 64);
            bits_in_buffer               <= 1260;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1325 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1260 downto 0)   <= buf_input_r(1324 downto 64);
            bits_in_buffer               <= 1261;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1326 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1261 downto 0)   <= buf_input_r(1325 downto 64);
            bits_in_buffer               <= 1262;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1327 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1262 downto 0)   <= buf_input_r(1326 downto 64);
            bits_in_buffer               <= 1263;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1328 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1263 downto 0)   <= buf_input_r(1327 downto 64);
            bits_in_buffer               <= 1264;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1329 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1264 downto 0)   <= buf_input_r(1328 downto 64);
            bits_in_buffer               <= 1265;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1330 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1265 downto 0)   <= buf_input_r(1329 downto 64);
            bits_in_buffer               <= 1266;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1331 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1266 downto 0)   <= buf_input_r(1330 downto 64);
            bits_in_buffer               <= 1267;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1332 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1267 downto 0)   <= buf_input_r(1331 downto 64);
            bits_in_buffer               <= 1268;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1333 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1268 downto 0)   <= buf_input_r(1332 downto 64);
            bits_in_buffer               <= 1269;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1334 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1269 downto 0)   <= buf_input_r(1333 downto 64);
            bits_in_buffer               <= 1270;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1335 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1270 downto 0)   <= buf_input_r(1334 downto 64);
            bits_in_buffer               <= 1271;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1336 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1271 downto 0)   <= buf_input_r(1335 downto 64);
            bits_in_buffer               <= 1272;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1337 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1272 downto 0)   <= buf_input_r(1336 downto 64);
            bits_in_buffer               <= 1273;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1338 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1273 downto 0)   <= buf_input_r(1337 downto 64);
            bits_in_buffer               <= 1274;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1339 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1274 downto 0)   <= buf_input_r(1338 downto 64);
            bits_in_buffer               <= 1275;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1340 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1275 downto 0)   <= buf_input_r(1339 downto 64);
            bits_in_buffer               <= 1276;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1341 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1276 downto 0)   <= buf_input_r(1340 downto 64);
            bits_in_buffer               <= 1277;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1342 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1277 downto 0)   <= buf_input_r(1341 downto 64);
            bits_in_buffer               <= 1278;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1343 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1278 downto 0)   <= buf_input_r(1342 downto 64);
            bits_in_buffer               <= 1279;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1344 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1279 downto 0)   <= buf_input_r(1343 downto 64);
            bits_in_buffer               <= 1280;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1345 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1280 downto 0)   <= buf_input_r(1344 downto 64);
            bits_in_buffer               <= 1281;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1346 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1281 downto 0)   <= buf_input_r(1345 downto 64);
            bits_in_buffer               <= 1282;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1347 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1282 downto 0)   <= buf_input_r(1346 downto 64);
            bits_in_buffer               <= 1283;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1348 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1283 downto 0)   <= buf_input_r(1347 downto 64);
            bits_in_buffer               <= 1284;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1349 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1284 downto 0)   <= buf_input_r(1348 downto 64);
            bits_in_buffer               <= 1285;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1350 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1285 downto 0)   <= buf_input_r(1349 downto 64);
            bits_in_buffer               <= 1286;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1351 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1286 downto 0)   <= buf_input_r(1350 downto 64);
            bits_in_buffer               <= 1287;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1352 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1287 downto 0)   <= buf_input_r(1351 downto 64);
            bits_in_buffer               <= 1288;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1353 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1288 downto 0)   <= buf_input_r(1352 downto 64);
            bits_in_buffer               <= 1289;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1354 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1289 downto 0)   <= buf_input_r(1353 downto 64);
            bits_in_buffer               <= 1290;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1355 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1290 downto 0)   <= buf_input_r(1354 downto 64);
            bits_in_buffer               <= 1291;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1356 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1291 downto 0)   <= buf_input_r(1355 downto 64);
            bits_in_buffer               <= 1292;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1357 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1292 downto 0)   <= buf_input_r(1356 downto 64);
            bits_in_buffer               <= 1293;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1358 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1293 downto 0)   <= buf_input_r(1357 downto 64);
            bits_in_buffer               <= 1294;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1359 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1294 downto 0)   <= buf_input_r(1358 downto 64);
            bits_in_buffer               <= 1295;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1360 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1295 downto 0)   <= buf_input_r(1359 downto 64);
            bits_in_buffer               <= 1296;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1361 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1296 downto 0)   <= buf_input_r(1360 downto 64);
            bits_in_buffer               <= 1297;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1362 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1297 downto 0)   <= buf_input_r(1361 downto 64);
            bits_in_buffer               <= 1298;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1363 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1298 downto 0)   <= buf_input_r(1362 downto 64);
            bits_in_buffer               <= 1299;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1364 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1299 downto 0)   <= buf_input_r(1363 downto 64);
            bits_in_buffer               <= 1300;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1365 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1300 downto 0)   <= buf_input_r(1364 downto 64);
            bits_in_buffer               <= 1301;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1366 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1301 downto 0)   <= buf_input_r(1365 downto 64);
            bits_in_buffer               <= 1302;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1367 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1302 downto 0)   <= buf_input_r(1366 downto 64);
            bits_in_buffer               <= 1303;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1368 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1303 downto 0)   <= buf_input_r(1367 downto 64);
            bits_in_buffer               <= 1304;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1369 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1304 downto 0)   <= buf_input_r(1368 downto 64);
            bits_in_buffer               <= 1305;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1370 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1305 downto 0)   <= buf_input_r(1369 downto 64);
            bits_in_buffer               <= 1306;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1371 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1306 downto 0)   <= buf_input_r(1370 downto 64);
            bits_in_buffer               <= 1307;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1372 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1307 downto 0)   <= buf_input_r(1371 downto 64);
            bits_in_buffer               <= 1308;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1373 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1308 downto 0)   <= buf_input_r(1372 downto 64);
            bits_in_buffer               <= 1309;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1374 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1309 downto 0)   <= buf_input_r(1373 downto 64);
            bits_in_buffer               <= 1310;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1375 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1310 downto 0)   <= buf_input_r(1374 downto 64);
            bits_in_buffer               <= 1311;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1376 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1311 downto 0)   <= buf_input_r(1375 downto 64);
            bits_in_buffer               <= 1312;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1377 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1312 downto 0)   <= buf_input_r(1376 downto 64);
            bits_in_buffer               <= 1313;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1378 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1313 downto 0)   <= buf_input_r(1377 downto 64);
            bits_in_buffer               <= 1314;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1379 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1314 downto 0)   <= buf_input_r(1378 downto 64);
            bits_in_buffer               <= 1315;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1380 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1315 downto 0)   <= buf_input_r(1379 downto 64);
            bits_in_buffer               <= 1316;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1381 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1316 downto 0)   <= buf_input_r(1380 downto 64);
            bits_in_buffer               <= 1317;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1382 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1317 downto 0)   <= buf_input_r(1381 downto 64);
            bits_in_buffer               <= 1318;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1383 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1318 downto 0)   <= buf_input_r(1382 downto 64);
            bits_in_buffer               <= 1319;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1384 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1319 downto 0)   <= buf_input_r(1383 downto 64);
            bits_in_buffer               <= 1320;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1385 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1320 downto 0)   <= buf_input_r(1384 downto 64);
            bits_in_buffer               <= 1321;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1386 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1321 downto 0)   <= buf_input_r(1385 downto 64);
            bits_in_buffer               <= 1322;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1387 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1322 downto 0)   <= buf_input_r(1386 downto 64);
            bits_in_buffer               <= 1323;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1388 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1323 downto 0)   <= buf_input_r(1387 downto 64);
            bits_in_buffer               <= 1324;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1389 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1324 downto 0)   <= buf_input_r(1388 downto 64);
            bits_in_buffer               <= 1325;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1390 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1325 downto 0)   <= buf_input_r(1389 downto 64);
            bits_in_buffer               <= 1326;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1391 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1326 downto 0)   <= buf_input_r(1390 downto 64);
            bits_in_buffer               <= 1327;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1392 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1327 downto 0)   <= buf_input_r(1391 downto 64);
            bits_in_buffer               <= 1328;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1393 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1328 downto 0)   <= buf_input_r(1392 downto 64);
            bits_in_buffer               <= 1329;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1394 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1329 downto 0)   <= buf_input_r(1393 downto 64);
            bits_in_buffer               <= 1330;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1395 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1330 downto 0)   <= buf_input_r(1394 downto 64);
            bits_in_buffer               <= 1331;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1396 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1331 downto 0)   <= buf_input_r(1395 downto 64);
            bits_in_buffer               <= 1332;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1397 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1332 downto 0)   <= buf_input_r(1396 downto 64);
            bits_in_buffer               <= 1333;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1398 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1333 downto 0)   <= buf_input_r(1397 downto 64);
            bits_in_buffer               <= 1334;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1399 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1334 downto 0)   <= buf_input_r(1398 downto 64);
            bits_in_buffer               <= 1335;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1400 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1335 downto 0)   <= buf_input_r(1399 downto 64);
            bits_in_buffer               <= 1336;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1401 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1336 downto 0)   <= buf_input_r(1400 downto 64);
            bits_in_buffer               <= 1337;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1402 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1337 downto 0)   <= buf_input_r(1401 downto 64);
            bits_in_buffer               <= 1338;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1403 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1338 downto 0)   <= buf_input_r(1402 downto 64);
            bits_in_buffer               <= 1339;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1404 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1339 downto 0)   <= buf_input_r(1403 downto 64);
            bits_in_buffer               <= 1340;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1405 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1340 downto 0)   <= buf_input_r(1404 downto 64);
            bits_in_buffer               <= 1341;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1406 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1341 downto 0)   <= buf_input_r(1405 downto 64);
            bits_in_buffer               <= 1342;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1407 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1342 downto 0)   <= buf_input_r(1406 downto 64);
            bits_in_buffer               <= 1343;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1408 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1343 downto 0)   <= buf_input_r(1407 downto 64);
            bits_in_buffer               <= 1344;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1409 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1344 downto 0)   <= buf_input_r(1408 downto 64);
            bits_in_buffer               <= 1345;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1410 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1345 downto 0)   <= buf_input_r(1409 downto 64);
            bits_in_buffer               <= 1346;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1411 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1346 downto 0)   <= buf_input_r(1410 downto 64);
            bits_in_buffer               <= 1347;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1412 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1347 downto 0)   <= buf_input_r(1411 downto 64);
            bits_in_buffer               <= 1348;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1413 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1348 downto 0)   <= buf_input_r(1412 downto 64);
            bits_in_buffer               <= 1349;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1414 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1349 downto 0)   <= buf_input_r(1413 downto 64);
            bits_in_buffer               <= 1350;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1415 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1350 downto 0)   <= buf_input_r(1414 downto 64);
            bits_in_buffer               <= 1351;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1416 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1351 downto 0)   <= buf_input_r(1415 downto 64);
            bits_in_buffer               <= 1352;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1417 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1352 downto 0)   <= buf_input_r(1416 downto 64);
            bits_in_buffer               <= 1353;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1418 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1353 downto 0)   <= buf_input_r(1417 downto 64);
            bits_in_buffer               <= 1354;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1419 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1354 downto 0)   <= buf_input_r(1418 downto 64);
            bits_in_buffer               <= 1355;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1420 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1355 downto 0)   <= buf_input_r(1419 downto 64);
            bits_in_buffer               <= 1356;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1421 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1356 downto 0)   <= buf_input_r(1420 downto 64);
            bits_in_buffer               <= 1357;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1422 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1357 downto 0)   <= buf_input_r(1421 downto 64);
            bits_in_buffer               <= 1358;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1423 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1358 downto 0)   <= buf_input_r(1422 downto 64);
            bits_in_buffer               <= 1359;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1424 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1359 downto 0)   <= buf_input_r(1423 downto 64);
            bits_in_buffer               <= 1360;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1425 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1360 downto 0)   <= buf_input_r(1424 downto 64);
            bits_in_buffer               <= 1361;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1426 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1361 downto 0)   <= buf_input_r(1425 downto 64);
            bits_in_buffer               <= 1362;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1427 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1362 downto 0)   <= buf_input_r(1426 downto 64);
            bits_in_buffer               <= 1363;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1428 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1363 downto 0)   <= buf_input_r(1427 downto 64);
            bits_in_buffer               <= 1364;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1429 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1364 downto 0)   <= buf_input_r(1428 downto 64);
            bits_in_buffer               <= 1365;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1430 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1365 downto 0)   <= buf_input_r(1429 downto 64);
            bits_in_buffer               <= 1366;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1431 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1366 downto 0)   <= buf_input_r(1430 downto 64);
            bits_in_buffer               <= 1367;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1432 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1367 downto 0)   <= buf_input_r(1431 downto 64);
            bits_in_buffer               <= 1368;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1433 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1368 downto 0)   <= buf_input_r(1432 downto 64);
            bits_in_buffer               <= 1369;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1434 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1369 downto 0)   <= buf_input_r(1433 downto 64);
            bits_in_buffer               <= 1370;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1435 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1370 downto 0)   <= buf_input_r(1434 downto 64);
            bits_in_buffer               <= 1371;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1436 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1371 downto 0)   <= buf_input_r(1435 downto 64);
            bits_in_buffer               <= 1372;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1437 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1372 downto 0)   <= buf_input_r(1436 downto 64);
            bits_in_buffer               <= 1373;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1438 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1373 downto 0)   <= buf_input_r(1437 downto 64);
            bits_in_buffer               <= 1374;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1439 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1374 downto 0)   <= buf_input_r(1438 downto 64);
            bits_in_buffer               <= 1375;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1440 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1375 downto 0)   <= buf_input_r(1439 downto 64);
            bits_in_buffer               <= 1376;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1441 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1376 downto 0)   <= buf_input_r(1440 downto 64);
            bits_in_buffer               <= 1377;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1442 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1377 downto 0)   <= buf_input_r(1441 downto 64);
            bits_in_buffer               <= 1378;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1443 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1378 downto 0)   <= buf_input_r(1442 downto 64);
            bits_in_buffer               <= 1379;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1444 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1379 downto 0)   <= buf_input_r(1443 downto 64);
            bits_in_buffer               <= 1380;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1445 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1380 downto 0)   <= buf_input_r(1444 downto 64);
            bits_in_buffer               <= 1381;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1446 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1381 downto 0)   <= buf_input_r(1445 downto 64);
            bits_in_buffer               <= 1382;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1447 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1382 downto 0)   <= buf_input_r(1446 downto 64);
            bits_in_buffer               <= 1383;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1448 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1383 downto 0)   <= buf_input_r(1447 downto 64);
            bits_in_buffer               <= 1384;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1449 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1384 downto 0)   <= buf_input_r(1448 downto 64);
            bits_in_buffer               <= 1385;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1450 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1385 downto 0)   <= buf_input_r(1449 downto 64);
            bits_in_buffer               <= 1386;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1451 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1386 downto 0)   <= buf_input_r(1450 downto 64);
            bits_in_buffer               <= 1387;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1452 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1387 downto 0)   <= buf_input_r(1451 downto 64);
            bits_in_buffer               <= 1388;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1453 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1388 downto 0)   <= buf_input_r(1452 downto 64);
            bits_in_buffer               <= 1389;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1454 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1389 downto 0)   <= buf_input_r(1453 downto 64);
            bits_in_buffer               <= 1390;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1455 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1390 downto 0)   <= buf_input_r(1454 downto 64);
            bits_in_buffer               <= 1391;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1456 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1391 downto 0)   <= buf_input_r(1455 downto 64);
            bits_in_buffer               <= 1392;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1457 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1392 downto 0)   <= buf_input_r(1456 downto 64);
            bits_in_buffer               <= 1393;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1458 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1393 downto 0)   <= buf_input_r(1457 downto 64);
            bits_in_buffer               <= 1394;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1459 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1394 downto 0)   <= buf_input_r(1458 downto 64);
            bits_in_buffer               <= 1395;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1460 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1395 downto 0)   <= buf_input_r(1459 downto 64);
            bits_in_buffer               <= 1396;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1461 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1396 downto 0)   <= buf_input_r(1460 downto 64);
            bits_in_buffer               <= 1397;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1462 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1397 downto 0)   <= buf_input_r(1461 downto 64);
            bits_in_buffer               <= 1398;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1463 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1398 downto 0)   <= buf_input_r(1462 downto 64);
            bits_in_buffer               <= 1399;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1464 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1399 downto 0)   <= buf_input_r(1463 downto 64);
            bits_in_buffer               <= 1400;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1465 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1400 downto 0)   <= buf_input_r(1464 downto 64);
            bits_in_buffer               <= 1401;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1466 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1401 downto 0)   <= buf_input_r(1465 downto 64);
            bits_in_buffer               <= 1402;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1467 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1402 downto 0)   <= buf_input_r(1466 downto 64);
            bits_in_buffer               <= 1403;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1468 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1403 downto 0)   <= buf_input_r(1467 downto 64);
            bits_in_buffer               <= 1404;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1469 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1404 downto 0)   <= buf_input_r(1468 downto 64);
            bits_in_buffer               <= 1405;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1470 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1405 downto 0)   <= buf_input_r(1469 downto 64);
            bits_in_buffer               <= 1406;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1471 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1406 downto 0)   <= buf_input_r(1470 downto 64);
            bits_in_buffer               <= 1407;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1472 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1407 downto 0)   <= buf_input_r(1471 downto 64);
            bits_in_buffer               <= 1408;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1473 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1408 downto 0)   <= buf_input_r(1472 downto 64);
            bits_in_buffer               <= 1409;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1474 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1409 downto 0)   <= buf_input_r(1473 downto 64);
            bits_in_buffer               <= 1410;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1475 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1410 downto 0)   <= buf_input_r(1474 downto 64);
            bits_in_buffer               <= 1411;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1476 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1411 downto 0)   <= buf_input_r(1475 downto 64);
            bits_in_buffer               <= 1412;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1477 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1412 downto 0)   <= buf_input_r(1476 downto 64);
            bits_in_buffer               <= 1413;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1478 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1413 downto 0)   <= buf_input_r(1477 downto 64);
            bits_in_buffer               <= 1414;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1479 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1414 downto 0)   <= buf_input_r(1478 downto 64);
            bits_in_buffer               <= 1415;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1480 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1415 downto 0)   <= buf_input_r(1479 downto 64);
            bits_in_buffer               <= 1416;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1481 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1416 downto 0)   <= buf_input_r(1480 downto 64);
            bits_in_buffer               <= 1417;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1482 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1417 downto 0)   <= buf_input_r(1481 downto 64);
            bits_in_buffer               <= 1418;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1483 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1418 downto 0)   <= buf_input_r(1482 downto 64);
            bits_in_buffer               <= 1419;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1484 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1419 downto 0)   <= buf_input_r(1483 downto 64);
            bits_in_buffer               <= 1420;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1485 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1420 downto 0)   <= buf_input_r(1484 downto 64);
            bits_in_buffer               <= 1421;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1486 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1421 downto 0)   <= buf_input_r(1485 downto 64);
            bits_in_buffer               <= 1422;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1487 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1422 downto 0)   <= buf_input_r(1486 downto 64);
            bits_in_buffer               <= 1423;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1488 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1423 downto 0)   <= buf_input_r(1487 downto 64);
            bits_in_buffer               <= 1424;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1489 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1424 downto 0)   <= buf_input_r(1488 downto 64);
            bits_in_buffer               <= 1425;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1490 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1425 downto 0)   <= buf_input_r(1489 downto 64);
            bits_in_buffer               <= 1426;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1491 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1426 downto 0)   <= buf_input_r(1490 downto 64);
            bits_in_buffer               <= 1427;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1492 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1427 downto 0)   <= buf_input_r(1491 downto 64);
            bits_in_buffer               <= 1428;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1493 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1428 downto 0)   <= buf_input_r(1492 downto 64);
            bits_in_buffer               <= 1429;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1494 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1429 downto 0)   <= buf_input_r(1493 downto 64);
            bits_in_buffer               <= 1430;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1495 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1430 downto 0)   <= buf_input_r(1494 downto 64);
            bits_in_buffer               <= 1431;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1496 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1431 downto 0)   <= buf_input_r(1495 downto 64);
            bits_in_buffer               <= 1432;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1497 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1432 downto 0)   <= buf_input_r(1496 downto 64);
            bits_in_buffer               <= 1433;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1498 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1433 downto 0)   <= buf_input_r(1497 downto 64);
            bits_in_buffer               <= 1434;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1499 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1434 downto 0)   <= buf_input_r(1498 downto 64);
            bits_in_buffer               <= 1435;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1500 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1435 downto 0)   <= buf_input_r(1499 downto 64);
            bits_in_buffer               <= 1436;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1501 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1436 downto 0)   <= buf_input_r(1500 downto 64);
            bits_in_buffer               <= 1437;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1502 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1437 downto 0)   <= buf_input_r(1501 downto 64);
            bits_in_buffer               <= 1438;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1503 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1438 downto 0)   <= buf_input_r(1502 downto 64);
            bits_in_buffer               <= 1439;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1504 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1439 downto 0)   <= buf_input_r(1503 downto 64);
            bits_in_buffer               <= 1440;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1505 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1440 downto 0)   <= buf_input_r(1504 downto 64);
            bits_in_buffer               <= 1441;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1506 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1441 downto 0)   <= buf_input_r(1505 downto 64);
            bits_in_buffer               <= 1442;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1507 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1442 downto 0)   <= buf_input_r(1506 downto 64);
            bits_in_buffer               <= 1443;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1508 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1443 downto 0)   <= buf_input_r(1507 downto 64);
            bits_in_buffer               <= 1444;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1509 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1444 downto 0)   <= buf_input_r(1508 downto 64);
            bits_in_buffer               <= 1445;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1510 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1445 downto 0)   <= buf_input_r(1509 downto 64);
            bits_in_buffer               <= 1446;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1511 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1446 downto 0)   <= buf_input_r(1510 downto 64);
            bits_in_buffer               <= 1447;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1512 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1447 downto 0)   <= buf_input_r(1511 downto 64);
            bits_in_buffer               <= 1448;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1513 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1448 downto 0)   <= buf_input_r(1512 downto 64);
            bits_in_buffer               <= 1449;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1514 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1449 downto 0)   <= buf_input_r(1513 downto 64);
            bits_in_buffer               <= 1450;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1515 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1450 downto 0)   <= buf_input_r(1514 downto 64);
            bits_in_buffer               <= 1451;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1516 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1451 downto 0)   <= buf_input_r(1515 downto 64);
            bits_in_buffer               <= 1452;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1517 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1452 downto 0)   <= buf_input_r(1516 downto 64);
            bits_in_buffer               <= 1453;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1518 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1453 downto 0)   <= buf_input_r(1517 downto 64);
            bits_in_buffer               <= 1454;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1519 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1454 downto 0)   <= buf_input_r(1518 downto 64);
            bits_in_buffer               <= 1455;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1520 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1455 downto 0)   <= buf_input_r(1519 downto 64);
            bits_in_buffer               <= 1456;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1521 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1456 downto 0)   <= buf_input_r(1520 downto 64);
            bits_in_buffer               <= 1457;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1522 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1457 downto 0)   <= buf_input_r(1521 downto 64);
            bits_in_buffer               <= 1458;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1523 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1458 downto 0)   <= buf_input_r(1522 downto 64);
            bits_in_buffer               <= 1459;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1524 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1459 downto 0)   <= buf_input_r(1523 downto 64);
            bits_in_buffer               <= 1460;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1525 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1460 downto 0)   <= buf_input_r(1524 downto 64);
            bits_in_buffer               <= 1461;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1526 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1461 downto 0)   <= buf_input_r(1525 downto 64);
            bits_in_buffer               <= 1462;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1527 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1462 downto 0)   <= buf_input_r(1526 downto 64);
            bits_in_buffer               <= 1463;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1528 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1463 downto 0)   <= buf_input_r(1527 downto 64);
            bits_in_buffer               <= 1464;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1529 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1464 downto 0)   <= buf_input_r(1528 downto 64);
            bits_in_buffer               <= 1465;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1530 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1465 downto 0)   <= buf_input_r(1529 downto 64);
            bits_in_buffer               <= 1466;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1531 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1466 downto 0)   <= buf_input_r(1530 downto 64);
            bits_in_buffer               <= 1467;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1532 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1467 downto 0)   <= buf_input_r(1531 downto 64);
            bits_in_buffer               <= 1468;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1533 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1468 downto 0)   <= buf_input_r(1532 downto 64);
            bits_in_buffer               <= 1469;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1534 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1469 downto 0)   <= buf_input_r(1533 downto 64);
            bits_in_buffer               <= 1470;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1535 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1470 downto 0)   <= buf_input_r(1534 downto 64);
            bits_in_buffer               <= 1471;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1536 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1471 downto 0)   <= buf_input_r(1535 downto 64);
            bits_in_buffer               <= 1472;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1537 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1472 downto 0)   <= buf_input_r(1536 downto 64);
            bits_in_buffer               <= 1473;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1538 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1473 downto 0)   <= buf_input_r(1537 downto 64);
            bits_in_buffer               <= 1474;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1539 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1474 downto 0)   <= buf_input_r(1538 downto 64);
            bits_in_buffer               <= 1475;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1540 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1475 downto 0)   <= buf_input_r(1539 downto 64);
            bits_in_buffer               <= 1476;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1541 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1476 downto 0)   <= buf_input_r(1540 downto 64);
            bits_in_buffer               <= 1477;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1542 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1477 downto 0)   <= buf_input_r(1541 downto 64);
            bits_in_buffer               <= 1478;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1543 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1478 downto 0)   <= buf_input_r(1542 downto 64);
            bits_in_buffer               <= 1479;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1544 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1479 downto 0)   <= buf_input_r(1543 downto 64);
            bits_in_buffer               <= 1480;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1545 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1480 downto 0)   <= buf_input_r(1544 downto 64);
            bits_in_buffer               <= 1481;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1546 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1481 downto 0)   <= buf_input_r(1545 downto 64);
            bits_in_buffer               <= 1482;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1547 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1482 downto 0)   <= buf_input_r(1546 downto 64);
            bits_in_buffer               <= 1483;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1548 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1483 downto 0)   <= buf_input_r(1547 downto 64);
            bits_in_buffer               <= 1484;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1549 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1484 downto 0)   <= buf_input_r(1548 downto 64);
            bits_in_buffer               <= 1485;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1550 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1485 downto 0)   <= buf_input_r(1549 downto 64);
            bits_in_buffer               <= 1486;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1551 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1486 downto 0)   <= buf_input_r(1550 downto 64);
            bits_in_buffer               <= 1487;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1552 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1487 downto 0)   <= buf_input_r(1551 downto 64);
            bits_in_buffer               <= 1488;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1553 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1488 downto 0)   <= buf_input_r(1552 downto 64);
            bits_in_buffer               <= 1489;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1554 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1489 downto 0)   <= buf_input_r(1553 downto 64);
            bits_in_buffer               <= 1490;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1555 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1490 downto 0)   <= buf_input_r(1554 downto 64);
            bits_in_buffer               <= 1491;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1556 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1491 downto 0)   <= buf_input_r(1555 downto 64);
            bits_in_buffer               <= 1492;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1557 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1492 downto 0)   <= buf_input_r(1556 downto 64);
            bits_in_buffer               <= 1493;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1558 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1493 downto 0)   <= buf_input_r(1557 downto 64);
            bits_in_buffer               <= 1494;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1559 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1494 downto 0)   <= buf_input_r(1558 downto 64);
            bits_in_buffer               <= 1495;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1560 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1495 downto 0)   <= buf_input_r(1559 downto 64);
            bits_in_buffer               <= 1496;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1561 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1496 downto 0)   <= buf_input_r(1560 downto 64);
            bits_in_buffer               <= 1497;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1562 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1497 downto 0)   <= buf_input_r(1561 downto 64);
            bits_in_buffer               <= 1498;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1563 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1498 downto 0)   <= buf_input_r(1562 downto 64);
            bits_in_buffer               <= 1499;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1564 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1499 downto 0)   <= buf_input_r(1563 downto 64);
            bits_in_buffer               <= 1500;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1565 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1500 downto 0)   <= buf_input_r(1564 downto 64);
            bits_in_buffer               <= 1501;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1566 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1501 downto 0)   <= buf_input_r(1565 downto 64);
            bits_in_buffer               <= 1502;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1567 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1502 downto 0)   <= buf_input_r(1566 downto 64);
            bits_in_buffer               <= 1503;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1568 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1503 downto 0)   <= buf_input_r(1567 downto 64);
            bits_in_buffer               <= 1504;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1569 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1504 downto 0)   <= buf_input_r(1568 downto 64);
            bits_in_buffer               <= 1505;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1570 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1505 downto 0)   <= buf_input_r(1569 downto 64);
            bits_in_buffer               <= 1506;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1571 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1506 downto 0)   <= buf_input_r(1570 downto 64);
            bits_in_buffer               <= 1507;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1572 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1507 downto 0)   <= buf_input_r(1571 downto 64);
            bits_in_buffer               <= 1508;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1573 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1508 downto 0)   <= buf_input_r(1572 downto 64);
            bits_in_buffer               <= 1509;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1574 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1509 downto 0)   <= buf_input_r(1573 downto 64);
            bits_in_buffer               <= 1510;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1575 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1510 downto 0)   <= buf_input_r(1574 downto 64);
            bits_in_buffer               <= 1511;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1576 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1511 downto 0)   <= buf_input_r(1575 downto 64);
            bits_in_buffer               <= 1512;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1577 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1512 downto 0)   <= buf_input_r(1576 downto 64);
            bits_in_buffer               <= 1513;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1578 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1513 downto 0)   <= buf_input_r(1577 downto 64);
            bits_in_buffer               <= 1514;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1579 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1514 downto 0)   <= buf_input_r(1578 downto 64);
            bits_in_buffer               <= 1515;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1580 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1515 downto 0)   <= buf_input_r(1579 downto 64);
            bits_in_buffer               <= 1516;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1581 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1516 downto 0)   <= buf_input_r(1580 downto 64);
            bits_in_buffer               <= 1517;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1582 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1517 downto 0)   <= buf_input_r(1581 downto 64);
            bits_in_buffer               <= 1518;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1583 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1518 downto 0)   <= buf_input_r(1582 downto 64);
            bits_in_buffer               <= 1519;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1584 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1519 downto 0)   <= buf_input_r(1583 downto 64);
            bits_in_buffer               <= 1520;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1585 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1520 downto 0)   <= buf_input_r(1584 downto 64);
            bits_in_buffer               <= 1521;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1586 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1521 downto 0)   <= buf_input_r(1585 downto 64);
            bits_in_buffer               <= 1522;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1587 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1522 downto 0)   <= buf_input_r(1586 downto 64);
            bits_in_buffer               <= 1523;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1588 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1523 downto 0)   <= buf_input_r(1587 downto 64);
            bits_in_buffer               <= 1524;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1589 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1524 downto 0)   <= buf_input_r(1588 downto 64);
            bits_in_buffer               <= 1525;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1590 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1525 downto 0)   <= buf_input_r(1589 downto 64);
            bits_in_buffer               <= 1526;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1591 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1526 downto 0)   <= buf_input_r(1590 downto 64);
            bits_in_buffer               <= 1527;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1592 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1527 downto 0)   <= buf_input_r(1591 downto 64);
            bits_in_buffer               <= 1528;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1593 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1528 downto 0)   <= buf_input_r(1592 downto 64);
            bits_in_buffer               <= 1529;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1594 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1529 downto 0)   <= buf_input_r(1593 downto 64);
            bits_in_buffer               <= 1530;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1595 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1530 downto 0)   <= buf_input_r(1594 downto 64);
            bits_in_buffer               <= 1531;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1596 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1531 downto 0)   <= buf_input_r(1595 downto 64);
            bits_in_buffer               <= 1532;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1597 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1532 downto 0)   <= buf_input_r(1596 downto 64);
            bits_in_buffer               <= 1533;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1598 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1533 downto 0)   <= buf_input_r(1597 downto 64);
            bits_in_buffer               <= 1534;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1599 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1534 downto 0)   <= buf_input_r(1598 downto 64);
            bits_in_buffer               <= 1535;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1600 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1535 downto 0)   <= buf_input_r(1599 downto 64);
            bits_in_buffer               <= 1536;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1601 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1536 downto 0)   <= buf_input_r(1600 downto 64);
            bits_in_buffer               <= 1537;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1602 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1537 downto 0)   <= buf_input_r(1601 downto 64);
            bits_in_buffer               <= 1538;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1603 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1538 downto 0)   <= buf_input_r(1602 downto 64);
            bits_in_buffer               <= 1539;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1604 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1539 downto 0)   <= buf_input_r(1603 downto 64);
            bits_in_buffer               <= 1540;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1605 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1540 downto 0)   <= buf_input_r(1604 downto 64);
            bits_in_buffer               <= 1541;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1606 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1541 downto 0)   <= buf_input_r(1605 downto 64);
            bits_in_buffer               <= 1542;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1607 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1542 downto 0)   <= buf_input_r(1606 downto 64);
            bits_in_buffer               <= 1543;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1608 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1543 downto 0)   <= buf_input_r(1607 downto 64);
            bits_in_buffer               <= 1544;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1609 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1544 downto 0)   <= buf_input_r(1608 downto 64);
            bits_in_buffer               <= 1545;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1610 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1545 downto 0)   <= buf_input_r(1609 downto 64);
            bits_in_buffer               <= 1546;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1611 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1546 downto 0)   <= buf_input_r(1610 downto 64);
            bits_in_buffer               <= 1547;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1612 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1547 downto 0)   <= buf_input_r(1611 downto 64);
            bits_in_buffer               <= 1548;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1613 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1548 downto 0)   <= buf_input_r(1612 downto 64);
            bits_in_buffer               <= 1549;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1614 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1549 downto 0)   <= buf_input_r(1613 downto 64);
            bits_in_buffer               <= 1550;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1615 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1550 downto 0)   <= buf_input_r(1614 downto 64);
            bits_in_buffer               <= 1551;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1616 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1551 downto 0)   <= buf_input_r(1615 downto 64);
            bits_in_buffer               <= 1552;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1617 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1552 downto 0)   <= buf_input_r(1616 downto 64);
            bits_in_buffer               <= 1553;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1618 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1553 downto 0)   <= buf_input_r(1617 downto 64);
            bits_in_buffer               <= 1554;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1619 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1554 downto 0)   <= buf_input_r(1618 downto 64);
            bits_in_buffer               <= 1555;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1620 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1555 downto 0)   <= buf_input_r(1619 downto 64);
            bits_in_buffer               <= 1556;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1621 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1556 downto 0)   <= buf_input_r(1620 downto 64);
            bits_in_buffer               <= 1557;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1622 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1557 downto 0)   <= buf_input_r(1621 downto 64);
            bits_in_buffer               <= 1558;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1623 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1558 downto 0)   <= buf_input_r(1622 downto 64);
            bits_in_buffer               <= 1559;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1624 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1559 downto 0)   <= buf_input_r(1623 downto 64);
            bits_in_buffer               <= 1560;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1625 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1560 downto 0)   <= buf_input_r(1624 downto 64);
            bits_in_buffer               <= 1561;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1626 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1561 downto 0)   <= buf_input_r(1625 downto 64);
            bits_in_buffer               <= 1562;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1627 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1562 downto 0)   <= buf_input_r(1626 downto 64);
            bits_in_buffer               <= 1563;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1628 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1563 downto 0)   <= buf_input_r(1627 downto 64);
            bits_in_buffer               <= 1564;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1629 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1564 downto 0)   <= buf_input_r(1628 downto 64);
            bits_in_buffer               <= 1565;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1630 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1565 downto 0)   <= buf_input_r(1629 downto 64);
            bits_in_buffer               <= 1566;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1631 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1566 downto 0)   <= buf_input_r(1630 downto 64);
            bits_in_buffer               <= 1567;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1632 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1567 downto 0)   <= buf_input_r(1631 downto 64);
            bits_in_buffer               <= 1568;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1633 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1568 downto 0)   <= buf_input_r(1632 downto 64);
            bits_in_buffer               <= 1569;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1634 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1569 downto 0)   <= buf_input_r(1633 downto 64);
            bits_in_buffer               <= 1570;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1635 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1570 downto 0)   <= buf_input_r(1634 downto 64);
            bits_in_buffer               <= 1571;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1636 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1571 downto 0)   <= buf_input_r(1635 downto 64);
            bits_in_buffer               <= 1572;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1637 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1572 downto 0)   <= buf_input_r(1636 downto 64);
            bits_in_buffer               <= 1573;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1638 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1573 downto 0)   <= buf_input_r(1637 downto 64);
            bits_in_buffer               <= 1574;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1639 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1574 downto 0)   <= buf_input_r(1638 downto 64);
            bits_in_buffer               <= 1575;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1640 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1575 downto 0)   <= buf_input_r(1639 downto 64);
            bits_in_buffer               <= 1576;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1641 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1576 downto 0)   <= buf_input_r(1640 downto 64);
            bits_in_buffer               <= 1577;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1642 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1577 downto 0)   <= buf_input_r(1641 downto 64);
            bits_in_buffer               <= 1578;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1643 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1578 downto 0)   <= buf_input_r(1642 downto 64);
            bits_in_buffer               <= 1579;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1644 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1579 downto 0)   <= buf_input_r(1643 downto 64);
            bits_in_buffer               <= 1580;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1645 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1580 downto 0)   <= buf_input_r(1644 downto 64);
            bits_in_buffer               <= 1581;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1646 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1581 downto 0)   <= buf_input_r(1645 downto 64);
            bits_in_buffer               <= 1582;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1647 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1582 downto 0)   <= buf_input_r(1646 downto 64);
            bits_in_buffer               <= 1583;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1648 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1583 downto 0)   <= buf_input_r(1647 downto 64);
            bits_in_buffer               <= 1584;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1649 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1584 downto 0)   <= buf_input_r(1648 downto 64);
            bits_in_buffer               <= 1585;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1650 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1585 downto 0)   <= buf_input_r(1649 downto 64);
            bits_in_buffer               <= 1586;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1651 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1586 downto 0)   <= buf_input_r(1650 downto 64);
            bits_in_buffer               <= 1587;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1652 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1587 downto 0)   <= buf_input_r(1651 downto 64);
            bits_in_buffer               <= 1588;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1653 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1588 downto 0)   <= buf_input_r(1652 downto 64);
            bits_in_buffer               <= 1589;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1654 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1589 downto 0)   <= buf_input_r(1653 downto 64);
            bits_in_buffer               <= 1590;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1655 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1590 downto 0)   <= buf_input_r(1654 downto 64);
            bits_in_buffer               <= 1591;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1656 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1591 downto 0)   <= buf_input_r(1655 downto 64);
            bits_in_buffer               <= 1592;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1657 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1592 downto 0)   <= buf_input_r(1656 downto 64);
            bits_in_buffer               <= 1593;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1658 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1593 downto 0)   <= buf_input_r(1657 downto 64);
            bits_in_buffer               <= 1594;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1659 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1594 downto 0)   <= buf_input_r(1658 downto 64);
            bits_in_buffer               <= 1595;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1660 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1595 downto 0)   <= buf_input_r(1659 downto 64);
            bits_in_buffer               <= 1596;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1661 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1596 downto 0)   <= buf_input_r(1660 downto 64);
            bits_in_buffer               <= 1597;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1662 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1597 downto 0)   <= buf_input_r(1661 downto 64);
            bits_in_buffer               <= 1598;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1663 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1598 downto 0)   <= buf_input_r(1662 downto 64);
            bits_in_buffer               <= 1599;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1664 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1599 downto 0)   <= buf_input_r(1663 downto 64);
            bits_in_buffer               <= 1600;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1665 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1600 downto 0)   <= buf_input_r(1664 downto 64);
            bits_in_buffer               <= 1601;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1666 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1601 downto 0)   <= buf_input_r(1665 downto 64);
            bits_in_buffer               <= 1602;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1667 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1602 downto 0)   <= buf_input_r(1666 downto 64);
            bits_in_buffer               <= 1603;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1668 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1603 downto 0)   <= buf_input_r(1667 downto 64);
            bits_in_buffer               <= 1604;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1669 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1604 downto 0)   <= buf_input_r(1668 downto 64);
            bits_in_buffer               <= 1605;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1670 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1605 downto 0)   <= buf_input_r(1669 downto 64);
            bits_in_buffer               <= 1606;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1671 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1606 downto 0)   <= buf_input_r(1670 downto 64);
            bits_in_buffer               <= 1607;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1672 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1607 downto 0)   <= buf_input_r(1671 downto 64);
            bits_in_buffer               <= 1608;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1673 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1608 downto 0)   <= buf_input_r(1672 downto 64);
            bits_in_buffer               <= 1609;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1674 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1609 downto 0)   <= buf_input_r(1673 downto 64);
            bits_in_buffer               <= 1610;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1675 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1610 downto 0)   <= buf_input_r(1674 downto 64);
            bits_in_buffer               <= 1611;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1676 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1611 downto 0)   <= buf_input_r(1675 downto 64);
            bits_in_buffer               <= 1612;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1677 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1612 downto 0)   <= buf_input_r(1676 downto 64);
            bits_in_buffer               <= 1613;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1678 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1613 downto 0)   <= buf_input_r(1677 downto 64);
            bits_in_buffer               <= 1614;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1679 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1614 downto 0)   <= buf_input_r(1678 downto 64);
            bits_in_buffer               <= 1615;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1680 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1615 downto 0)   <= buf_input_r(1679 downto 64);
            bits_in_buffer               <= 1616;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1681 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1616 downto 0)   <= buf_input_r(1680 downto 64);
            bits_in_buffer               <= 1617;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1682 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1617 downto 0)   <= buf_input_r(1681 downto 64);
            bits_in_buffer               <= 1618;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1683 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1618 downto 0)   <= buf_input_r(1682 downto 64);
            bits_in_buffer               <= 1619;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1684 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1619 downto 0)   <= buf_input_r(1683 downto 64);
            bits_in_buffer               <= 1620;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1685 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1620 downto 0)   <= buf_input_r(1684 downto 64);
            bits_in_buffer               <= 1621;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1686 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1621 downto 0)   <= buf_input_r(1685 downto 64);
            bits_in_buffer               <= 1622;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1687 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1622 downto 0)   <= buf_input_r(1686 downto 64);
            bits_in_buffer               <= 1623;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1688 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1623 downto 0)   <= buf_input_r(1687 downto 64);
            bits_in_buffer               <= 1624;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1689 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1624 downto 0)   <= buf_input_r(1688 downto 64);
            bits_in_buffer               <= 1625;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1690 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1625 downto 0)   <= buf_input_r(1689 downto 64);
            bits_in_buffer               <= 1626;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1691 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1626 downto 0)   <= buf_input_r(1690 downto 64);
            bits_in_buffer               <= 1627;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1692 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1627 downto 0)   <= buf_input_r(1691 downto 64);
            bits_in_buffer               <= 1628;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1693 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1628 downto 0)   <= buf_input_r(1692 downto 64);
            bits_in_buffer               <= 1629;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1694 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1629 downto 0)   <= buf_input_r(1693 downto 64);
            bits_in_buffer               <= 1630;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1695 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1630 downto 0)   <= buf_input_r(1694 downto 64);
            bits_in_buffer               <= 1631;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1696 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1631 downto 0)   <= buf_input_r(1695 downto 64);
            bits_in_buffer               <= 1632;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1697 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1632 downto 0)   <= buf_input_r(1696 downto 64);
            bits_in_buffer               <= 1633;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1698 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1633 downto 0)   <= buf_input_r(1697 downto 64);
            bits_in_buffer               <= 1634;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1699 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1634 downto 0)   <= buf_input_r(1698 downto 64);
            bits_in_buffer               <= 1635;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1700 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1635 downto 0)   <= buf_input_r(1699 downto 64);
            bits_in_buffer               <= 1636;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1701 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1636 downto 0)   <= buf_input_r(1700 downto 64);
            bits_in_buffer               <= 1637;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1702 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1637 downto 0)   <= buf_input_r(1701 downto 64);
            bits_in_buffer               <= 1638;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1703 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1638 downto 0)   <= buf_input_r(1702 downto 64);
            bits_in_buffer               <= 1639;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1704 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1639 downto 0)   <= buf_input_r(1703 downto 64);
            bits_in_buffer               <= 1640;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1705 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1640 downto 0)   <= buf_input_r(1704 downto 64);
            bits_in_buffer               <= 1641;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1706 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1641 downto 0)   <= buf_input_r(1705 downto 64);
            bits_in_buffer               <= 1642;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1707 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1642 downto 0)   <= buf_input_r(1706 downto 64);
            bits_in_buffer               <= 1643;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1708 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1643 downto 0)   <= buf_input_r(1707 downto 64);
            bits_in_buffer               <= 1644;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1709 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1644 downto 0)   <= buf_input_r(1708 downto 64);
            bits_in_buffer               <= 1645;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1710 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1645 downto 0)   <= buf_input_r(1709 downto 64);
            bits_in_buffer               <= 1646;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1711 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1646 downto 0)   <= buf_input_r(1710 downto 64);
            bits_in_buffer               <= 1647;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1712 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1647 downto 0)   <= buf_input_r(1711 downto 64);
            bits_in_buffer               <= 1648;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1713 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1648 downto 0)   <= buf_input_r(1712 downto 64);
            bits_in_buffer               <= 1649;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1714 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1649 downto 0)   <= buf_input_r(1713 downto 64);
            bits_in_buffer               <= 1650;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1715 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1650 downto 0)   <= buf_input_r(1714 downto 64);
            bits_in_buffer               <= 1651;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1716 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1651 downto 0)   <= buf_input_r(1715 downto 64);
            bits_in_buffer               <= 1652;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1717 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1652 downto 0)   <= buf_input_r(1716 downto 64);
            bits_in_buffer               <= 1653;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1718 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1653 downto 0)   <= buf_input_r(1717 downto 64);
            bits_in_buffer               <= 1654;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1719 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1654 downto 0)   <= buf_input_r(1718 downto 64);
            bits_in_buffer               <= 1655;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1720 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1655 downto 0)   <= buf_input_r(1719 downto 64);
            bits_in_buffer               <= 1656;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1721 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1656 downto 0)   <= buf_input_r(1720 downto 64);
            bits_in_buffer               <= 1657;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1722 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1657 downto 0)   <= buf_input_r(1721 downto 64);
            bits_in_buffer               <= 1658;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1723 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1658 downto 0)   <= buf_input_r(1722 downto 64);
            bits_in_buffer               <= 1659;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1724 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1659 downto 0)   <= buf_input_r(1723 downto 64);
            bits_in_buffer               <= 1660;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1725 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1660 downto 0)   <= buf_input_r(1724 downto 64);
            bits_in_buffer               <= 1661;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1726 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1661 downto 0)   <= buf_input_r(1725 downto 64);
            bits_in_buffer               <= 1662;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1727 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1662 downto 0)   <= buf_input_r(1726 downto 64);
            bits_in_buffer               <= 1663;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1728 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1663 downto 0)   <= buf_input_r(1727 downto 64);
            bits_in_buffer               <= 1664;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1729 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1664 downto 0)   <= buf_input_r(1728 downto 64);
            bits_in_buffer               <= 1665;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1730 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1665 downto 0)   <= buf_input_r(1729 downto 64);
            bits_in_buffer               <= 1666;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1731 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1666 downto 0)   <= buf_input_r(1730 downto 64);
            bits_in_buffer               <= 1667;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1732 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1667 downto 0)   <= buf_input_r(1731 downto 64);
            bits_in_buffer               <= 1668;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1733 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1668 downto 0)   <= buf_input_r(1732 downto 64);
            bits_in_buffer               <= 1669;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1734 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1669 downto 0)   <= buf_input_r(1733 downto 64);
            bits_in_buffer               <= 1670;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1735 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1670 downto 0)   <= buf_input_r(1734 downto 64);
            bits_in_buffer               <= 1671;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1736 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1671 downto 0)   <= buf_input_r(1735 downto 64);
            bits_in_buffer               <= 1672;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1737 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1672 downto 0)   <= buf_input_r(1736 downto 64);
            bits_in_buffer               <= 1673;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1738 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1673 downto 0)   <= buf_input_r(1737 downto 64);
            bits_in_buffer               <= 1674;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1739 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1674 downto 0)   <= buf_input_r(1738 downto 64);
            bits_in_buffer               <= 1675;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1740 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1675 downto 0)   <= buf_input_r(1739 downto 64);
            bits_in_buffer               <= 1676;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1741 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1676 downto 0)   <= buf_input_r(1740 downto 64);
            bits_in_buffer               <= 1677;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1742 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1677 downto 0)   <= buf_input_r(1741 downto 64);
            bits_in_buffer               <= 1678;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1743 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1678 downto 0)   <= buf_input_r(1742 downto 64);
            bits_in_buffer               <= 1679;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1744 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1679 downto 0)   <= buf_input_r(1743 downto 64);
            bits_in_buffer               <= 1680;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1745 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1680 downto 0)   <= buf_input_r(1744 downto 64);
            bits_in_buffer               <= 1681;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1746 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1681 downto 0)   <= buf_input_r(1745 downto 64);
            bits_in_buffer               <= 1682;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1747 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1682 downto 0)   <= buf_input_r(1746 downto 64);
            bits_in_buffer               <= 1683;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1748 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1683 downto 0)   <= buf_input_r(1747 downto 64);
            bits_in_buffer               <= 1684;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1749 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1684 downto 0)   <= buf_input_r(1748 downto 64);
            bits_in_buffer               <= 1685;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1750 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1685 downto 0)   <= buf_input_r(1749 downto 64);
            bits_in_buffer               <= 1686;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1751 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1686 downto 0)   <= buf_input_r(1750 downto 64);
            bits_in_buffer               <= 1687;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1752 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1687 downto 0)   <= buf_input_r(1751 downto 64);
            bits_in_buffer               <= 1688;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1753 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1688 downto 0)   <= buf_input_r(1752 downto 64);
            bits_in_buffer               <= 1689;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1754 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1689 downto 0)   <= buf_input_r(1753 downto 64);
            bits_in_buffer               <= 1690;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1755 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1690 downto 0)   <= buf_input_r(1754 downto 64);
            bits_in_buffer               <= 1691;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1756 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1691 downto 0)   <= buf_input_r(1755 downto 64);
            bits_in_buffer               <= 1692;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1757 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1692 downto 0)   <= buf_input_r(1756 downto 64);
            bits_in_buffer               <= 1693;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1758 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1693 downto 0)   <= buf_input_r(1757 downto 64);
            bits_in_buffer               <= 1694;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1759 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1694 downto 0)   <= buf_input_r(1758 downto 64);
            bits_in_buffer               <= 1695;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1760 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1695 downto 0)   <= buf_input_r(1759 downto 64);
            bits_in_buffer               <= 1696;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1761 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1696 downto 0)   <= buf_input_r(1760 downto 64);
            bits_in_buffer               <= 1697;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1762 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1697 downto 0)   <= buf_input_r(1761 downto 64);
            bits_in_buffer               <= 1698;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1763 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1698 downto 0)   <= buf_input_r(1762 downto 64);
            bits_in_buffer               <= 1699;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1764 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1699 downto 0)   <= buf_input_r(1763 downto 64);
            bits_in_buffer               <= 1700;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1765 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1700 downto 0)   <= buf_input_r(1764 downto 64);
            bits_in_buffer               <= 1701;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1766 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1701 downto 0)   <= buf_input_r(1765 downto 64);
            bits_in_buffer               <= 1702;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1767 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1702 downto 0)   <= buf_input_r(1766 downto 64);
            bits_in_buffer               <= 1703;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1768 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1703 downto 0)   <= buf_input_r(1767 downto 64);
            bits_in_buffer               <= 1704;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1769 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1704 downto 0)   <= buf_input_r(1768 downto 64);
            bits_in_buffer               <= 1705;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1770 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1705 downto 0)   <= buf_input_r(1769 downto 64);
            bits_in_buffer               <= 1706;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1771 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1706 downto 0)   <= buf_input_r(1770 downto 64);
            bits_in_buffer               <= 1707;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1772 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1707 downto 0)   <= buf_input_r(1771 downto 64);
            bits_in_buffer               <= 1708;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1773 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1708 downto 0)   <= buf_input_r(1772 downto 64);
            bits_in_buffer               <= 1709;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1774 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1709 downto 0)   <= buf_input_r(1773 downto 64);
            bits_in_buffer               <= 1710;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1775 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1710 downto 0)   <= buf_input_r(1774 downto 64);
            bits_in_buffer               <= 1711;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1776 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1711 downto 0)   <= buf_input_r(1775 downto 64);
            bits_in_buffer               <= 1712;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1777 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1712 downto 0)   <= buf_input_r(1776 downto 64);
            bits_in_buffer               <= 1713;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1778 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1713 downto 0)   <= buf_input_r(1777 downto 64);
            bits_in_buffer               <= 1714;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1779 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1714 downto 0)   <= buf_input_r(1778 downto 64);
            bits_in_buffer               <= 1715;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1780 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1715 downto 0)   <= buf_input_r(1779 downto 64);
            bits_in_buffer               <= 1716;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1781 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1716 downto 0)   <= buf_input_r(1780 downto 64);
            bits_in_buffer               <= 1717;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1782 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1717 downto 0)   <= buf_input_r(1781 downto 64);
            bits_in_buffer               <= 1718;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1783 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1718 downto 0)   <= buf_input_r(1782 downto 64);
            bits_in_buffer               <= 1719;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1784 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1719 downto 0)   <= buf_input_r(1783 downto 64);
            bits_in_buffer               <= 1720;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1785 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1720 downto 0)   <= buf_input_r(1784 downto 64);
            bits_in_buffer               <= 1721;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1786 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1721 downto 0)   <= buf_input_r(1785 downto 64);
            bits_in_buffer               <= 1722;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1787 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1722 downto 0)   <= buf_input_r(1786 downto 64);
            bits_in_buffer               <= 1723;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1788 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1723 downto 0)   <= buf_input_r(1787 downto 64);
            bits_in_buffer               <= 1724;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1789 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1724 downto 0)   <= buf_input_r(1788 downto 64);
            bits_in_buffer               <= 1725;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1790 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1725 downto 0)   <= buf_input_r(1789 downto 64);
            bits_in_buffer               <= 1726;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1791 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1726 downto 0)   <= buf_input_r(1790 downto 64);
            bits_in_buffer               <= 1727;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1792 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1727 downto 0)   <= buf_input_r(1791 downto 64);
            bits_in_buffer               <= 1728;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1793 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1728 downto 0)   <= buf_input_r(1792 downto 64);
            bits_in_buffer               <= 1729;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1794 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1729 downto 0)   <= buf_input_r(1793 downto 64);
            bits_in_buffer               <= 1730;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1795 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1730 downto 0)   <= buf_input_r(1794 downto 64);
            bits_in_buffer               <= 1731;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1796 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1731 downto 0)   <= buf_input_r(1795 downto 64);
            bits_in_buffer               <= 1732;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1797 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1732 downto 0)   <= buf_input_r(1796 downto 64);
            bits_in_buffer               <= 1733;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1798 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1733 downto 0)   <= buf_input_r(1797 downto 64);
            bits_in_buffer               <= 1734;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1799 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1734 downto 0)   <= buf_input_r(1798 downto 64);
            bits_in_buffer               <= 1735;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1800 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1735 downto 0)   <= buf_input_r(1799 downto 64);
            bits_in_buffer               <= 1736;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1801 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1736 downto 0)   <= buf_input_r(1800 downto 64);
            bits_in_buffer               <= 1737;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1802 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1737 downto 0)   <= buf_input_r(1801 downto 64);
            bits_in_buffer               <= 1738;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1803 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1738 downto 0)   <= buf_input_r(1802 downto 64);
            bits_in_buffer               <= 1739;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1804 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1739 downto 0)   <= buf_input_r(1803 downto 64);
            bits_in_buffer               <= 1740;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1805 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1740 downto 0)   <= buf_input_r(1804 downto 64);
            bits_in_buffer               <= 1741;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1806 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1741 downto 0)   <= buf_input_r(1805 downto 64);
            bits_in_buffer               <= 1742;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1807 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1742 downto 0)   <= buf_input_r(1806 downto 64);
            bits_in_buffer               <= 1743;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1808 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1743 downto 0)   <= buf_input_r(1807 downto 64);
            bits_in_buffer               <= 1744;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1809 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1744 downto 0)   <= buf_input_r(1808 downto 64);
            bits_in_buffer               <= 1745;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1810 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1745 downto 0)   <= buf_input_r(1809 downto 64);
            bits_in_buffer               <= 1746;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1811 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1746 downto 0)   <= buf_input_r(1810 downto 64);
            bits_in_buffer               <= 1747;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1812 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1747 downto 0)   <= buf_input_r(1811 downto 64);
            bits_in_buffer               <= 1748;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1813 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1748 downto 0)   <= buf_input_r(1812 downto 64);
            bits_in_buffer               <= 1749;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1814 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1749 downto 0)   <= buf_input_r(1813 downto 64);
            bits_in_buffer               <= 1750;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1815 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1750 downto 0)   <= buf_input_r(1814 downto 64);
            bits_in_buffer               <= 1751;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1816 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1751 downto 0)   <= buf_input_r(1815 downto 64);
            bits_in_buffer               <= 1752;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1817 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1752 downto 0)   <= buf_input_r(1816 downto 64);
            bits_in_buffer               <= 1753;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1818 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1753 downto 0)   <= buf_input_r(1817 downto 64);
            bits_in_buffer               <= 1754;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1819 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1754 downto 0)   <= buf_input_r(1818 downto 64);
            bits_in_buffer               <= 1755;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1820 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1755 downto 0)   <= buf_input_r(1819 downto 64);
            bits_in_buffer               <= 1756;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1821 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1756 downto 0)   <= buf_input_r(1820 downto 64);
            bits_in_buffer               <= 1757;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1822 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1757 downto 0)   <= buf_input_r(1821 downto 64);
            bits_in_buffer               <= 1758;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1823 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1758 downto 0)   <= buf_input_r(1822 downto 64);
            bits_in_buffer               <= 1759;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1824 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1759 downto 0)   <= buf_input_r(1823 downto 64);
            bits_in_buffer               <= 1760;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1825 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1760 downto 0)   <= buf_input_r(1824 downto 64);
            bits_in_buffer               <= 1761;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1826 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1761 downto 0)   <= buf_input_r(1825 downto 64);
            bits_in_buffer               <= 1762;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1827 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1762 downto 0)   <= buf_input_r(1826 downto 64);
            bits_in_buffer               <= 1763;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1828 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1763 downto 0)   <= buf_input_r(1827 downto 64);
            bits_in_buffer               <= 1764;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1829 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1764 downto 0)   <= buf_input_r(1828 downto 64);
            bits_in_buffer               <= 1765;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1830 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1765 downto 0)   <= buf_input_r(1829 downto 64);
            bits_in_buffer               <= 1766;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1831 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1766 downto 0)   <= buf_input_r(1830 downto 64);
            bits_in_buffer               <= 1767;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1832 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1767 downto 0)   <= buf_input_r(1831 downto 64);
            bits_in_buffer               <= 1768;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1833 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1768 downto 0)   <= buf_input_r(1832 downto 64);
            bits_in_buffer               <= 1769;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1834 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1769 downto 0)   <= buf_input_r(1833 downto 64);
            bits_in_buffer               <= 1770;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1835 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1770 downto 0)   <= buf_input_r(1834 downto 64);
            bits_in_buffer               <= 1771;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1836 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1771 downto 0)   <= buf_input_r(1835 downto 64);
            bits_in_buffer               <= 1772;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1837 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1772 downto 0)   <= buf_input_r(1836 downto 64);
            bits_in_buffer               <= 1773;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1838 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1773 downto 0)   <= buf_input_r(1837 downto 64);
            bits_in_buffer               <= 1774;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1839 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1774 downto 0)   <= buf_input_r(1838 downto 64);
            bits_in_buffer               <= 1775;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1840 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1775 downto 0)   <= buf_input_r(1839 downto 64);
            bits_in_buffer               <= 1776;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1841 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1776 downto 0)   <= buf_input_r(1840 downto 64);
            bits_in_buffer               <= 1777;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1842 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1777 downto 0)   <= buf_input_r(1841 downto 64);
            bits_in_buffer               <= 1778;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1843 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1778 downto 0)   <= buf_input_r(1842 downto 64);
            bits_in_buffer               <= 1779;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1844 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1779 downto 0)   <= buf_input_r(1843 downto 64);
            bits_in_buffer               <= 1780;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1845 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1780 downto 0)   <= buf_input_r(1844 downto 64);
            bits_in_buffer               <= 1781;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1846 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1781 downto 0)   <= buf_input_r(1845 downto 64);
            bits_in_buffer               <= 1782;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1847 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1782 downto 0)   <= buf_input_r(1846 downto 64);
            bits_in_buffer               <= 1783;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1848 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1783 downto 0)   <= buf_input_r(1847 downto 64);
            bits_in_buffer               <= 1784;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1849 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1784 downto 0)   <= buf_input_r(1848 downto 64);
            bits_in_buffer               <= 1785;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1850 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1785 downto 0)   <= buf_input_r(1849 downto 64);
            bits_in_buffer               <= 1786;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1851 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1786 downto 0)   <= buf_input_r(1850 downto 64);
            bits_in_buffer               <= 1787;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1852 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1787 downto 0)   <= buf_input_r(1851 downto 64);
            bits_in_buffer               <= 1788;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1853 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1788 downto 0)   <= buf_input_r(1852 downto 64);
            bits_in_buffer               <= 1789;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1854 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1789 downto 0)   <= buf_input_r(1853 downto 64);
            bits_in_buffer               <= 1790;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1855 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1790 downto 0)   <= buf_input_r(1854 downto 64);
            bits_in_buffer               <= 1791;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1856 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1791 downto 0)   <= buf_input_r(1855 downto 64);
            bits_in_buffer               <= 1792;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1857 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1792 downto 0)   <= buf_input_r(1856 downto 64);
            bits_in_buffer               <= 1793;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1858 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1793 downto 0)   <= buf_input_r(1857 downto 64);
            bits_in_buffer               <= 1794;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1859 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1794 downto 0)   <= buf_input_r(1858 downto 64);
            bits_in_buffer               <= 1795;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1860 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1795 downto 0)   <= buf_input_r(1859 downto 64);
            bits_in_buffer               <= 1796;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1861 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1796 downto 0)   <= buf_input_r(1860 downto 64);
            bits_in_buffer               <= 1797;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1862 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1797 downto 0)   <= buf_input_r(1861 downto 64);
            bits_in_buffer               <= 1798;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1863 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1798 downto 0)   <= buf_input_r(1862 downto 64);
            bits_in_buffer               <= 1799;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1864 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1799 downto 0)   <= buf_input_r(1863 downto 64);
            bits_in_buffer               <= 1800;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1865 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1800 downto 0)   <= buf_input_r(1864 downto 64);
            bits_in_buffer               <= 1801;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1866 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1801 downto 0)   <= buf_input_r(1865 downto 64);
            bits_in_buffer               <= 1802;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1867 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1802 downto 0)   <= buf_input_r(1866 downto 64);
            bits_in_buffer               <= 1803;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1868 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1803 downto 0)   <= buf_input_r(1867 downto 64);
            bits_in_buffer               <= 1804;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1869 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1804 downto 0)   <= buf_input_r(1868 downto 64);
            bits_in_buffer               <= 1805;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1870 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1805 downto 0)   <= buf_input_r(1869 downto 64);
            bits_in_buffer               <= 1806;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1871 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1806 downto 0)   <= buf_input_r(1870 downto 64);
            bits_in_buffer               <= 1807;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1872 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1807 downto 0)   <= buf_input_r(1871 downto 64);
            bits_in_buffer               <= 1808;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1873 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1808 downto 0)   <= buf_input_r(1872 downto 64);
            bits_in_buffer               <= 1809;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1874 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1809 downto 0)   <= buf_input_r(1873 downto 64);
            bits_in_buffer               <= 1810;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1875 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1810 downto 0)   <= buf_input_r(1874 downto 64);
            bits_in_buffer               <= 1811;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1876 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1811 downto 0)   <= buf_input_r(1875 downto 64);
            bits_in_buffer               <= 1812;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1877 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1812 downto 0)   <= buf_input_r(1876 downto 64);
            bits_in_buffer               <= 1813;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1878 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1813 downto 0)   <= buf_input_r(1877 downto 64);
            bits_in_buffer               <= 1814;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1879 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1814 downto 0)   <= buf_input_r(1878 downto 64);
            bits_in_buffer               <= 1815;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1880 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1815 downto 0)   <= buf_input_r(1879 downto 64);
            bits_in_buffer               <= 1816;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1881 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1816 downto 0)   <= buf_input_r(1880 downto 64);
            bits_in_buffer               <= 1817;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1882 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1817 downto 0)   <= buf_input_r(1881 downto 64);
            bits_in_buffer               <= 1818;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1883 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1818 downto 0)   <= buf_input_r(1882 downto 64);
            bits_in_buffer               <= 1819;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1884 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1819 downto 0)   <= buf_input_r(1883 downto 64);
            bits_in_buffer               <= 1820;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1885 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1820 downto 0)   <= buf_input_r(1884 downto 64);
            bits_in_buffer               <= 1821;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1886 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1821 downto 0)   <= buf_input_r(1885 downto 64);
            bits_in_buffer               <= 1822;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1887 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1822 downto 0)   <= buf_input_r(1886 downto 64);
            bits_in_buffer               <= 1823;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1888 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1823 downto 0)   <= buf_input_r(1887 downto 64);
            bits_in_buffer               <= 1824;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1889 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1824 downto 0)   <= buf_input_r(1888 downto 64);
            bits_in_buffer               <= 1825;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1890 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1825 downto 0)   <= buf_input_r(1889 downto 64);
            bits_in_buffer               <= 1826;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1891 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1826 downto 0)   <= buf_input_r(1890 downto 64);
            bits_in_buffer               <= 1827;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1892 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1827 downto 0)   <= buf_input_r(1891 downto 64);
            bits_in_buffer               <= 1828;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1893 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1828 downto 0)   <= buf_input_r(1892 downto 64);
            bits_in_buffer               <= 1829;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1894 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1829 downto 0)   <= buf_input_r(1893 downto 64);
            bits_in_buffer               <= 1830;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1895 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1830 downto 0)   <= buf_input_r(1894 downto 64);
            bits_in_buffer               <= 1831;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1896 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1831 downto 0)   <= buf_input_r(1895 downto 64);
            bits_in_buffer               <= 1832;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1897 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1832 downto 0)   <= buf_input_r(1896 downto 64);
            bits_in_buffer               <= 1833;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1898 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1833 downto 0)   <= buf_input_r(1897 downto 64);
            bits_in_buffer               <= 1834;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1899 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1834 downto 0)   <= buf_input_r(1898 downto 64);
            bits_in_buffer               <= 1835;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1900 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1835 downto 0)   <= buf_input_r(1899 downto 64);
            bits_in_buffer               <= 1836;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1901 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1836 downto 0)   <= buf_input_r(1900 downto 64);
            bits_in_buffer               <= 1837;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1902 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1837 downto 0)   <= buf_input_r(1901 downto 64);
            bits_in_buffer               <= 1838;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1903 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1838 downto 0)   <= buf_input_r(1902 downto 64);
            bits_in_buffer               <= 1839;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1904 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1839 downto 0)   <= buf_input_r(1903 downto 64);
            bits_in_buffer               <= 1840;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1905 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1840 downto 0)   <= buf_input_r(1904 downto 64);
            bits_in_buffer               <= 1841;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1906 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1841 downto 0)   <= buf_input_r(1905 downto 64);
            bits_in_buffer               <= 1842;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1907 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1842 downto 0)   <= buf_input_r(1906 downto 64);
            bits_in_buffer               <= 1843;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1908 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1843 downto 0)   <= buf_input_r(1907 downto 64);
            bits_in_buffer               <= 1844;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1909 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1844 downto 0)   <= buf_input_r(1908 downto 64);
            bits_in_buffer               <= 1845;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1910 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1845 downto 0)   <= buf_input_r(1909 downto 64);
            bits_in_buffer               <= 1846;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1911 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1846 downto 0)   <= buf_input_r(1910 downto 64);
            bits_in_buffer               <= 1847;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1912 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1847 downto 0)   <= buf_input_r(1911 downto 64);
            bits_in_buffer               <= 1848;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1913 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1848 downto 0)   <= buf_input_r(1912 downto 64);
            bits_in_buffer               <= 1849;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1914 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1849 downto 0)   <= buf_input_r(1913 downto 64);
            bits_in_buffer               <= 1850;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1915 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1850 downto 0)   <= buf_input_r(1914 downto 64);
            bits_in_buffer               <= 1851;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1916 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1851 downto 0)   <= buf_input_r(1915 downto 64);
            bits_in_buffer               <= 1852;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1917 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1852 downto 0)   <= buf_input_r(1916 downto 64);
            bits_in_buffer               <= 1853;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1918 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1853 downto 0)   <= buf_input_r(1917 downto 64);
            bits_in_buffer               <= 1854;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1919 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1854 downto 0)   <= buf_input_r(1918 downto 64);
            bits_in_buffer               <= 1855;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1920 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1855 downto 0)   <= buf_input_r(1919 downto 64);
            bits_in_buffer               <= 1856;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1921 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1856 downto 0)   <= buf_input_r(1920 downto 64);
            bits_in_buffer               <= 1857;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1922 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1857 downto 0)   <= buf_input_r(1921 downto 64);
            bits_in_buffer               <= 1858;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1923 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1858 downto 0)   <= buf_input_r(1922 downto 64);
            bits_in_buffer               <= 1859;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1924 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1859 downto 0)   <= buf_input_r(1923 downto 64);
            bits_in_buffer               <= 1860;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1925 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1860 downto 0)   <= buf_input_r(1924 downto 64);
            bits_in_buffer               <= 1861;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1926 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1861 downto 0)   <= buf_input_r(1925 downto 64);
            bits_in_buffer               <= 1862;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1927 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1862 downto 0)   <= buf_input_r(1926 downto 64);
            bits_in_buffer               <= 1863;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1928 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1863 downto 0)   <= buf_input_r(1927 downto 64);
            bits_in_buffer               <= 1864;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1929 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1864 downto 0)   <= buf_input_r(1928 downto 64);
            bits_in_buffer               <= 1865;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1930 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1865 downto 0)   <= buf_input_r(1929 downto 64);
            bits_in_buffer               <= 1866;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1931 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1866 downto 0)   <= buf_input_r(1930 downto 64);
            bits_in_buffer               <= 1867;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1932 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1867 downto 0)   <= buf_input_r(1931 downto 64);
            bits_in_buffer               <= 1868;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1933 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1868 downto 0)   <= buf_input_r(1932 downto 64);
            bits_in_buffer               <= 1869;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1934 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1869 downto 0)   <= buf_input_r(1933 downto 64);
            bits_in_buffer               <= 1870;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1935 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1870 downto 0)   <= buf_input_r(1934 downto 64);
            bits_in_buffer               <= 1871;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1936 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1871 downto 0)   <= buf_input_r(1935 downto 64);
            bits_in_buffer               <= 1872;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1937 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1872 downto 0)   <= buf_input_r(1936 downto 64);
            bits_in_buffer               <= 1873;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1938 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1873 downto 0)   <= buf_input_r(1937 downto 64);
            bits_in_buffer               <= 1874;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1939 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1874 downto 0)   <= buf_input_r(1938 downto 64);
            bits_in_buffer               <= 1875;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1940 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1875 downto 0)   <= buf_input_r(1939 downto 64);
            bits_in_buffer               <= 1876;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1941 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1876 downto 0)   <= buf_input_r(1940 downto 64);
            bits_in_buffer               <= 1877;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1942 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1877 downto 0)   <= buf_input_r(1941 downto 64);
            bits_in_buffer               <= 1878;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1943 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1878 downto 0)   <= buf_input_r(1942 downto 64);
            bits_in_buffer               <= 1879;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1944 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1879 downto 0)   <= buf_input_r(1943 downto 64);
            bits_in_buffer               <= 1880;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1945 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1880 downto 0)   <= buf_input_r(1944 downto 64);
            bits_in_buffer               <= 1881;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1946 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1881 downto 0)   <= buf_input_r(1945 downto 64);
            bits_in_buffer               <= 1882;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1947 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1882 downto 0)   <= buf_input_r(1946 downto 64);
            bits_in_buffer               <= 1883;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1948 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1883 downto 0)   <= buf_input_r(1947 downto 64);
            bits_in_buffer               <= 1884;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1949 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1884 downto 0)   <= buf_input_r(1948 downto 64);
            bits_in_buffer               <= 1885;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1950 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1885 downto 0)   <= buf_input_r(1949 downto 64);
            bits_in_buffer               <= 1886;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1951 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1886 downto 0)   <= buf_input_r(1950 downto 64);
            bits_in_buffer               <= 1887;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1952 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1887 downto 0)   <= buf_input_r(1951 downto 64);
            bits_in_buffer               <= 1888;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1953 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1888 downto 0)   <= buf_input_r(1952 downto 64);
            bits_in_buffer               <= 1889;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1954 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1889 downto 0)   <= buf_input_r(1953 downto 64);
            bits_in_buffer               <= 1890;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1955 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1890 downto 0)   <= buf_input_r(1954 downto 64);
            bits_in_buffer               <= 1891;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1956 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1891 downto 0)   <= buf_input_r(1955 downto 64);
            bits_in_buffer               <= 1892;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1957 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1892 downto 0)   <= buf_input_r(1956 downto 64);
            bits_in_buffer               <= 1893;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1958 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1893 downto 0)   <= buf_input_r(1957 downto 64);
            bits_in_buffer               <= 1894;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1959 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1894 downto 0)   <= buf_input_r(1958 downto 64);
            bits_in_buffer               <= 1895;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1960 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1895 downto 0)   <= buf_input_r(1959 downto 64);
            bits_in_buffer               <= 1896;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1961 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1896 downto 0)   <= buf_input_r(1960 downto 64);
            bits_in_buffer               <= 1897;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1962 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1897 downto 0)   <= buf_input_r(1961 downto 64);
            bits_in_buffer               <= 1898;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1963 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1898 downto 0)   <= buf_input_r(1962 downto 64);
            bits_in_buffer               <= 1899;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1964 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1899 downto 0)   <= buf_input_r(1963 downto 64);
            bits_in_buffer               <= 1900;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1965 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1900 downto 0)   <= buf_input_r(1964 downto 64);
            bits_in_buffer               <= 1901;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1966 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1901 downto 0)   <= buf_input_r(1965 downto 64);
            bits_in_buffer               <= 1902;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1967 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1902 downto 0)   <= buf_input_r(1966 downto 64);
            bits_in_buffer               <= 1903;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1968 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1903 downto 0)   <= buf_input_r(1967 downto 64);
            bits_in_buffer               <= 1904;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1969 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1904 downto 0)   <= buf_input_r(1968 downto 64);
            bits_in_buffer               <= 1905;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1970 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1905 downto 0)   <= buf_input_r(1969 downto 64);
            bits_in_buffer               <= 1906;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1971 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1906 downto 0)   <= buf_input_r(1970 downto 64);
            bits_in_buffer               <= 1907;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1972 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1907 downto 0)   <= buf_input_r(1971 downto 64);
            bits_in_buffer               <= 1908;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1973 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1908 downto 0)   <= buf_input_r(1972 downto 64);
            bits_in_buffer               <= 1909;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1974 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1909 downto 0)   <= buf_input_r(1973 downto 64);
            bits_in_buffer               <= 1910;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1975 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1910 downto 0)   <= buf_input_r(1974 downto 64);
            bits_in_buffer               <= 1911;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1976 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1911 downto 0)   <= buf_input_r(1975 downto 64);
            bits_in_buffer               <= 1912;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1977 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1912 downto 0)   <= buf_input_r(1976 downto 64);
            bits_in_buffer               <= 1913;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1978 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1913 downto 0)   <= buf_input_r(1977 downto 64);
            bits_in_buffer               <= 1914;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1979 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1914 downto 0)   <= buf_input_r(1978 downto 64);
            bits_in_buffer               <= 1915;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1980 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1915 downto 0)   <= buf_input_r(1979 downto 64);
            bits_in_buffer               <= 1916;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1981 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1916 downto 0)   <= buf_input_r(1980 downto 64);
            bits_in_buffer               <= 1917;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1982 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1917 downto 0)   <= buf_input_r(1981 downto 64);
            bits_in_buffer               <= 1918;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1983 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1918 downto 0)   <= buf_input_r(1982 downto 64);
            bits_in_buffer               <= 1919;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1984 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1919 downto 0)   <= buf_input_r(1983 downto 64);
            bits_in_buffer               <= 1920;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1985 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1920 downto 0)   <= buf_input_r(1984 downto 64);
            bits_in_buffer               <= 1921;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1986 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1921 downto 0)   <= buf_input_r(1985 downto 64);
            bits_in_buffer               <= 1922;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1987 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1922 downto 0)   <= buf_input_r(1986 downto 64);
            bits_in_buffer               <= 1923;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1988 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1923 downto 0)   <= buf_input_r(1987 downto 64);
            bits_in_buffer               <= 1924;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1989 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1924 downto 0)   <= buf_input_r(1988 downto 64);
            bits_in_buffer               <= 1925;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1990 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1925 downto 0)   <= buf_input_r(1989 downto 64);
            bits_in_buffer               <= 1926;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1991 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1926 downto 0)   <= buf_input_r(1990 downto 64);
            bits_in_buffer               <= 1927;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1992 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1927 downto 0)   <= buf_input_r(1991 downto 64);
            bits_in_buffer               <= 1928;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1993 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1928 downto 0)   <= buf_input_r(1992 downto 64);
            bits_in_buffer               <= 1929;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1994 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1929 downto 0)   <= buf_input_r(1993 downto 64);
            bits_in_buffer               <= 1930;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1995 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1930 downto 0)   <= buf_input_r(1994 downto 64);
            bits_in_buffer               <= 1931;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1996 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1931 downto 0)   <= buf_input_r(1995 downto 64);
            bits_in_buffer               <= 1932;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1997 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1932 downto 0)   <= buf_input_r(1996 downto 64);
            bits_in_buffer               <= 1933;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1998 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1933 downto 0)   <= buf_input_r(1997 downto 64);
            bits_in_buffer               <= 1934;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 1999 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1934 downto 0)   <= buf_input_r(1998 downto 64);
            bits_in_buffer               <= 1935;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 2000 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1935 downto 0)   <= buf_input_r(1999 downto 64);
            bits_in_buffer               <= 1936;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 2001 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1936 downto 0)   <= buf_input_r(2000 downto 64);
            bits_in_buffer               <= 1937;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 2002 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1937 downto 0)   <= buf_input_r(2001 downto 64);
            bits_in_buffer               <= 1938;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 2003 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1938 downto 0)   <= buf_input_r(2002 downto 64);
            bits_in_buffer               <= 1939;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 2004 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1939 downto 0)   <= buf_input_r(2003 downto 64);
            bits_in_buffer               <= 1940;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 2005 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1940 downto 0)   <= buf_input_r(2004 downto 64);
            bits_in_buffer               <= 1941;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        when 2006 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(1941 downto 0)   <= buf_input_r(2005 downto 64);
            bits_in_buffer               <= 1942;
            out_rdy_r                    <= '1';
            congestion_out               <= '1';
        end case;

        end if;
    end process the_buffing_process;
    end architecture arch_word_compressor_1003IN_to_64OUT;