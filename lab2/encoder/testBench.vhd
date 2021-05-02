
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY testBench IS
END testBench;
 
ARCHITECTURE behavior OF testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Encoderone
    PORT(
         a0 : IN  std_logic;
         a1 : IN  std_logic;
         a2 : IN  std_logic;
         a3 : IN  std_logic;
         b0 : OUT  std_logic;
         b1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a0 : std_logic := '0';
   signal a1 : std_logic := '0';
   signal a2 : std_logic := '0';
   signal a3 : std_logic := '0';

 	--Outputs
   signal b0 : std_logic;
   signal b1 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoderone PORT MAP (
          a0 => a0,
          a1 => a1,
          a2 => a2,
          a3 => a3,
          b0 => b0,
          b1 => b1
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

    

      -- insert stimulus here 
		a0 <= '1';
		a1 <= '0';
		a2 <= '0';
		a3 <= '0';
		wait for 100 ns;	
		a0 <= '0';
		a1 <= '1';
		a2 <= '0';
		a3 <= '0';
		wait for 100 ns;	
		a0 <= '1';
		a1 <= '0';
		a2 <= '1';
		a3 <= '0';
		wait for 100 ns;	
		a0 <= '1';
		a1 <= '0';
		a2 <= '1';
		a3 <= '1';
		wait for 100 ns;	

      wait;
   end process;

END;
