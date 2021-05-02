--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:59:40 02/21/2018
-- Design Name:   
-- Module Name:   D:/Phantom/ISEFile/decoder/testing.vhd
-- Project Name:  decoder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoderone
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
 
ENTITY testing IS
END testing;
 
ARCHITECTURE behavior OF testing IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoderone
    PORT(
         a0 : IN  std_logic;
         a1 : IN  std_logic;
         b0 : OUT  std_logic;
         b1 : OUT  std_logic;
         b2 : OUT  std_logic;
         b3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a0 : std_logic := '0';
   signal a1 : std_logic := '0';

 	--Outputs
   signal b0 : std_logic;
   signal b1 : std_logic;
   signal b2 : std_logic;
   signal b3 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoderone PORT MAP (
          a0 => a0,
          a1 => a1,
          b0 => b0,
          b1 => b1,
          b2 => b2,
          b3 => b3
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      

      -- insert stimulus here 
		
		a0 <= '0';
		a1 <= '0';
		wait for 100 ns;	
		a0 <= '1';
		a1 <= '0';
		wait for 100 ns;	
		
		a0 <= '0';
		a1 <= '1';
		wait for 100 ns;	
		
		a0 <= '1';
		a1 <='1';
			
      wait;
   end process;

END behavior;
