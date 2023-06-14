library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all ;
use ieee.numeric_std.all;


entity clk_8times is
    Port (
        stdload_clkin : in  STD_LOGIC;
		  en_in			: in  STD_LOGIC;
		  stdload_out		: out STD_LOGIC
--		  out_Byte  : out  std_logic_vector(8 downto 0)
    );
end clk_8times;

architecture Behavioral of clk_8times is
    signal counter_ck : integer range 0 to 268 := 0;
	 signal count_data: std_logic_vector(8 downto 0) := "000000000";
    signal counter_stdload : integer range 0 to 7 := 0;
begin
    process (stdload_clkin) 
	 begin
		if rising_edge(stdload_clkin) then
		if (en_in = '1') then
			if (counter_stdload = 0) then
				stdload_out <= '0';
				counter_stdload <= counter_stdload + 1;
			elsif (counter_stdload >= 1 and counter_stdload < 4) then
				stdload_out <= '1';
				counter_stdload <= counter_stdload + 1;
			elsif (counter_stdload >= 4 and counter_stdload < 7) then
				stdload_out <= '0';
				counter_stdload <= counter_stdload + 1;
			elsif (counter_stdload = 7) then
				stdload_out <= '0';
				counter_stdload <= 0;
			end if;
		else
--			if (counter_stdload = 0) then
--				stdload_out <= '0';
--				counter_stdload <= counter_stdload + 1;
--			elsif (counter_stdload >= 1 and counter_stdload < 4) then
--				stdload_out <= '1';
--				counter_stdload <= counter_stdload + 1;
--			elsif (counter_stdload >= 4 and counter_stdload < 7) then
--				stdload_out <= '0';
--				counter_stdload <= counter_stdload + 1;
--			elsif (counter_stdload = 7) then
--				stdload_out <= '0';
				counter_stdload <= 0;
				stdload_out <='0';
--			end if;
		end if;
		end if;
    end process;
end Behavioral;