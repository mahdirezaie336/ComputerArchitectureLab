----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:35:59 11/24/2020 
-- Design Name: 
-- Module Name:    mux_4to1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_4to1 is
    Port ( a : in  STD_LOGIC_VECTOR (0 to 3);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           o : out  STD_LOGIC);
end mux_4to1;

architecture Behavioral of mux_4to1 is

begin

	o <= ((not sel(1)) and (not sel(0)) and a(0)) or 
		  ((not sel(1)) and (    sel(0)) and a(1)) or 
		  ((    sel(1)) and (not sel(0)) and a(2)) or 
		  ((    sel(1)) and (    sel(0)) and a(3));

end Behavioral;

