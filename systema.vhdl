entity entJanelas is
  port (
    j1: in STD_logic;
    j2: in STD_logic;
    j3: in STD_logic;
    janela : out STD_logic
  ) ;
end entJanelas;

architecture archJanelas of entJanelas is

    signal 

begin
    janelas <= j1 and j2 and j3;
end archJanelas ; -- arch