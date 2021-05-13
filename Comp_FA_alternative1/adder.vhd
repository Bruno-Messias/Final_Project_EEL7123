library IEEE;
use IEEE.Std_Logic_1164.all;

entity adder is
generic (n : natural);
port (A: in std_logic_vector((n-1) downto 0);
		B: in std_logic_vector((n-1) downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(n downto 0));
end entity;

architecture circuito_logico of adder is

	signal Cout: std_logic_vector(n downto 0);

component FA_Alternative is
port (A: in std_logic;
 B: in std_logic;
 Cin: in std_logic;
 S: out std_logic;
 Cout: out std_logic);
end component;

begin
Cout(0) <= Cin;

cpa_1 : for j in 0 to (n-1) generate

	cpa_j: FA_Alternative port map( A => A(j), B => B(j), Cin => Cout(j),
	 S =>S(j) , Cout =>Cout(j+1));
 
end generate cpa_1;
S(n) <= Cout(n);

end architecture;