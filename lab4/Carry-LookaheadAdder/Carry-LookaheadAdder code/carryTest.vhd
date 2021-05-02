LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY carryTest IS
END carryTest;
 
ARCHITECTURE behavior OF carryTest IS 
 
-- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT carryLookaheadAdder
  PORT(
      ai : IN  std_logic_vector(3 downto 0);
      bi : IN  std_logic_vector(3 downto 0);
      c0 : IN  std_logic;
      c4 : OUT  std_logic;
      s : OUT  std_logic_vector(3 downto 0)
      );
END COMPONENT;
    

--Inputs
signal ai : std_logic_vector(3 downto 0) := (others => '0');
signal bi : std_logic_vector(3 downto 0) := (others => '0');
signal c0 : std_logic := '0';

--Outputs
signal c4 : std_logic;
signal s : std_logic_vector(3 downto 0);
-- No clocks detected in port list. Replace <clock> below with 
-- appropriate port name 
 
BEGIN
 
  -- Instantiate the Unit Under Test (UUT)
  uut: carryLookaheadAdder PORT MAP (
          ai => ai,
          bi => bi,
          c0 => c0,
          s => s,
          c4 => c4
          );

  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 100 ns.
    wait for 100 ns;
    	
    -- insert stimulus here 
		ai <= "1000";
		bi <= "0000";
		c0 <= '0';
		wait for 100 ns;	
		
		ai <= "1000";
		bi <= "1001";
		c0 <= '0';
		wait for 100 ns;	
		
		ai <= "0110";
		bi <= "1100";
		c0 <= '0';
		wait for 100 ns;	
		
		ai <= "1001";
		bi <= "0011";
		c0 <= '0';
		wait for 100 ns;	
		
		ai <= "1000";
		bi <= "1000";
		c0 <= '1';
		wait for 100 ns;	

      wait;
   end process;

END;
