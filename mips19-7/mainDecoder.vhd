library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mainDecoder is
    Port ( OPcode : in  STD_LOGIC_VECTOR (5 downto 0);
			  cALUSrc,
			  cMemToReg,
			  cWriteReg,
			  cRegDst,
			  cBranch,
			  cRamWrite,
			  cRegDstJal,
			  cJump: out std_logic;
			  cALUOP: out std_logic_vector(1 downto 0)
	 );
end mainDecoder;

architecture Behavioral of mainDecoder is

	signal sTMP: std_logic_vector(9 downto 0);
	
begin
	sTMP <= 
	"0110000100" when (OPcode="000000") else --tipo R
	"0101001000" when (OPcode="100011") else --lw
	"0001010000" when (OPcode="101011") else --sw
	"0000100010" when (OPcode="000100") else --beq
	"0101000000" when (OPcode="001000") else --addi
	"0000000001" when (OPcode="000010") else --j
	"1100000001" when (OPcode="000011") else "0000000000"; --jal
	

	cRegDstJal <= sTMP(9);
	cWriteReg <= sTMP(8);
	cRegDst <= sTMP(7);
	cALUSrc <= sTMP(6);
	cBranch <= sTMP(5);
	cRamWrite <= sTMP(4);
	cMemToReg <= sTMP(3);
	cALUOP <= sTMP(2 downto 1);
	cJump <= sTMP(0);
	
	
	
	

end Behavioral;

