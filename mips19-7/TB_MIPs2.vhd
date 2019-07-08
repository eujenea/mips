LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_MIPs2 IS
END TB_MIPs2;
 
ARCHITECTURE behavior OF TB_MIPs2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mips
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
			btn : IN  std_logic;
        	sieteSeg: OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btn : std_logic := '0';
 	--Outputs
   signal sieteSeg : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mips PORT MAP (
          clk => clk,
          rst => rst,
			 btn => btn,
          sieteSeg => sieteSeg
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 5 ns;      -- insert stimulus here 
		rst <= '1';
		wait for 5 ns;      -- insert stimulus here 
		rst <= '0';
      wait for 5 ns;
		btn <= '1';
		WAIT;
   end process;

END;
