library ieee;
use ieee.std_logic_1164.all;

entity two_s_tb is

end entity two_s_tb;

architecture behavioural of two_s_tb is

	component two_sequence
		
		port(
			x : in std_logic;
			clk : in std_logic;
			enable : in std_logic;
			z : out std_logic;
			binary_state : out std_logic_vector(2 downto 0)
			);

	end component two_sequence;

	-- signals
	signal x, clk, enable, z : std_logic;
	signal binary_state : std_logic_vector(2 downto 0);

begin

	uut: two_sequence port map(
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
		x <= '1';
		wait for 10 ns;
		
		x <= '0';
		wait for 10 ns;

		x <= '1';
		wait for 10 ns;

		x <= '0';
		wait for 10 ns;
		
		x <= '1';
		wait for 10 ns;
		
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
		
		
	end process;

end behavioural;
