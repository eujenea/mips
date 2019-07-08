library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;

use ieee.std_logic_unsigned.all;

entity Datapath is
	port(
		clock : in std_logic;
		clock_7seg : in std_logic;
		reset : in std_logic;
		controlALUSrc,controlMemToReg,controlWriteReg,controlRegDst,controlBranch,controlRamWrite,controlJump,controlJumpJr,controlControlRa,controlCRegDstJal: in std_logic;
		controlAluOp: in std_logic_vector(2 downto 0);
		btn: in std_logic;
		instrOp,instrFn: out std_logic_vector(5 downto 0);
		sieteSeg: out std_logic_vector(10 downto 0)
	);
end Datapath;

architecture arq of Datapath is
	--1 PC
	component PC port (
			  CLK : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCo : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	

	--2 Memoria de datos
	component RAM port (
	        CLK : in  STD_LOGIC;
           WE : in  STD_LOGIC;--HABILITAR ESCRITURA
           A : in  STD_LOGIC_VECTOR (31 downto 0);--DIRECCION
			--  A2 : in  STD_LOGIC_VECTOR (31 downto 0);--DIRECCION botones
           WD : in  STD_LOGIC_VECTOR (31 downto 0);--DATA A ESCRIBIR
			 -- WD2 : in  STD_LOGIC;--DATA A ESCRIBIR boton
           RD : out  STD_LOGIC_VECTOR (31 downto 0)--DATA LEIDA
			  --DISPLAY: out  STD_LOGIC_VECTOR (31 downto 0)
			  );-- VALOR A MOSTAR EN LCD

	end component;
	
	
	--3 Memoria de intrucciones
	component rom port (
	      ADDR : in std_logic_vector(31 downto 0);
			DATA : out std_logic_vector(31 downto 0));
	end component;
	
	--4 Registros
	component registros port (
	        CLK : in  STD_LOGIC;
           WE3 : in  STD_LOGIC; -- ENABLER
           A1 : in  STD_LOGIC_VECTOR (4 downto 0);
           A2 : in  STD_LOGIC_VECTOR (4 downto 0);
           A3 : in  STD_LOGIC_VECTOR (4 downto 0);
           WD3 : in  STD_LOGIC_VECTOR (31 downto 0);	-- DATO A ESCRIBIR
           RD1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	--5 ALU
	component alu port (
		srcA, srcB: in std_logic_vector(31 downto 0);
		ALUcontrol: in std_logic_vector(2 downto 0);
		zero: out std_logic;
		ALUresult: out std_logic_vector(31 downto 0));
	end component;
	
	--6 ALU PLUS 4
	component aluPlus port (
			srcA : in  STD_LOGIC_VECTOR (31 downto 0);
			srcB : in  STD_LOGIC_VECTOR (31 downto 0);
         aluPlusResult : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	--7 MUX 2:1 32bits
	component mux_2_1_32bits port (
		x: in std_logic_vector(31 downto 0);
		y: in std_logic_vector(31 downto 0);
		control: in std_logic;
		output: out std_logic_vector(31 downto 0));
	end component;
	--7bis MUX 3:1 32bits
	component mux_3_1_32bits port (
		x: in std_logic_vector(31 downto 0);
		y: in std_logic_vector(31 downto 0);
		z: in std_logic_vector(31 downto 0);
		control: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(31 downto 0));
	end component;
	
	--8 MUX 2:1 4bits
	component mux_2_1_4bits port (
		x: in std_logic_vector(4 downto 0);
		y: in std_logic_vector(4 downto 0);
		z: in std_logic_vector(4 downto 0);
		control: in std_logic_vector (1 downto 0);
		output: out std_logic_vector(4 downto 0));
	end component;
	
	--9 Sign Extend
	component signExtend port (
		input : in  STD_LOGIC_VECTOR (15 downto 0);
      output : out  STD_LOGIC_VECTOR (31 downto 0)
	);
	end component;
	
	--10 controladorio
	COMPONENT controlador_io
	PORT(
		btn : IN std_logic;
		clk : IN std_logic;
		rst : IN std_logic;
		display : IN std_logic_vector(31 downto 0);          
		--A : OUT std_logic_vector(31 downto 0);
		--D : OUT std_logic;
		LCD : OUT std_logic_vector(10 downto 0)
		);
	END COMPONENT;
	
	--11 latch display
	COMPONENT latch
	PORT(
		data : IN std_logic_vector(31 downto 0);
		we : IN std_logic;
		clk : IN std_logic;          
		display : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	 
	
	signal sInstruccion,sRegistro1,sRegistro2,sMemReadData,sPC,sPC1,sJumpPC,sPCnew,sALUResult,
			 sPCPrima,sALUSrcB,sMemToReg,sSignExtRes,sSignExtendShift,sPCJump,sWriteSrc,sDisplay: std_logic_vector(31 downto 0);
	signal sZero,controlPCSrc,sReset,sRegDstJal,sJumpJr,sControlRa: std_logic;
	--signal controlALUSrc,controlMemToReg,controlWriteReg,controlRegDst,controlBranch,controlRamWrite: std_logic;
	signal aux1,aux2: std_logic_vector(1 downto 0);
	signal sWriteReg: std_logic_vector(4 downto 0);
	signal sInstruccionOut: std_logic_vector(11 downto 0);


begin

	sReset <= reset;
	sJumpJr <= controlJumpJr;
	sControlRa <= controlControlRa;
	sRegDstJal <= controlCRegDstJal;
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
	
	--Instruccion tipo J --------------------------------
	---6bits OP y 26 bits Direccion
	
	
	Inst_PC: PC PORT MAP(
		CLK => clock,
		reset => sReset,
      PC1 =>sPCJump,
      PCo => sPC
	);
	
	Inst_ram: ram port map(
		CLK => clock,
      WE => controlRamWrite,
      A => sALUResult,
		--A2 => sAddress,
      WD => sRegistro2,
	--	WD2 => sData,
	--	DISPLAY => sDisplay,
      RD => sMemReadData
	);
	
	Inst_rom: rom port map(
		ADDR => sPC,
		DATA => sInstruccion
	);
	
   Inst_registros: registros PORT MAP(
			  CLK => clock,
           WE3 => controlWriteReg,
           A1 => sInstruccion(25 downto 21),
           A2 => sInstruccion(20 downto 16),
           A3 => sWriteReg,
           WD3 => sWriteSrc,
           RD1 => sRegistro1,
           RD2 => sRegistro2
	);
	
	Inst_alu: alu port map(
		srcA => sRegistro1,
		srcB => sALUSrcB,
		ALUcontrol => controlAluOp,
		zero => sZero,
		ALUresult => sALUResult
	);
	
	Inst_aluPlus4: aluPlus port map (
		srcA => sPC,
		srcB => "00000000000000000000000000000100",
      aluPlusResult => sPC1
	);
	
	Inst_aluPlusBranch: aluPlus port map (
		srcA => sSignExtendShift,
		srcB => sPC1,
      aluPlusResult => sPCnew
	);

	Inst_mux_aluSRC: mux_2_1_32bits port map (
		x => sRegistro2,
		y => sSignExtRes,
		control => controlALUSrc,
		output => sALUSrcB
	);
	
	controlPCSrc <= sZero and controlBranch;
	
	Inst_mux_PC: mux_2_1_32bits port map (
		x => sPC1,--aluPlus4
		y => sPCnew,--aluPlusBranch
		control => controlPCSrc,
		output => sPCPrima
	);
	
	aux2<=sJumpJr&controlJump;
	Inst_mux_Jump: mux_3_1_32bits port map (
		x => sPCPrima,--mux_PC
		y => sJumpPC,--shift jump
		z => sMemToReg,
		control => aux2,
		output => sPCJump
	);

	Inst_mux_memToReg: mux_2_1_32bits port map (
		x => sALUResult,
		y => sMemReadData,
		control => controlMemToReg,
		output => sMemToReg
	);
	
	Inst_mux_writeRegSelect: mux_2_1_32bits port map (
		x => sMemToReg,
		y => sPC1,
		control => sRegDstJal,
		output => sWriteSrc
	);
	
	aux1<=sRegDstJal&controlRegDst;
	-- es de 3 en 1 
	Inst_mux_regDst: mux_2_1_4bits port map (
		x => sInstruccion(20 downto 16),
		y => sInstruccion(15 downto 11),
		z => "11111",
		control => aux1,
		output => sWriteReg
	);		
	
	Inst_signExtend: signExtend port map (
		input => sInstruccion(15 downto 0),
      output => sSignExtRes
	);
	
	sSignExtendShift <= sSignExtRes(29 downto 0) & "00";
	
	
	--Jump
	sJumpPC(31 downto 0) <= ("00000000000000" & (sInstruccion(15 downto 0)) & "00");
	--sJumpPC(31 downto 28) <= sPC1(31 downto 28);
	
	--enviar instruccion a la unidad de control	
	instrOp <= sInstruccionOut(11 downto 6);
	instrFn <= sInstruccionOut(5 downto 0);
	
	sInstruccionOut(5 downto 0) <= sInstruccion(5 downto 0);
	sInstruccionOut(11 downto 6) <= sInstruccion(31 downto 26);
	
	
	--result <= sMemToReg(7 downto 0);
	
	
	--CONTROLADOR IO BOTONES
	Inst_controlador_io: controlador_io PORT MAP(
		btn => btn,
		clk => clock_7seg,
		rst => sReset,
		display => sDisplay,
	--	A => sAddress,
	--	D => sData,
		LCD => sieteSeg
	);
	
	--11 latch display
	
	Inst_latch: latch PORT MAP(
		data => sRegistro2,
		we => controlRamWrite,
		clk => clock,
		display => sDisplay
	);


end arq;

