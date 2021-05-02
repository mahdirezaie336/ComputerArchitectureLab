library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity compratorfour is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           agtb : out  STD_LOGIC;
           aeqb : out  STD_LOGIC;
           altb : out  STD_LOGIC);
end compratorfour;

architecture Behavioral of compratorfour is

component compratorOne is
Port(
a,b,gtt,eq,lt: in std_logic;
agtb,aeqb,altb : out std_logic
);
End component compratorOne;

signal anot,bnot,c1gt,c1eq,c1lt,c2gt,c2eq,c2lt,c3gt,c3eq,c3lt:std_logic;

begin

comprator1 : compratorOne port map ( a => a(3),b => b(3),gtt => '0',eq => '1',lt => '0' ,agtb => c1gt,aeqb => c1eq,altb => c1lt);
comprator2 : compratorOne port map ( a => a(2),b => b(2),gtt => c1gt,eq => c1eq,lt => c1lt ,agtb => c2gt,aeqb => c2eq,altb => c2lt);
comprator3 : compratorOne port map ( a => a(1),b => b(1),gtt => c2gt,eq => c2eq,lt => c2lt ,agtb => c3gt,aeqb => c3eq,altb => c3lt);
comprator4 : compratorOne port map ( a => a(0),b => b(0),gtt => c3gt,eq => c3eq,lt => c3lt ,agtb => agtb,aeqb => aeqb,altb => altb);



end Behavioral;

