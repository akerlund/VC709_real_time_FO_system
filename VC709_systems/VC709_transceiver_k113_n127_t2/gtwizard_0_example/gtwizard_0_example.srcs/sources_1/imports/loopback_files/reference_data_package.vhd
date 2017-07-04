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

    constant ROM_WIDTH : integer := 64;
    constant ROM_ROWS  : integer := 16;
        
    type ROM_type is array (0 to ROM_ROWS-1) of std_logic_vector(ROM_WIDTH-1 downto 0);

    constant TX_ROM2 : ROM_type := (
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
                
    -- Can use this one for testing the FBERT syncronization, has the start word sent last.
    constant TX_ROM : ROM_type := (
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
                x"7786757473727170",
                x"00000000000000fb");
                
--    constant RX_ROM : ROM_type := (
--                x"000000fb",
--                x"03020100",
--                x"07060504",
--                x"0b0a0908",
--                x"0f0e0d0c",
--                x"13121110",
--                x"17161514",
--                x"1b1a1918",
--                x"1f1e1d1c",
--                x"23222120",
--                x"27262524",
--                x"2b2a2928",
--                x"2f2e2d2c",
--                x"33323130",
--                x"37363534",
--                x"3b3a3938");

  --constant RX_ROM_1_one_error : ROM_type := ( 
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
                x"7786757473727170");
                
  --constant RX_ROM_errors : ROM_type := ( 
    --constant RX_ROM : ROM_type := (   -- error sum:
--                x"000000fb", -- x"000000fb", -- 1
--                x"33020100", -- x"03020100", -- 2
--                x"77060504", -- x"07060504", -- 3
--                x"Fb0a0908", -- x"0b0a0908", -- 4
--                x"Ff1e0d0c", -- x"0f0e0d0c", -- 5
--                x"13121FF0", -- x"13121110", -- 6
--                x"371615FF", -- x"17161514", -- 7
--                x"1b1F19FF", -- x"1b1a1918", -- 8  2+3+3
--                x"FfFeFd1c", -- x"1f1e1d1c", -- 9  3+3+3
--                x"F3FF2020", -- x"23222120", -- 10 3+3+3+1
--                x"F7F6F521", -- x"27262524", -- 11 3+3+3+2
--                x"24251918", -- x"2b2a2928", -- 12 4+4+2+2
--                x"2021220c", -- x"2f2e2d2c", -- 13 4+4+4+1
--                x"ccc13130", -- x"33323130", -- 14 4+4+4+2
--                x"c7c6c533", -- x"37363534", -- 15 4+4+4+3
--                x"cbcac9c8");-- x"3b3a3938");-- 16 4+4+4+4

    -- Can use these inverted numbers for error injection, 4 errors each.
    
      -- A = 10 = 1010 => Inverse => 0101 = 5 
      -- B = 11 = 1011 => Inverse => 0100 = 4
      -- C = 12 = 1100 => Inverse => 0011 = 3
      -- D = 13 = 1101 => Inverse => 0010 = 2
      -- E = 14 = 1110 => Inverse => 0001 = 1
      -- F = 15 = 1111 => Inverse => 0000 = 0

      -- 3 = 0011 => Inverse => 1100 = 12 = C      
    
    constant NR_OF_STARTUP_WORDS : integer := 16;
    constant SYNC_ROWS : integer := 4;
    type RSYNC_type is array (0 to SYNC_ROWS-1) of std_logic_vector(ROM_WIDTH-1 downto 0);

    constant SYNC_ROM : RSYNC_type := (   -- error sum:
                x"00000000000000fb",
                x"0000000033020100",
                x"0000000077060504",
                x"00000000Fb0a0908");
                    
    impure function TX_reference_data(index : integer) return std_logic_vector;
    impure function RX_reference_data(index : integer) return std_logic_vector;
    impure function SYNC_reference_data(index : integer) return std_logic_vector;

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


    impure function SYNC_reference_data(index : integer) return std_logic_vector is
    begin
        return SYNC_ROM(index);
    end SYNC_reference_data;
    
end reference_data_package;

