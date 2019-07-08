library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- CONTROLADOR IO
-- Se encarca de escanear (pooling) las señales delos botones de la FPGA
-- y escribir en una dirección de memoria fija si valor, para luego ser 
-- interpretado por el procesador.

entity controlador_io is
    Port ( btn : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           display : in  STD_LOGIC_VECTOR (31 downto 0);--dato a mostar en LEDS
          -- A : out  STD_LOGIC_VECTOR (31 downto 0);
          -- D : out  STD_LOGIC;--si el boton esta presionado
           LCD : out  STD_LOGIC_VECTOR (10 downto 0));-- codigo an mas salida colificada para LEDS
end controlador_io;

architecture Behavioral of controlador_io is

	COMPONENT anti_rebote
		PORT(
			clk : IN std_logic;
			rst : IN std_logic;
			button : IN std_logic;          
			valid : OUT std_logic
			);
	END COMPONENT;
	
	
	COMPONENT hex2led
	PORT(
		hex : IN std_logic_vector(3 downto 0);          
		sseg : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	
	COMPONENT display_mux
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		signo : IN std_logic_vector(6 downto 0);
		centena : IN std_logic_vector(6 downto 0);
		decena : IN std_logic_vector(6 downto 0);
		unidad : IN std_logic_vector(6 downto 0);          
		an : OUT std_logic_vector(3 downto 0);
		sseg : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

	COMPONENT BINtoCDU_BCD
	PORT(
		A : IN std_logic_vector(9 downto 0);          
		CDU : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;
	
	signal button : std_logic;
	signal sCDU : std_logic_vector(11 downto 0);
	signal digitosSeg : std_logic_vector(20 downto 0);
--	signal poolId, tmpPoolId : std_logic; --indice del explorador
--	signal tmpA,tmpD : std_logic_vector(31 downto 0);
	


begin


	Inst_anti_rebote1: anti_rebote PORT MAP(--boton prev
		clk => clk,
		rst => rst,
		button => btn,
		valid => button
	);
	--next
--	Inst_anti_rebote2: anti_rebote1 PORT MAP(-- boton next
--		clk => not (poolId),
--		rst => rst,
--		button => btn(1),
--		valid => buttons(1)
--	);
--	
	
	--pasa las seniales para mostrar
	Inst_display_mux: display_mux PORT MAP(
		clk => clk,
		rst => rst,
		signo => "1111111",--no usado (seria la unidad de mil)
		centena => digitosSeg(20 downto 14),
		decena => digitosSeg(13 downto 7),
		unidad => digitosSeg(6 downto 0), 
		an => LCD(10 downto 7), --out: posicion donde escribir resultado
		sseg => LCD(6 downto 0) --out: resultado
	);
	
	Inst_BINtoCDU_BCD: BINtoCDU_BCD PORT MAP(
		A => display (9 downto 0),
		CDU => sCDU
	);

   --control 7 segmentos
	Inst_hex2ledCentena:  hex2led PORT MAP(
		hex => sCDU(11 downto 8),
		sseg => digitosSeg(20 downto 14)
	);
	Inst_hex2ledDecena:  hex2led PORT MAP(
		hex => sCDU(7 downto 4),
		sseg => digitosSeg(13 downto 7)
	);
	Inst_hex2ledUnidad: hex2led PORT MAP(
		hex => sCDU(3 downto 0),
		sseg => digitosSeg(6 downto 0)
	);
	
	--POOLING DE BOTONES
--	process (clk) begin
--	   if (clk'event and clk = '1') then
--			D <= button;
--		end if;	
--	end process;		
		
--			if(rst = '1') then
--				poolId <= '0';
--			else 
--				poolId <= not poolId;
--			end if;
--		end if;
--		
--		-- mapea los botones a posiciones de memoria
--		if poolId = '0' then
--			tmpA <= "00000000000000000000000011111000";--248
--		else
--			tmpA <= "00000000000000000000000011111100";--252
--		end if;
--		-- escribe los datos de los botones en las posiciones de memoria
--		if (poolId = '0' AND buttons(0) = '1') then
--			tmpD <= "0000000000000000000000000000000"&buttons(0); --prev
--		else if (poolId = '1' AND buttons(1) = '1') then
--			tmpD <= "0000000000000000000000000000000"&buttons(1); --next
--		else
--			tmpD <= "00000000000000000000000000000000"; 
--		end if;
--		end if;
--		
--	A <= tmpA;
--	--D <= tmpD;
		
--	end process;



	
	


end Behavioral;

