library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder_tb is
end entity half_adder_tb;

architecture behavioural of half_adder_tb is

	component half_adder
		port(
			x, y: in std_logic;
			s, cout: out std_logic
			);
	end component half_adder;

	signal x, y: std_logic; -- inputs
	signal s, cout: std_logic; -- outputs

	begin
		UUT: half_adder port map(x => x, y => y, s => s, cout => cout);
	process
	begin
		x <= '0';
		y <= '0';
		wait for 10 ns;
		x <= '0';
		y <= '1';
		wait for 10 ns;
		x <= '1';
		y <= '0';
		wait for 10 ns;
		x <= '1';
		y <= '1';
		wait for 10 ns;
	end process;

end behavioural;