library ieee;
use ieee.std_logic_1164.all;

entity mealy_tb is

end entity mealy_tb;

architecture behavioural of mealy_tb is

	component mealy_machine

		port(
			x : in std_logic;
			clk : in std_logic;
			enable : in std_logic;
			z : out std_logic;
			binary_state : out std_logic_vector(1 downto 0)
			);

	end component mealy_machine;
	
	-- signals
	signal x, clk, enable, z : std_logic;
	signal binary_state : std_logic_vector(1 downto 0);

begin

	uut: mealy_machine port map(
					x => x,
					clk => clk,
					enable => enable,
					z => z,
					binary_state => binary_state
					);

	-- clock cycle
	process begin
	
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	
	end process;

	-- setting values for inputs
	process begin

		enable <= '1';
		x <= '0';
		wait for 10 ns;
		
		x <= '0';
		wait for 10 ns;

		x <= '1';
		wait for 10 ns;

		x <= '1';
		wait for 10 ns;
		
		x <= '0';
		wait for 10 ns;
		
		x <= '1';
		wait for 10 ns;
		
		x <= '1';
		wait for 10 ns;
		
		x <= '0';
		wait for 10 ns;
		
		x <= '1';
		wait for 10 ns;
		
		
	end process;

end behavioural;
