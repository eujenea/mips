library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signExtend is
    Port ( input : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end signExtend;

architecture arch_signExtend of signExtend is

begin

	output <= "0000000000000000" & input when (input(15) = '0') else "1111111111111111" & input;	
end arch_signExtend;
