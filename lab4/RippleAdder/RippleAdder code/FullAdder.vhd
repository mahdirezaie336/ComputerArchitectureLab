library IEEE;
use ieee.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           ci : in  STD_LOGIC;
           s : out  STD_LOGIC;
           co : out  STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

component HalfAdder is
  Port(
      a,b : in std_logic;
      sum,carry : out std_logic
      );
End component HalfAdder;

signal s1,s2,s3 :std_logic;
begin

  half1 : HalfAdder port map ( a => a,b => b,sum => s1,carry => s2);
  half2 : HalfAdder port map ( a => s1,b => ci,sum => s,carry => s3);
  co <= s2 or s3;

end Behavioral;

