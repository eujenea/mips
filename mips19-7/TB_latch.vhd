LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_latch IS
END TB_latch;
 
ARCHITECTURE behavior OF TB_latch IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT latch
    PORT(
         data : IN  std_logic_vector(31 downto 0);
         we : IN  std_logic;
         clk : IN  std_logic;
         display : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(31 downto 0) := (others => '0');
   signal we : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal display : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: latch PORT MAP (
          data => data,
          we => we,
          clk => clk,
          display => display
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      wait for clk_period*10;

      -- insert stimulus here
		we <= '1';
		data<= "00000000000000000000000000000111";
		
		wait for 10 ns;
		
		we <= '0';
		data<= "00000000000000000000000001110000";

      wait;
   end process;

END;
