
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY testbench_dff IS
END testbench_dff;
 
ARCHITECTURE behavior OF testbench_dff IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dff
    PORT(
         D : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

 
   signal D ,clk,reset,Q : std_logic;
 	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dff PORT MAP (
          D => D,
          clk => clk,
          reset => reset,
          Q => Q
        );

process begin
	clk <= '0' ; wait for 5 ns;
	clk <= '1' ; wait for 5 ns;
end process;
 


   process begin		
      reset <= '1';D <= '1';wait for 12500 ps;
		reset <= '0'; wait for 10 ns;
		D <= '0' ; wait for 12500 ps;
		D <= '1'; wait for 20 ns;
		assert false report "END of simulation" severity failure;
      wait;
   end process;

END behavior;
