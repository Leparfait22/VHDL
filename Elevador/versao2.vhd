--codigos para as portas 

-- Declaração da biblioteca e pacotes utilizados
library ieee;
use ieee.std_logic_1164.all;

-- Declaração da entidade
entity elevador is

    port (
        clock : in std_logic;
        andar : in bit_vector(2 downto 0);
        Andar1,Andar2,Andar3,Andar4 : out std_logic

    );
end entity elevador;

-- Arquitetura
architecture mainElevador of elevador is    
Type estado is (A,B,C,D);
signal Y_atual :estado := A;
signal Y_prox :estado := A;

begin
    process(andar,Andar1,Andar2,Andar3,Andar4,clock,Y_prox) 
    begin
        if(clock'EVENT and clock = '1') then
            case Y_prox is 
                when A =>
                    if andar = '0' then
                        Y_prox <= A;
                        Andar1 <= '1';
                        Andar2 <= '0';
                        Andar3 <= '0';
                        Andar4 <= '0';
                    else
                        Y_prox <= B;
                        Andar1 <= '0';
                        Andar2 <= '1';
                        Andar3 <= '0';
                        Andar4 <= '0';
                    end if;
                when B =>
                    if andar = '0' then
                        Y_prox <= A;
                        Andar1 <= '1';
                        Andar2 <= '0';
                        Andar3 <= '0';
                        Andar4 <= '0';

                    else
                        Y_prox <= C;
                        Andar1 <= '0';
                        Andar2 <= '0';
                        Andar3 <= '1';
                        Andar4 <= '0';
                    end if;
                when C =>--codigos para as portas 

                -- Declaração da biblioteca e pacotes utilizados
                library ieee;
                use ieee.std_logic_1164.all;
                
                -- Declaração da entidade
                entity elevador is
                
                    port (
                        clock : in std_logic;
                        andar : in std_logic;
                        Andar1,Andar2,Andar3,Andar4 : out std_logic
                
                    );
                end entity elevador;
                
                -- Arquitetura
                architecture mainElevador of elevador is    
                Type estado is (A,B,C,D);
                signal Y_atual :estado := A;
                signal Y_prox :estado := A;
                
                begin
                    process(andar,Andar1,Andar2,Andar3,Andar4,clock,Y_prox) 
                    begin
                        if(clock'EVENT and clock = '1') then
                            case Y_prox is 
                                when A =>
                                    if andar = '0' then
                                        Y_prox <= A;
                                        Andar1 <= '1';
                                        Andar2 <= '0';
                                        Andar3 <= '0';
                                        Andar4 <= '0';
                                    else
                                        Y_prox <= B;
                                        Andar1 <= '0';
                                        Andar2 <= '1';
                                        Andar3 <= '0';
                                        Andar4 <= '0';
                                    end if;
                                when B =>
                                    if andar = '0' then
                                        Y_prox <= A;
                                        Andar1 <= '1';
                                        Andar2 <= '0';
                                        Andar3 <= '0';
                                        Andar4 <= '0';
                
                                    else
                                        Y_prox <= C;
                                        Andar1 <= '0';
                                        Andar2 <= '0';
                                        Andar3 <= '1';
                                        Andar4 <= '0';
                                    end if;
                                when C =>
                                    if andar = '0' then
                                        Y_prox <= B;
                                        Andar1 <= '0';
                                        Andar2 <= '1';
                                        Andar3 <= '0';
                                        Andar4 <= '0';
                                    else
                                        Y_prox <= D;
                                        Andar1 <= '1';
                                        Andar2 <= '0';
                                        Andar3 <= '0';
                                        Andar4 <= '1';
                                    end if;
                                when D =>
                                    if andar = '0' then
                                        Y_prox <= C;
                                        Andar1 <= '0';
                                        Andar2 <= '0';
                                        Andar3 <= '1';
                                        Andar4 <= '0';
                                    else
                                        Y_prox <= D;
                                        Andar1 <= '0';
                                        Andar2 <= '0';
                                        Andar3 <= '0';
                                        Andar4 <= '1';
                                    end if;
                                
                            end case;
                        end if;
                       
                    end process;                         
                
                    --process(Y_prox)
                    --begin
                     --   if Y_prox <= A then
                     --       Andar1 <= '1';
                     --       Andar2 <= '0';
                       --     Andar3 <= '0';
                     --          
                      --      Andar2 <= '0';
                     ---       Andar3 <= '0';
                     --   end if;
                   -- end process;
                    
                end architecture mainElevador;
                    if andar = '0' then
                        Y_prox <= B;
                        Andar1 <= '0';
                        Andar2 <= '1';
                        Andar3 <= '0';
                        Andar4 <= '0';
                    else
                        Y_prox <= D;
                        Andar1 <= '1';
                        Andar2 <= '0';
                        Andar3 <= '0';
                        Andar4 <= '1';
                    end if;
                when D =>
                    if andar = '0' then
                        Y_prox <= C;
                        Andar1 <= '0';
                        Andar2 <= '0';
                        Andar3 <= '1';
                        Andar4 <= '0';
                    else
                        Y_prox <= D;
                        Andar1 <= '0';
                        Andar2 <= '0';
                        Andar3 <= '0';
                        Andar4 <= '1';
                    end if;
                
            end case;
        end if;
       
    end process;                         

    --process(Y_prox)
    --begin
     --   if Y_prox <= A then
     --       Andar1 <= '1';
     --       Andar2 <= '0';
       --     Andar3 <= '0';
     --          
      --      Andar2 <= '0';
     ---       Andar3 <= '0';
     --   end if;
   -- end process;
    
end architecture mainElevador;