----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/13/2017 12:04:46 PM
-- Design Name: 
-- Module Name: test_bench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_bench is
--  Port ( );
end test_bench;

architecture Behavioral of test_bench is

    component ALU is
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
             SEL : in STD_LOGIC_VECTOR (3 downto 0);
             Cin : in STD_LOGIC;
          RESULT : out STD_LOGIC_VECTOR (7 downto 0);
               C : out STD_LOGIC;
               Z : out STD_LOGIC);
    end component;

signal a, b, result : std_logic_vector (7 downto 0) := "00000000";
signal sel : std_logic_vector(3 downto 0) := "0000";
signal cin, c, z : std_logic := '0';

begin

    logic_unit : ALU 
        Port map ( A => a,
                   B => b,
                   SEL => sel,
                   Cin => cin,
                   RESULT => result,
                   C => c,
                   Z => z);
                   
    number_process : process
        begin
            sel <= "0000";      -- ADD
            a <= "10101010";
            b <= "10101010";
            cin <= '0';
            wait for 10ns;
            
            sel <= "0001";      -- ADDC
            a <= "11001000";
            b <= "00110111";
            cin <= '1';
            wait for 10ns;
            
            sel <= "0010";      -- SUB
            --a <= "11001000";
            --b <= "01100100";
            a <= "10101010";
            b <= "10101010";
            cin <= '0';
            wait for 10ns;
            
            sel <= "0011";      -- SUBC
            a <= "11001000";
            b <= "11001000";
            cin <= '1';
            wait for 10ns;
            
            sel <= "0100";      -- CMP
            a <= "10101010";
            b <= "10101010";
            cin <= '0';
            wait for 10ns;
            
            sel <= "0100";      -- CMP
            a <= "10101010";
            b <= "11111111";
            cin <= '0';
            wait for 10ns;
            
            sel <= "0101";      -- AND
            a <= "10101010";
            b <= "11001100";
            cin <= '0';
            wait for 10ns;
            
            sel <= "0110";      -- OR
            a <= "10101010";
            b <= "10101010";
            cin <= '0';
            wait for 10ns;
            
            sel <= "0111";      -- EXOR
            a <= "10101010";
            b <= "10101010";
            cin <= '0';
            wait for 10ns;
            
            sel <= "1000";      -- TEST
            a <= "10101010";
            b <= "01010101";
            cin <= '0';
            wait for 10ns;
            
            sel <= "1001";      -- LSL
            a <= "00000001";
            b <= "00010010";
            cin <= '1';
            wait for 10ns;
            
            sel <= "1010";      -- LSR
            a <= "10000001";
            b <= "00110011";
            cin <= '0';
            wait for 10ns;
            
            sel <= "1011";      -- ROL
            a <= "00000001";
            b <= "10101011";
            cin <= '1';
            wait for 10ns;
            
            sel <= "1100";      -- ROL
            a <= "10000001";
            b <= "00111100";
            cin <= '0';
            wait for 10ns;
            
            sel <= "1101";      -- ASR
            a <= "10000001";
            b <= "10000001";
            cin <= '0';
            wait for 10ns;
            
            sel <= "1111";      -- MOV
            a <= "01010001";
            b <= "00110000";
            cin <= '0';
            wait for 10ns;
            
        end process;


end Behavioral;
