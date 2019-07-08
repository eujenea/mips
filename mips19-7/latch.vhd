library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch is
    Port ( data : in  STD_LOGIC_VECTOR (31 downto 0);
           we : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           display : out  STD_LOGIC_VECTOR (31 downto 0));
end latch;

architecture Behavioral of latch is

type mem_array is array (0 downto 0) of std_logic_vector(31 downto 0);
signal ram: mem_array:=( OTHERS => "00000000000000000000000000000000");

begin

process(clk,we,ram,data)	begin
		
		if clk'event and clk= '1' then
			if we = '1' then
					ram(0) <= data(31 downto 0);
			end if;
		end if;
		
		display(31 downto 0) <=  ram(0);
		
	end process;


end Behavioral;

