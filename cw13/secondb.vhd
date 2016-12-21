Library ieee;
use ieee.std_logic_1164.all;

entity secondb is
	port(
		A, B, C: buffer std_logic;
		CLK: in std_logic
	);
end secondb;

architecture solution of secondb is
	component jk
		port( 
			J,K, CLK : IN std_logic;
			Q: OUT std_logic
		);
	end component;
	begin
		jk2: jk port map(
			'1', C or B, CLK, A
		);
		
		jk1: jk port map(
			A and not(C), C, CLK, B
		);
		
		jk0: jk port map(
			not(A) and B, A and not(B), CLK, C
		);
		
	end solution;
	
Library ieee;
use ieee.std_logic_1164.all;
	
entity jk is
	port( 
			J,K, CLK : IN std_logic;
			Q: OUT std_logic
		);
end jk;

architecture impl of jk is
	signal temp: std_logic;
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if (J = '0' and K = '0') then 
				temp <= temp;
			elsif (J = '0' and K = '1') then
				temp <= '0';
			elsif (J = '1' and K = '0') then	
				temp <= '1';
			elsif (J = '1' and K = '1') then
				temp <= not(temp);
			end if;
		end if;
	end process;
	Q <= temp;
end impl;
		
		