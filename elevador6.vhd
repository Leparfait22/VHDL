library ieee;
use ieee.std_logic_1164.all;

entity elevador is
    port (
        clock   : in std_logic;
        reset   : in std_logic;
        andar   : in std_logic_vector(1 downto 0);
        andar1, andar2, andar3, andar4 : out std_logic
    );
end entity elevador;

architecture mainElevador of elevador is
    type estado is (A, B, C, D);
    signal Y_atual, Y_prox : estado;
    signal counter : integer range 0 to 3;

begin
    process(clock, reset)
    begin
        if reset = '1' then
            Y_atual <= A;
            counter <= 0;
        elsif rising_edge(clock) then
            Y_atual <= Y_prox;
            counter <= counter + 1;
        end if;
    end process;

    process(Y_atual)
    begin
        case Y_atual is
            when A =>
                andar1 <= '1';
                andar2 <= '0';
                andar3 <= '0';
                andar4 <= '0';

            when B =>
                andar1 <= '0';
                andar2 <= '1';
                andar3 <= '0';
                andar4 <= '0';

            when C =>
                andar1 <= '0';
                andar2 <= '0';
                andar3 <= '1';
                andar4 <= '0';

            when D =>
                andar1 <= '0';
                andar2 <= '0';
                andar3 <= '0';
                andar4 <= '1';
        end case;
    end process;

    process(Y_atual, andar, clock)
    begin
        case Y_atual is
            when A =>
                if andar = "11" then
                    if clock'event and clock = '1' then
                        if counter < 3 then
                            Y_prox <= A;
                            counter <= counter + 1;
                        else
                            Y_prox <= D;
                            counter <= 0;
                        end if;
                    else
                        Y_prox <= A;
                        counter <= 0;
                    end if;
                elsif andar = "10" then
                    if clock'event and clock = '1' then
                        if counter < 2 then
                            Y_prox <= A;
                            counter <= counter + 1;
                        else
                            Y_prox <= C;
                            counter <= 0;
                        end if;
                    else
                        Y_prox <= A;
                        counter <= 0;
                    end if;
                elsif andar = "01" then
                    if clock'event and clock = '1' then
                        Y_prox <= B;
                        counter <= 0;
                    else
                        Y_prox <= A;
                        counter <= 0;
                    end if;
                elsif andar = "00" then
                    Y_prox <= A;
                    counter <= 0;
                end if;

            when B =>
                if andar = "11" then
                    if clock'event and clock = '1' then
                        if counter < 2 then
                            Y_prox <= B;
                            counter <= counter + 1;
                        else
                            Y_prox <= D;
                            counter <= 0;
                        end if;
                    else
                        Y_prox <= B;
                        counter <= 0;
                    end if;
                elsif andar = "10" then
                    if clock'event and clock = '1' then
                        if counter < 1 then
                            Y_prox <= B;
                            counter <= counter + 1;
                        else
                            Y_prox <= C;
                            counter <= 0;
                        end if;
                    else
                        Y_prox <= B;
                        counter <= 0;
                    end if;
                elsif andar = "00" then
                    if clock'event and clock = '1' then
                        if counter < 1 then
                            Y_prox <= B;
                            counter <= counter + 1;
                        else
                            Y_prox <= A;
                            counter <= 0;
                        end if;
                    else
                        Y_prox <= B;
                        counter <= 0;
                    end if;
                elsif andar = "01" then
                    Y_prox <= B;
                    counter <= 0;
                end if;

            when C =>
                if andar = "11" then
                    if clock'event and clock = '1' then
                        Y_prox <= D;
                        counter <= 0;
                    else
                        Y_prox <= C;
                        counter <= 0;
                    end if;
                elsif andar = "10" then
                    Y_prox <= C;
                    counter <= 0;
                elsif andar = "01" then
                    if clock'event and clock = '1' then
                        Y_prox <= B;
                        counter <= 0;
                    else
                        Y_prox <= C;
                        counter <= 0;
                    end if;
                elsif andar = "00" then
                    if clock'event and clock = '1' then
                        if counter < 2 then
                            Y_prox <= C;
                            counter <= counter + 1;
                        else
                            Y_prox <= A;
                            counter <= 0;
                        end if;
                    else
                        Y_prox <= C;
                        counter <= 0;
                    end if;
                end if;

            when D =>
                if andar = "11" then
                    Y_prox <= D;
                    counter <= 0;
                elsif andar = "10" then
                    if clock'event and clock = '1' then
                        Y_prox <= C;
                        counter <= 0;
                    else
                        Y_prox <= D;
                        counter <= 0;
                    end if;
                elsif andar = "01" then
                    if clock'event and clock = '1' then
                        if counter < 2 then
                            Y_prox <= B;
                            counter <= counter + 1;
                        else
                            Y_prox <= D;
                            counter <= 0;
                        end if;
                    else
                        Y_prox <= D;
                        counter <= 0;
                    end if;
                elsif andar = "00" then
                    if clock'event and clock = '1' then
                        if counter < 3 then
                            Y_prox <= B;
                            counter <= counter + 1;
                        else
                            Y_prox <= A;
                            counter <= 0;
                        end if;
                    else
                        Y_prox <= D;
                        counter <= 0;
                    end if;
                end if;
        end case;
    end process;

    
end architecture mainElevador;
