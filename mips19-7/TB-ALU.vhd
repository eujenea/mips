LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_ALU IS
END TB_ALU;
 
ARCHITECTURE behavior OF TB_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         srcA : IN  std_logic_vector(31 downto 0);
         srcB : IN  std_logic_vector(31 downto 0);
         ALUcontrol : IN  std_logic_vector(2 downto 0);
         zero : OUT  std_logic;
         ALUresult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal srcA : std_logic_vector(31 downto 0) := (others => '0');
   signal srcB : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUcontrol : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal zero : std_logic;
   signal ALUresult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          srcA => srcA,
          srcB => srcB,
          ALUcontrol => ALUcontrol,
          zero => zero,
          ALUresult => ALUresult
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

			srcA <= "00000000000000000000000000000001";
			srcB <= "00000000000000000000000000011111";
			AluControl <= "000";--and
			wait for 10 ns;	
			srcA <= "00000000000000000000000000000001";
			srcB <= "00000000000000000000000000011111";
			AluControl <= "001";--or
			wait for 10 ns;	
			srcA <= "00000000000000000000000000000001";
			srcB <= "00000000000000000000000000011111";
			AluControl <= "000";--and	
     wait for 10 ns;	
			srcA <= "00000000000000000000000000000001";
			srcB <= "10000000000000000000000000000001";
			AluControl <= "110";-- resta
	  -- insert stimulus here 

      wait;
   end process;

END;
