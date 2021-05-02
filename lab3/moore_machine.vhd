library ieee;
use ieee.std_logic_1164.all;

entity moore_machine is

	port(
		x : in std_logic;
		clk : in std_logic;
		enable : in std_logic;
		z : out std_logic;
		binary_state : out std_logic_vector(2 downto 0)
		);

end entity moore_machine;

architecture behavioural of moore_machine is

	type state_t is (s0, s1, s2, s3, s4);
	signal state : state_t := s0;
	signal next_state : state_t := s0;

begin
	-- behave of the FSM
	CMB:process(state, x)
	begin
		case state is
		
			when s0 =>
				---------------------
				if x = '0' then
					next_state <= s0;
				else
					next_state <= s1;
				end if;
				---------------------
			
			when s1 =>
				---------------------
				if x = '0' then
					next_state <= s0;
				else
					next_state <= s2;
				end if;
				---------------------

			when s2 =>
				---------------------
				if x = '0' then
					next_state <= s3;
				else
					next_state <= s1;
				end if;
				---------------------

			when s3 =>
				---------------------
				if x = '0' then
					next_state <= s0;
				else
					next_state <= s4;
				end if;
				---------------------
			
			when s4 =>
				---------------------
				if x = '0' then
					next_state <= s0;
				else
					next_state <= s2;
				end if;
				---------------------
			
		end case;
	end process;
	
	-- switching between states
	REG:process(clk)
	begin
		-- changing state
		if rising_edge(clk) and (enable = '1') then
		
			state <= next_state;

		end if;
		
	end process;

	-- setting label for each state
	BIN:process(next_state)
	begin

		case next_state is

			when s0 =>
				---------------------
				binary_state <= "000";
				---------------------
			
			when s1 =>
				---------------------
				binary_state <= "001";
				---------------------
			
			when s2 =>
				---------------------
				binary_state <= "010";
				---------------------
			
			when s3 =>
				---------------------
				binary_state <= "011";
				---------------------

			when s4 =>
				---------------------
				binary_state <= "100";
				---------------------

		end case;

	end process;

	-- setting outputs
	z <= '0' when next_state = s0 else
		'0' when next_state = s1 else
		'0' when next_state = s2 else
		'0' when next_state = s3 else
		'1' when next_state = s4 ;

end behavioural;
