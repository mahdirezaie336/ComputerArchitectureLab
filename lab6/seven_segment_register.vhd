----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Mahdi Rezaie
-- 
-- Create Date:    10:16:41 11/25/2020 
-- Design Name: 
-- Module Name:    seven_segment_register - Behavioral 
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

entity seven_segment_register is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in std_logic;
			  load : in std_logic;
			  reset : in std_logic;
           o : out  STD_LOGIC_VECTOR (6 downto 0));
end seven_segment_register;

architecture Behavioral of seven_segment_register is

	component sl_register is
		Port ( p_in : in  STD_LOGIC_VECTOR (3 downto 0);
					LR : in  STD_LOGIC_VECTOR (1 downto 0);
					load : in  STD_LOGIC;
					reset : in  STD_LOGIC;
					clk : in  STD_LOGIC;
					reg_out : inout  STD_LOGIC_VECTOR (3 downto 0));
	end component sl_register;
	
	component seven_segment is
		port (
			D: in STD_LOGIC_VECTOR (3 downto 0);
			S: out STD_LOGIC_VECTOR (6 downto 0)
		);
	end component seven_segment;
	
	signal w : std_logic_vector (3 downto 0);

begin

	register0 : sl_register port map (p_in => i,
													LR => "01", 
													load => load,
													reset => reset, 
													clk => clk,
													reg_out => w);
	
	ss0 : seven_segment port map (d => w, s => o);
	

end Behavioral;

