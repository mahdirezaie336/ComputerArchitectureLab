library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           A : out  STD_LOGIC;
           B : out  STD_LOGIC);
end ripple;

architecture Behavioral of ripple is
component tff is
  Port(
      T,clk,reset: in std_logic;
      Q : out std_logic
  );
End component tff;
signal anot,a1 : std_logic;

begin

  tff1 : tff port map (T => '1',clk => clk,reset =>reset,Q => a1);
  anot <= Not(a1);
  tff2 : tff port map (T => '1',clk => anot,reset =>reset,Q => B );
  A <= a1;

end Behavioral;
