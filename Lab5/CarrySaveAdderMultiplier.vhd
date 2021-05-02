----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:42 11/17/2020 
-- Design Name: 
-- Module Name:    CarrySaveAdderMultiplier - Behavioral 
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

entity CarrySaveAdderMultiplier is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           p : out  STD_LOGIC_VECTOR (7 downto 0));
end CarrySaveAdderMultiplier;

architecture Behavioral of CarrySaveAdderMultiplier is
component halfAdder is
					Port(
						ai,bi: in std_logic;
						s,c : out std_logic
						);
End component halfAdder;

component fullAdder is
						Port(
							ai,bi,ci: in std_logic;
							s,co : out std_logic
							);
End component fullAdder;

signal stemp : STD_LOGIC_VECTOR (5 downto 0);
signal ctemp : STD_LOGIC_VECTOR (10 downto 0);
signal temp : STD_LOGIC_VECTOR (15 downto 0);
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
	half1 : halfAdder port map ( ai => temp(1),bi => temp(4),s => p(1),c => ctemp(0));
	half2 : halfAdder port map ( ai => temp(2),bi => temp(5),s => stemp(0),c => ctemp(1));
	half3 : halfAdder port map ( ai => temp(3),bi => temp(6),s => stemp(1),c => ctemp(2));

	full1 : fullAdder port map (ai =>temp(8) ,bi =>ctemp(0) , ci => stemp(0) ,s => p(2),co =>ctemp(3) );
	full2 : fullAdder port map (ai =>temp(9) ,bi =>ctemp(1) , ci => stemp(1) ,s => stemp(2),co =>ctemp(4));
	full3 : fullAdder port map (ai =>temp(10) ,bi =>ctemp(2) , ci => temp(7) ,s => stemp(3),co =>ctemp(5) );

	full4 : fullAdder port map (ai =>temp(12) ,bi =>ctemp(3) , ci => stemp(2) ,s => p(3),co =>ctemp(6) );
	full5 : fullAdder port map (ai =>temp(13) ,bi =>ctemp(4) , ci => stemp(3) ,s => stemp(4),co =>ctemp(7) );
	full6 : fullAdder port map (ai =>temp(14) ,bi =>ctemp(5) , ci => temp(11) ,s => stemp(5),co =>ctemp(8) );

	half4 : halfAdder port map ( ai => ctemp(6),bi => stemp(4),s => p(4),c => ctemp(9));
	full7 : fullAdder port map (ai =>ctemp(9) ,bi =>ctemp(7) , ci => stemp(5) ,s => p(5),co =>ctemp(10) );
	full8 : fullAdder port map (ai =>ctemp(10) ,bi =>ctemp(8) , ci => temp(15) ,s => p(6),co =>p(7) );


end Behavioral;
