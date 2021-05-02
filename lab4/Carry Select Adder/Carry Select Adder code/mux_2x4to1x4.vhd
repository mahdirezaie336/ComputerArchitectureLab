library ieee;
use ieee.std_logic_1164.all;

entity mux_2x4to1x4 is

	port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		sel : in std_logic;
		o : out std_logic_vector(3 downto 0)
		);

end entity mux_2x4to1x4;

architecture behavioural of mux_2x4to1x4 is

component mux_2to1 is

	port(
		a : in std_logic;
		b : in std_logic;
		sel : in std_logic;
		o : out std_logic
		);

end component mux_2to1;

begin

	mux0 : mux_2to1 port map(a => a(0), b => b(0), sel => sel, o => o(0));
	mux1 : mux_2to1 port map(a => a(1), b => b(1), sel => sel, o => o(1));
	mux2 : mux_2to1 port map(a => a(2), b => b(2), sel => sel, o => o(2));
	mux3 : mux_2to1 port map(a => a(3), b => b(3), sel => sel, o => o(3));
	

end behavioural;


