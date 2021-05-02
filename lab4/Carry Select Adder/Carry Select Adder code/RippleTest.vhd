LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY RippleTest IS
END RippleTest;
 
ARCHITECTURE behavior OF RippleTest IS 
 
-- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT Ripple
    PORT(
         a  : IN  std_logic_vector(3 downto 0);
         b  : IN  std_logic_vector(3 downto 0);
         c0 : IN  std_logic;
         s  : OUT  std_logic_vector(3 downto 0);
         c4 : OUT  std_logic
        );
END COMPONENT;
    
--Inputs
signal a  : std_logic_vector(3 downto 0) := (others => '0');
signal b  : std_logic_vector(3 downto 0) := (others => '0');
signal c0 : std_logic := '0';

--Outputs
signal s  : std_logic_vector(3 downto 0);
signal c4 : std_logic;
-- No clocks detected in port list. Replace <clock> below with 
-- appropriate port name 
 
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: Ripple PORT MAP (
          a => a,
          b => b,
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
		a <= "1000";
		b <= "0000";
		c0 <= '0';
		wait for 100 ns;	
		a <= "1000";
		b <= "0001";
		c0 <= '0';
		wait for 100 ns;	
		a <= "1000";
		b <= "1000";
		c0 <= '0';
		wait for 100 ns;	
		a <= "1001";
		b <= "0001";
		c0 <= '0';
		wait for 100 ns;
		a <= "1011";
		b <= "0111";
		c0 <= '0';
		wait for 100 ns;	
   
      wait;
   end process;

END;


