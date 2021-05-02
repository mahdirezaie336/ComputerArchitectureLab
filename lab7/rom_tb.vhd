--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:33:06 11/16/2020
-- Design Name:   
-- Module Name:   C:/Users/Rezaie/Documents/xilinx/Lab7/rom_tb.vhd
-- Project Name:  Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rom
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
 
ENTITY rom_tb IS
END rom_tb;
 
ARCHITECTURE behavior OF rom_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rom
    PORT(
         RD_en : IN  std_logic;
         Addr : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         Data : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RD_en : std_logic := '0';
   signal Addr : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal Data : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rom PORT MAP (
          RD_en => RD_en,
          Addr => Addr,
          clk => clk,
          Data => Data
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
      
		rd_en <= '0';
		addr <= "0100";
		wait for 70 ns;
		
		rd_en <= '1';
		addr <= "0110";
		wait for 70 ns;
		
		addr <= "0010";
		wait for 70 ns;
		
		addr <= "0011";
		wait for 70 ns;
		
		addr <= "0100";
		wait for 70 ns;
		
		addr <= "0110";
		wait for 70 ns;
		
		addr <= "1000";
		wait for 70 ns;
		
		addr <= "1001";
		wait for 70 ns;
		
      wait;
   end process;

END;
