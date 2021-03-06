
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY testbench_tff IS
END testbench_tff;
 
ARCHITECTURE behavior OF testbench_tff IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tff
    PORT(
         T : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         Q : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal T : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

	--BiDirs
   signal Q : std_logic;

  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tff PORT MAP (
          T => T,
          clk => clk,
          reset => reset,
          Q => Q
        );

  process begin
	clk <= '0' ; wait for 5 ns;
	clk <= '1' ; wait for 5 ns;
   end process;
 

   process begin		
      reset <= '1';T <= '1';wait for 12500 ps;
		reset <= '0'; wait for 10 ns;
		T <= '0' ; wait for 12500 ps;
		T <= '1'; wait for 20 ns;
		assert false report "END of simulation" severity failure;

      wait;
   end process;

END behavior;
