--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:39:40 11/25/2020
-- Design Name:   
-- Module Name:   Z:/home/rezaie/Apps/xilinx/workspace/Lab6/ss_register_tb.vhd
-- Project Name:  Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seven_segment_register
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
 
ENTITY ss_register_tb IS
END ss_register_tb;
 
ARCHITECTURE behavior OF ss_register_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seven_segment_register
    PORT(
         i : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         load : IN  std_logic;
			reset : in std_logic;
         o : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal load : std_logic := '0';
	signal reset : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seven_segment_register PORT MAP (
          i => i,
          clk => clk,
          load => load,
			 reset => reset,
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
      
		reset <= '1';
		wait for 110 ns;
		
		reset <= '0';
		load <= '1';
		i <= "0110";
		wait for 170 ns;
		
		load <= '0';
		wait for 100 ns;
		
      wait;
   end process;

END;
