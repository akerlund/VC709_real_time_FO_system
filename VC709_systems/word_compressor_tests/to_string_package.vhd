----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/03/2017 09:21:15 AM
-- Design Name: 
-- Module Name: to_string_package - arch_to_string_package
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
use IEEE.NUMERIC_STD.ALL;

library STD;
use STD.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package to_string_package is

    function to_bstring(sl : std_logic) return string;
    function to_bstring(slv : std_logic_vector) return string;

end to_string_package;

package body to_string_package is

--FUNCTION to_char(value : STD_LOGIC) RETURN CHARACTER IS
--BEGIN
--    CASE value IS
--        WHEN 'U' =>     RETURN 'U';
--        WHEN 'X' =>     RETURN 'X';
--        WHEN '0' =>     RETURN '0';
--        WHEN '1' =>     RETURN '1';
--        WHEN 'Z' =>     RETURN 'Z';
--        WHEN 'W' =>     RETURN 'W';
--        WHEN 'L' =>     RETURN 'L';
--        WHEN 'H' =>     RETURN 'H';
--        WHEN '-' =>     RETURN '-';
--        WHEN OTHERS =>  RETURN 'X';
--    END CASE;
--END FUNCTION;

function to_bstring(sl : std_logic) return string is
  variable sl_str_v : string(1 to 3);  -- std_logic image with quotes around
begin
  sl_str_v := std_logic'image(sl);
  return "" & sl_str_v(2);  -- "" & character to get string
end function;

function to_bstring(slv : std_logic_vector) return string is
  alias    slv_norm : std_logic_vector(1 to slv'length) is slv;
  variable sl_str_v : string(1 to 1);  -- String of std_logic
  variable res_v    : string(1 to slv'length);
begin
  for idx in slv_norm'range loop
    sl_str_v := to_bstring(slv_norm(idx));
    res_v(idx) := sl_str_v(1);
  end loop;
  return res_v;
  
end function;


end to_string_package;
