library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--CDU : Centena, Decena, Unidad en BCD
entity BINtoCDU_BCD is
    Port ( A : in  STD_LOGIC_VECTOR (9 downto 0);--máx 1024
           CDU : out  STD_LOGIC_VECTOR (11 downto 0)-- 0000 0000 0000
);
end BINtoCDU_BCD;

architecture Behavioral of BINtoCDU_BCD is

COMPONENT Suma3 PORT (
      A : in  STD_LOGIC_VECTOR (3 downto 0);
      B : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL tmp1,tmp2,tmp3,tmp4,tmp5,tmp6,tmp7,tmp9,tmp10,tmp11,tmp12,tmp14: std_logic_vector(3 downto 0);
SIGNAL aux1,aux2,aux3,aux4,aux5,aux6,aux7,aux9,aux10,aux11,aux12,aux14: std_logic_vector(3 downto 0);

begin

--Unidad

aux1 <= "0" & A(9 downto 7);
S1: Suma3 PORT MAP(
			A => aux1,
			B => tmp1
);
aux2 <= tmp1(2 downto 0) & A(6);
S2: Suma3 PORT MAP(
			A => aux2,
			B => tmp2
);
aux3 <= tmp2(2 downto 0) & A(5);
S3: Suma3 PORT MAP(
			A => aux3,
			B => tmp3
);
aux4 <= tmp3(2 downto 0) & A(4);
S4: Suma3 PORT MAP(
			A => aux4,
			B => tmp4
);
aux5 <= tmp4(2 downto 0) & A(3);
S5: Suma3 PORT MAP(
			A => aux5,
			B => tmp5
);
aux6 <= tmp5(2 downto 0) & A(2);
S6: Suma3 PORT MAP(
			A => aux6,
			B => tmp6
);
aux7 <= tmp6(2 downto 0) & A(1);
S7: Suma3 PORT MAP(
			A => aux7,
			B => tmp7
);
CDU(3 downto 0) <= tmp7(2 downto 0) & A(0);


--Decena
aux9 <= "0" & tmp1(3) & tmp2(3) & tmp3(3);
S9: Suma3 PORT MAP(
			A => aux9,
			B => tmp9
);
aux10 <= tmp9(2 downto 0) & tmp4(3);
S10: Suma3 PORT MAP(
			A => aux10,
			B => tmp10
);
aux11 <= tmp10(2 downto 0) & tmp5(3); 
S11: Suma3 PORT MAP(
			A => aux11,
			B => tmp11
);
aux12 <= tmp11(2 downto 0) & tmp6(3);
S12: Suma3 PORT MAP(
			A => aux12,
			B => tmp12
);
CDU(7 downto 4) <= tmp12(2 downto 0) & tmp7(3);


--CENTENA

aux14 <="0" & tmp9(3) & tmp10(3) & tmp11(3);
S14: Suma3 PORT MAP(
			A => aux14,
			B => tmp14
);

CDU (11 downto 8) <= tmp14(2 downto 0) & tmp12(3);

end Behavioral;
