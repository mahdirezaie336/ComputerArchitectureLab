--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:17:39 11/15/2020
-- Design Name:   
-- Module Name:   Z:/home/mahdi/Apps/xilinx-workspace/Lab7/tm_tb.vhd
-- Project Name:  Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_module
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
 
ENTITY tm_tb IS
END tm_tb;
 
ARCHITECTURE behavior OF tm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT test_module
    PORT(
         d : IN  std_logic;
         clk : IN  std_logic;
         o : INOUT  std_logic_vector
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic := '0';

	--BiDirs
   signal o : std_logic_vector(1 downto 0);

 	--Outputs
   signal clk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test_module PORT MAP (
          d => d,
          clk => clk,
          o => o
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

		o <= "10";
		d <= '0';
		wait for 90 ns;
		
		d <= '1';
		wait for 40 ns;
		
		d <= '0';
		o <= "01";
		wait for 90 ns;
		
		d <= '1';
		wait for 40 ns;
		
      wait;
   end process;

END;
