library IEEE;
use IEEE.Std_Logic_1164.all;

entity FA_Alternative2 is
	port(
			a,b,cin: in std_logic;
			s,cout: out std_logic
			);
end FA_Alternative2;

architecture structure of FA_Alternative2 is
signal aux1, aux2, aux3: std_logic;
begin

s <= a xor b xor cin;
aux1 <= a and b;
aux2 <= a and cin;
aux3 <= b and cin;
cout <= aux1 or aux2 or aux3;
end architecture;