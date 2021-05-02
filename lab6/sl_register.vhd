----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:41 11/24/2020 
-- Design Name: 
-- Module Name:    sl_register - Behavioral 
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

entity sl_register is
    Port ( p_in : in  STD_LOGIC_VECTOR (3 downto 0);
           LR : in  STD_LOGIC_VECTOR (1 downto 0);
           load : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reg_out : inout  STD_LOGIC_VECTOR (3 downto 0));
end sl_register;

architecture Behavioral of sl_register is

	component mux_4to1 is
		Port ( a : in  STD_LOGIC_VECTOR (0 to 3);
				sel : in  STD_LOGIC_VECTOR (1 downto 0);
				o : out  STD_LOGIC);
	end component mux_4to1;
	
	component D_FF is
		 Port ( d : in  STD_LOGIC;
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  q : out  STD_LOGIC);
	end component D_FF;
	
	component counter is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  Qout : out STD_LOGIC);
	end component counter;

	signal s0, s1, first, new_clk : std_logic;
	signal o, m : std_logic_vector (0 to 3);

begin
	
	---- Setting the muxes selection inputs
	s1 <= load or (LR(1) and not LR(0));
	s0 <= load or LR(0);
	
	---- Setting the switching mode between arithmetic and logical
	first <= reg_out(3) when (LR(1) = '1' and LR(0) = '1') else '0';
	
	---- Setting the counter and delay
	counter0 : counter port map (reset => reset, clk => clk, Qout => new_clk);
	
	---- Setting the muxes inputs
	mux0 : mux_4to1 port map (	a(0) => reg_out(0), 
										a(1) => reg_out(1), 
										a(2) => '0', 
										a(3) => p_in(0),
										sel(1) => s1, 
										sel(0) => s0, 
										o => m(0));
	
	mux1 : mux_4to1 port map (	a(0) => reg_out(1),
										a(1) => reg_out(2), 
										a(2) => reg_out(0), 
										a(3) => p_in(1),
										sel(1) => s1, 
										sel(0) => s0, 
										o => m(1));

	mux2 : mux_4to1 port map (	a(0) => reg_out(2), 
										a(1) => reg_out(3), 
										a(2) => reg_out(1), 
										a(3) => p_in(2),
										sel(1) => s1, 
										sel(0) => s0, 
										o => m(2));

	mux3 : mux_4to1 port map (	a(0) => reg_out(3), 
										a(1) => first, 
										a(2) => reg_out(2), 
										a(3) => p_in(3),
										sel(1) => s1, 
										sel(0) => s0, 
										o => m(3));
	
	---- Setting flipflips inputs
	ff0 : D_FF port map (d => m(0), clk => new_clk, reset => reset, q => reg_out(0));
	ff1 : D_FF port map (d => m(1), clk => new_clk, reset => reset, q => reg_out(1));
	ff2 : D_FF port map (d => m(2), clk => new_clk, reset => reset, q => reg_out(2));
	ff3 : D_FF port map (d => m(3), clk => new_clk, reset => reset, q => reg_out(3));
	

end Behavioral;

