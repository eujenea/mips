--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:13:33 12/18/2018
-- Design Name:   
-- Module Name:   C:/Users/Juan/Desktop/JUEVES 14/MIPS 2018/TB_bintocdu.vhd
-- Project Name:  monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BINtoCDU_BCD
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
 
ENTITY TB_bintocdu IS
END TB_bintocdu;
 
ARCHITECTURE behavior OF TB_bintocdu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BINtoCDU_BCD
    PORT(
         A : IN  std_logic_vector(9 downto 0);
         CDU : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal CDU : std_logic_vector(11 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BINtoCDU_BCD PORT MAP (
          A => A,
          CDU => CDU
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      A <= "1111111111";
		wait for 10 ns;	
		A <= "0100110111";--311
		wait for 10 ns;	
		A <= "0000000000";--0
		wait for 10 ns;	
		A <= "1001100011";--611
		wait for 10 ns;	
		A <= "0000010111";--23
		wait for 10 ns;	
		A <= "1100001001";--777
		wait for 10 ns;	
		A <= "1100110100";--820
 

      -- insert stimulus here 

      wait;
   end process;

END;
