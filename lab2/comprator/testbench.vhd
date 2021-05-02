
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT compratorfour
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         agtb : OUT  std_logic;
         aeqb : OUT  std_logic;
         altb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal agtb : std_logic;
   signal aeqb : std_logic;
   signal altb : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: compratorfour PORT MAP (
          a => a,
          b => b,
          agtb => agtb,
          aeqb => aeqb,
          altb => altb
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      

      -- insert stimulus here 
		a <= "1000";
		b <= "0111";
		wait for 100 ns;
		a <= "0111";
		b <= "0111";
		wait for 100 ns;
		a <= "0100";
		b <= "1011";
		wait for 100 ns;
		a <= "1001";
		b <= "1100";
		wait for 100 ns;
		a <= "1010";
		b <= "1011";
		wait for 100 ns;
		a <= "0000";
		b <= "0000";

      wait;
   end process;

END;
