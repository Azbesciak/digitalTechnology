library ieee;
use ieee.std_logic_1164.all;

entity FourBitMultiplier is 
	port(
		SW : IN std_logic_vector(7 downto 0);
		KEY0: IN std_logic;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT std_logic_vector (6 downto 0);
		LEDR: out std_logic_vector(7 downto 0)
	);
end FourBitMultiplier;

architecture impl of FourBitMultiplier is
	component OneBitAdder is
	port(
		A, B, CIN: IN std_logic;
		S, COUT: OUT std_logic
	);
	end component;
	component HexDisplay is
		port(
			input: in std_logic_vector(3 downto 0);
			display: out std_logic_vector(6 downto 0)
		);
	end component;
	signal c0: std_logic_vector(4 downto 0) := "00000";
	signal c1: std_logic_vector(4 downto 0) := "00000";
	signal c2: std_logic_vector(4 downto 0) := "00000";
	signal line2: std_logic_vector(2 downto 0) := "000";
	signal line3: std_logic_vector(2 downto 0) := "000";
	signal buf: std_logic_vector(7 downto 0) := "00000000";
	signal ledrOut: std_logic_vector(7 downto 0) := "00000000";
begin
	H0: HexDisplay port map(
		ledrOut(3 downto 0), HEX0(6 downto 0)
	);
	H1: HexDisplay port map(
		ledrOut(7 downto 4), HEX1(6 downto 0)
	);
	HEX2 <= "1101110"; -- = sign
	H3: HexDisplay port map(
		SW(3 downto 0), HEX3(6 downto 0)
	);
	HEX4 <= "0010010"; -- multiplication sign
	H5: HexDisplay port map(
		SW(7 downto 4), HEX5(6 downto 0)
	);
	--1st line of adders
	add01: OneBitAdder port map(
		SW(5) and SW(0), SW(4) and SW(1), c0(0), buf(1), C0(1) 
	);
	add11: OneBitAdder port map(
		SW(6) and SW(0), SW(5) and SW(1), c0(1), line2(0), C0(2) 
	);
	add21: OneBitAdder port map(
		SW(7) and SW(0), SW(6) and SW(1), c0(2), line2(1), C0(3) 
	);
	add31: OneBitAdder port map(
		'0', SW(7) and SW(1), c0(0), line2(2),  C0(4) 
	);
	--2nd line of adders
	add02: OneBitAdder port map(
		line2(0), SW(4) and SW(2), c1(0), buf(2), C1(1) 
	);
	add12: OneBitAdder port map(
		line2(1), SW(5) and SW(2), c1(1), line3(0), C1(2) 
	);
	add22: OneBitAdder port map(
		line2(2), SW(6) and SW(2), c1(2), line3(1), C1(3) 
	);
	add32: OneBitAdder port map(
		C0(4), SW(7) and SW(2), c1(3), line3(2), C1(4) 
	);
	--3th line of adders
	add03: OneBitAdder port map(
		line3(0), SW(4) and SW(3), c2(0), buf(3), C2(1) 
	);
	add13: OneBitAdder port map(
		line3(1), SW(5) and SW(3), c2(1), buf(4), C2(2) 
	);
	add23: OneBitAdder port map(
		line3(2), SW(6) and SW(3), c2(2), buf(5), C2(3) 
	);
	add33: OneBitAdder port map(
		C1(4), SW(7) and SW(3), c2(3), buf(6), buf(7) 
	);
	--others 
	process (KEY0)
	begin
		if rising_edge(KEY0) then
			ledrOut(0) <= SW(4) and SW(0);
			ledrOut(7 downto 1) <= buf(7 downto 1);
			LEDR(0) <= SW(4) and SW(0);
			LEDR(7 downto 1) <= buf(7 downto 1);
		end if;
	end process;

end;