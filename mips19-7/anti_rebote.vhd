library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- provee un pulso de disparo estable y maneja el tema de presionar el botón 
-- unos milisegundos antes que se libere la señal como "presionado".
entity anti_rebote is
    Port ( -- entradas
			  clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           -- entrada de control
			  button : in  STD_LOGIC;
			  -- salidas
			  valid : out std_logic
			  );
end anti_rebote;

architecture Behavioral of anti_rebote is
signal q_reg, q_next: unsigned(24 downto 0); --2^25  = 33.5 M
signal Q1, Q2, Q3 : std_logic;
signal svalid : std_logic := '0';

--25000000 ES MEDIO SEGUNDO CON FREQUENCIA 50MHZ

begin
process (clk) begin
	   if (clk'event and clk = '1') then
		  if (rst = '1') then
			  Q1 <= '0';
		     Q2 <= '0';
		     Q3 <= '0';
			  q_reg <= (others=>'0');
			  svalid <= '0';
		  else
		     Q1 <= button;
		     Q2 <= Q1;
		     Q3 <= Q2;
			  if (Q1 = '1' and Q2 = '1' and Q3 = '1') then --señal estable
					if (q_reg < 25000000) then -- faltan milisegundos 25000000
						q_reg <= q_next;
						svalid <= '0';
					else --tiempo cumplido
						svalid <= '1';
						q_reg <= (others=>'0');
					end if;
			  else -- pulso no seguro
					svalid <= '0';
					q_reg <= (others=>'0');
			  end if;
		  end if;
	   end if;
		--Q1 and Q2 and  not (Q3) and
		
end process;
valid <= svalid;
q_next <= q_reg + 1;

end Behavioral;

