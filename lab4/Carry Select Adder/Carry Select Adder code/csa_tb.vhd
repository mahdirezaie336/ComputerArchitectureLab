library ieee;
use ieee.std_logic_1164.all;

entity csa_tb is
end entity csa_tb;

architecture behavioural of csa_tb is

component carry_select_adder is

	port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		c_in : in std_logic;
		sum : out std_logic_vector(3 downto 0);
		c_out : out std_logic
		);

end component carry_select_adder;

signal a, b, sum : std_logic_vector(3 downto 0);
signal c_in, c_out : std_logic;

begin
	
	uut: carry_select_adder port map(
						a => a,
						b => b,
						c_in => c_in,
						sum => sum,
						c_out => c_out
						);

	process begin

		a <= "0100";
		b <= "0010";
		c_in <= '0';
		wait for 20 ns;
		
		a <= "0100";
		b <= "0010";
		c_in <= '1';
		wait for 20 ns;
		
		a <= "0101";
		b <= "0010";
		c_in <= '0';
		wait for 20 ns;
		
		a <= "0101";
		b <= "0010";
		c_in <= '1';
		wait for 20 ns;
		
		a <= "0111";
		b <= "0011";
		c_in <= '0';
		wait for 20 ns;
		
		a <= "0111";
		b <= "0011";
		c_in <= '1';
		wait for 20 ns;
		
		
		
	end process;

end behavioural;


