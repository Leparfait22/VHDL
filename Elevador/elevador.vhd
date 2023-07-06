--codigos para as portas 

-- Declaração da biblioteca e pacotes utilizados
library ieee;
use ieee.std_logic_1164.all;

-- Declaração da entidade
entity elevador is

    port (
        clock : in std_logic;
        reset : in std_logic;
        andar : in std_logic;
        Andar1,Andar2,Andar3,Andar4 : out std_logic

    );
end entity elevador;

-- Arquitetura
architecture mainElevador of elevador is
Type estado is (A,B,C,D);
signal Y_prox,Y_atual :estado;

begin
    process(andar,clock,Y_prox)
    begin
        if(clock'EVENT and clock = '1') then
            case Y_prox is 
                when A =>
                    if andar = '0' then
                        Y_prox <= A;
                        Andar1 <= '1';
                    else
                        Y_prox <= B;
                        Andar2 <= '1';
                        Andar1 <= '0';
                    end if;
                when B =>
                    if andar = '0' then
                        Y_prox <= A;
                        Andar1 <= '1';
                        Andar1 <= '0';

                    else
                        Y_prox <= C;
                        Andar3 <= '1';
                        Andar1 <= '0';
                    end if;
                when C =>
                    if andar = '0' then
                        Y_prox <= B;
                        Andar2 <= '1';
                        Andar1 <= '0';
                    else
                        Y_prox <= D;
                        Andar4 <= '1';
                        Andar1 <= '0';
                    end if;
                when D =>
                    if andar = '0' then
                        Y_prox <= C;
                        Andar3 <= '1';
                        Andar1 <= '0';
                    else
                        Y_prox <= D;
                        Andar4 <= '1';
                        Andar1 <= '0';
                    end if;
                
            end case;
        end if;
        --if portaTrancada = '1' then 
        --    if portaAberta = '1' then
        --        p <= '1';
        --    else 
        --        p <= '0';
		--end if;
	--else 
		--p<= '0';
      --  end if;
    end process;
end architecture mainElevador;
