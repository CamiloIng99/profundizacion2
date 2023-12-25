----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2022 09:26:30 PM
-- Design Name: 
-- Module Name: tb_ejercicio1 - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity tb_ejercicio1 is
--  Port ( );
end tb_ejercicio1;

architecture Behavioral of tb_ejercicio1 is

component tb_ejercicio1 is 
    
    generic (n: integer := 8;
            m: integer :=55
    );

    port (
    clk, reset : in std_logic;
    q: out std_logic_vector(n-1 downto 0)
    );
end component;

constant nt : integer := 8;
constant mt : integer := 55;
signal clk, reset: std_logic;
signal q: std_logic_vector(nt-1 downto 0);
constant clock_period: time := 10 ns;

begin

    tb_ejercicio10: tb_ejercicio1 
    
    generic map (
    n=>nt,
    m=>mt
    
    )
    
    
    port map (
        clk=>clk,
        reset => reset,
        q => q
    );

    process
        begin
            clk<='0';
            wait for clock_period/2;
            clk<='1';
            wait for clock_period/2;
        end process;
        
        
        process
        begin
            reset<='0';
            wait for clock_period;
            reset<='1';
            wait;
        end process;

end Behavioral;
