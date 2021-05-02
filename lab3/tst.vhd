LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         A : INOUT  std_logic;
         B : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

	--BiDirs
   signal A : std_logic;

 	--Outputs
   signal B : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple PORT MAP (
          clk => clk,
          reset => reset,
          A => A,
          B => B
        );

  
  process begin
	clk <= '0' ; wait for 5 ns;
	clk <= '1' ; wait for 5 ns;
   end process;
 

   process begin		
      reset <= '1';wait for 12500 ps;
		reset <= '0'; wait for 40 ns;
		assert false report "END of simulation" severity failure;

      wait;
   end process;

END;

