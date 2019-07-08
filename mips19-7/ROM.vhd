library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rom is
port (ADDR : in std_logic_vector(31 downto 0);
      DATA : out std_logic_vector(31 downto 0));
end rom;
architecture syn of rom is
    type rom_type is array (0 to 121) of std_logic_vector (7 downto 0);                 
    signal sROM : rom_type:= (




--x"20",x"04",x"00",x"07",
--x"0c",x"10",x"00",x"04",
--x"00",x"40",x"c8",x"20",
--x"08",x"10",x"00",x"1e",
--x"20",x"0f",x"00",x"0c",
--x"03",x"af",x"e8",x"22",
--x"af",x"b0",x"00",x"00",
--x"af",x"b1",x"00",x"04",
--x"af",x"bf",x"00",x"08",
--x"20",x"18",x"00",x"03",
--x"00",x"98",x"40",x"2a",
--x"11",x"00",x"00",x"05",
--x"10",x"80",x"00",x"02",
--x"20",x"02",x"00",x"01",
--x"08",x"10",x"00",x"19",
--x"20",x"02",x"00",x"00",
--x"08",x"10",x"00",x"19",
--x"20",x"90",x"00",x"00",
--x"20",x"84",x"ff",x"ff",
--x"0c",x"10",x"00",x"04",
--x"20",x"51",x"00",x"00",
--x"22",x"04",x"ff",x"fe",
--x"0c",x"10",x"00",x"04",
--x"02",x"22",x"10",x"20",
--x"00",x"40",x"50",x"20",
--x"8f",x"b0",x"00",x"00",
--x"8f",x"b1",x"00",x"04",
--x"8f",x"bf",x"00",x"08",
--x"23",x"bd",x"00",x"0c",
--x"03",x"e0",x"00",x"08",



--ULTIMO QUE HICIMOS SALTO DE 1 EN 1
x"20",x"0f",x"00",x"10",
x"20",x"0c",x"00",x"00",
x"20",x"10",x"00",x"00",
x"ad",x"90",x"00",x"00",
x"20",x"10",x"00",x"01",
x"ad",x"90",x"00",x"01",
x"21",x"ef",x"ff",x"fe",
x"0c",x"10",x"00",x"09", --08
x"08",x"10",x"00",x"14",
x"8d",x"88",x"00",x"00", 
x"21",x"8a",x"00",x"01",
x"8d",x"49",x"00",x"00",
x"01",x"09",x"58",x"20",
x"21",x"8c",x"00",x"01",
x"21",x"8a",x"00",x"01",
x"ad",x"4b",x"00",x"00",
x"21",x"ef",x"ff",x"ff",
x"10",x"0f",x"00",x"01",
x"08",x"10",x"00",x"09",
x"08",x"10",x"00",x"08",


	 OTHERS => x"00"); 
begin
   DATA(31 downto 24) <= sROM(conv_integer(ADDR));
   DATA(23 downto 16) <= sROM(conv_integer(ADDR)+1);
	DATA(15 downto 8) <= sROM(conv_integer(ADDR)+2);
	DATA(7 downto 0) <= sROM(conv_integer(ADDR)+3);
end syn;