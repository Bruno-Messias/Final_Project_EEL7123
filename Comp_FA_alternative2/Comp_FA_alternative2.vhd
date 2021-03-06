library IEEE;
use IEEE.std_logic_1164.all;

--Entity
entity Comp_FA_alternative2 is port
(
	A : in  std_logic_vector(3 downto 0);
	B : in  std_logic_vector(3 downto 0);
	C : in  std_logic_vector(3 downto 0);
	D : in  std_logic_vector(2 downto 0);
	S : out std_logic_vector(17 downto 0)
);
end entity;


-- Architecture
architecture logic of Comp_FA_alternative2 is 
-- Signals
signal cp0, cp1, cp2, cp3, cp6, cp9, cp11, cp12, cp13 : std_logic_vector(5 downto 0);
signal cp4, cp5, cp8, cp10, cp14 : std_logic_vector(7 downto 0);
signal cp7 : std_logic_vector(2 downto 0);
signal not_D0, cout : std_logic;

signal A_sum, B_sum : std_logic_vector(17 downto 0);

--Components
component FA22_3 IS
PORT(
	A0,A1,B0,B1: IN STD_LOGIC;
	S0,S1,COUT0: OUT STD_LOGIC);
end component;

component FA333_33 IS
PORT(
	A0,A1,A2,B0,B1,B2,C0,C1,C2 : IN STD_LOGIC;
	S0,S1,S2,COUT0,C0UT1,COUT2: OUT STD_LOGIC);
end component;

component FA3333_44 IS
PORT(
		A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3 : IN STD_LOGIC;
		S0,S1,S2,S3,COUT0,C0UT1,COUT2,COUT3: OUT STD_LOGIC
	  );
end component;

component CSA is 
generic(n : natural := 18);
port(
	a,b: in std_logic_vector((n-1) downto 0);
	sel: in std_logic;
	s: out std_logic_vector((n-1) downto 0);
	cout: out std_logic);
end component;

begin

not_D0 <= not(D(0));

----------------------------------- 1° Nível ----------------------------------------------------


Comp0: FA333_33 port map(B(1), B(2), B(3), C(1), C(2), C(3), D(0), D(1), D(2),
								cp0(0), cp0(1), cp0(2), cp0(3), cp0(4), cp0(5));

Comp1: FA333_33 port map(D(0), A(3), C(0), A(3), A(3), C(0), A(2), A(3), C(0), 
								cp1(0), cp1(1), cp1(2), cp1(3), cp1(4), cp1(5));

Comp2: FA333_33 port map(A(1), A(2), A(3), A(0), A(1), A(2), C(1), A(0), A(1),
								cp2(0), cp2(1), cp2(2), cp2(3), cp2(4), cp2(5));

Comp3: FA333_33 port map(A(0), A(1), A(2), D(0), D(1), D(2), '1', A(3), A(3),
								cp3(0), cp3(1), cp3(2), cp3(3), cp3(4), cp3(5));

Comp4: FA3333_44 port map(C(2), A(0), A(1), A(2), C(0), B(0), B(1), B(2), D(1), C(3), C(2), C(3),
								cp4(0), cp4(1), cp4(2), cp4(3), cp4(4), cp4(5), cp4(6), cp4(7));
								
----------------------------------- 2° Nível ------------------------------------------------------

Comp5: FA3333_44 port map(cp2(2), cp2(5), cp1(1), cp1(2), cp2(4), cp1(0), cp1(3), cp1(4), 
									cp4(1), cp4(2), cp4(3), cp4(7),
									cp5(0), cp5(1), cp5(2), cp5(3), cp5(4), cp5(5), cp5(6), cp5(7));

Comp6: FA333_33 port map(A(0), cp2(0), cp2(1), C(0), D(0), cp2(3), C(1), C(1), cp4(0),
									cp6(0), cp6(1), cp6(2), cp6(3), cp6(4), cp6(5));

Comp7: FA22_3 port map(cp3(1), cp3(2), cp3(3), cp3(4),
								cp7(0), cp7(1), cp7(2));

Comp8: FA3333_44 port map(cp4(4), cp4(5), cp4(6), C(0), not_D0, D(1), D(2), B(3),
									B(0), B(0), B(0), B(0),
									cp8(0), cp8(1), cp8(2), cp8(3), cp8(4),cp8(5), cp8(6), cp8(7));

Comp9: FA333_33 port map(C(1), C(1), D(2), B(0), C(1), D(2), B(0), B(0), B(0),
									cp9(0), cp9(1), cp9(2), cp9(3), cp9(4), cp9(5));


----------------------------------- 3° Nível ------------------------------------------------------- 

Comp10: FA3333_44 port map(cp5(1), cp5(2), cp5(3), cp1(5), cp5(4), cp5(5), cp5(6), B(0), 
									cp8(1), cp8(2), cp8(3), cp5(7),
									cp10(0), cp10(1), cp10(2), cp10(3), cp10(4), cp10(5), cp10(6), cp10(7));

Comp11: FA333_33 port map(cp6(1), cp6(2), cp6(5), cp6(3), cp6(4), cp9(5), cp9(1), cp9(2), cp5(0),
									cp11(0), cp11(1), cp11(2), cp11(3), cp11(4), cp11(5));

----------------------------------- 4° Nível ------------------------------------------------------- 

Comp12: FA333_33 port map(cp10(1), cp10(2), cp10(3), cp10(4), cp10(5), cp10(6), cp8(5), cp8(6), cp8(7),
									cp12(0), cp12(1), cp12(2), cp12(3), cp12(4), cp12(5));

Comp13: FA333_33 port map(cp11(1), cp11(2), cp11(5), cp11(3), cp11(4), cp10(0), cp9(4), cp8(0), cp8(4),
									cp13(0), cp13(1), cp13(2), cp13(3), cp13(4), cp13(5));

----------------------------------- SUM - CSA ----------------------------------------------------------------------------------------

A_sum <= cp0(5) & cp0(2) & cp0(1 downto 0) & cp10(7) & cp12(2 downto 1) & cp13(5) & cp13(2 downto 0) & cp11(0) & cp6(0) & '0' & cp7(2 downto 0) & cp3(0);
B_sum <=  '0' & cp0(4 downto 3) & '0' & cp12(5 downto 3) & cp12(0) & cp13(4 downto 3) & '0' & cp9(3) & cp9(0) & '0' &  cp3(5) & '0' & A(3) & '0';

SUM: CSA port map(A_sum, B_sum, '0', S, cout);



end architecture;
