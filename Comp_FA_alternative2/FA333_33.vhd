library IEEE;
use IEEE.Std_Logic_1164.all;

ENTITY FA333_33 IS
PORT(
		A0,A1,A2,B0,B1,B2,C0,C1,C2 : IN STD_LOGIC;
		S0,S1,S2,COUT0,C0UT1,COUT2: OUT STD_LOGIC
	  );
END FA333_33;

ARCHITECTURE SOMA333_33 OF FA333_33 IS
 
 COMPONENT FA_Alternative2 is
		port (A: in std_logic;
				B: in std_logic;
				Cin: in std_logic;
				S: out std_logic;
				Cout: out std_logic
);
end COMPONENT; 


BEGIN 
FA1: FA_Alternative2 PORT MAP (A0,B0,C0,S0,COUT0);
FA2: FA_Alternative2 PORT MAP (A1,B1,C1,S1,C0UT1);
FA3: FA_Alternative2 PORT MAP (A2,B2,C2,S2,COUT2);

END SOMA333_33;