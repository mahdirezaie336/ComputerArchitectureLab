library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HalfAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end HalfAdder;

architecture Behavioral of HalfAdder is

begin

  sum <= a xor b;
  carry <= a and b;

end Behavioral;