library IEEE;
use IEEE.Std_Logic_1164.all;


ENTITY FA22_3 IS
PORT(
		A0,A1,B0,B1: IN STD_LOGIC;
		S0,S1,COUT0: OUT STD_LOGIC
	  );
END FA22_3;

ARCHITECTURE SOMA22_3 OF FA22_3 IS
SIGNAL CS0: STD_LOGIC;
 COMPONENT FA_Alternative is
		port (A: in std_logic;
				B: in std_logic;
				Cin: in std_logic;
				S: out std_logic;
				Cout: out std_logic
);
end COMPONENT;

COMPONENT HA IS
port (
	A: in std_logic;
	B: in std_logic;
	S: out std_logic;
	Cout: out std_logic
);
end COMPONENT;

BEGIN 
FA1: HA PORT MAP (A0,B0,S0,CS0);
FA2: FA_Alternative PORT MAP (A1,B1,CS0,S1,COUT0);
END SOMA22_3;