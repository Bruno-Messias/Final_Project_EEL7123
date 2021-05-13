library IEEE;
use IEEE.Std_Logic_1164.all;

ENTITY FA3333_44 IS
PORT(
		A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3 : IN STD_LOGIC;
		S0,S1,S2,S3,COUT0,C0UT1,COUT2,COUT3: OUT STD_LOGIC
	  );
END FA3333_44;

ARCHITECTURE SOMA3333_44 OF FA3333_44 IS
 
 COMPONENT FA_Alternative is
		port (A: in std_logic;
				B: in std_logic;
				Cin: in std_logic;
				S: out std_logic;
				Cout: out std_logic
);
end COMPONENT; 


BEGIN 
FA1: FA_Alternative PORT MAP (A0,B0,C0,S0,COUT0);
FA2: FA_Alternative PORT MAP (A1,B1,C1,S1,C0UT1);
FA3: FA_Alternative PORT MAP (A2,B2,C2,S2,COUT2);
FA4: FA_Alternative PORT MAP (A3,B3,C3,S3,COUT3);

END SOMA3333_44;