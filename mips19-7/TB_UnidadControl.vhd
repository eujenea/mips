--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:58:03 11/12/2018
-- Design Name:   
-- Module Name:   C:/Users/Juan/Desktop/MIPS 2018/monociclo/TB_UnidadControl.vhd
-- Project Name:  monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: unidadControl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_UnidadControl IS
END TB_UnidadControl;
 
ARCHITECTURE behavior OF TB_UnidadControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT unidadControl
    PORT(
         op : IN  std_logic_vector(5 downto 0);
         func : IN  std_logic_vector(5 downto 0);
         cALUSrc : OUT  std_logic;
         cMemToReg : OUT  std_logic;
         cWriteReg : OUT  std_logic;
         cRegDst : OUT  std_logic;
         cBranch : OUT  std_logic;
         cRamWrite : OUT  std_logic;
         cJump : OUT  std_logic;
         cAluOp : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(5 downto 0) := (others => '0');
   signal func : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal cALUSrc : std_logic;
   signal cMemToReg : std_logic;
   signal cWriteReg : std_logic;
   signal cRegDst : std_logic;
   signal cBranch : std_logic;
   signal cRamWrite : std_logic;
   signal cJump : std_logic;
   signal cAluOp : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: unidadControl PORT MAP (
          op => op,
          func => func,
          cALUSrc => cALUSrc,
          cMemToReg => cMemToReg,
          cWriteReg => cWriteReg,
          cRegDst => cRegDst,
          cBranch => cBranch,
          cRamWrite => cRamWrite,
          cJump => cJump,
          cAluOp => cAluOp
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      -- insert stimulus here 
		
		op <="000000";
		func <="100000";--add
		wait for 10 ns;
		op <="000000";--sub
		func <="100010";
		wait for 10 ns;
		op <="001000";--addi
		func <="000000";
		wait for 10 ns;
		op <="000000";--addi
		func <="100101";
		wait for 10 ns;
		
      wait;
   end process;

END;
