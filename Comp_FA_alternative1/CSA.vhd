library IEEE;
use IEEE.Std_Logic_1164.all;


entity CSA is 
	generic(n : natural := 18);
	port(
			
			a,b: in std_logic_vector((n-1) downto 0);
		   sel: in std_logic;
			s: out std_logic_vector((n-1) downto 0);
			cout: out std_logic
			
			);
	end CSA;
	
architecture structure of CSA is

component FA_Alternative is
	port(
			a,b,cin: in std_logic;
			s,cout: out std_logic
			);
end component;

component  Mux2_1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Sel : in STD_LOGIC;
           S : out STD_LOGIC);
    end component;
signal aux,saux, aux2,saux2: std_logic_vector((n-1) downto 0);  

begin
FA_Alternative1: FA_Alternative port map(a(0), b(0),'0' , saux(0), aux(0));
FA_Alternative2: FA_Alternative port map(a(1), b(1), aux(0), saux(1), aux(1));
FA_Alternative3: FA_Alternative port map(a(2), b(2), aux(1), saux(2), aux(2));
FA_Alternative4: FA_Alternative port map(a(3), b(3), aux(2), saux(3), aux(3));
FA_Alternative5: FA_Alternative port map(a(4), b(4), aux(3),saux(4), aux(4));
FA_Alternative6: FA_Alternative port map(a(5), b(5), aux(4),  saux(5), aux(5));
FA_Alternative7: FA_Alternative port map(a(6), b(6), aux(5),saux(6), aux(6));
FA_Alternative8: FA_Alternative port map(a(7), b(7), aux(6),saux(7), aux(7));
FA_Alternative9: FA_Alternative port map(a(8), b(8), aux(7),saux(8), aux(8));
FA_Alternative10: FA_Alternative port map(a(9), b(9), aux(8),saux(9), aux(9));
FA_Alternative11: FA_Alternative port map(a(10), b(10), aux(9),saux(10), aux(10));
FA_Alternative12: FA_Alternative port map(a(11), b(11), aux(10),saux(11), aux(11));
FA_Alternative13: FA_Alternative port map(a(12), b(12), aux(11),saux(12), aux(12));
FA_Alternative14: FA_Alternative port map(a(13), b(13), aux(12),saux(13), aux(13));
FA_Alternative15: FA_Alternative port map(a(14), b(14), aux(13),saux(14), aux(14));
FA_Alternative16: FA_Alternative port map(a(15), b(15), aux(14),saux(15), aux(15));
FA_Alternative17: FA_Alternative port map(a(16), b(16), aux(15),saux(16), aux(16));
FA_Alternative18: FA_Alternative port map(a(17), b(17), aux(16),saux(17), aux(17));

-- 2° nível --
FA_Alternative19: FA_Alternative port map(a(0), b(0),'1' , saux2(0), aux2(0));
FA_Alternative20: FA_Alternative port map(a(1), b(1), aux(0), saux2(1), aux2(1));
FA_Alternative21: FA_Alternative port map(a(2), b(2), aux(1), saux2(2), aux2(2));
FA_Alternative22: FA_Alternative port map(a(3), b(3), aux(2), saux2(3), aux2(3));
FA_Alternative23: FA_Alternative port map(a(4), b(4), aux(3), saux2(4), aux2(4));
FA_Alternative24: FA_Alternative port map(a(5), b(5), aux(4), saux2(5), aux2(5));
FA_Alternative25: FA_Alternative port map(a(6), b(6), aux(5), saux2(6), aux2(6));
FA_Alternative26: FA_Alternative port map(a(7), b(7), aux(6), saux2(7), aux2(7));
FA_Alternative27: FA_Alternative port map(a(8), b(8), aux(7), saux2(8), aux2(8));
FA_Alternative28: FA_Alternative port map(a(9), b(9), aux(8), saux2(9), aux2(9));
FA_Alternative29: FA_Alternative port map(a(10), b(10), aux(9),saux2(10), aux2(10));
FA_Alternative30: FA_Alternative port map(a(11), b(11), aux(10),saux2(11), aux2(11));
FA_Alternative31: FA_Alternative port map(a(12), b(12), aux(11),saux2(12), aux2(12));
FA_Alternative32: FA_Alternative port map(a(13), b(13), aux(12),saux2(13), aux2(13));
FA_Alternative33: FA_Alternative port map(a(14), b(14), aux(13),saux2(14), aux2(14));
FA_Alternative34: FA_Alternative port map(a(15), b(15), aux(14),saux2(15), aux2(15));
FA_Alternative35: FA_Alternative port map(a(16), b(16), aux(15),saux2(16), aux2(16));
FA_Alternative36: FA_Alternative port map(a(17), b(17), aux(16),saux2(17), aux2(17));

-- Multiplexers out --
mux1: Mux2_1 port map(saux(0), saux2(0), sel, s(0));
mux2: Mux2_1 port map(saux(1), saux2(1), sel, s(1));
mux3: Mux2_1 port map(saux(2), saux2(2), sel, s(2));
mux4: Mux2_1 port map(saux(3), saux2(3), sel, s(3));
mux5: Mux2_1 port map(saux(4), saux2(4), sel, s(4));
mux6: Mux2_1 port map(saux(5), saux2(5), sel, s(5));
mux7: Mux2_1 port map(saux(6), saux2(6), sel, s(6));
mux8: Mux2_1 port map(saux(7), saux2(7), sel, s(7));
mux9: Mux2_1 port map(saux(8), saux2(8), sel, s(8));
mux10: Mux2_1 port map(saux(9), saux2(9), sel, s(9));
mux11: Mux2_1 port map(saux(10), saux2(10), sel, s(10));
mux12: Mux2_1 port map(saux(11), saux2(11), sel, s(11));
mux13: Mux2_1 port map(saux(12), saux2(12), sel, s(12));
mux14: Mux2_1 port map(saux(13), saux2(13), sel, s(13));
mux15: Mux2_1 port map(saux(14), saux2(14), sel, s(14));
mux16: Mux2_1 port map(saux(15), saux2(15), sel, s(15));
mux17: Mux2_1 port map(saux(16), saux2(16), sel, s(16));
mux18: Mux2_1 port map(saux(17), saux2(17), sel, s(17));

-- Multiplexer Carry out --
mux_out: Mux2_1 port map(aux(17), aux2(17), sel, cout);
end architecture;