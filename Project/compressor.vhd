library IEEE;
use IEEE.std_logic_1164.all;

--Entity
entity compressor is port
(
	A : in  std_logic_vector(3 downto 0);
	B : in  std_logic_vector(3 downto 0);
	C : in  std_logic_vector(3 downto 0);
	D : in  std_logic_vector(2 downto 0);
	S : out std_logic_vector(18 downto 0)
);
end entity;


-- Architecture
architecture logic of compressor is 
-- Signals
signal cp0, cp1, cp2, cp3 : std_logic_vector(5 downto 0);
signal cp4 : std_logic_vector(7 downto 0);


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

component FA is
port (A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		S: out std_logic;
		Cout: out std_logic);
end component;

begin
----------------------------------- 1° Nível -------------------------------------------------


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
								
----------------------------------- 2° Nível -------------------------------------------------






----------------------------------- 3° Nível -------------------------------------------------




----------------------------------- 4° Nível -------------------------------------------------




end architecture;
