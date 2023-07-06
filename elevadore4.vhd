library ieee;
use ieee.std_logic_1164.all;

entity elevador is
    port (
        clock     : in std_logic;
        reset   : in std_logic;
        andar   : in std_logic_vector(1 downto 0);
        andar1, andar2, andar3, andar4 : out std_logic              
    );
end entity elevador;

architecture mainElevador of elevador is
    Type estado is (A,B,C,D);
    signal Y_atual :estado := A;
    signal Y_prox :estado;
    begin
        process(Y_atual)
        begin
            if Y_atual = A then
                Andar1 <= '1';
                Andar2 <= '0';
                Andar3 <= '0';
                Andar4 <= '0';
            elsif Y_atual = B then
                Andar1 <= '0';
                Andar2 <= '1';
                Andar3 <= '0';
                Andar4 <= '0';
            elsif Y_atual = C then
                Andar1 <= '0';
                Andar2 <= '0';
                Andar3 <= '1';
                Andar4 <= '0';
            elsif Y_atual = D then
                Andar1 <= '0';
                Andar2 <= '0';
                Andar3 <= '0';
                Andar4 <= '1';
        end process
        process(andar,clock,Y_prox) 
        begin
            if(clock'EVENT and clock = '1') then
                case Y_prox is 
                    when A =>
                        if andar = "00" then
                            Y_prox <= A;
                            Andar1 <= '1';
                            Andar2 <= '0';
                            Andar3 <= '0';
                            Andar4 <= '0';
                        elsif andar = "01" then 
                            Y_prox <= B;
                            Andar1 <= '0';
                            Andar2 <= '1';
                            Andar3 <= '0';
                            Andar4 <= '0';
                        elsif andar = "11" then 
                            Y_prox <= C;
                            Andar1 <= '0';
                            Andar2 <= '0';
                            Andar3 <= '1';
                            Andar4 <= '0';
                        elsif andar = "11" then 
                            Y_prox <= D;
                            Andar1 <= '0';
                            Andar2 <= '0';
                            Andar3 <= '0';
                            Andar4 <= '1';
                        end if;
                    when B =>
                        if andar = "00" then
                            Y_prox <= A;
                            Andar1 <= '1';
                            Andar2 <= '0';
                            Andar3 <= '0';
                            Andar4 <= '0';
                        elsif andar = "01" then 
                            Y_prox <= B;
                            Andar1 <= '0';
                            Andar2 <= '1';
                            Andar3 <= '0';
                            Andar4 <= '0';
                        elsif andar = "11" then 
                            Y_prox <= C;
                            Andar1 <= '0';
                            Andar2 <= '0';
                            Andar3 <= '1';
                            Andar4 <= '0';
                        elsif andar = "11" then 
                            Y_prox <= D;
                            Andar1 <= '0';
                            Andar2 <= '0';
                            Andar3 <= '0';
                            Andar4 <= '1';
                        end if;
                    when C =>
                        if andar = "00" then
                            Y_prox <= A;
                            Andar1 <= '1';
                            Andar2 <= '0';
                            Andar3 <= '0';
                            Andar4 <= '0';
                        elsif andar = "01" then 
                            Y_prox <= B;
                            Andar1 <= '0';
                            Andar2 <= '1';
                            Andar3 <= '0';
                            Andar4 <= '0';
                        elsif andar = "11" then 
                            Y_prox <= C;
                            Andar1 <= '0';
                            Andar2 <= '0';
                            Andar3 <= '1';
                            Andar4 <= '0';
                        elsif andar = "11" then 
                            Y_prox <= D;
                            Andar1 <= '0';
                            Andar2 <= '0';
                            Andar3 <= '0';
                            Andar4 <= '1';
                        end if;
                    when D =>
                        if andar = "00" then
                            Y_prox <= A;
                            Andar1 <= '1';
                            Andar2 <= '0';
                            Andar3 <= '0';
                            Andar4 <= '0';
                        elsif andar = "01" then 
                            Y_prox <= B;
                            Andar1 <= '0';
                            Andar2 <= '1';
                            Andar3 <= '0';
                            Andar4 <= '0';
                        elsif andar = "11" then 
                            Y_prox <= C;
                            Andar1 <= '0';
                            Andar2 <= '0';
                            Andar3 <= '1';
                            Andar4 <= '0';
                        elsif andar = "11" then 
                            Y_prox <= D;
                            Andar1 <= '0';
                            Andar2 <= '0';
                            Andar3 <= '0';
                            Andar4 <= '1';
                        end if;
                end case;
            end if;
           
        end process;          
end architecture mainElevador;