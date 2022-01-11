--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: interfaceTester.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::400 VF>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity interfaceTester is
port (
    --<port_name> : <direction> <type>;
	clk : IN  std_logic; -- example
    dds_out : OUT std_logic_vector(11 downto 0)  -- example
    --<other_ports>;
);
end interfaceTester;
architecture architecture_interfaceTester of interfaceTester is
	signal temp : std_logic_vector(11 downto 0) := "000000111111"; -- example

begin
    process(clk) begin
        if(rising_edge(clk)) then
            temp <= NOT temp;
        end if;
    end process;
   -- architecture body
   dds_out <= temp;
end architecture_interfaceTester;
