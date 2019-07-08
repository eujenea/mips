library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mips is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
			  btn : IN  STD_LOGIC;
			  sieteSeg : OUT  STD_LOGIC_vector (10 downto 0)
	  );
end mips;

architecture arq of mips is
	COMPONENT divisor_frecuecia
	PORT(
		entrada : IN  std_logic;
      reset_clk : IN  std_logic;
      salida1 : OUT  std_logic;
		salida2 : OUT  std_logic
	);
	END COMPONENT;
	
	COMPONENT Datapath
	PORT(
		clock : IN std_logic;
		clock_7seg : IN std_logic;
		reset : IN std_logic;
		controlALUSrc : IN std_logic;
		controlMemToReg : IN std_logic;
		controlWriteReg : IN std_logic;
		controlRegDst : IN std_logic;
		controlBranch : IN std_logic;
		controlRamWrite : IN std_logic;
		controlJump : IN std_logic;
		controlAluOp : IN std_logic_vector(2 downto 0);
		btn : IN std_logic;   		
		instrOp : OUT std_logic_vector(5 downto 0);
		instrFn : OUT std_logic_vector(5 downto 0);
		sieteSeg: out std_logic_vector(10 downto 0);
		controlJumpJr : IN std_logic;
		controlControlRa : IN std_logic;
		controlCRegDstJal : IN std_logic
		);
	END COMPONENT;
	
	COMPONENT unidadControl
	PORT(
		op : IN std_logic_vector(5 downto 0);
		func : IN std_logic_vector(5 downto 0);          
		cALUSrc : OUT std_logic;
		cMemToReg : OUT std_logic;
		cWriteReg : OUT std_logic;
		cRegDst : OUT std_logic;
		cBranch : OUT std_logic;
		cRamWrite : OUT std_logic;
		cJumpJr : OUT std_logic;
		cControlRa : OUT std_logic;
		cCRegDstJal : OUT std_logic;
		cJump : OUT std_logic;
		cAluOp : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;
	
	signal sTemps: std_logic_vector(12 downto 0);
	signal sTempo: std_logic_vector(11 downto 0);
	signal aux: std_logic_vector(7 downto 0);
	signal salida_clk: std_logic;
	signal salida_clk_7seg: std_logic;
begin
	
	Inst_divisor_frecuecia: divisor_frecuecia PORT MAP(
		entrada => clk,
      reset_clk  => rst,
      salida1 => salida_clk,
		salida2 => salida_clk_7seg
	);
	
	Inst_Datapath: Datapath PORT MAP(
		clock => salida_clk,
		clock_7seg => salida_clk_7seg,
		reset => rst,
		controlALUSrc => sTemps(0),
		controlMemToReg => sTemps(1),
		controlWriteReg => sTemps(2),
		controlRegDst => sTemps(3),
		controlBranch => sTemps(4),
		controlRamWrite => sTemps(5),
		controlJump => sTemps(6),
		controlAluOp => sTemps(9 downto 7),
		instrOp => sTempo(5 downto 0),
		instrFn => sTempo(11 downto 6),
		sieteSeg => sieteSeg,
		btn => btn,
		controlJumpJr => sTemps(10),
		controlControlRa => sTemps(11),
		controlCRegDstJal => sTemps(12)
	);
	
	Inst_unidadControl: unidadControl PORT MAP(
		cALUSrc => sTemps(0),
		cMemToReg => sTemps(1),
		cWriteReg => sTemps(2),
		cRegDst => sTemps(3),
		cBranch => sTemps(4),
		cRamWrite => sTemps(5),
		cJumpJr => sTemps(10),
		cControlRa => sTemps(11),
		cCRegDstJal => sTemps(12),
		cJump => sTemps(6),
		cAluOp => sTemps(9 downto 7),
		op => sTempo(5 downto 0),
		func => sTempo(11 downto 6)
	);
	

end arq;