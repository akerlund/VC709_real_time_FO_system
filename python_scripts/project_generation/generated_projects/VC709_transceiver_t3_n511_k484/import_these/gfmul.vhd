library ieee;
use ieee.std_logic_1164.all;
entity gfmul is
    port(
        a     :    in  std_logic_vector(8 downto 0);
        b     :    in  std_logic_vector(8 downto 0);
        X     :    out std_logic_vector(8 downto 0)
);
end entity;

architecture arch of gfmul is
signal d : std_logic_vector(8 downto 0);
signal e : std_logic_vector(7 downto 0);
begin
 d(0) <=  (a(0) and b(0));
 d(1) <=  (a(1) and b(0)) xor (a(0) and b(1));
 d(2) <=  (a(2) and b(0)) xor (a(1) and b(1)) xor (a(0) and b(2));
 d(3) <=  (a(3) and b(0)) xor (a(2) and b(1)) xor (a(1) and b(2)) xor (a(0) and b(3));
 d(4) <=  (a(4) and b(0)) xor (a(3) and b(1)) xor (a(2) and b(2)) xor (a(1) and b(3)) xor (a(0) and b(4));
 d(5) <=  (a(5) and b(0)) xor (a(4) and b(1)) xor (a(3) and b(2)) xor (a(2) and b(3)) xor (a(1) and b(4)) xor (a(0) and b(5));
 d(6) <=  (a(6) and b(0)) xor (a(5) and b(1)) xor (a(4) and b(2)) xor (a(3) and b(3)) xor (a(2) and b(4)) xor (a(1) and b(5)) xor (a(0) and b(6));
 d(7) <=  (a(7) and b(0)) xor (a(6) and b(1)) xor (a(5) and b(2)) xor (a(4) and b(3)) xor (a(3) and b(4)) xor (a(2) and b(5)) xor (a(1) and b(6)) xor (a(0) and b(7));
 d(8) <=  (a(8) and b(0)) xor (a(7) and b(1)) xor (a(6) and b(2)) xor (a(5) and b(3)) xor (a(4) and b(4)) xor (a(3) and b(5)) xor (a(2) and b(6)) xor (a(1) and b(7)) xor (a(0) and b(8));
 
 e(0) <=  (a(8) and b(1)) xor (a(7) and b(2)) xor (a(6) and b(3)) xor (a(5) and b(4)) xor (a(4) and b(5)) xor (a(3) and b(6)) xor (a(2) and b(7)) xor (a(1) and b(8));
 e(1) <=  (a(8) and b(2)) xor (a(7) and b(3)) xor (a(6) and b(4)) xor (a(5) and b(5)) xor (a(4) and b(6)) xor (a(3) and b(7)) xor (a(2) and b(8));
 e(2) <=  (a(8) and b(3)) xor (a(7) and b(4)) xor (a(6) and b(5)) xor (a(5) and b(6)) xor (a(4) and b(7)) xor (a(3) and b(8));
 e(3) <=  (a(8) and b(4)) xor (a(7) and b(5)) xor (a(6) and b(6)) xor (a(5) and b(7)) xor (a(4) and b(8));
 e(4) <=  (a(8) and b(5)) xor (a(7) and b(6)) xor (a(6) and b(7)) xor (a(5) and b(8));
 e(5) <=  (a(8) and b(6)) xor (a(7) and b(7)) xor (a(6) and b(8));
 e(6) <=  (a(8) and b(7)) xor (a(7) and b(8));
 e(7) <=  (a(8) and b(8));

 X(0) <= d(0) xor e(0) xor e(5);
 X(1) <= d(1) xor e(1) xor e(6);
 X(2) <= d(2) xor e(2) xor e(7);
 X(3) <= d(3) xor e(3);
 X(4) <= d(4) xor e(0) xor e(4) xor e(5);
 X(5) <= d(5) xor e(1) xor e(5) xor e(6);
 X(6) <= d(6) xor e(2) xor e(6) xor e(7);
 X(7) <= d(7) xor e(3) xor e(7);
 X(8) <= d(8) xor e(4);

end arch;
