library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ejercicio is 

generic( n: integer:=8;
         m: integer:=55
	);
port(
      clk,reset: in std_logic;
      q: out std_logic_vector(n-1 downto 0)
      
      );
      
      end entity;

architecture rtl of ejercicio is
	signal r_reg: unsigned(n-1 downto 0);
begin

    process(clk,reset)
    begin
        if reset ='1' then
            r_reg <= (others=>'0');
        elsif rising_edge(clk) then 
            r_reg <= r_reg+1;
            if r_reg = m then 
                r_reg <= (others=>'0');
            end if;
        end if;
    end process;

    q <= std_logic_vector(r_reg);

end rtl;
