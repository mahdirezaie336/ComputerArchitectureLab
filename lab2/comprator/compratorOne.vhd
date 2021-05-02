
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compratorOne is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           gtt : in  STD_LOGIC;
           eq : in  STD_LOGIC;
           lt : in  STD_LOGIC;
           agtb : out  STD_LOGIC;
           aeqb : out  STD_LOGIC;
           altb : out  STD_LOGIC);
end compratorOne;

architecture Behavioral of compratorOne is

component mux is
Port(
a0,a1,eq: in std_logic;
f : out std_logic
);
End component mux;

signal anot,bnot,c1,c2,c3:std_logic;
begin
anot <= Not(a);
bnot <= Not(b);
c1 <= a and bnot;
c2 <= (a and b) or (anot and bnot);
c3 <= anot and b;
mux1 : mux port map (a0 => gtt, a1 => c1, eq => eq , f => agtb);
mux2 : mux port map (a0 => '0', a1 => c2, eq => eq , f => aeqb);
mux3 : mux port map (a0 => lt, a1 => c3, eq => eq , f => altb);


end Behavioral;

