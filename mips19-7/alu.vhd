library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity alu is
	port (
		srcA, srcB: in std_logic_vector(31 downto 0);
		ALUcontrol: in std_logic_vector(2 downto 0);
		zero: out std_logic;
		ALUresult: out std_logic_vector(31 downto 0)
	);
end alu;

architecture arch_alu of alu is

signal aux : std_logic_vector(31 downto 0);

begin
 
	aux <=	srcA and srcB when(ALUcontrol = "000") else
						srcA or srcB when(ALUcontrol = "001") else
						srcA + srcB when(ALUcontrol = "010") else
						srcA and not(srcB) when(ALUcontrol = "100") else
						srcA or not(srcB) when(ALUcontrol = "101") else
						srcA - srcB when(ALUcontrol = "110") else -- RESTA
						"00000000000000000000000000000001" when(ALUcontrol = "111" and srcA < srcB) else
						"00000000000000000000000000000000";

	zero <=	'1' when(aux = "00000000000000000000000000000000000") else '0';
	ALUresult <= aux;			
end arch_alu;