
-- VHDL Instantiation Created from source file latch.vhd -- 10:24:31 04/09/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT latch
	PORT(
		data : IN std_logic_vector(31 downto 0);
		we : IN std_logic;
		clk : IN std_logic;          
		display : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_latch: latch PORT MAP(
		data => ,
		we => ,
		clk => ,
		display => 
	);


