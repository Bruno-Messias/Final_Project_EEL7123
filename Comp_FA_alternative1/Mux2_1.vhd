library IEEE;
 use IEEE.STD_LOGIC_1164.all;
 
 entity Mux2_1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Sel : in STD_LOGIC;
           S : out STD_LOGIC);
 end Mux2_1;
 
 architecture Mux of Mux2_1 is
 
 begin
      S <= A when Sel='0' else B;
 end architecture;
 