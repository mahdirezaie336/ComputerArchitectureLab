----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:50:55 11/16/2020 
-- Design Name: 
-- Module Name:    ram2 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram2 is

	generic(
				w : integer := 4; 
				c : integer := 4
				);
	
	Port ( 
				mode : in  STD_LOGIC;					-- mode 1 is writing mode
				address : in  STD_LOGIC_VECTOR (c-1 downto 0);
				reset : in  STD_LOGIC;
				clk : in  STD_LOGIC;
				data : inout  STD_LOGIC_VECTOR (w-1 downto 0)
				);
end ram2;

architecture Behavioral of ram2 is

	type memory is Array (2**(C)-1 downto 0) of STD_LOGIC_VECTOR(w-1 downto 0);
	signal mem: memory;
	signal data_keep : STD_LOGIC_VECTOR(w-1 downto 0);

begin

	-- writing process
	w_proc : process (clk, reset)
	begin
		if reset = '0' then
			if rising_edge(clk) and mode = '1' then
					mem(to_integer(unsigned(address))) <= data;
			end if;
		else
			for i in 0 to 2**(C)-1 loop
				mem(i) <= STD_LOGIC_VECTOR(to_unsigned(i,W));
			end loop;
		end if;
	end process w_proc;
	
	-- reading process
	r_proc : process (clk)
	begin
		if rising_edge(clk) and mode = '0' then
			data_keep <= mem(to_integer(unsigned(address)));
		end if;
	end process r_proc;
	
	data <= data_keep when mode = '0' else (others => 'Z');

end Behavioral;

