library IEEE;
use IEEE.Std_Logic_1164.all;

entity FA_Alternative is
	port(
			a,b,cin: in std_logic;
			s,cout: out std_logic
			);
end FA_Alternative;

architecture structure of FA_Alternative is
signal aux1,aux2: std_logic;
begin
aux1 <= a xor b;
s <= aux1 xor cin;
aux2 <= a nand b;
cout <= aux2 nand (aux1 nand cin);

end architecture; 