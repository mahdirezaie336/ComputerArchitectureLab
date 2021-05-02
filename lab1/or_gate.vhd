library IEEE;
use IEEE.std_logic_1164.all;

entity or_gate is
	port(
		a, b : in std_logic;
		o : out std_logic
		);
end entity or_gate;

architecture behavioural of or_gate is
begin
	o <= a or b;
end behavioural;