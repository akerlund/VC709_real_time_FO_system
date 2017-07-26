library ieee;
use ieee.std_logic_1164.all;
entity peterson is
    port(
        synd     :    in  std_logic_vector(35 downto 0);
        la_1     :    out  std_logic_vector(8 downto 0);
        la_2     :    out  std_logic_vector(8 downto 0);
        la_3     :    out  std_logic_vector(8 downto 0)
);
end entity;

architecture arch of peterson is
signal laT_1 : std_logic_vector(8 downto 0);
signal laT_2 : std_logic_vector(8 downto 0);
signal laT_3 : std_logic_vector(8 downto 0);
begin

laT_1<=synd(8 downto 0);

process(laT_1)
begin
    if laT_1 = (8 downto 0=>'0') then
        la_1<=((8 downto 1=>'0')&'1');
    else
        la_1<=laT_1;
    end if;
end process;

mul1 : entity work.gfmul
port map(
    a=>synd(8 downto 0),
    b=>synd(8 downto 0),
    X=>laT_2);

la_2<=laT_2;

mul2 : entity work.gfmul
port map(
    a=>laT_2,
    b=>synd(8 downto 0),
    X=>laT_3);

la_3<=synd(26 downto 18) xor laT_3;

end arch;
