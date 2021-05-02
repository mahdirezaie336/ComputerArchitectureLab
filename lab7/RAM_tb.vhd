----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:54:45 11/11/2020 
-- Design Name: 
-- Module Name:    RAM_tb - Behavioral 
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

entity RAM_tb is
end RAM_tb;

architecture Behavioral of RAM_tb is

component ram is
	
	port (
				wr : in STD_LOGIC;
				rd : in STD_LOGIC;
				adress : in STD_LOGIC_VECTOR (3 downto 0);
				reset : in STD_LOGIC;
				data : inout STD_LOGIC_VECTOR (3 downto 0);
				clk : in STD_LOGIC
				);
	
end component ram;

signal clk, wr, rd, reset : STD_LOGIC;
signal adress, data : STD_LOGIC_VECTOR (3 downto 0);

begin

	uut: ram port map(
								wr => wr,
								rd => rd,
								adress => adress,
								reset => reset,
								data => data,
								clk => clk
								);

	clock: process 
	begin
		
		clk <= '0';
		wait for 20 ns;
		clk <= '1';
		wait for 20 ns;
	
	end process clock;
	
	main: process
	begin
		
		reset <= '0';
		wr <= '0';
		rd <= '0';
		wait for 70 ns;
		
		reset <= '1';
		wr <= '0';
		rd <= '0';
		wait for 60 ns;
		
		reset <= '0';
		rd <= '1';
		wr <= '0';
		adress <= "0110";
		wait for 130 ns;
		
		rd <= '0';
		wr <= '1';
		adress <= "1101";
		data <= "0001";
		wait for 70 ns;
		
		rd <= '1';
		wr <= '0';
		wait for 80 ns;
	
	end process main;

end Behavioral;

