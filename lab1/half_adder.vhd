library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
	port(
		x, y : in std_logic;
		s, cout : out std_logic
		);
end entity half_adder;

architecture behavioural of half_adder is
	
	component and_gate is
		port(
			a, b: in std_logic;
			o: out std_logic
			);
	end component and_gate;

	component xor_gate is
		port(
			a, b: in std_logic;
			o: out std_logic
			);
	end component xor_gate;

begin
	xor_gate_i0: xor_gate port map (a => x, b => y, o => s);
	and_gate_i0: and_gate port map (a => x, b => y, o => cout);
end behavioural;
