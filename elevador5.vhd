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
        process(clock, reset)
        begin
            if reset = '1' then
                Y_atual <= A;
            end if;
        end process;
       

        process(clock) 
        variable contador: integer := 0;

        begin
            case Y_atual  is
                when A =>
                    if andar = "11" then
                        if clock'event and clock = '1' then
                            if contador < 3 then
                                contador := contador + 1;
                            end if;
                        end if;
                        if contador = 1 then
                            Y_prox <= B;
                            
                        elsif contador = 2 then
                            Y_prox <= C;
                        elsif contador = 3 then
                            Y_prox <= D;
                            
                        end if;
                    end if;
                    if andar = "10" then
                        if clock'event and clock = '1' then
                            if contador < 2 then
                                contador := contador + 1;
                            end if;
                        end if;
                        if contador = 1 then
                            Y_prox <= B;
                        elsif contador = 2 then
                            Y_prox <= C;
                        end if ;
                    end if;
                    if andar = "01" then
                        if clock'event and clock = '1' then
                            Y_prox <= B;
                        end if ;
                    end if;
                    if andar = "00" then
                        if clock'event and clock = '1' then
                            Y_prox <= A;
                            Y_atual <= Y_prox;
                        end if ;
                    end if;
                    --Y_atual <= Y_prox;

                when B =>
                    if andar = "11" then
                        if clock'event and clock = '1' then
                            if contador < 2 then
                                contador := contador + 1;
                            end if;
                        end if;
                        if contador = 1 then
                            Y_prox <= C;
                        elsif contador = 2 then
                            Y_prox <= D;
                        end if;
                    end if;
                    if andar = "10" then
                        if clock'event and clock = '1' then
                            Y_prox <= C;
                        end if ;
                    end if;
                    if andar = "01" then
                        if clock'event and clock = '1' then
                            Y_prox <= B;
                        end if ;
                    end if;
                    if andar = "00" then
                        if clock'event and clock = '1' then
                            Y_prox <= A;
                        end if ;
                    end if;
                    --Y_atual <= Y_prox;

                when C =>
                    if andar = "11" then
                        if clock'event and clock = '1' then
                            Y_prox <= D;
                        end if ;
                    end if;
                    if andar = "01" then
                        if clock'event and clock = '1' then
                            Y_prox <= B;
                        end if ;
                    end if;
                    if andar = "00" then
                        if clock'event and clock = '1' then
                            if contador < 2 then
                                contador := contador + 1;
                            end if;
                        end if;
                        if contador = 1 then
                            Y_prox <= B;
                        elsif contador = 2 then
                            Y_prox <= A;
                        end if;
                    end if;
                    if andar = "10" then
                        if clock'event and clock = '1' then
                            Y_prox <= C;
                        end if ;
                    end if;
                    --Y_atual <= Y_prox;

                when D =>
                    if andar = "00" then
                        if clock'event and clock = '1' then
                            if contador < 3 then
                                contador := contador + 1;
                            end if;
                        end if;
                        if contador = 1 then
                            Y_prox <= C;
                        elsif contador = 2 then
                            Y_prox <= B;
                        elsif contador = 3 then
                            Y_prox <= A;
                        end if ;
                    end if;
                    if andar = "01" then
                        if clock'event and clock = '1' then
                            if contador < 2 then
                                contador := contador + 1;
                            end if;
                        end if;
                        if contador = 1 then
                            Y_prox <= C;
                        elsif contador = 2 then
                            Y_prox <= B;
                        end if ;
                    end if;
                    if andar = "10" then
                        if clock'event and clock = '1' then
                            Y_prox <= C;
                        end if ;
                    end if;
                    if andar = "11" then
                        if clock'event and clock = '1' then
                            Y_prox <= D;
                        end if ;
                    end if; 
                    --Y_atual <= Y_prox;
                 
                end case; 
            end process;   
            process(Y_prox)
            begin
                if Y_prox = A then
                    Andar1 <= '1';
                    Andar2 <= '0';
                    Andar3 <= '0';
                    Andar4 <= '0';
                elsif Y_prox = B then
                    Andar1 <= '0';
                    Andar2 <= '1';
                    Andar3 <= '0';
                    Andar4 <= '0';
                elsif Y_prox = C then
                    Andar1 <= '0';
                    Andar2 <= '0';
                    Andar3 <= '1';
                    Andar4 <= '0';
                elsif Y_prox = D then
                    Andar1 <= '0';
                    Andar2 <= '0';
                    Andar3 <= '0';
                    Andar4 <= '1';
                end if;
            end process;       
end architecture mainElevador;