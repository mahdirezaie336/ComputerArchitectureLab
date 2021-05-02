library ieee;
use ieee.std_logic_1164.all;

entity bc_tb is
end entity bc_tb;

architecture behavior of bc_tb is
component bc is
	port(
	clk, rst, rst_ram : in std_logic
	);
end component bc;

	signal rst, clk, rst_ram : std_logic := '0';
	constant clk_period : time := 15 ns;

	begin
	uut : bc port map(clk, rst, rst_ram);

	clk_process :process
   	begin
        clk <= '1';
        wait for clk_period/2;
        clk <= '0';
        wait for clk_period/2;
   	end process;

	process
	begin
	rst_ram <= '0';
	rst <= '0';
	wait for 2 ns;
	rst_ram <= '1';
	rst <= '1';
	wait;
	end process;
end;
