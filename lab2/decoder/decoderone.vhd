
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoderone is
    Port ( a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b0 : out  STD_LOGIC;
           b1 : out  STD_LOGIC;
           b2 : out  STD_LOGIC;
           b3 : out  STD_LOGIC);
end decoderone;

architecture Behavioral of decoderone is
signal a0not,a1not : std_logic;
begin
a0not <= Not(a0);
a1not <= Not(a1);
b0 <= a1not and a0not;
b1 <= a1 and a0not;
b2 <= a1not and a0;
b3 <= a1 and a0;
end Behavioral;

