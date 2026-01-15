-- circuito prox state

library IEEE;
use ieee.std_logic_1164.all;

entity log_next is port
(
	o_next : out std_logic_vector (1 downto 0);
	i_atual	: in std_logic_vector (1 downto 0)
);
end log_next;

architecture bdsm of log_next is
begin
	process(i_atual)
	begin
		if (i_atual = "00")then
		o_next <= "01";-- avisa que proximo estado vai ser s1=0 e so=1
			elsif(i_atual = "01")then
			o_next <= "10";--proximo estado
			elsif (i_atual = "10")then
			o_next <= "11";
		end if;
	end process;
end bdsm;