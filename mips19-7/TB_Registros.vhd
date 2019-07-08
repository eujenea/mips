LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Registros IS
END TB_Registros;
 
ARCHITECTURE behavior OF TB_Registros IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registros
    PORT(
         CLK : IN  std_logic;
         WE3 : IN  std_logic;
         A1 : IN  std_logic_vector(4 downto 0);
         A2 : IN  std_logic_vector(4 downto 0);
         A3 : IN  std_logic_vector(4 downto 0);
         WD3 : IN  std_logic_vector(31 downto 0);
         RD1 : OUT  std_logic_vector(31 downto 0);
         RD2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal WE3 : std_logic := '0';
   signal A1 : std_logic_vector(4 downto 0) := (others => '0');
   signal A2 : std_logic_vector(4 downto 0) := (others => '0');
   signal A3 : std_logic_vector(4 downto 0) := (others => '0');
   signal WD3 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal RD1 : std_logic_vector(31 downto 0);
   signal RD2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registros PORT MAP (
          CLK => CLK,
          WE3 => WE3,
          A1 => A1,
          A2 => A2,
          A3 => A3,
          WD3 => WD3,
          RD1 => RD1,
          RD2 => RD2
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
		-- hold reset state for 100 ns.
  
		wait for 10 ns;	
		WE3 <= '0';
      A1 <= ("00000");
      A2 <= ("00000");
      A3 <= ("00000");
		
		wait for 10 ns;	
		WE3 <= '0';
      A1 <= ("00001");
      A2 <= ("00001");
      A3 <= ("10000");
		
		wait for 10 ns;	
		WE3 <= '0';
      A1 <= ("00001");
      A2 <= ("00001");
      A3 <= ("10000");
		
		wait for 10 ns;	
		WE3 <= '1';
      A1 <= ("00001");
      A2 <= ("00001");
      A3 <= ("10000");
      WD3 <= ("11110111100000000011110111101111");
		
		wait for 10 ns;	
		WE3 <= '0';
      A1 <= ("10000");
      A2 <= ("10000");
      A3 <= ("10000");
		
		wait for 10 ns;	
		WE3 <= '1';
      A1 <= ("01011");
      A2 <= ("01111");
      A3 <= ("10000");
      WD3 <= ("00000000000000000011110111101111");
		
		wait for 10 ns;	
		WE3 <= '0';
      A1 <= ("01011");
      A2 <= ("01111");
      A3 <= ("10000");
		
		wait for 10 ns;	
		WE3 <= '0';
      A1 <= ("10000");
      A2 <= ("10000");
      A3 <= ("10000");      

      wait;
   end process;

END;
