--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:58:16 11/16/2020
-- Design Name:   
-- Module Name:   C:/Users/Rezaie/Documents/xilinx/Lab7/ram2_tb.vhd
-- Project Name:  Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram2
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
 
ENTITY ram2_tb IS
END ram2_tb;
 
ARCHITECTURE behavior OF ram2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ram2
    PORT(
         mode : IN  std_logic;
         address : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         data : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mode : std_logic := '0';
   signal address : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ram2 PORT MAP (
          mode => mode,
          address => address,
          reset => reset,
          clk => clk,
          data => data
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
      
		mode <= '1';
		data <= "0011";
		address <= "1111";
		wait for 70 ns;
		
		mode <= '1';
		data <= "0010";
		address <= "1110";
		wait for 60 ns;
		
		mode <= '0';
		address <= "1111";
		wait for 70 ns;
				
		mode <= '0';
		address <= "1110";
		wait for 60 ns;
		
      wait;
   end process;

END;
