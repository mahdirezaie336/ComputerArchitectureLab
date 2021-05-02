LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY divider_testbench IS
END divider_testbench;
 
ARCHITECTURE behavior OF divider_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divider
    PORT(
         dividend : IN  std_logic_vector(9 downto 0);
         division : IN  std_logic_vector(4 downto 0);
         zero_error : OUT  std_logic;
         overflow : OUT  std_logic;
         reminder : OUT  std_logic_vector(4 downto 0);
         quotient : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dividend : std_logic_vector(9 downto 0) := (others => '0');
   signal divisor : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal divide_zero_err : std_logic;
   signal overflow : std_logic;
   signal Quotient : std_logic_vector(4 downto 0);
   signal Remainder : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divider PORT MAP (
          dividend => dividend,
          division => divisor,
          zero_error => divide_zero_err,
          overflow => overflow,
          Quotient => Quotient,
          Reminder => Remainder
        );
 

   
	
	stim2_proc: process
	begin
	
		for i in 30 to 34 loop
			
			dividend <= std_logic_vector(to_unsigned(i, 10));
			
			divisor <= "00000";
			wait for 10 ns;
			
			divisor <= "00001";
			wait for 10 ns;
			
			divisor <= "00010";
			wait for 10 ns;
			
			divisor <= "00011";
			wait for 10 ns;
			
			divisor <= "00100";
			wait for 10 ns;
			
			divisor <= "10000";
			wait for 10 ns;
		
		end loop;
		
		wait;
	
	end process;

END;