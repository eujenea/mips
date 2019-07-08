LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TB_ROM IS
END TB_ROM;
 
ARCHITECTURE behavior OF TB_ROM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rom
    PORT(
 
         ADDR : IN  std_logic_vector(31 downto 0);
         DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADDR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DATA : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rom PORT MAP (
          ADDR => ADDR,
          DATA => DATA
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
      -- insert stimulus here
		ADDR <= X"00000000";
		wait for 10 ns;
		ADDR <= x"00000001";
		wait for 10 ns;
		ADDR <= x"00000002";
		wait for 10 ns;
		ADDR <= x"00000003";
 
      wait;
   end process;

END;
