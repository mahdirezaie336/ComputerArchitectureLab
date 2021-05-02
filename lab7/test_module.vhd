----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:56 11/15/2020 
-- Design Name: 
-- Module Name:    test_module - Behavioral 
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

entity test_module is
    Port ( d : in  STD_LOGIC;						-- to read set d to 1
			  clk : in  STD_LOGIC;
           o : inout  STD_LOGIC_VECTOR(1 downto 0));
end test_module;

architecture Behavioral of test_module is

	type memory is array (0 downto 0) of STD_LOGIC_VECTOR(1 downto 0);
	signal mem : memory;
	signal holder : std_logic_vector(1 downto 0);

begin
	
	test : process (clk)
	begin
		if d = '0' then
			mem(0) <= o;
		end if;
	end process test;
	
	rest : process (clk)
	begin
		if d = '1' then
			holder <= mem(0);
		end if;
	end process rest;
	
	o <= holder when (d = '1') else (others => 'Z');
	
end Behavioral;

