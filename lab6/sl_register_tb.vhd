--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:44:47 11/24/2020
-- Design Name:   
-- Module Name:   Z:/home/rezaie/Apps/xilinx/workspace/Lab6/sl_register_tb.vhd
-- Project Name:  Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sl_register
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sl_register_tb IS
END sl_register_tb;
 
ARCHITECTURE behavior OF sl_register_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sl_register
    PORT(
         p_in : IN  std_logic_vector(3 downto 0);
         LR : IN  std_logic_vector(1 downto 0);
         load : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         reg_out : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal p_in : std_logic_vector(3 downto 0) := (others => '0');
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal reg_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sl_register PORT MAP (
          p_in => p_in,
          LR => LR,
          load => load,
          reset => reset,
          clk => clk,
          reg_out => reg_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		p_in <= "1101";
		reset <= '1';
		load <= '0';
		LR <= "00";
		wait for (clk_period + clk_period/2);
		
		reset <= '0';
		load <= '1';
		LR <= "00";
		wait for 2*clk_period;
		
		load <= '0';
		LR <= "11";
		wait for 4*clk_period;
		
		LR <= "10";
		wait for 4*clk_period;
		
		LR <= "01";
		wait for 4*clk_period;
		
		load <= '1';
		p_in <= "1011";
		wait for clk_period;
		
      wait;
   end process;

END;
