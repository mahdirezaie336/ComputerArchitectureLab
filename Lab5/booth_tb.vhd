-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY booth_tb IS
  END booth_tb;

  ARCHITECTURE behavior OF booth_tb IS 

  -- Component Declaration
          COMPONENT booth_multiplier
          PORT(
                  m : IN std_logic_vector(3 downto 0);
                  r : IN std_logic_vector(3 downto 0);       
                  result : OUT std_logic_vector(3 downto 0)
                  );
          END COMPONENT booth_multiplier;

          SIGNAL m, r :  std_logic_vector(3 downto 0);
          SIGNAL result :  std_logic_vector(3 downto 0);
          

  BEGIN


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
			
			m <= "1010";
			r <= "0101";
			wait for 20 ns;
			
			m <= "1001";
			r <= "0110";
			wait for 20 ns;
			
			m <= "0111";
			r <= "1011";
			wait for 20 ns;
			
			m <= "0011";
			r <= "0100";
			wait for 20 ns;
			
			m <= "0101";
			r <= "1001";
			wait for 20 ns;
			
			m <= "0101";
			r <= "1110";
			wait for 20 ns;
			
			

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
