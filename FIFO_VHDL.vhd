library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO8x9 is
   port(
      clk, rst:		in std_logic;
      RdPtrClr, WrPtrClr:	in std_logic;    
      RdInc, WrInc:	in std_logic;
      DataIn:	 in std_logic_vector(8 downto 0);
      DataOut: out std_logic_vector(8 downto 0);
      rden, wren: in std_logic
	);
end entity FIFO8x9;

architecture RTL of FIFO8x9 is
	--signal declarations
	type fifo_array is array(7 downto 0) of std_logic_vector(8 downto 0);  -- makes use of VHDL’s enumerated type
	signal fifo:  fifo_array;
	signal wrptr, rdptr: unsigned(2 downto 0);
	signal en: std_logic_vector(7 downto 0);
	signal dmuxout: std_logic_vector(8 downto 0);

begin
--WRITE POINTER COUNTER LOGIC(SYNCHRONOUS WITH ASYNCHRONOUS RESET)--
    process(clk,rst)
    begin
        if rst = '1' then
           wrptr <= (others => '0');
        elsif rising_edge(clk) then
           if WrPtrClr = '1' then
               wrptr <= (others => '0');
           elsif WrInc = '1' then
               wrptr <= wrptr + 1;
           end if;
        end if;
    end process;
-- READ POINTER COUNTER LOGIC(SYNCHRONOUS WITH ASYNCHRONOUS RESET)--
    process(clk,rst)
    begin
        if rst = '1' then 
           rdptr <= (others => '0');
        elsif rising_edge(clk) then
           if RdPtrClr = '1' then
               rdptr <= (others => '0');
           elsif RdInc = '1' then
               rdptr <= rdptr +1;
           end if;
        end if;
     end process;
--combinational 3-to-8 Decoder for write enable vector
     process(wren, wrptr)
     begin
         en <= (others => '0');
         if wren = '1' then
             en(to_integer(wrptr)) <= '1';
         end if;
     end process;
--synchronous write logic for the register file array
     process(clk)
     begin
         if rising_edge(clk) then
             for i in 0 to 7 loop
                if en(i) = '1' then
                   fifo(i) <= DataIn;
                end if;
             end loop;
         end if;
      end process;
--combinational read multiplexer
      dmuxout <= fifo(to_integer(rdptr));
--tri-state output buffer control
      DataOut <= dmuxout when (rden = '1') else (others => 'Z');

end architecture RTL;
