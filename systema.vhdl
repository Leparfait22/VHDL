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

user.email "helomeranda@gmail.com"
user.name "Leparfait"

git config --global user.email "helomeranda@gmail.com"
git config --global user.name "Leparfait22"
