LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CW4 IS
	port(
		SW: IN std_logic_vector(17 downto 0);
		HEX0: OUT std_logic_vector(0 to 6);
		HEX1: OUT std_logic_vector(0 to 6);
		HEX2: OUT std_logic_vector(0 to 6);
		HEX3: OUT std_logic_vector(0 to 6);
		HEX4: OUT std_logic_vector(0 to 6);
		HEX5: OUT std_logic_vector(0 to 6);
		HEX6: OUT std_logic_vector(0 to 6);
		HEX7: OUT std_logic_vector(0 to 6)
	);
END CW4;

ARCHITECTURE strukturalna OF CW4 IS
	CONSTANT space : std_logic_vector(2 downto 0) := "111";
	
	COMPONENT mux3bit8to1
		port(
			S, U0, U1, U2, U3, U4, U5, U6, U7: 
				IN	std_logic_vector(2 downto 0);
			M0: OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;
	
	COMPONENT char7seg
		port(
			C : IN std_logic_vector(2 downto 0);
			DISPLAY : OUT std_logic_vector(0 to 6)
		);
	END COMPONENT;
	
	SIGNAL M0: std_logic_vector(2 downto 0);
	SIGNAL M1: std_logic_vector(2 downto 0);
	SIGNAL M2: std_logic_vector(2 downto 0);
	SIGNAL M3: std_logic_vector(2 downto 0);
	SIGNAL M4: std_logic_vector(2 downto 0);
	SIGNAL M5: std_logic_vector(2 downto 0);
	SIGNAL M6: std_logic_vector(2 downto 0);
	SIGNAL M7: std_logic_vector(2 downto 0);
	
	BEGIN
		MUX0: mux3bit8to1 port map(
			SW(17 downto 15), SW(14 downto 12), SW(11 downto 9), SW(8 downto 6), SW(5 downto 3), SW(2 downto 0), space, space, space, M0
		);
		MUX1: mux3bit8to1 port map(
			SW(17 downto 15), SW(11 downto 9), SW(8 downto 6), SW(5 downto 3), SW(2 downto 0), space, space, space, SW(14 downto 12), M1
		);
		MUX2: mux3bit8to1 port map(
			SW(17 downto 15), SW(8 downto 6), SW(5 downto 3), SW(2 downto 0),	space, space, space, SW(14 downto 12), SW(11 downto 9), M2
		);
		MUX3: mux3bit8to1 port map(
			SW(17 downto 15), SW(5 downto 3), SW(2 downto 0), space, space, space, SW(14 downto 12), SW(11 downto 9),SW(8 downto 6), M3
		);
		MUX4: mux3bit8to1 port map(
			SW(17 downto 15),SW(2 downto 0), space, space, space, SW(14 downto 12), SW(11 downto 9), SW(8 downto 6), SW(5 downto 3), M4
		);
		MUX5: mux3bit8to1 port map(
			SW(17 downto 15), space, space, space, SW(14 downto 12), SW(11 downto 9), SW(8 downto 6), SW(5 downto 3),  SW(2 downto 0), M5
		);
		MUX6: mux3bit8to1 port map(
			SW(17 downto 15), space, space, SW(14 downto 12), SW(11 downto 9), SW(8 downto 6), SW(5 downto 3),  SW(2 downto 0),space, M6
		);
		MUX7: mux3bit8to1 port map(
			SW(17 downto 15), space, SW(14 downto 12), SW(11 downto 9), SW(8 downto 6), SW(5 downto 3),  SW(2 downto 0),space, space, M7
		);
		
		H0: char7seg port map(M0, HEX0);
		H1: char7seg port map(M1, HEX1);
		H2: char7seg port map(M2, HEX2);
		H3: char7seg port map(M3, HEX3);
		H4: char7seg port map(M4, HEX4);
		H5: char7seg port map(M5, HEX5);
		H6: char7seg port map(M6, HEX6);
		H7: char7seg port map(M7, HEX7);
END strukturalna;
	
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux3bit8to1 IS 
	port(
		S, U0, U1, U2, U3, U4, U5, U6, U7: 
			IN std_logic_vector(2 downto 0);
		M0: OUT std_logic_vector(2 downto 0) --było M
	);
END mux3bit8to1;

ARCHITECTURE strukturalna OF mux3bit8to1 IS
	signal output : std_logic_vector(2 downto 0);
	
	begin
		with s select
			output <= U0 when "000",
						 U1 when "001",
						 U2 when "010",
						 U3 when "011",
						 U4 when "100",
						 U5 when "101",
						 U6 when "110",
						 U7 when "111",
						 "---" when others;
		M0 <= output;
	
END strukturalna;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY char7seg IS
	port(
		C : IN std_logic_vector(2 downto 0);
		DISPLAY : OUT std_logic_vector(0 to 6)
	);
END char7seg;

ARCHITECTURE strukturalna of char7seg IS
	signal output : std_logic_vector(0 to 6);
	begin	
		with c select	
			output <= "1001111" when "000",
						"1000011" when "001",
						"1110001" when "010",
						"0000001" when "011",
						"0011000" when "100",
						"1111111" when others;
		display <= output;
END strukturalna;

