--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:31:54 04/02/2019
-- Design Name:   
-- Module Name:   C:/Users/Juan/Desktop/TODO ANDA/MIPS 2018/TB_divisor_frecuencia.vhd
-- Project Name:  monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divisor_frecuecia
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
 
ENTITY TB_divisor_frecuencia IS
END TB_divisor_frecuencia;
 
ARCHITECTURE behavior OF TB_divisor_frecuencia IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divisor_frecuecia
    PORT(
         entrada : IN  std_logic;
         reset_clk : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic := '0';
   signal reset_clk : std_logic := '0';

 	--Outputs
   signal salida : std_logic;
	constant entrada_t : time := 20 ns;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divisor_frecuecia PORT MAP (
          entrada => entrada,
          reset_clk => reset_clk,
          salida => salida
        );

   -- Clock process definitions
   entrada_process :process
   begin
		entrada <= '0';
		wait for entrada_t/2;
		entrada <= '1';
		wait for entrada_t/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset_clk <= '1'; 
      wait for 100 ns;
      reset_clk <= '0'; 
      wait;
   end process;

END;
