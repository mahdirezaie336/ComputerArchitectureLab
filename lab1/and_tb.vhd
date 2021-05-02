library IEEE;
use IEEE.std_logic_1164.all;

entity and_tb is
end entity and_tb;

architecture behavioural of and_tb is

	component and_gate
		port(
			a, b: in std_logic;
			o: out std_logic
			);
	end component and_gate;

	signal a, b: std_logic; -- inputs
	signal o: std_logic; -- outputs

	begin
		UUT: and_gate port map(a => a, b => b, o => o);
	process
	begin
		a <= '0';
		b <= '0';
		wait for 10 ns;
		a <= '0';
		b <= '1';
		wait for 10 ns;
		a <= '1';
		b <= '0';
		wait for 10 ns;
		a <= '1';
		b <= '1';
		wait for 10 ns;
	end process;

end behavioural;
