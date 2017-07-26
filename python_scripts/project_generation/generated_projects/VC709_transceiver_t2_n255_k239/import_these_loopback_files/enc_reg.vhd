library ieee;
use ieee.std_logic_1164.all;
entity synenc_reg is
    port(
            in_data     :   in  std_logic_vector(238 downto 0);
            out_data    :   out std_logic_vector(254 downto 0);
            clk         :   in  std_logic;
            ena         :   in  std_logic
    );
end entity;
architecture arch of synenc_reg is
    signal  in_data_reg     :   std_logic_vector(238 downto 0);
    signal  out_data_sig    :   std_logic_vector(254 downto 0);
begin
    enc :   entity work.synenc
    port map(
                --in_data => in_data_reg,
                in_data => in_data,
                out_data => out_data_sig
            );
    process(clk)
    begin
        if rising_edge(clk) and ena = '1' then
            in_data_reg <= in_data;
            out_data <= out_data_sig;
        end if;
    end process;
end;
