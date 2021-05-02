----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:15 11/15/2020 
-- Design Name: 
-- Module Name:    rom - Behavioral 
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
 use IEEE.STD_LOGIC_UNSIGNED.ALL;
 use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom is
	generic(
				W : integer := 4;
				C : integer := 4
				);
	Port ( 
			RD_en : in  STD_LOGIC;
			Addr : in  STD_LOGIC_VECTOR (C-1 downto 0);
			clk : in  STD_LOGIC;
			Data : out  STD_LOGIC_VECTOR (W-1 downto 0)
			);
end rom;

architecture Behavioral of rom is

	constant ROM_DEPTH :integer := 2**C;
	signal reg_address :std_logic_vector (C-1 downto 0);
	type ROM is array (integer range <>)of std_logic_vector (W-1 downto 0);
	constant mem : ROM := (
									2 => "1111" , 
									3 => "1101" , 
									4 => "0110" , 
									6 => "1001" , 
									8 => "0101" , 
									9 => "0111" , 
									others => "0000" ) ;
begin
	process(clk) is
	begin 
		if rising_edge(clk) then
			if( RD_en = '1' ) then
				reg_address <= Addr ;
			end if ;
		end if ;
	end process ;

Data <= mem(to_integer(unsigned(reg_address))) ;

end Behavioral;