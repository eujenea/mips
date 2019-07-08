library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_3_1_32bits is
port (
		x: in std_logic_vector(31 downto 0);
		y: in std_logic_vector(31 downto 0);
		z: in std_logic_vector(31 downto 0);
		control: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(31 downto 0)
	);
end mux_3_1_32bits;

architecture Behavioral of mux_3_1_32bits is

begin
	output <= x when (control="00") else 
	 y when (control="01") else 
	z;
end Behavioral;

