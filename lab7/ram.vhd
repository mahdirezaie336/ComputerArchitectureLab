----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:44:33 11/11/2020 
-- Design Name: 
-- Module Name:    Ram - Behavioral 
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

entity ram is 

	generic(
				w : integer := 4; 
				c : integer := 4
				);
	port (
				wr : in STD_LOGIC;
				rd : in STD_LOGIC;
				adress : in STD_LOGIC_VECTOR (c-1 downto 0);
				reset : in STD_LOGIC;
				data : inout STD_LOGIC_VECTOR (w-1 downto 0);
				clk : in STD_LOGIC
				);
				
end entity ram;

architecture behavioral of ram is
	
	type memory is Array (2**(C)-1 downto 0) of STD_LOGIC_VECTOR(w-1 downto 0);
	signal mem: memory;
	signal data_out : STD_LOGIC_VECTOR(w-1 downto 0);

begin
	-- Writing process ---------------
	write_proc : process (clk, reset, wr)
	begin
	
		if reset = '1' then
			for i in 0 to 2**(C)-1 loop
				mem(i) <= STD_LOGIC_VECTOR(to_unsigned(i,W));
			end loop;
		else
			if (wr = '1' and rising_edge(clk) and rd = '0') then
				mem(to_integer(unsigned(adress))) <= data;
			end if;
		end if;
		
	end process write_proc;
	
	-- Reading process ---------------
	read_proc : process (clk, rd)
	begin
		
		if rising_edge(clk) then
			if (wr = '0' and rd = '1' and reset = '0') then
				data_out <= mem(to_integer(unsigned(adress)));
			else
				data_out <= (others => '0');
			end if;
		end if;
		
	end process read_proc;

	data <= data_out when (RD = '1' and WR = '0' and reset = '0') else (others => 'Z');
	
end Behavioral;