#!/usr/bin/env python2
# -*- coding: utf-8 -*-

CORRECTION_ENABLE = True
import sys
import math

def make_bch(k,n,t):



    m = str(int(math.log(int(n)+1,2)))

    bch = """library ieee;
use ieee.std_logic_1164.all;

package bch_pak is
"""

    bch += "constant m : integer :="+m+";\n"
    bch += "constant n : integer :="+str(n)+";--shortened length\n"
    bch += "constant k : integer :="+str(k)+";--shortened length\n"
    bch += "constant sz : integer :=m*"+str(int(t)*2)+";-- # syndromes times m (t*2)\n"

    bch += """end package\n;

library ieee;
use ieee.std_logic_1164.all;
use work.bch_pak.all;

entity bch_peterson is
    port(
        clk    : in  std_logic;
        enable : in  std_logic;
"""

    if CORRECTION_ENABLE:
        bch += "        on_off : in  std_logic;\n"

    bch += """        x      : in  std_logic_vector(n-1 downto 0);-- Change to n
        E      : out std_logic_vector(k-1 downto 0)
);
end entity;

architecture arch of bch_peterson is
    signal         synd_sig : std_logic_vector(sz-1 downto 0);-- Change to length of syndrome vector
    signal         synd_reg : std_logic_vector(sz-1 downto 0);-- Change to length of syndrome vector
"""

    bch += "    signal         la_1_sig : std_logic_vector(m-1 downto 0);\n"
    bch += "    signal         la_2_sig : std_logic_vector(m-1 downto 0);\n"
    if int(t) >= 2:
        bch += "    signal         la_3_sig : std_logic_vector(m-1 downto 0);\n"
    if int(t) >= 3:
        bch += "    signal         la_4_sig : std_logic_vector(m-1 downto 0);\n"
    bch += """    signal         x_reg    : std_logic_vector(n-1 downto 0);
    signal         x1_reg   : std_logic_vector(n-1 downto 0);
    signal         E_sig    : std_logic_vector(n-1 downto 0);

begin

    process (clk)
    begin
        if rising_edge(clk) then
        
            if enable = '1' then
                x_reg <= x;
            end if;
            
            x1_reg   <= x_reg;
            synd_reg <= synd_sig;
"""
    if CORRECTION_ENABLE:
        bch += "            if on_off = '1' then\n"
        if int(t) == 3:
            bch += "                E <= E_sig(n-1 downto n-k) xor x1_reg(n-1 downto n-k);\n"
        else:
            bch += "                E <= E_sig(k-1 downto 0) xor x1_reg(k-1 downto 0);\n"


        bch += "            else\n"

        if int(t) == 3:
            bch += "                E <= x1_reg(n-1 downto n-k);\n"
        else:
            bch += "                E <= x1_reg(k-1 downto 0);\n"

        bch += "            end if;\n\n"

    else:
        if int(t) == 3:
            bch += "            E        <= E_sig(n-1 downto n-k) xor x1_reg(n-1 downto n-k);\n"
        else:
            bch += "            E        <= E_sig(k-1 downto 0) xor x1_reg(k-1 downto 0);\n"

    bch += """
        end if;
    end process;

    synd : entity work.syncalc
    port map(
        in_data  => x_reg,
        out_data => synd_sig
    );

    peter : entity work.peterson
    port map(
        synd => synd_reg,
        la_1 => la_1_sig,
        la_2 => la_2_sig"""
    if int(t) >= 2:
        bch += ",\n        la_3 => la_3_sig"
    if int(t) >= 3:
        bch += ",\n        la_4 => la_4_sig"

    bch += "\n    );\n\n"

    bch += "    chi : entity work.chien"
    bch += """
    port map(
        a_1 => la_1_sig,
        a_2 => la_2_sig"""
    if int(t) >= 2:
        bch += ",\n        a_3 => la_3_sig"
    if int(t) >= 3:
        bch += ",\n        a_4 => la_4_sig"

    bch += """,
        E   => E_sig
    );
end arch;"""

    return bch

if __name__ == "__main__":
    bch = make_bch(sys.argv[1], sys.argv[2], sys.argv[3]) # (k,n,t)
    with open("bch_test.vhd",'w') as file:
        file.write(bch)
