--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:08:39 11/17/2020
-- Design Name:   
-- Module Name:   Z:/home/rezaie/Apps/xilinx/workspace/Lab5/ripple_adder_tb.vhd
-- Project Name:  Lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ripple_adder
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
 
ENTITY ripple_adder_tb IS
END ripple_adder_tb;
 
ARCHITECTURE behavior OF ripple_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple_adder
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         c_in : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         c_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal c_in : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal c_out : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_adder PORT MAP (
          a => a,
          b => b,
          c_in => c_in,
          sum => sum,
          c_out => c_out
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		a <= "0001";
		b <= "1010";
		c_in <= '1';
		wait for 20 ns;
		
		a <= "0001";
		b <= "1010";
		c_in <= '0';
		wait for 20 ns;
		
		a <= "0010";
		b <= "0110";
		c_in <= '1';
		wait for 20 ns;
		
		a <= "1010";
		b <= "0110";
		c_in <= '0';
		wait for 20 ns;
		
		a <= "1011";
		b <= "0010";
		c_in <= '1';
		wait for 20 ns;
		
      wait;
   end process;

END;
