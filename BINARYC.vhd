library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity BINARYC is port (                    
   CP:   in std_logic;  -- clock
   SR:   in std_logic;  -- Active low, synchronous reset
   P:    in std_logic_vector(3 downto 0);  -- Parallel input
   PE:   in std_logic;  -- Parallel Enable (Load)
   CEP:  in std_logic;  -- Count enable parallel input
   CET:  in std_logic;  -- Count enable trickle input
   Q:    out std_logic_vector(3 downto 0);             
   TC:   out std_logic  -- Terminal Count
);              
end BINARYC;

architecture behavioral of BINARYC is 
    -- Internal register to store the count state for arithmetic operations
    signal count : unsigned (3 downto 0) := (others => '0');
begin

     -- SYNCHRONOUS COUNTER PROCESS
     process(CP)
     begin
        if rising_edge(CP) then
           if SR = '0' then
              -- Synchronous reset (highest priority, active low)
              count <= (others => '0');
           elsif PE = '0' then
              -- Synchronous load (second priority, active low)
              count <= unsigned(P);
           elsif (CEP = '1') and (CET = '1') then
              -- Increment only when both count enables are high
              count <= count + 1;
           else
              -- Maintain the value if no condition is met
              count <= count; 
           end if;
        end if;
     end process;

     -- Continuous output assignments
     Q <= std_logic_vector(count);
     
     -- Terminal count output logic
     TC <= '1' when (count = "1111" and CET = '1') else '0';

end behavioral;