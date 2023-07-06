library ieee;
use ieee.std_logic_1164.all;

entity elevador is
    port (
        clock   : in std_logic;
        reset   : in std_logic;
        andar   : in std_logic_vector(1 downto 0);
        andar1, andar2, andar3 : out std_logic
    );
end entity elevador;

architecture mainElevador of elevador is
    type estado is (PARADO, SUBINDO, DESCENDO);
    signal Y_atual, Y_prox : estado;
    signal counter : integer range 0 to 3;

begin
    process(clock, reset)
    begin
        if reset = '1' then
            Y_atual <= PARADO;
            counter <= 0;
        elsif rising_edge(clock) then
            case Y_atual is
                when PARADO =>
                    if andar = "11" then
                        Y_prox <= DESCENDO;
                    elsif andar = "10" then
                        Y_prox <= SUBINDO;
                    elsif andar = "01" then
                        Y_prox <= SUBINDO;
                    else 
                        Y_prox <= PARADO; 
                    end if;
                    
                    counter <= 0;

                when SUBINDO =>
                    if andar = "11" then
                        Y_prox <= PARADO;
                    elsif andar = "10" then
                        Y_prox <= SUBINDO;
                        counter <= counter + 1;
                    elsif andar = "01" then
                        Y_prox <= SUBINDO;
                        counter <= counter + 1;
                    end if; 

                when DESCENDO =>
                    if andar = "11" then
                        Y_prox <= DESCENDO;
                        counter <= counter + 1;
                    elsif andar = "10" then
                        Y_prox <= DESCENDO;
                        counter <= counter + 1;
                    elsif andar = "01" then
                        Y_prox <= PARADO;
                        counter <= 0;
                    end if;

                when others =>
                    null;
            end case;
            
            Y_atual <= Y_prox;
        end if;
    end process;

    -- Saída do elevador.
    andar1 <= '1' when (Y_atual = PARADO) and (andar = "01") else '0';
    andar2 <= '1' when (Y_atual = PARADO) and (andar = "10") else '0';
    andar3 <= '1' when (Y_atual = PARADO) and (andar = "11") else '0';

end architecture mainElevador;