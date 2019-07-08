library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_1_4bits is
	port (
		x: in std_logic_vector(4 downto 0);
		y: in std_logic_vector(4 downto 0);
		z: in std_logic_vector(4 downto 0);
		control: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(4 downto 0)
	);
end mux_2_1_4bits;

architecture arch_mux_2_1_4bits of mux_2_1_4bits is
begin
	output <= x when (control="00") else
			    y when (control="01") else z;

end arch_mux_2_1_4bits;
