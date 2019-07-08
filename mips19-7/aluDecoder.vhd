library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity aluDecoder is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUControl : out  STD_LOGIC_VECTOR (2 downto 0);
			  jumpJr : out  STD_LOGIC);
end aluDecoder;

architecture Behavioral of aluDecoder is
	
begin
	ALUControl <= 
	"010" when (ALUOP="00") else --suma
	"110" when (ALUOP(0)='1') else 
	"010" when (ALUOP(1)='1' AND funct= "100000") else --suma
	"010" when (ALUOP(1)='1' AND funct= "001000") else -- suma jr
	"110" when (ALUOP(1)='1' AND funct= "100010") else --sub
	"000" when (ALUOP(1)='1' AND funct= "100100") else 
	"001" when (ALUOP(1)='1' AND funct= "100101") else
	"111" when (ALUOP(1)='1' AND funct= "101010") else "000";
	
   jumpJr <= '1' when ALUOP="10" and funct = "001000" else '0';

end Behavioral;

