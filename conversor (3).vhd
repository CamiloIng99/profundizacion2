library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
entity conversor is port(
	QL,QR : out std_logic_vector(7 downto 0);
    ws,clk: out std_logic;
    reset : in std_logic :='1';
	MCLK,Serial_in : in std_logic
	);
end entity conversor;

architecture rtl of conversor is
    signal content: std_logic_vector(7 downto 0);
    signal auxQR: std_logic_vector(7 downto 0);
    signal auxQL: std_logic_vector(7 downto 0);
	signal enable: std_logic;
	signal count: integer:=1;
	signal tmp : std_logic := '0';
    signal count1: integer:=1;
	signal tmp1 : std_logic := '0';
begin

    process(MCLK, reset)
        begin
            if (reset = '1') then
                tmp <= '0';
            elsif(MCLK'event and MCLK='1') then
                count <=count+1;
                if (count = 128) then
                    -- Reloj 48K y datos en serie.
                    tmp <= NOT tmp;
                    count <= 1;
                    -- Complemento a dos.
                    auxQL <= NOT(Serial_in & content(7 downto 1));
                    auxQL <= std_logic_vector(to_unsigned(to_integer(unsigned( auxQL )) + 1, 8));
                end if;
            end if;
           
        end process;

    ws <= tmp;
    QL <= auxQL;
    process(MCLK, reset)
        begin
            if (reset = '1') then
                tmp1 <= '0';
            elsif(MCLK'event and MCLK='1') then
                count1 <=count1+1;
                if (count1 = 2) then
                    -- Reloj 3.072M y datos en serie.
                    tmp1 <= NOT tmp1;
                    count1 <= 1;
                    --Complemento a dos.
                    auxQR <= NOT(Serial_in & content(7 downto 1));
                    auxQR <= std_logic_vector(to_unsigned(to_integer(unsigned( auxQR )) + 1, 8));
                end if;
            end if;
          
        end process;
    QR <= auxQR;
    clk <= tmp1;

end rtl;