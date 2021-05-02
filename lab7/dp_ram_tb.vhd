--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:36:25 11/16/2020
-- Design Name:   
-- Module Name:   C:/Users/Rezaie/Documents/xilinx/Lab7/dp_ram_tb.vhd
-- Project Name:  Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dual_port_ram
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
 
ENTITY dp_ram_tb IS
END dp_ram_tb;
 
ARCHITECTURE behavior OF dp_ram_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dual_port_ram
    PORT(
         mode : IN  std_logic;
         clk : IN  std_logic;
			reset : in std_logic;
         address : IN  std_logic_vector(3 downto 0);
         data_in : IN  std_logic_vector(3 downto 0);
         data_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mode : std_logic := '0';
   signal clk : std_logic := '0';
	signal reset : std_logic := '0';
   signal address : std_logic_vector(3 downto 0) := (others => '0');
   signal data_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dual_port_ram PORT MAP (
          mode => mode,
          clk => clk,
			 reset => reset,
          address => address,
          data_in => data_in,
          data_out => data_out
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
		wait for 10 ns;
		
		reset <= '0';
		mode <= '0';
		address <= "1110";
		data_in <= "0010";
		wait for 70 ns;
		
		mode <= '0';
		address <= "1111";
		data_in <= "0011";
		wait for 70 ns;
		
		mode <= '1';
		address <= "1110";
		wait for 70 ns;
		
		mode <= '1';
		address <= "1111";
		wait for 70 ns;
		
      wait;
   end process;

END;
