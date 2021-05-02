
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           eq : in  STD_LOGIC;
           f : out  STD_LOGIC);
end mux;

architecture Behavioral of mux is

signal eqnot : std_logic;

begin

eqnot <= Not(eq);

f <= (eqnot and a0) or (eq and a1);


end Behavioral;

