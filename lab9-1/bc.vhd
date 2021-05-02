library ieee;
use ieee.std_logic_1164.all;

entity bc is
	generic(
	w : integer := 8;
	c : integer := 5
	);

	port(
	clk, rst, rst_ram : in std_logic
	);
end entity bc;

architecture dataflow of bc is
component ram 
	port(
	data_in : in std_logic_vector(7 downto 0);
	addr : in std_logic_vector(4 downto 0);
	w, r, clk, rst : in std_logic;
	data_out : out std_logic_vector(7 downto 0)
	);
end component ram;

component cpu8bits is
	port(
	data_in : in std_logic_vector(7 downto 0);	
	clk, rst : in std_logic;
	data_out : out std_logic_vector(7 downto 0);
	address : out std_logic_vector(4 downto 0);
	we, oe : out std_logic
	);
end component cpu8bits;

	signal we, oe : std_logic := '0';
	signal data_out, data_in : std_logic_vector(7 downto 0) := (others => '0');
	signal address : std_logic_vector(4 downto 0) := (others =>'0');

begin
	cpu : cpu8bits port map(data_in, clk, rst, data_out, address, we, oe);
	ram_ins : ram port map(data_in => data_out, addr => address, w => we, r => oe, clk => clk, rst => rst_ram, data_out => data_in);
end architecture dataflow;
