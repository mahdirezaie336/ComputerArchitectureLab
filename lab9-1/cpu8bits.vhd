library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity cpu8bits is
	port(
	data_in : in std_logic_vector(7 downto 0);	
	clk, rst : in std_logic;
	data_out : out std_logic_vector(7 downto 0);
	address : out std_logic_vector(4 downto 0);
	we, oe : out std_logic
	);
end entity cpu8bits;

architecture behavioral of cpu8bits is
	signal pc, adreg : std_logic_vector(4 downto 0) := (others => '0');
	signal akku : std_logic_vector(8 downto 0) := (others => '0');
	signal state :std_logic_vector(3 downto 0) := (others => '0');
begin
process(clk, rst)
variable sum : std_logic_vector(7 downto 0);
begin
	if (rst = '0') then
	adreg <= (others => '0');
	state <= (others => '0');
	akku <= (others => '0');
	pc <= (others => '0');
        oe <= '0';
        we <= '0';
        data_out <= "ZZZZZZZZ";
	elsif (rising_edge(clk)) then
	if (state = "0000") then
		pc <= std_logic_vector(unsigned(adreg) + 1);
		adreg <= data_in(4 downto 0);
                oe <= '1';
                we <= '0';
	else
		adreg <= pc;
	end if;
	
	case state is
	--when "1000" => akku <= '0' & data_in; 
	when "1011" => oe <= '0'; we <= '0'; akku(8) <= '0'; 
	when "0100" => 
		oe <= '1'; we <= '0'; akku <= akku(8) & (akku(7 downto 0) and data_in); 
	when "0101" => oe <= '0'; we <= '0';
		sum := std_logic_vector(signed(akku(7 downto 0)) + signed(data_in)); 
			if (akku(7) = data_in(7) and sum(7) /= data_in(7)) then 
				akku <= '1' & sum;
			else
				akku <= '0' & sum;
			end if;
	when "0110" => oe <= '0'; we <= '0'; akku <= not akku;
	when "0111" => oe <= '0'; we <= '0'; akku <= akku(7 downto 0) &'0'; 
   when "1000" => oe <= '1'; we <= '0'; akku <= '0' & data_in;
   when "1001" => oe <= '0'; we <= '1'; data_out <= akku(7 downto 0);
	when others => null;
	end case;

	if (state /= "0000") then state <= "0000"; oe <= '1'; we <= '0';
	elsif (data_in(7 downto 5) = "011" and akku(8) = '0') then state <= "1000"; oe <= '0'; we <= '0';
	elsif (data_in(7 downto 5) = "010") then state <= "1010"; oe <= '0'; we <= '0';
	elsif (data_in(7 downto 5) = "000") then state <= "1000"; oe <= '1'; we <= '0';
	elsif (data_in(7 downto 5) = "001") then state <= "1001"; oe <= '0'; we <= '1';
	elsif (data_in(7 downto 5) = "100") then state <= "0100"; oe <= '1'; we <= '0';
	elsif (data_in(7 downto 5) = "101") then state <= "0101"; oe <= '1'; we <= '0';
	elsif (data_in(7 downto 5) = "110") then state <= "0110"; oe <= '0'; we <= '0';
	elsif (data_in(7 downto 5) = "111") then state <= "0111"; oe <= '0'; we <= '0';
	end if;

end if;
end process;

address <= adreg;
--data_out <= (others => 'Z') when (state /= "1001") else akku(7 downto 0);

end architecture;
