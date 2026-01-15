--Leonardo carvalho bikulcius
--rafael buratto ribas
--eduardo Basánez Reichert
--
--
--FSM_3saidas xyz
--
library IEEE;
use IEEE.std_logic_1164.all;

entity projetin is 
    port (
        i_clk, i_clr : in std_logic;              -- Entrada do clock e clear
        o_xyz        : out std_logic_vector(2 downto 0)  -- Saída de 3 bits
    );
end projetin;

architecture hardware of projetin is
    signal w_atual : std_logic_vector(1 downto 0);  -- Sinal de estado atual
    signal w_next  : std_logic_vector(1 downto 0);  -- Sinal de próximo estado

    component log_xyz is 
        port (
            o_xyz : out std_logic_vector(2 downto 0);
            i_a   : in std_logic_vector(1 downto 0)
        );
    end component;

    component log_next is 
        port (
            o_next  : out std_logic_vector(1 downto 0);
            i_atual : in std_logic_vector(1 downto 0)
        );
    end component;

    component reg is 
        port (
            o_atual  : out std_logic_vector(1 downto 0);
            i_next   : in std_logic_vector(1 downto 0);
            i_clk, i_clr : in std_logic
        );
    end component;

begin
    -- Instanciação do registrador (reg) para armazenar o estado atual
    u_1 : reg 
        port map(
            o_atual => w_atual,    -- Problema: w_atual<= o_atual
            i_next  => w_next,     -- Problema: w_next <= i_next
            i_clk   => i_clk,      
            i_clr   => i_clr       
        );

    -- Instanciação do componente log_next para calcular o próximo estado
    u_2 : log_next 
        port map(
            o_next  => w_next,     -- Problema: w_next <= o_next
            i_atual => w_atual     -- Problema: w_atual <= i_atual
        );

    -- Instanciação do componente log_xyz para gerar a saída com base no estado atual
    u_3 : log_xyz 
        port map(
            o_xyz => o_xyz,        -- Problema: o_xyz<=o_xyz
            i_a   => w_atual       
        );

end hardware;
