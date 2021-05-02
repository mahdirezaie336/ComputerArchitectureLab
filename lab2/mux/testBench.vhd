--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:50:51 02/21/2018
-- Design Name:   
-- Module Name:   D:/Phantom/ISEFile/mux/testBench.vhd
-- Project Name:  mux
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: muxfour
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
 
ENTITY testBench IS
END testBench;
 
ARCHITECTURE behavior OF testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxfour
    PORT(
         a0 : IN  std_logic_vector(3 downto 0);
         a1 : IN  std_logic_vector(3 downto 0);
         a2 : IN  std_logic_vector(3 downto 0);
         a3 : IN  std_logic_vector(3 downto 0);
         b0 : IN  std_logic;
         b1 : IN  std_logic;
         f : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a0 : std_logic_vector(3 downto 0) := (others => '0');
   signal a1 : std_logic_vector(3 downto 0) := (others => '0');
   signal a2 : std_logic_vector(3 downto 0) := (others => '0');
   signal a3 : std_logic_vector(3 downto 0) := (others => '0');
   signal b0 : std_logic := '0';
   signal b1 : std_logic := '0';

 	--Outputs
   signal f : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxfour PORT MAP (
          a0 => a0,
          a1 => a1,
          a2 => a2,
          a3 => a3,
          b0 => b0,
          b1 => b1,
          f => f
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

 

      -- insert stimulus here 


		a0 <= "0000";
		a1 <= "1111";
		a2 <= "1010";
		a3 <= "0101";
		b0 <= '0';
		b1 <= '1';

		
      wait;
   end process;

END;
