----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:04:07 11/17/2020 
-- Design Name: 
-- Module Name:    ripple_adder - Behavioral 
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

entity ripple_adder is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           c_in : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           c_out : out  STD_LOGIC);
end ripple_adder;

architecture Behavioral of ripple_adder is

	component full_adder is
		Port ( 	a : in  STD_LOGIC;
					b : in  STD_LOGIC;
					c_in : in  STD_LOGIC;
					sum : out  STD_LOGIC;
					c_out : out  STD_LOGIC);
	end component full_adder;
	
	signal c1, c2, c3 : std_logic;

begin

	full0 : full_adder port map (a => a(0), b => b(0), c_in => c_in, sum => sum(0), c_out => c1);
	full1 : full_adder port map (a => a(1), b => b(1), c_in => c1, sum => sum(1), c_out => c2);
	full2 : full_adder port map (a => a(2), b => b(2), c_in => c2, sum => sum(2), c_out => c3);
	full3 : full_adder port map (a => a(3), b => b(3), c_in => c3, sum => sum(3), c_out => c_out);

end Behavioral;

