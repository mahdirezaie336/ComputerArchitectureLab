library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity ram is
	generic (
	ww : integer := 8;
	d : integer := 32;
	c : integer := 5);

	port(
	data_in : in std_logic_vector(ww - 1 downto 0);
	addr : in std_logic_vector(c - 1 downto 0);
	w, r, clk, rst : in std_logic;
	data_out : out std_logic_vector(ww - 1 downto 0));
end entity ram;

architecture behavior of ram is
	type ram_type is array(0 to d - 1) of std_logic_vector(ww - 1 downto 0);	
	signal ram : ram_type := (others => (others => '0'));
	
	begin 

	main_process : process(clk, rst)
	begin
	if (rising_edge(clk)) then 
		if (w = '1') then ram(conv_integer(addr)) <= data_in; elsif (r = '1') then data_out <= ram(conv_integer(addr)); end if;
	end if;

	if (rst = '0') then
                data_out <= "00000000";
		ram(0) <= "00010000";
		ram(1) <= "00110001";
		ram(2) <= "01011111";
		ram(3) <= "01111110";
		ram(4) <= "10010000";
		ram(5) <= "10110000";
		ram(6) <= "11010000";
		ram(7) <= "11110000";
		ram(8) <= "00000000";
		ram(9) <= "00000000";
		ram(10) <= "00000000";
		ram(11) <= "00000000";
		ram(12) <= "00000000";
		ram(13) <= "00010000";
		ram(14) <= "00010000";
		ram(15) <= "00010000";
		ram(16) <= "00110011";
		ram(17) <= "00000000";
		ram(18) <= "00000000";
		ram(19) <= "00000000";
		ram(20) <= "00000000";
		ram(21) <= "00000000";
		ram(22) <= "00000000";
		ram(23) <= "00000000";
		ram(24) <= "00000000";
		ram(25) <= "00000000";
		ram(26) <= "00000000";
		ram(27) <= "00000000";
		ram(28) <= "00000000";
		ram(29) <= "00000000";
		ram(30) <= "00000000";
		ram(31) <= "01000011";
		--for i in 0 to d - 1 loop
			--ram(i) <= conv_std_logic_vector(0, ww);
		--end loop;
	end if;

	end process main_process;
	
end architecture behavior;
