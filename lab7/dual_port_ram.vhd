----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:34:54 11/16/2020 
-- Design Name: 
-- Module Name:    dual_port_ram - Behavioral 
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

entity dual_port_ram is
	-- generic nubers
	generic(
				w : integer := 4; 
				c : integer := 4
				);
	port ( 
				mode : in  STD_LOGIC;				-- mode 0 is writing mode
				clk : in  STD_LOGIC;
				reset : in STD_LOGIC;
				address : in  STD_LOGIC_VECTOR (c-1 downto 0);
				data_in : in  STD_LOGIC_VECTOR (w-1 downto 0);
				data_out : out  STD_LOGIC_VECTOR (w-1 downto 0));
end dual_port_ram;

architecture Behavioral of dual_port_ram is

	type memory is Array (2**(C)-1 downto 0) of STD_LOGIC_VECTOR(w-1 downto 0);
	signal mem: memory;
	signal address_keep : STD_LOGIC_VECTOR(c-1 downto 0);

begin
	
	-- main process
	proc : process (clk, reset)
	begin
		-- checking the reseting signal
		if reset = '0' then
			if rising_edge(clk) and mode = '0' then
				mem(to_integer(unsigned(address))) <= data_in;
			end if;
		else
			for i in 0 to 2**(C)-1 loop
				mem(i) <= STD_LOGIC_VECTOR(to_unsigned(i,W));
			end loop;
		end if;
		
	end process proc;
	
	-- setting output data
	data_out <= mem(to_integer(unsigned(address))) when (
							mode = '1') else (others => 'Z');

end Behavioral;

