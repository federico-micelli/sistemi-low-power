library IEEE;
use IEEE.std_logic_1164.all; --  libreria IEEE con definizione tipi standard logic


entity fsm1 is
port(clock: in std_logic;
	reset:	in std_logic;
	S00, S01, S10, S11: out std_logic
);
end	fsm1;

---------------------------------------------

architecture behavior of fsm1 is

	type TYPE_STATE is (AB, SC, SD, SE, SF);
	ATTRIBUTE enum_encoding: string;
	ATTRIBUTE enum_encoding of TYPE_STATE: TYPE is "111 101 000 010 011";
	signal p_s : TYPE_STATE;
	signal n_s : TYPE_STATE;

begin
 	Next_state_transition : process(CLOCK, RESET)
	begin

		if reset='1' then
	    	p_s <= AB;
		elsif (CLOCK'EVENT and CLOCK ='1') then
			p_s <= n_s;
		end if;
	end process Next_state_transition;

	Next_state_evaluation : process(p_s)
	begin
		case p_s is
			when AB => n_s <= SC;
			when SC => n_s <= SD;
			when SD => n_s <= SE;
			when SE => n_s <= SF;
			when SF => n_s <= AB;
		end case;
	end process Next_state_evaluation;


	Output_evaluation: process(p_s)
	begin
		case p_s is

			when AB => S11 <= '0'; S10 <= '1'; S01 <= '0'; S00 <= '1';
			when SC => S11 <= '0'; S10 <= '0'; S01 <= '0'; S00 <= '0';
			when SD => S11 <= '0'; S10 <= '0'; S01 <= '1'; S00 <= '0';
			when SE => S11 <= '1'; S10 <= '0'; S01 <= '1'; S00 <= '1';
			when SF => S11 <= '1'; S10 <= '1'; S01 <= '1'; S00 <= '1';
		end case;
	end process Output_evaluation;

end behavior;


configuration CFG_FSM_OPC of fsm1 is
	for  behavior
	end for;
end CFG_FSM_OPC;
