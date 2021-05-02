
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity muxfour is
    Port ( a0 : in  STD_LOGIC_VECTOR (3 downto 0);
           a1 : in  STD_LOGIC_VECTOR (3 downto 0);
           a2 : in  STD_LOGIC_VECTOR (3 downto 0);
           a3 : in  STD_LOGIC_VECTOR (3 downto 0);
           b0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           f : out  STD_LOGIC_VECTOR (3 downto 0));
end muxfour;
architecture Behavioral of muxfour is
component muxT is
Port(
a0,a1,a2,a3,b0,b1: in std_logic;
f : out std_logic
);
End component muxT;



signal b0not,b1not : std_logic;
signal c0,c1,c2,c3 : STD_LOGIC_VECTOR (3 downto 0);

begin

mux1 : muxT port map (a0 => a0(0),a1 => a1(0) , a2 => a2(0),a3 => a3(0),b0=>b0,b1=>b1,f => f(0));
mux2 : muxT port map (a0 => a0(1),a1 => a1(1) , a2 => a2(1),a3 => a3(1),b0=>b0,b1=>b1,f => f(1));
mux3 : muxT port map (a0 => a0(2),a1 => a1(2) , a2 => a2(2),a3 => a3(2),b0=>b0,b1=>b1,f => f(2));
mux4 : muxT port map (a0 => a0(3),a1 => a1(3) , a2 => a2(3),a3 => a3(3),b0=>b0,b1=>b1,f => f(3));

end Behavioral;