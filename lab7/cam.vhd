library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cam is

generic(
constant DATA_WIDTH : integer := 4
);

port ( rst : in std_logic ;
       wr : in std_logic ;
       rd : in std_logic ;
	data_in : in std_logic_vector( DATA_WIDTH-1 downto 0 );
       found : out std_logic
	 
	  ) ;
end cam;

architecture arch of cam is 
  
constant C : integer := 4;
        
TYPE memory IS ARRAY(0 TO 3) OF std_logic_vector(3 DOWNTO 0);
   SIGNAL ram_block : memory;



begin
 
process(rd , wr , rst )
begin 
if( rd'event and rd = '1' ) then
   found<='0';
   for i in 0 to C-1 loop 
     if ram_block(i) = data_in then
     found<= '1';
	  end if;
end loop;
end if ;

if( wr'event and wr = '1' ) then
 for i in 0 to C-1 loop 
     if ram_block(i) = data_in then
     exit ;
	  elsif ram_block(i)="ZZZZ" then
	  ram_block(i)<=data_in;
	  exit;
	  end if;
end loop;
    
    
end if ;

 
if(  rst = '0' ) then
for i in 0 to C-1 loop 
  ram_block(i) <=  "ZZZZ";
end loop;
end if ;
 


end process ;
end architecture ;