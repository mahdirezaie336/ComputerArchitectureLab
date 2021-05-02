library ieee;
use ieee.std_logic_1164.all;

entity carry_select_adder is

	port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		c_in : in std_logic;
		sum : out std_logic_vector(3 downto 0);
		c_out : out std_logic
		);

end entity carry_select_adder;


architecture behavioural of carry_select_adder is

component ripple is

	port (
		a : in  std_logic_vector(3 downto 0);
		b : in  std_logic_vector(3 downto 0);
		c0 : in  std_logic;
		s : out  std_logic_vector(3 downto 0);
		c4 : out  std_logic
		);

end component ripple;

component mux_2to1 is

	port(
		a : in std_logic;
		b : in std_logic;
		sel : in std_logic;
		o : out std_logic
		);

end component mux_2to1;

component mux_2x4to1x4 is

	port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		sel : in std_logic;
		o : out std_logic_vector(3 downto 0)
		);

end component mux_2x4to1x4;

signal v0, v1 : std_logic_vector(3 downto 0);
signal w0, w1 : std_logic;

begin

	ripple0 : ripple port map(a => a, b => b, c0 => '0', s => v0, c4 => w0);
	ripple1 : ripple port map(a => a, b => b, c0 => '1', s => v1, c4 => w1);
	mux4 : mux_2x4to1x4 port map(a => v0, b => v1, sel => c_in, o => sum);
	mux2 : mux_2to1 port map(a => w0, b => w1, sel => c_in, o => c_out);

end behavioural;


