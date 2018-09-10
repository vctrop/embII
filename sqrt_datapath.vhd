library ieee;
    use ieee.std_logic_1164.all;
use work.root_package.all;
    
entity sqrt_datapath is
    port(
        input           : in std_logic_vector(15 downto 0);
        clock           : in std_logic;
        inputen_reset   : in std_logic;
        regsen_ready    : in std_logic;
        data_diff       : out std_logic;
        root            : out std_logic_vector(7 downto 0)
    );
end sqrt_datapath;

architecture structural of sqrt_datapath is
    signal square_sum_res       : std_logic_vector(15 downto 0);
    signal square_sum_cout      : std_logic;
    
    signal comp_out             : std_logic;
    
    signal input_reg_q          : std_logic_vector(15 downto 0);
    signal square_reg_q         : std_logic_vector(15 downto 0);
    signal root_reg_q           : std_logic_vector(7 downto 0);
    signal drt_reg_q            : std_logic_vector(7 downto 0);
    signal incremented_drt      : std_logic_vector(7 downto 0);
    
begin
    input_register: entity work.reg_input
        port map(
			d		=> input;
			reset	=> ;                        -- missing
			enable	=> inputen_reset;
			clock   => clock;
			q		=> input_reg_q
		);
        
    
    square_register: entity work.reg_square
        port map(
			d		=> square_sum_res
			reset	=> inputen_reset;
			enable	=> regsen_ready;
			clock	=> clock;
			q		=> square_reg_q
		); 
    
    root_register: entity work.reg_root
        port map(
            d		=> drt_reg_q;
            reset	=> inputen_reset;
            enable	=> regsen_ready;
            clock	=> clock;
            q		=> root_reg_q
        );
    
    drt_register: entity work.reg_drt
        port map(
            d		=> incremented_drt;
            reset	=> inputen_reset;
            enable	=> regsen_ready;
            clock	=> clock;
            q		=> drt_reg_q
        );
    
    drt_adder: entity work.Adder
        generic map(
            ADDER_WIDTH => 8
        )
        port map(
            input0    => 1;
            input1    => drt_reg_q;
            carry_in  => 0;
            result    => incremented_drt;	
            carry_out =>                        -- missing
        );
    
    square_adder: entity work.Adder
        generic map(
            ADDER_WIDTH => 16
        )
        port map(
            input0    => SHIFTED DRT ROOT;      -- missing
            input1    => square_reg_q;
            carry_in  => 1;
            result    => square_sum_res;
            carry_out => square_sum_cout
        );
    
    comparator: entity work.comp_out
        port map(
			A		=> input_reg_q;
			B		=> square_sum_res;
			AltB	=>  comp_out
		);

end structural;