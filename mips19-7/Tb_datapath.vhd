LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_datapath IS
END Tb_datapath;
 
ARCHITECTURE behavior OF Tb_datapath IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Datapath
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         controlALUSrc : IN  std_logic;
         controlMemToReg : IN  std_logic;
         controlWriteReg : IN  std_logic;
         controlRegDst : IN  std_logic;
         controlBranch : IN  std_logic;
         controlRamWrite : IN  std_logic;
         controlJump : IN  std_logic;
         controlAluOp : IN  std_logic_vector(2 downto 0);
         instrOp : OUT  std_logic_vector(5 downto 0);
         instrFn : OUT  std_logic_vector(5 downto 0);
         result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal controlALUSrc : std_logic := '0';
   signal controlMemToReg : std_logic := '0';
   signal controlWriteReg : std_logic := '0';
   signal controlRegDst : std_logic := '0';
   signal controlBranch : std_logic := '0';
   signal controlRamWrite : std_logic := '0';
   signal controlJump : std_logic := '0';
   signal controlAluOp : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal instrOp : std_logic_vector(5 downto 0);
   signal instrFn : std_logic_vector(5 downto 0);
   signal result : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Datapath PORT MAP (
          clock => clock,
          reset => reset,
          controlALUSrc => controlALUSrc,
          controlMemToReg => controlMemToReg,
          controlWriteReg => controlWriteReg,
          controlRegDst => controlRegDst,
          controlBranch => controlBranch,
          controlRamWrite => controlRamWrite,
          controlJump => controlJump,
          controlAluOp => controlAluOp,
          instrOp => instrOp,
          instrFn => instrFn,
          result => result
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
		
		reset<='1';
		
		wait for 10 ns;
		
		reset<='0';

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
