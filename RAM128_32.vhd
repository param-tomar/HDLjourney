LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; -- FIXED: Added to support 'unsigned' and 'to_integer'

ENTITY RAM128_32 IS
    PORT
    (
        address : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
        clock   : IN STD_LOGIC  := '1';
        data    : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        wren    : IN STD_LOGIC ;
        q       : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
END RAM128_32;

ARCHITECTURE behavioral of RAM128_32 is
    -- Create a 2D array representing a 128-word x 32-bit structure
    type ram_type is array (0 to 127) of std_logic_vector(31 downto 0);

    -- Internal signal initialized cleanly to all '0's for simulation
    -- FIXED: Changed '=' to '=>' in the inner aggregate
    signal ram_block : ram_type := (others => (others => '0'));
begin

    -- Process block for synchronous clock logic 
    process(clock)
    begin
        if rising_edge(clock) then
            -- Write Logic: Save data to memory if write enable is active
            if wren = '1' then 
                ram_block(to_integer(unsigned(address))) <= data; 
            end if; -- FIXED: Added missing semicolon

            -- Read Logic: Read out data from selected address to q on the clock edge
            q <= ram_block(to_integer(unsigned(address)));
        end if;
    end process;

end behavioral;