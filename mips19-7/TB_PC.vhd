LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY TB_PC IS
END TB_PC;
 
ARCHITECTURE behavior OF TB_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         CLK : IN  std_logic;
         reset : IN  std_logic;
         PC1 : IN  std_logic_vector(31 downto 0);
         PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal reset : std_logic := '0';
   signal PC1 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          CLK => CLK,
          reset => reset,
          PC1 => PC1,
          PC => PC
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
		
		reset <= '0';
		wait for 1 ns;
		reset <= '1';
      wait for 10 ns;
		reset <= '0';
		
		wait for 1 ns;
      --insert stimulus here 
		PC1 <= "00000000000000000000000000000001";
		wait for 10 ns;
		PC1 <= "00000000000000000000000000000010";
		wait for 10 ns;
		PC1 <= "00000000000000000000000000000011";
      wait;
   end process;

END;
