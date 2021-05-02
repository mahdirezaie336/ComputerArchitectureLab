----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:57 11/17/2020 
-- Design Name: 
-- Module Name:    normal_multiplier - Behavioral 
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

entity normal_multiplier is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           p : out  STD_LOGIC_VECTOR (7 downto 0));
end normal_multiplier;

architecture Behavioral of normal_multiplier is

	component full_adder is
		Port ( a : in  STD_LOGIC;
				  b : in  STD_LOGIC;
				  c_in : in  STD_LOGIC;
				  sum : out  STD_LOGIC;
				  c_out : out  STD_LOGIC);
	end component full_adder;
	
	component half_adder is
		 Port ( a : in  STD_LOGIC;
				  b : in  STD_LOGIC;
				  sum : out  STD_LOGIC;
				  c_out : out  STD_LOGIC);
	end component half_adder;
	
	signal s : std_logic_vector (5 downto 0);
	signal c : std_logic_vector (10 downto 0);
	signal ands : std_logic_vector (14 downto 0);

begin

	ands(0) <= a(0) and b(1);
	ands(1) <= a(1) and b(0);
	ands(2) <= a(0) and b(2);
	ands(3) <= a(1) and b(1);
	ands(4) <= a(1) and b(2);
	ands(5) <= a(0) and b(3);
	ands(6) <= a(1) and b(3);
	
	ands(7) <= a(2) and b(0);
	ands(8) <= a(2) and b(1);
	ands(9) <= a(2) and b(2);
	ands(10) <= a(2) and b(3);
	
	ands(11) <= a(3) and b(0);
	ands(12) <= a(3) and b(1);
	ands(13) <= a(3) and b(2);
	ands(14) <= a(3) and b(3);
	
	p(0) <= a(0) and b(0);
	
	half1 : half_adder port map (a => ands(0), b => ands(1), sum => p(1), c_out => c(0));
	full1 : full_adder port map (a => ands(2), b => ands(3), c_in => c(0), sum => s(0), c_out => c(1));
	full2 : full_adder port map (a => ands(4), b => ands(5), c_in => c(1), sum => s(1), c_out => c(2));
	half2 : half_adder port map (a => ands(6), b => c(2), sum => s(2), c_out => c(3));
	
	half3 : half_adder port map (a => ands(7), b => s(0), sum => p(2), c_out => c(4));
	full3 : full_adder port map (a => ands(8), b => s(1), c_in => c(4), sum => s(3), c_out => c(5));
	full4 : full_adder port map (a => ands(9), b => s(2), c_in => c(5), sum => s(4), c_out => c(6));
	full5 : full_adder port map (a => ands(10), b => c(3), c_in => c(6), sum => s(5), c_out => c(7));
	
	half4 : half_adder port map (a => ands(11), b => s(3), sum => p(3), c_out => c(8));
	full6 : full_adder port map (a => ands(12), b => s(4), c_in => c(8), sum => p(4), c_out => c(9));
	full7 : full_adder port map (a => ands(13), b => s(5), c_in => c(9), sum => p(5), c_out => c(10));
	full8 : full_adder port map (a => ands(14), b => c(7), c_in => c(10), sum => p(6), c_out => p(7));

end Behavioral;

