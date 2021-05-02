
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity muxT is
    Port ( a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           a2 : in  STD_LOGIC;
           a3 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           f : out  STD_LOGIC);
end muxT;

architecture Behavioral of muxT is
signal b1not,b0not,c0,c1,c2,c3:std_logic;
begin

b1not <= Not(b1);
b0not <= Not(b0);
c0 <= (a0 and b1not)and b0not;
c1 <= (a1 and b1not) and b0;
c2 <= (a2 and b1) and b0not;
c3 <= (a3 and b1) and b0;

f <= (c0 or c1) or ( c2 or c3);

end Behavioral;

