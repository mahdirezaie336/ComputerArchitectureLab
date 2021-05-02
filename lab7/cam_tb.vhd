library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY cam_tb IS
END cam_tb;
 
ARCHITECTURE behavior OF cam_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cam
    PORT(
         rst : IN  std_logic;
         wr : IN  std_logic;
         rd : IN  std_logic;
         data_in : IN  std_logic_vector(3 downto 0);
         found : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal data_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal found : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cam PORT MAP (
          rst => rst,
          wr => wr,
          rd => rd,
          data_in => data_in,
          found => found
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
      rst<='0';
		wait for 10 ns;
		rst<='1';
		wait for 10 ns;
		data_in<="1100";
		wait for 10 ns;
		wr<='1';
		wait for 10 ns;
		rd<='1';
		wait for 10 ns;
		rd<='0';
		data_in<="0011";
		wait for 10 ns;
		rd<='1';
		
		
		
		

     

      -- insert stimulus here 

      wait;
   end process;

END;
