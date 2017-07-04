----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2017 06:22:35 PM
-- Design Name: 
-- Module Name: word_compressors_tb1_tb1 - arch_word_compressors_tb1_tb1
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

--use work.word_expander_package_for_D64_N99.all;
--use work.word_expander_package_for_D64_N106.all;
--use work.word_expander_package_for_D64_N113.all;
--use work.word_expander_package_for_D64_N120.all;
--use work.word_expander_package_for_D64_N127.all;
--use work.word_expander_package_for_D64_N223.all;
--use work.word_expander_package_for_D64_N231.all;
--use work.word_expander_package_for_D64_N239.all;
--use work.word_expander_package_for_D64_N247.all;
--use work.word_expander_package_for_D64_N255.all;
--use work.word_expander_package_for_D64_N475.all;
--use work.word_expander_package_for_D64_N484.all;
--use work.word_expander_package_for_D64_N493.all;
--use work.word_expander_package_for_D64_N502.all;
--use work.word_expander_package_for_D64_N511.all;

--use work.word_expander_package_for_D113_N512.all;

--use work.word_expander_package_for_D127_N512.all;
--use work.word_expander_package_for_D255_N512.all;
use work.word_expander_package_for_D511_N512.all;




-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity word_compressors_tb1 is
    generic
    (
        --OUT_WIDTH : integer := 64;
        --OUT_WIDTH : integer := 127;
        --OUT_WIDTH : integer := 255;
        OUT_WIDTH : integer := 511;
        
        --IN_WIDTH  : integer := 99
        --IN_WIDTH  : integer := 106
        --IN_WIDTH  : integer := 113
        --IN_WIDTH  : integer := 120
        --IN_WIDTH  : integer := 127
        --IN_WIDTH  : integer := 223
        --IN_WIDTH  : integer := 231
        --IN_WIDTH  : integer := 239
        --IN_WIDTH  : integer := 247
        --IN_WIDTH  : integer := 255
        --IN_WIDTH  : integer := 475
        --IN_WIDTH  : integer := 484
        --IN_WIDTH  : integer := 493
        --IN_WIDTH  : integer := 502
        --IN_WIDTH  : integer := 511

        IN_WIDTH  : integer := 512
    );
end word_compressors_tb1;

architecture arch_word_compressors_tb1 of word_compressors_tb1 is

    -- Inputs
    signal   sim_clk    : std_logic;
    signal   reset_in   : std_logic;
    constant clk_period : time := 100 ns;
    
    component word_compressor_99IN_to_64OUT is
            port(
                user_clk       : in  std_logic;       
                reset_in       : in  std_logic;
    
                enable_in      : in  std_logic;
                congestion_out : out std_logic;
    
                data_in        : in  std_logic_vector(98 downto 0);
                in_rdy         : in  std_logic;
    
                buf_out        : out std_logic_vector(63 downto 0);
                out_rdy        : out std_logic
            );
            end component;
        
    component word_compressor_106IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(105 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_113IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(112 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_120IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(119 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_127IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(126 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_223IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(222 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_231IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(230 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_239IN_to_64OUT is
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
        end component;
    
    component word_compressor_247IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(246 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_255IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(254 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_475IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(474 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_484IN_to_64OUT is
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
        end component;
    
    component word_compressor_493IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(492 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_502IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(501 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    component word_compressor_511IN_to_64OUT is
        port(
            user_clk       : in  std_logic;       
            reset_in       : in  std_logic;
    
            enable_in      : in  std_logic;
            congestion_out : out std_logic;
    
            data_in        : in  std_logic_vector(510 downto 0);
            in_rdy         : in  std_logic;
    
            buf_out        : out std_logic_vector(63 downto 0);
            out_rdy        : out std_logic
        );
        end component;
    
    
    component word_compressor_512IN_to_113OUT is
    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;

        enable_in      : in  std_logic;
        congestion_out : out std_logic;

        data_in        : in  std_logic_vector(511 downto 0);
        in_rdy         : in  std_logic;

        buf_out        : out std_logic_vector(112 downto 0);
        out_rdy        : out std_logic
    );
    end component;
    
    --

    
    component word_compressor_512IN_to_127OUT is
    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;

        enable_in      : in  std_logic;
        congestion_out : out std_logic;

        data_in        : in  std_logic_vector(511 downto 0);
        in_rdy         : in  std_logic;

        buf_out        : out std_logic_vector(126 downto 0);
        out_rdy        : out std_logic
    );
    end component;
    
        
    component word_compressor_512IN_to_255OUT is
    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;

        enable_in      : in  std_logic;
        congestion_out : out std_logic;

        data_in        : in  std_logic_vector(511 downto 0);
        in_rdy         : in  std_logic;

        buf_out        : out std_logic_vector(254 downto 0);
        out_rdy        : out std_logic
    );
    end component;
    
    
        
    component word_compressor_512IN_to_511OUT is
    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;

        enable_in      : in  std_logic;
        congestion_out : out std_logic;

        data_in        : in  std_logic_vector(511 downto 0);
        in_rdy         : in  std_logic;

        buf_out        : out std_logic_vector(510 downto 0);
        out_rdy        : out std_logic
    );
    end component;
    
    signal enable_in_i      : std_logic;
    signal congestion_out_i : std_logic;

    signal data_in_i        : std_logic_vector(IN_WIDTH-1 downto 0);
    signal in_rdy_i         : std_logic;

    signal buf_out_i        : std_logic_vector(OUT_WIDTH-1 downto 0);
    signal out_rdy_i        : std_logic;
    
    signal WRONG_OUTPUT     : std_logic := '0';
    signal WRONG_OUTPUT_r   : std_logic := '0';
    signal TEST_DONE        : std_logic := '0';
    signal CURRENT_ROM      : std_logic_vector(OUT_WIDTH-1 downto 0);
    signal nr_of_runs_cnt   : integer := 0;

begin

word_compressor_comp:
--component word_compressor_99IN_to_64OUT
--component word_compressor_106IN_to_64OUT
--component word_compressor_113IN_to_64OUT
--component word_compressor_120IN_to_64OUT
--component word_compressor_127IN_to_64OUT
--component word_compressor_223IN_to_64OUT
--component word_compressor_231IN_to_64OUT
--component word_compressor_239IN_to_64OUT
--component word_compressor_247IN_to_64OUT
--component word_compressor_255IN_to_64OUT
--component word_compressor_475IN_to_64OUT
--component word_compressor_484IN_to_64OUT
--component word_compressor_493IN_to_64OUT
--component word_compressor_502IN_to_64OUT
--component word_compressor_511IN_to_64OUT

--component word_compressor_512IN_to_127OUT
--component word_compressor_512IN_to_255OUT
component word_compressor_512IN_to_511OUT

    port map(
        user_clk       => sim_clk,
        reset_in       => reset_in,

        enable_in      => enable_in_i,
        congestion_out => congestion_out_i,

        data_in        => data_in_i,
        in_rdy         => in_rdy_i,
    
        buf_out        => buf_out_i,
        out_rdy        => out_rdy_i
    );

    
-- Clock process.
rx_clk_process:
process
begin
    sim_clk <= '1';
    wait for clk_period/2;
    sim_clk <= '0';
    wait for clk_period/2;
end process;


-- Stimulus process
stim_proc:
process
begin

    reset_in    <= '0';
    enable_in_i <= '0';
    
    wait for 10*clk_period;

    reset_in <= '1';
    
    wait for clk_period;
     
    enable_in_i <= '1';
        
    wait for 100 us;
    
    enable_in_i <= '0';
    
    wait for 10 us;
    
    enable_in_i <= '1';
    
    
    wait for 999 Ms;
    
    assert false report "End of simulation" severity FAILURE;

end process;


data_in_process:
process
variable in_cnt : integer := 0;
variable in_rdy_cnt : integer := 0;
begin
    
--    data_in_i <= ROM_D64_N99(in_cnt);
--    data_in_i <= ROM_D64_N106(in_cnt);
--    data_in_i <= ROM_D64_N113(in_cnt);
--    data_in_i <= ROM_D64_N120(in_cnt);
--    data_in_i <= ROM_D64_N127(in_cnt);
--    data_in_i <= ROM_D64_N223(in_cnt);
--    data_in_i <= ROM_D64_N231(in_cnt);
--    data_in_i <= ROM_D64_N239(in_cnt);
--    data_in_i <= ROM_D64_N247(in_cnt);
--    data_in_i <= ROM_D64_N255(in_cnt);
--    data_in_i <= ROM_D64_N475(in_cnt);
--    data_in_i <= ROM_D64_N484(in_cnt);
--    data_in_i <= ROM_D64_N493(in_cnt);
--  data_in_i <= ROM_D64_N502(in_cnt);
--    data_in_i <= ROM_D64_N511(in_cnt);

    --data_in_i   <= ROM_D113_N512(in_cnt);
--    data_in_i <= ROM_D127_N512(in_cnt);
--    data_in_i <= ROM_D255_N512(in_cnt);
    data_in_i <= ROM_D511_N512(in_cnt);
    
    in_rdy_cnt := in_rdy_cnt + 1;
    
    
    
    if congestion_out_i = '0' and (in_rdy_cnt mod 3 = 0) then

        --data_in_i <= ROM_D64_N127(in_cnt);
    else
        --data_in_i <= ROM_D64_N127(in_cnt);
    end if;
       
    
    
    if reset_in = '1' and enable_in_i = '1' and congestion_out_i = '0' and (in_rdy_cnt mod 3 = 0) then
        in_rdy_i  <= '1';
--        data_in_i <= ROM_D64_N99(in_cnt);
--        data_in_i <= ROM_D64_N106(in_cnt);
--        data_in_i <= ROM_D64_N113(in_cnt);
--        data_in_i <= ROM_D64_N120(in_cnt);
--        data_in_i <= ROM_D64_N127(in_cnt);
--        data_in_i <= ROM_D64_N223(in_cnt);
--        data_in_i <= ROM_D64_N231(in_cnt);
--        data_in_i <= ROM_D64_N239(in_cnt);
--        data_in_i <= ROM_D64_N247(in_cnt);
--        data_in_i <= ROM_D64_N255(in_cnt);
--        data_in_i <= ROM_D64_N475(in_cnt);
--        data_in_i <= ROM_D64_N484(in_cnt);
--        data_in_i <= ROM_D64_N493(in_cnt);
--        data_in_i <= ROM_D64_N502(in_cnt);
--        data_in_i <= ROM_D64_N511(in_cnt);

--        data_in_i <= ROM_D113_N512(in_cnt);
--    data_in_i <= ROM_D127_N512(in_cnt);
--    data_in_i <= ROM_D255_N512(in_cnt);
    data_in_i <= ROM_D511_N512(in_cnt);

        if in_cnt /= (INPUT_WIDTH*INPUT_ROM_ROWS-1) then
            in_cnt := in_cnt + 1;
        else
            in_cnt := 0;
            TEST_DONE <= '1';
            nr_of_runs_cnt <= nr_of_runs_cnt + 1;
            if nr_of_runs_cnt = 32 then
                if WRONG_OUTPUT_r = '0' then
                    assert false report "TEST DONE: SUCCESSFUL" severity FAILURE;
                else
                    assert false report "TEST DONE: FAILURE" severity FAILURE;
                end if;
            end if;
        end if;
    else
        in_rdy_i  <= '0';
--        data_in_i <= ROM_D64_N99(in_cnt);
--        data_in_i <= ROM_D64_N106(in_cnt);
--        data_in_i <= ROM_D64_N113(in_cnt);
--        data_in_i <= ROM_D64_N120(in_cnt);
--        data_in_i <= ROM_D64_N127(in_cnt);
--        data_in_i <= ROM_D64_N223(in_cnt);
--        data_in_i <= ROM_D64_N231(in_cnt);
--        data_in_i <= ROM_D64_N239(in_cnt);
--        data_in_i <= ROM_D64_N247(in_cnt);
--        data_in_i <= ROM_D64_N255(in_cnt);
--        data_in_i <= ROM_D64_N475(in_cnt);
--        data_in_i <= ROM_D64_N484(in_cnt);
--        data_in_i <= ROM_D64_N493(in_cnt);
--        data_in_i <= ROM_D64_N502(in_cnt);
--        data_in_i <= ROM_D64_N511(in_cnt);

        --data_in_i <= ROM_D113_N512(in_cnt);
--    data_in_i <= ROM_D127_N512(in_cnt);
--    data_in_i <= ROM_D255_N512(in_cnt);
    data_in_i <= ROM_D511_N512(in_cnt);
    
    end if;  
    wait for clk_period;

end process;


data_check_process:
process
variable out_cnt : integer := 0;
begin

    CURRENT_ROM <= ROM_send_data(out_cnt);
    wait for clk_period;

    if out_rdy_i = '1' and enable_in_i = '1' then
    
        if buf_out_i /= ROM_send_data(out_cnt) then
            WRONG_OUTPUT   <= '1';
            WRONG_OUTPUT_r <= '1';
        else
            WRONG_OUTPUT <= '0';
        end if;
        
        if out_cnt /= (INPUT_ROM_ROWS-1) then
            out_cnt := out_cnt + 1;
        else
            out_cnt := 0;
        end if;
        
        
    end if;
end process;

end arch_word_compressors_tb1;
