library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Suma3 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0));
end Suma3;

architecture Behavioral of Suma3 is

begin

with A select
	B <= 
	"0000" when "0000",--mientras A menor a 5 (0101), B queda igual a .
	"0001" when "0001",
	"0010" when "0010",
	"0011" when "0011",
	"0100" when "0100",
	"1000" when "0101",--para A mayores a 5 (0101), B es A más 3.
	"1001" when "0110",
	"1010" when "0111",
	"1011" when "1000",
	"1100" when "1001",
	"0000" when others;
	
end Behavioral;