library ieee;
use ieee.std_logic_1164.all;
entity peterson is
    port(
        synd     :    in  std_logic_vector(17 downto 0);
        la_1     :    out  std_logic_vector(8 downto 0);
        la_2     :    out  std_logic_vector(8 downto 0)
);
end entity;

architecture arch of peterson is
begin

la_1<=((8 downto 1=>'0')&'1');

la_2<=synd(8 downto 0);

end arch;
