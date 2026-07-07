library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (
   In1  : in std_logic;
   RST  : in std_logic; 
   CLK  : in std_logic;
   Out1 : inout std_logic
);
end FSM;

architecture behavioral of FSM is
    -- Define the enumerated states for our FSM
    type state_type is (s0, s1, s2);
    signal current_state, next_state : state_type;
begin

    -- PROCESS 1: Synchronous State Register with Asynchronous Reset
    process(CLK, RST)
    begin
        if RST = '1' then
            current_state <= s0;
        elsif rising_edge(CLK) then
            current_state <= next_state;
        end if;
    end process;

    -- PROCESS 2: Combinational Next-State and Output Logic
    process(current_state, In1)
    begin
        -- Default assignments to prevent accidental latch synthesis
        next_state <= s0;
        Out1 <= '0';
        
        case current_state is
            when s0 =>
                Out1 <= '0';
                if In1 = '1' then
                    next_state <= s1;
                else
                    next_state <= s0;
                end if;
                
            when s1 =>
                Out1 <= '0';
                if In1 = '0' then
                    next_state <= s2;
                else
                    next_state <= s1;
                end if;
                
            when s2 =>
                Out1 <= '1';
                if In1 = '1' then
                    next_state <= s0;
                else
                    next_state <= s2;
                end if;
                
            when others =>
                next_state <= s0;
                Out1 <= '0';
        end case;
    end process;

end behavioral;