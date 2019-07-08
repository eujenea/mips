library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           func : in  STD_LOGIC_VECTOR (5 downto 0);
			  cALUSrc,
			  cMemToReg,
			  cWriteReg,
			  cRegDst,
			  cBranch,
			  cRamWrite,
			  cJumpJr,
			  cControlRa,
			  cCRegDstJal,
			  cJump: out std_logic;
			  cAluOp: out std_logic_vector(2 downto 0)
			  );
			
end unidadControl;

architecture arq of unidadControl is
	COMPONENT aluDecoder
	PORT(
		ALUOP : IN std_logic_vector(1 downto 0);
		funct : IN std_logic_vector(5 downto 0);          
		ALUControl : OUT std_logic_vector(2 downto 0);
		jumpJr : out  STD_LOGIC
		);
	END COMPONENT;
		COMPONENT mainDecoder
	PORT(
		OPcode : IN std_logic_vector(5 downto 0);          
		cALUSrc : OUT std_logic;
		cMemToReg : OUT std_logic;
		cWriteReg : OUT std_logic;
		cRegDst : OUT std_logic;
		cBranch : OUT std_logic;
		cRamWrite : OUT std_logic;
		cJump : OUT std_logic;
		cRegDstJal : OUT std_logic;
		cALUOP : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	signal sALUOP: std_logic_vector(1 downto 0);
	signal salva: std_logic_vector(2 downto 0);
begin

	-- Instruccion tipo R -------------------------------
	-----------------------------------------------------
	--| 31   26 | 25   21 | 20   16 | 15   11 | 10    0 |
	--| OP CODE | R Src   | R Dest  | Shamt   | Function|
	-----------------------------------------------------
	
	-- Instruccion tipo I -------------------------------
	-----------------------------------------------------
	--| 31   26 | 25   21 | 20   16 | 15              0 |
	--| OP CODE | R Src   | R Dest  |       Data        |
	-----------------------------------------------------
	
	Inst_aluDecoder: aluDecoder PORT MAP(
		ALUOP => sALUOP,
		funct => func,
		ALUControl => salva,
		jumpJr => cJumpJr
	);
	
	cAluOp <= salva;
	
	Inst_mainDecoder: mainDecoder PORT MAP(
		OPcode => op,
		cALUSrc => cALUSrc,
		cMemToReg => cMemToReg,
		cWriteReg => cWriteReg,
		cRegDst => cRegDst,
		cBranch => cBranch,
		cRamWrite => cRamWrite,
		cRegDstJal => cCRegDstJal,
		cJump => cJump,
		cALUOP => sALUOP
	);

end arq;

