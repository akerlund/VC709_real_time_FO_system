----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2017 05:11:13 PM
-- Design Name: 
-- Module Name: reference_data_package - arch_reference_data_package
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
package reference_data_package is

    constant ROM_WIDTH     : integer := 64;
    constant ROM_ROWS      : integer := 16;
        
    type ROM_type is array (0 to ROM_ROWS-1) of std_logic_vector(ROM_WIDTH-1 downto 0);

    constant TX_ROM : ROM_type := (
                x"00000000000000fb",
                x"0706050403020100",
                x"0f0e0d0c0b0a0908",
                x"1716151413121110",
                x"1f1e1d1c1b1a1918",
                x"2726252423222120",
                x"2f2e2d2c2b2a2928",
                x"3736353433323130",
                x"3f3e3d3c3b3a3938",
                x"4746454443424140",
                x"4f4e4d4c4b4a4948",
                x"5756555453525150",
                x"5f5e5d5c5b5a5958",
                x"6766656463626160",
                x"6f6e6d6c6b6a6968",
                x"7776757473727170");
                
    constant RX_ROM : ROM_type := (
                x"00000000000000fb",
                x"0706050403020100",
                x"0f0e0d0c0b0a0908",
                x"1716151413121110",
                x"1f1e1d1c1b1a1918",
                x"2726252423222120",
                x"2f2e2d2c2b2a2928",
                x"3736353433323130",
                x"3f3e3d3c3b3a3938",
                x"4746454443424140",
                x"4f4e4d4c4b4a4948",
                x"5756555453525150",
                x"5f5e5d5c5b5a5958",
                x"6766656463626160",
                x"6f6e6d6c6b6a6968",
                x"7776757473727170");
                    
    impure function TX_reference_data(index : integer) return std_logic_vector;
    impure function RX_reference_data(index : integer) return std_logic_vector;

end reference_data_package;


package body reference_data_package is

    impure function TX_reference_data(index : integer) return std_logic_vector is
    begin
        return TX_ROM(index);
    end TX_reference_data;


    impure function RX_reference_data(index : integer) return std_logic_vector is
    begin
        return RX_ROM(index);
    end RX_reference_data;
    
end reference_data_package;

