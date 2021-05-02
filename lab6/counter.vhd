----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:22:34 11/24/2020 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
-- author: MH Badiei
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity counter is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  Qout : out STD_LOGIC);
end counter;

architecture asynchronous of counter is

signal Q : STD_LOGIC;

begin



 process(clk,reset) 
   variable int : Integer; 
 begin
 
 if reset = '1' then
 Q <= '0';
 Qout <= '0';
 int := 0;
 
 elsif  rising_edge(clk) then
 
		int := int + 1;
 
 
	end if;
	
	if int = 1 then
	Q <= not(Q);
	Qout <= Q;
	int := 0;
	end if;
	
 end process;

end architecture;

