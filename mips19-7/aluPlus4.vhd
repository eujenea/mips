library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity aluPlus is
    Port ( srcA : in  STD_LOGIC_VECTOR (31 downto 0);
			  srcB : in  STD_LOGIC_VECTOR (31 downto 0);
           aluPlusResult : out  STD_LOGIC_VECTOR (31 downto 0));
end aluPlus;

architecture Behavioral of aluPlus is

begin

aluPlusResult <= srcA + srcB;


end Behavioral;

