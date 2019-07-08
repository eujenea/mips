library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--envia las señales para mostar en los leds
entity display_mux is
   port(
	-- entradas
	clk, rst: in std_logic;
	signo, centena, decena, unidad: in std_logic_vector(6 downto 0);
	-- salidas
	an: out std_logic_vector(3 downto 0);
	sseg: out std_logic_vector(6 downto 0)
   );
end display_mux ;

architecture arch of display_mux is -- velocidad de refresco alrededor de 800 Hz (50MHz/2^16)
   signal q_reg, q_next: unsigned(18 downto 0);
   signal sel: std_logic_vector(1 downto 0);
begin
   -- registro
   process(clk,rst)
   begin
      if rst='1' then
         q_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         q_reg <= q_next;
      end if;
   end process;

   -- logica de proxiomo estado para contador
   q_next <= q_reg + 1;

   -- se usan los dos bits mas significativos para controlar el mux
   -- y generar la señal activa
   sel <= std_logic_vector(q_reg(1 downto 0));
   process(sel,signo,unidad,decena,centena)
   begin
      case sel is
         when "00" =>
            an <= "1110";--unidad
            sseg <= unidad;
         when "01" =>
            an <= "1101";--decena
            sseg <= decena;
         when "10" =>
            an <= "1011";--centena
            sseg <= centena;
         when others =>
            an <= "0111";--signo
            sseg <= signo;
      end case;
   end process;
end arch;