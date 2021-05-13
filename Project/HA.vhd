library IEEE;
use IEEE.Std_Logic_1164.all;

library IEEE;
use IEEE.Std_Logic_1164.all;

entity HA is
port (
	A: in std_logic;
	B: in std_logic;
	S: out std_logic;
	Cout: out std_logic
);
end HA;
architecture half of HA is
BEGIN
	S <= A XOR B;
	COUT <= A AND B;
END half;