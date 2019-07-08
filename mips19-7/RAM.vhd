library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity RAM is
    Port ( CLK : in  STD_LOGIC;
           WE : in  STD_LOGIC;--HABILITAR ESCRITURA
           A : in  STD_LOGIC_VECTOR (31 downto 0);--DIRECCION
		--	  A2 : in  STD_LOGIC_VECTOR (31 downto 0);--DIRECCION Botones
           WD : in  STD_LOGIC_VECTOR (31 downto 0);--DATA A ESCRIBIR
			  --WD2 : in  STD_LOGIC;--DATA A ESCRIBIR boton
           RD : out  STD_LOGIC_VECTOR (31 downto 0)--DATA LEIDA
			  --DISPLAY: out  STD_LOGIC_VECTOR (31 downto 0)
			  );-- VALOR A MOSTAR EN LCD

end RAM;
--
architecture arch_RAM of RAM is
type mem_array is array (15 downto 0) of std_logic_vector(31 downto 0);
signal ram: mem_array:=( OTHERS => "00000000000000000000000000000000");
--signal A2: std_logic_vector(31 downto 0):= "00000000000000000000000001010100"; --84 : DIRECCION BOTON
begin

	process(CLK,WD,WE,A,ram)	begin
		
	
		if CLK'event and CLK= '1' then
			if ( (conv_integer(A) < 16 and  conv_integer(A) >= 0) ) then
				if WE = '1' then
					ram(conv_integer(A)) <= WD(31 downto 0);
					--DISPLAY(31 downto 0) <=  WD(31 downto 0);
				end if;
	 end if;
			 --if WD2 = '1' then --si se presiono el boton escribe 1 en la pos de memoria del boton
			--	ram(15) <= "00000000000000000000000000000001";
			 --end if;
	end if;
		if (conv_integer(A) < 16 and  conv_integer(A) >= 0) then 
				RD(31 downto 0) <= ram(conv_integer(A));
		else
				RD <="00000000000000000000000000000000";
			end if;
			--display es el ANTEULTIMO renglon 
			--boton 1 es el ULTIMO renglon
			-- DISPLAY SOLO OCUPARIA 10 BITS
			--DISPLAY(31 downto 0) <=  ram(15);--fijo 80,81
			
	end process;
	
	

end arch_RAM;

