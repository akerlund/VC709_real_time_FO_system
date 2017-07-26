library ieee;
use ieee.std_logic_1164.all;
entity peterson is
    port(
        synd     :    in  std_logic_vector(47 downto 0);
        la_1     :    out  std_logic_vector(7 downto 0);
        la_2     :    out  std_logic_vector(7 downto 0);
        la_3     :    out  std_logic_vector(7 downto 0);
        la_4     :    out  std_logic_vector(7 downto 0)
);
end entity;

architecture arch of peterson is
signal S1_2 : std_logic_vector(7 downto 0);
signal S1_3 : std_logic_vector(7 downto 0);
signal S1_2_S3 : std_logic_vector(7 downto 0);
signal S1_laT_3 : std_logic_vector(7 downto 0);
signal laT_1 : std_logic_vector(7 downto 0);
signal laT_1_2 : std_logic_vector(7 downto 0);
signal laT_2 : std_logic_vector(7 downto 0);
signal laT_3 : std_logic_vector(7 downto 0);
signal laT_4 : std_logic_vector(7 downto 0);
begin

process(laT_1,laT_2,laT_3,synd)
begin
    if laT_1 = (7 downto 0=>'0') then
        la_1<=((7 downto 1=>'0')&'1');
        la_2<=synd(7 downto 0);
        la_3<=(others=>'0');
        la_4<=(others=>'0');
    else
        la_2<=laT_2;
        la_3<=laT_3;
        la_4<=laT_1_2 xor S1_laT_3;
        la_1<=laT_1;
    end if;
end process;

mul_s1_2 : entity work.gfmul
port map(
    a=>synd(7 downto 0),
    b=>synd(7 downto 0),
    X=>S1_2);

mul_s1_3 : entity work.gfmul
port map(
    a=>synd(7 downto 0),
    b=>S1_2,
    X=>S1_3);

laT_1<=synd(23 downto 16) xor S1_3;

mul_l2 : entity work.gfmul
port map(
    a=>laT_1,
    b=>synd(7 downto 0),
    X=>laT_2);

mul_s1_2_s3 : entity work.gfmul
port map(
    a=>S1_2,
    b=>synd(23 downto 16),
    X=>S1_2_S3);

laT_3<=S1_2_S3 xor synd(39 downto 32);

mul_l1_2 : entity work.gfmul
port map(
    a=>laT_1,
    b=>laT_1,
    X=>laT_1_2);

mul_s1_laT3 : entity work.gfmul
port map(
    a=>synd(7 downto 0),
    b=>laT_3,
    X=>S1_laT_3);

end arch;
