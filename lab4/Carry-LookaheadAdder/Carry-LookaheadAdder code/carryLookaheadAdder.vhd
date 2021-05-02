library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carryLookaheadAdder is
    Port ( ai : in  STD_LOGIC_VECTOR (3 downto 0);
           bi : in  STD_LOGIC_VECTOR (3 downto 0);
           c0 : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           c4 : out  STD_LOGIC);
end carryLookaheadAdder;

architecture Behavioral of carryLookaheadAdder is
component FullAdder is
    Port(
        a,b,ci: in std_logic;
        s,co : out std_logic
        );
End component FullAdder;

signal pi,gi : STD_LOGIC_VECTOR (3 downto 0);
signal c,c1,c2,c3 : std_logic;
  begin

    full1 : FullAdder port map ( a => ai(0),b => bi(0) ,ci => c0,s => s(0),co => c);
    gi(0) <= ai(0) and bi(0);
    pi(0) <= ai(0) xor bi(0);
    c1 <= gi(0) or (c0 and pi(0));


    full2 : FullAdder port map ( a => ai(1),b => bi(1) ,ci => c1,s => s(1),co => c);
    gi(1) <= ai(1) and bi(1);
    pi(1) <= ai(1) xor bi(1);
    c2 <= gi(1) or (c1 and pi(1));


    full3 : FullAdder port map ( a => ai(2),b => bi(2) ,ci => c2,s => s(2),co => c);
    gi(2) <= ai(2) and bi(2);
    pi(2) <= ai(2) xor bi(2);
    c3 <= gi(2) or (c2 and pi(2));
  

    full4 : FullAdder port map ( a => ai(3),b => bi(3) ,ci => c3,s => s(3),co => c);
    gi(3) <= ai(3) and bi(3);
    pi(3) <= ai(3) xor bi(3);
    c4 <= gi(3) or (c3 and pi(3));


end Behavioral;

