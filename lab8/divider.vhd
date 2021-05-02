library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;

entity divider is
	generic(
				p : integer := 5
				);
	port(
		  dividend : IN  std_logic_vector(2*p - 1 downto 0);
        division : IN  std_logic_vector(p - 1 downto 0);
        zero_error : OUT  std_logic;
        overflow : OUT  std_logic;
        reminder : OUT  std_logic_vector(p - 1 downto 0);
        quotient : OUT  std_logic_vector(p - 1 downto 0)
        );
end entity divider;

architecture behavior of divider is

begin -- architecture

	zero_error <= '1' when (to_integer(unsigned(division)) = 0) else '0';
	overflow <= '0' when (dividend(2*p-1 downto p) < division) else '1';
	

	process(dividend, division) 
	
		variable q : std_logic_vector(2*p-1 downto 0);
		variable r : std_logic_vector(2*p-1 downto 0);
		
	begin
		
		q := std_logic_vector(to_unsigned(0, 2*p));
		r := std_logic_vector(to_unsigned(0, 2*p));
		
		if (not(to_integer(unsigned(division)) = 0)) then 
			for i in 0 to 2*p-1 loop
				r := r(2*p - 2 downto 0) & '0';
				r(0) := dividend(2*p - 1 - i);
				if (r >= division) then
					r := r - division;
					q(2*p - 1 - i) := '1';
				end if;
			end loop;
		end if;

		if (to_integer(unsigned(division)) = 0) then
			quotient <= (others => 'Z');
			reminder <= (others => 'Z');
		else
			quotient <= q(p-1 downto 0);
			reminder <= r(p-1 downto 0);
		end if;

	end process;
	
end architecture;