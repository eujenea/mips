library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_1_32bits is
	port (
		x: in std_logic_vector(31 downto 0);
		y: in std_logic_vector(31 downto 0);
		control: in std_logic;
		output: out std_logic_vector(31 downto 0)
	);
end mux_2_1_32bits;

architecture arch_mux_2_1_32bits of mux_2_1_32bits is
begin
	output <= x when (control='0') else y;
end arch_mux_2_1_32bits;
