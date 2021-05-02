library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_tb is
end entity full_adder_tb;

architecture behavioural of full_adder_tb is

	component full_adder
		port(
			x, y, cin: in std_logic;
			s, cout: out std_logic
			);
	end component full_adder;

	signal x, y, cin: std_logic; -- inputs
	signal s, cout: std_logic; -- outputs

	begin
		UUT: full_adder port map(x => x, y => y, cin => cin, s => s, cout => cout);
	process
	begin
		x <= '0';
		y <= '0';
		cin <= '0';
		wait for 10 ns;
		x <= '0';
		y <= '0';
		cin <= '1';
		wait for 10 ns;
		x <= '0';
		y <= '1';
		cin <= '0';
		wait for 10 ns;
		x <= '0';
		y <= '1';
		cin <= '1';
		wait for 10 ns;
		x <= '1';
		y <= '0';
		cin <= '0';
		wait for 10 ns;
		x <= '1';
		y <= '0';
		cin <= '1';
		wait for 10 ns;
		x <= '1';
		y <= '1';
		cin <= '0';
		wait for 10 ns;
		x <= '1';
		y <= '1';
		cin <= '1';
		wait for 10 ns;
	end process;

end behavioural;