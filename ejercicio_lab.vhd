library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

entity ejercicio_lab is port(
    --clk_out: out std_logic;
    clk_in: in std_logic;
    count_out: out std_logic_vector(3 downto 0);
    reset : in std_logic
    
);
end entity ejercicio_lab;


architecture rtl of ejercicio_lab is

    signal count:std_logic_vector(3 downto 0):= "0000";
    signal count1: std_logic_vector(23 downto 0) :=(others =>'0');
begin

    process(count1(21), reset)
        begin
            if (reset = '1') then
            
                 count <= "0000";
                
           elsif(count1(21)'event and count1(21)='1') then

                    count <= count + 1;
                    
            end if;
          
        end process;
        
    process(clk_in)
    begin
    if rising_edge(clk_in) then
    count1<=std_logic_vector(unsigned(count1) + 1);
    end if;
    end process;
    
    --clk_out<=count1(21);
    count_out <= count;   

     
end rtl;