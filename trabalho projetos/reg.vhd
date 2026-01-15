-- circuito xyz

library IEEE;
use ieee.std_logic_1164.all;

entity reg is port
(
		o_atual 		 : out std_logic_vector (1 downto 0);
		i_next		 : in std_logic_vector (1 downto 0);
		i_clk, i_clr : in std_logic
);
end reg;
architecture lil of reg is
begin
	process(i_clk, i_clr, i_next)
	begin
		if (i_clr = '1')then
		o_atual <= "00";
		elsif (rising_edge(i_clk))then
		o_atual<= i_next;
		end if;
	end process;
end lil;
