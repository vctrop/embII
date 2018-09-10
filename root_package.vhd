library ieee;
	use ieee.std_logic_1164.all;
	
package root_package is

	component FFD_set is
		port (
			d		: in std_logic;
			set		: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
	end component;
	
	component FFD_rst is
		port (
			d		: in std_logic;
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
	end component;

	component reg_input is
		port (
			d		: in std_logic_vector(15 downto 0);
			--reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic_vector(15 downto 0)
		);
	end component;
    
    component reg_square is
    	port (
			d		: in std_logic_vector(15 downto 0);
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic_vector(15 downto 0)
		);    
    end component;
    
    component reg_root is
        port (
                d		: in std_logic_vector(7 downto 0);
                reset	: in std_logic;
                enable	: in std_logic;
                clock	: in std_logic;
                q		: out std_logic_vector(7 downto 0)
        );
    end component;
    
    component reg_drt is
        port (
                d		: in std_logic_vector(7 downto 0);
                reset	: in std_logic;
                enable	: in std_logic;
                clock	: in std_logic;
                q		: out std_logic_vector(7 downto 0)
        );
    end component;
    
	component comp is
		port (
			A		: in std_logic_vector(15 downto 0);
			B		: in std_logic_vector(15 downto 0);
			AltB	: out std_logic
		);
	end component;
    
    component left_log_shift is
        port (
            inp_8bits	    : in std_logic_vector(7 downto 0);
            out_16bits	    : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component or_1bit is
        port (
            inp1	    : in std_logic;
            inp2	    : in std_logic;
            outp	    : out std_logic
        );
    end component;
	
	component sqrt_datapath is
		port(
			input           : in std_logic_vector(15 downto 0);
			clock           : in std_logic;
			inputen_reset   : in std_logic;
			regsen_ready    : in std_logic;
			data_diff       : out std_logic;
			root            : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component sqrt_ctrlpath is
		port (
			clock			: in std_logic;
			reset			: in std_logic;
			diff			: in std_logic;
			regsen_ready	: out std_logic;
			inputen_reset	: out std_logic;
		);
	end component;	
	
end root_package;
	