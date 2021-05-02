library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tff is
    Port ( T : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end entity;

architecture Behavioral of tff is
signal F :std_logic;
begin
	process(clk , reset)
		begin
		if reset = '1' then
		F <= '0';
		
		elsif clk'event and clk = '0' then
		
		if(T='1') then 
		 F<=not(F);
		 else
       F<=(F);
		 end if;
		 end if;
	end process;
	Q <= F;


end Behavioral;

