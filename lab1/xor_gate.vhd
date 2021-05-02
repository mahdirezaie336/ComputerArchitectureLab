library IEEE;
use IEEE.std_logic_1164.all;

entity xor_gate is
	port(
		a, b : in std_logic;
		o : out std_logic
		);
end entity xor_gate;

architecture behavioural of xor_gate is
begin
	o <= a xor b;
end behavioural;
