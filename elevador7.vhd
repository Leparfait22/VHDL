library ieee;
use ieee.std_logic_1164.all;

entity Elevador is
    port (
        clock: in std_logic;
        reset: in std_logic;
        andar: in std_logic_vector(1 downto 0);
        andar1, andar2, andar3, andar4: out std_logic
    );
end entity Elevador;

architecture mainElevador of Elevador is
    type Estado_Type is (Andar_A, Andar_B, Andar_C, Andar_D);
    signal estado_atual: Estado_Type := Andar_A;



begin
    process (reset,clock)
    variable contador: integer := 0;
    begin
        if reset = '1' then 
            estado_atual <= Andar_A;
        end if;
        case estado_atual is
            when Andar_A =>
                if andar = "00" then 
                    if clock'event and clock = '1' then
                        estado_atual <= Andar_A;
                    end if;
                elsif andar = "01" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_B;
                    end if;
                elsif andar = "10" then
                        if clock'event and clock = '1' then
                            contador := contador + 1;
                            if contador = 1 then 
                                estado_atual <= Andar_B; 
                            elsif contador = 2 then 
                                estado_atual <= Andar_C;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '1';
                                --andar4 <= '0';
                            end if;
                        end if;
                    ----end loop;
                elsif andar = "11" then
                    --for contador in 1 to 3 loop
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_B;
                                --andar1 <= '0';
                                --andar2 <= '1';
                                --andar3 <= '0';
                                --andar4 <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_C;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '1';
                                --andar4 <= '0';
                            elsif contador = 3 then 
                                estado_atual <= Andar_D;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '0';
                                --andar4 <= '1';
                            end if;
                        end if;
                    --end loop;     
                end if;
            when Andar_B =>
                if andar = "01" then 
                    if clock'event and clock = '1' then
                        estado_atual <= andar_B;
                        --andar1 <= '0';
                        --andar2 <= '1';
                        --andar3 <= '0';
                        --andar4 <= '0';
                    end if;
                elsif andar = "10" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_C;
                        --andar1 <= '0';
                        --andar2 <= '0';
                        --andar3 <= '1';
                        --andar4 <= '0';
                    end if;
                elsif andar = "00" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_A;
                        --andar1 <= '1';
                        --andar2 <= '0';
                        --andar3 <= '0';
                        --andar4 <= '0';
                        end if;
                elsif andar = "11" then
                    --for contador in 1 to 2 loop
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_C;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '1';
                                --andar4 <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_D;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '0';
                                --andar4 <= '1';
                            end if;
                        end if;
                    --end loop;     
                end if;
            when Andar_C =>
                if andar = "10" then 
                    if clock'event and clock = '1' then
                        estado_atual <= Andar_C;
                    end if;
                elsif andar = "01" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_B;
                    end if;
                elsif andar = "11" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_D;
                        end if;
                elsif andar = "00" then
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_B; 
                            elsif contador = 2 then 
                                estado_atual <= Andar_A;
                            end if;
                        end if;
                end if;
            when Andar_D =>
                if andar = "11" then 
                    if clock'event and clock = '1' then
                        estado_atual <= Andar_D;
                    end if;
                elsif andar = "10" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_C;
                    end if;
                elsif andar = "01" then
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_C; 
                            elsif contador = 2 then 
                                estado_atual <= Andar_B;
                            end if;
                        end if;
                elsif andar = "00" then
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_C;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '1';
                                --andar4 <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_B;
                                --andar1 <= '0';
                                --andar2 <= '1';
                                --andar3 <= '0';
                                --andar4 <= '0';
                            elsif contador = 3 then 
                                estado_atual <= Andar_A;
                                --andar1 <= '1';
                                --andar2 <= '0';
                                --andar3 <= '0';
                                --andar4 <= '0';
                            end if;
                        end if;
                    --end loop;     
                end if;
            end case;
    end process;
       


    process (estado_atual)
    begin
        case estado_atual is
            when Andar_A =>
                andar1 <= '1';
                andar2 <= '0';
                andar3 <= '0';
                andar4 <= '0';
            when Andar_B =>
                andar1 <= '0';
                andar2 <= '1';
                andar3 <= '0';
                andar4 <= '0';
           when Andar_C =>
                andar1 <= '0';
                andar2 <= '0';
                andar3 <= '1';
                andar4 <= '0';
            when Andar_D =>
                andar1 <= '0';
                andar2 <= '0';
                andar3 <= '0';
                andar4 <= '1';
        end case;
    end process;
end architecture mainElevador;