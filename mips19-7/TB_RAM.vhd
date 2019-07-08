LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_RAM IS
END TB_RAM;
 
ARCHITECTURE behavior OF TB_RAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         CLK : IN  std_logic;
         WE : IN  std_logic;
         A : IN  std_logic_vector(31 downto 0);
         WD : IN  std_logic_vector(31 downto 0);
         RD : OUT  std_logic_vector(31 downto 0);
			WD2 : IN  std_logic;
			DISPLAY: out  STD_LOGIC_VECTOR (31 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
   signal WE : std_logic := '0';
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal WD : std_logic_vector(31 downto 0) := (others => '0');
   signal WD2 : std_logic := '0';



 	--Outputs
   signal RD : std_logic_vector(31 downto 0);
	signal DISPLAY : std_logic_vector(31 downto 0);


   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          CLK => CLK,
          WE => WE,
          A => A,
          WD => WD,
          WD2 => WD2,
          RD => RD,
          DISPLAY => DISPLAY
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '1';
		wait for CLK_period/2;
		CLK <= '0';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		WE <= '0';
      A <= ("00000000000000000000000000000001");--1
		
	   wait for 10 ns;	
		WE <= '1';
      A <=  ("00000000000000000000000000000010");--2
      WD <= ("00000000000000000000000000000001");
		 wait for 10 ns;	
		WE <= '0';
      A <= ("00000000000000000000000000000010");--2
		
      wait;
   end process;

END;
