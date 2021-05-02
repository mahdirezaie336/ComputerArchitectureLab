--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:53:10 11/17/2020
-- Design Name:   
-- Module Name:   Z:/home/rezaie/Apps/xilinx/workspace/Lab5/normal_multiplier_tb.vhd
-- Project Name:  Lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: normal_multiplier
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
 
ENTITY normal_multiplier_tb IS
END normal_multiplier_tb;
 
ARCHITECTURE behavior OF normal_multiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT normal_multiplier
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         p : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal p : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: normal_multiplier PORT MAP (
          a => a,
          b => b,
          p => p
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
	
		a <= "0001";
		b <= "1010";
		wait for 20 ns;
		
		a <= "0001";
		b <= "1110";
		wait for 20 ns;
		
		a <= "0101";
		b <= "0111";
		wait for 20 ns;
		
		a <= "1001";
		b <= "0111";
		wait for 20 ns;
		
		a <= "0111";
		b <= "0111";
		wait for 20 ns;
		
		a <= "0011";
		b <= "1101";
		wait for 20 ns;
		
		a <= "1111";
		b <= "0111";
		wait for 20 ns;
		
		a <= "0011";
		b <= "1011";
		wait for 20 ns;
		
		

      wait;
   end process;

END;
