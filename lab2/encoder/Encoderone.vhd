
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Encoderone is
    Port ( a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           a2 : in  STD_LOGIC;
           a3 : in  STD_LOGIC;
           b0 : out  STD_LOGIC;
           b1 : out  STD_LOGIC);
end Encoderone;

architecture Behavioral of Encoderone is

begin

b0 <= a1 or a3;
b1 <= a2 or a3;


end Behavioral;

