
library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
	port(
		x, y, cin: in std_logic;
		s, cout : out std_logic
		);
end entity full_adder;

architecture behavioural of full_adder is
	
	component or_gate is
		port(
			a, b: in std_logic;
			o: out std_logic
			);
	end component or_gate;

	component half_adder is
		port(
			x, y: in std_logic;
			s, cout: out std_logic
			);
	end component half_adder;

	signal wire0, wire1, wire2 : std_logic;

begin
	or_gate_i0: or_gate port map (a => wire1, b => wire2, o => cout);
	half_adder_i0: half_adder port map (x => x, y => y, s => wire0, cout => wire1);
	half_adder_i1: half_adder port map (x => wire0, y => cin, s => s, cout => wire2);
end behavioural;