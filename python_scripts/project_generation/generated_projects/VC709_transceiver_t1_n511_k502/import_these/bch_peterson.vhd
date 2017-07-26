library ieee;
use ieee.std_logic_1164.all;

package bch_pak is
constant m : integer :=9;
constant n : integer :=511;--shortened length
constant k : integer :=502;--shortened length
constant sz : integer :=m*2;-- # syndromes times m (t*2)
end package
;

library ieee;
use ieee.std_logic_1164.all;
use work.bch_pak.all;

entity bch_peterson is
    port(
        clk    : in  std_logic;
        enable : in  std_logic;
        x      : in  std_logic_vector(n-1 downto 0);-- Change to n
        E      : out std_logic_vector(k-1 downto 0)
);
end entity;

architecture arch of bch_peterson is
    signal         synd_sig : std_logic_vector(sz-1 downto 0);-- Change to length of syndrome vector
    signal         synd_reg : std_logic_vector(sz-1 downto 0);-- Change to length of syndrome vector
    signal         la_1_sig : std_logic_vector(m-1 downto 0);
    signal         la_2_sig : std_logic_vector(m-1 downto 0);
    signal         x_reg    : std_logic_vector(n-1 downto 0);
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
            E        <= E_sig(k-1 downto 0) xor x1_reg(k-1 downto 0);

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
        la_2 => la_2_sig
    );

    chi : entity work.chien
    port map(
        a_1 => la_1_sig,
        a_2 => la_2_sig,
        E   => E_sig
    );
end arch;