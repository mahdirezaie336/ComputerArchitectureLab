
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity dff is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end entity;

architecture asynchronous of dff is

begin
	process (clk,reset) begin
		if reset = '1' then
		Q <= '0';
		elsif clk'event and clk = '0' then
				Q <= D;
				end if;
			end process;


end architecture;

