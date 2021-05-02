library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is

	port(
		a : in std_logic;
		b : in std_logic;
		sel : in std_logic;
		o : out std_logic
		);

end entity mux_2to1;

architecture behavioural of mux_2to1 is

begin

	o <= (a and not sel) or (b and sel);

end behavioural;


