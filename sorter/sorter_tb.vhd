library IEEE;
use IEEE.std_logic_1164.all;
use work.sorter_pkg.all;

entity sorter_tb is
end sorter_tb;

architecture tb of sorter_tb is

	signal A_s		: std_logic_vector(159 downto 0);
	alias A0		: std_logic_vector(15 downto 0) is A_s(15 downto 0);
	alias A1		: std_logic_vector(15 downto 0) is A_s(31 downto 16);
	alias A2		: std_logic_vector(15 downto 0) is A_s(47 downto 32);
	alias A3		: std_logic_vector(15 downto 0) is A_s(63 downto 48);
	alias A4		: std_logic_vector(15 downto 0) is A_s(79 downto 64);
	alias A5		: std_logic_vector(15 downto 0) is A_s(95 downto 80);
	alias A6		: std_logic_vector(15 downto 0) is A_s(111 downto 96);
	alias A7		: std_logic_vector(15 downto 0) is A_s(127 downto 112);
	alias A8		: std_logic_vector(15 downto 0) is A_s(143 downto 128);
	alias A9		: std_logic_vector(15 downto 0) is A_s(159 downto 144);
	
	signal rst_s	: std_logic := '1';
	signal clk_s	: std_logic := '0';
	
	signal G_s		: std_logic_vector(159 downto 0);
	alias G0		: std_logic_vector(15 downto 0) is G_s(15 downto 0);
	alias G1		: std_logic_vector(15 downto 0) is G_s(31 downto 16);
	alias G2		: std_logic_vector(15 downto 0) is G_s(47 downto 32);
	alias G3		: std_logic_vector(15 downto 0) is G_s(63 downto 48);
	alias G4		: std_logic_vector(15 downto 0) is G_s(79 downto 64);
	alias G5		: std_logic_vector(15 downto 0) is G_s(95 downto 80);
	alias G6		: std_logic_vector(15 downto 0) is G_s(111 downto 96);
	alias G7		: std_logic_vector(15 downto 0) is G_s(127 downto 112);
	alias G8		: std_logic_vector(15 downto 0) is G_s(143 downto 128);
	alias G9		: std_logic_vector(15 downto 0) is G_s(159 downto 144);
	
	signal rdy_s	: std_logic;
	
	component sorter
	port (
			A_i		: in input_type;
			rst		: in std_logic;
			clk		: in std_logic;
			G_o		: out input_type;
			rdy_o	: out std_logic
		);
	end component;
	
begin

	clk_s <= not clk_s after 5 ns;

	DUV: entity work.sorter
        port map (
            A_i         => A_s,
            rst         => rst_s,
            clk			=> clk_s,
            G_o      	=> G_s, 
            rdy_o		=> rdy_s
        );
		
	process
	begin
	
		A_s(0) <= x"0001";
		A_s(1) <= x"0002";
		A_s(2) <= x"0003";
		A_s(3) <= x"0004";
		A_s(4) <= x"0005";
		A_s(5) <= x"0006";
		A_s(6) <= x"0007";
		A_s(7) <= x"0008";
		A_s(8) <= x"0009";
		A_s(9) <= x"000A";
		
		wait for 15 ns;
		
		rst_s <= '0';
		
		wait for 20 ns;
		
		A_s(0) <= x"FFFF";
		A_s(1) <= x"FFFE";
		A_s(2) <= x"FFFD";
		A_s(3) <= x"FFFC";
		A_s(4) <= x"FFFB";
		A_s(5) <= x"FFFA";
		A_s(6) <= x"FFF9";
		A_s(7) <= x"FFF8";
		A_s(8) <= x"FFF7";
		A_s(9) <= x"FFF6";
		rst_s <= '1';
		
		wait for 20 ns;
		
		rst_s <= '0';
		
		wait;
		
	end process;
	
end tb;