----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:17 11/17/2020 
-- Design Name: 
-- Module Name:    array_multiplier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity array_multiplier is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           p : out  STD_LOGIC_VECTOR (7 downto 0));
end array_multiplier;

architecture Behavioral of array_multiplier is

	component ripple_adder is
		Port(
				a : in STD_LOGIC_VECTOR (3 downto 0);
				b : in STD_LOGIC_VECTOR (3 downto 0);
				c_in : in std_logic;
				sum : out STD_LOGIC_VECTOR (3 downto 0);
				c_out : out std_logic
				);
	End component ripple_adder;
	
	signal temp : STD_LOGIC_VECTOR (15 downto 0);
	signal ftemp : STD_LOGIC_VECTOR (3 downto 0);
	signal stemp : STD_LOGIC_VECTOR (3 downto 0);
	
begin

	temp(0) <= b(0) and a(0);
	temp(1) <= b(0) and a(1);
	temp(2) <= b(0) and a(2);
	temp(3) <= b(0) and a(3);
	temp(4) <= b(1) and a(0);
	temp(5) <= b(1) and a(1);
	temp(6) <= b(1) and a(2);
	temp(7) <= b(1) and a(3);
	temp(8) <= b(2) and a(0);
	temp(9) <= b(2) and a(1);
	temp(10) <= b(2) and a(2);
	temp(11) <= b(2) and a(3);
	temp(12) <= b(3) and a(0);
	temp(13) <= b(3) and a(1);
	temp(14) <= b(3) and a(2);
	temp(15) <= b(3) and a(3);

	p(0) <= temp(0);
	
	ra1 : ripple_adder port map ( a(0) => temp(1), a(1) => temp(2), a(2) => temp(3), a(3) => '0',
											b(0) => temp(4), b(1) => temp(5), b(2) => temp(6), b(3) => temp(7),
											c_in => '0', sum(0) => p(1), sum(1) => stemp(0), sum(2) => stemp(1),
											sum(3) => stemp(2), c_out => stemp(3));
										
	ra2 : ripple_adder port map ( a(0) => stemp(0), a(1) => stemp(1), a(2) => stemp(2), a(3) => stemp(3),
											b(0) => temp(8), b(1) => temp(9), b(2) => temp(10), b(3) => temp(11),
											c_in => '0', sum(0) => p(2), sum(1) => ftemp(0), sum(2) => ftemp(1),
											sum(3) => ftemp(2), c_out => ftemp(3));
											
	ra3 : ripple_adder port map ( a(0) => ftemp(0), a(1) => ftemp(1), a(2) => ftemp(2), a(3) => ftemp(3),
											b(0) => temp(12), b(1) => temp(13), b(2) => temp(14), b(3) => temp(15),
											c_in => '0', sum(0) => p(3), sum(1) => p(4), sum(2) => p(5),
											sum(3) => p(6), c_out => p(7));

end Behavioral;

