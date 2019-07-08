library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC is
    Port ( CLK : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCo : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture arch_PC of PC is
	begin
	process(CLK,Pc1,reset) begin
		if reset = '1' then
			PCo <= "00000000000000000000000000000000";
		elsif (CLK='1' and CLK'event) then
			PCo <= PC1;
		end if;
	end process;
end arch_PC;

