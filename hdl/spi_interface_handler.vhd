--------------------------------------------------------------------------------
-- Company: <UF PSSL>
--
-- File: spi_interface_handler.vhd
-- File history:
--      0.1.0: 2021-04-11: Initial commit.
--      0.2.0: 2022-01-11: Myles Edit
--
-- Description: 
--
-- This is the initial iteration of the interface to the SPI handler being used. 
-- It is designed to interface with a TI-DAC121S101EVM but can likely be modified
-- for other devices.
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::400 VF>
-- Author: Mamoon Syed, Myles Clark
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;   

entity spi_interface_handler is
port (
    dds_ready   : IN  std_logic;                        -- Enable SPI output following DDS LUT initialization
    clock       : IN  std_logic;                        -- High frequency clock
    reset_n_in  : IN  std_logic;                        -- You need a reset from the outside world!
	dds_input   : IN  std_logic_vector(11 downto 0);    -- 12 bit input vector from CoreDDS
    reset_n     : OUT std_logic;                        -- Reset line for the SPI module
    enable      : OUT std_logic;                        -- Enable line for transaction
    cpol        : OUT std_logic;                        -- CPOL
    cpha        : OUT std_logic;                        -- CPHA 
    continuous  : OUT std_logic;                        -- Continuous transaction mode
    clk_divider : OUT std_logic_vector(31 downto 0);    -- Integer clock division   !!!
    addr        : OUT std_logic_vector(31 downto 0);    -- Integer address          !!!
    spi_out     : OUT std_logic_vector(15 downto 0);    -- 16 bit output vector containing config
    miso        : OUT std_logic                         -- MISO data (unused in this case)
);
end spi_interface_handler;

architecture architecture_spi_interface_handler of spi_interface_handler is
    -- If you are going to hardcode things, do it right.
    -- Put all config constant settings at the top so they are easier to find.
    -- NO MAGIC NUMBERS IN ARCH!
    constant config         : std_logic_vector(3 downto 0) := "0000";
    constant int_clk_div    : integer   := 0;   -- Currently set to full speed transfer.   
    constant int_addr       : integer   := 0;   -- There is a single device.
    constant cpol_set       : std_logic := '0'; -- Clock polarity yanked from datasheet.
    constant cpha_set       : std_logic := '1'; -- Clock phase yanked from datasheet
    constant cont_set       : std_logic := '0'; -- Remains to be seen if this is a good idea.
    constant seq_clk_div    : integer   := 25;

    -- Only set default values if you are going to use them in combinatorial logic that
    -- may not have initialised by the time they are needed.
	signal data_out     : std_logic_vector(15 downto 0);            -- Concatenate the data here.
    -- signal enable_out   : std_logic;                                -- State machine output enable.
    signal counter      : integer;
    

begin
    -- I like to put the combinatorial logic stuff at the top.

    reset_n      <= reset_n_in;          -- Copy the reset from the power on reset logic input.
    -- You aren't ever reading enable, so you can use it directly from the port list.
    -- Make a buffer if you need to read from it as well, or use a INOUT port type (though I've never tried that).
    -- enable       <= enable_out;          -- Enable is being set low for first and last cycle (18 cycle loop)
    cpol         <= cpol_set;
    cpha         <= cpha_set;
    continuous   <= cont_set;
    
    clk_divider  <= std_logic_vector(to_unsigned(int_clk_div, clk_divider'length));
    addr         <= std_logic_vector(to_unsigned(int_addr, addr'length));

    -- It appears that the DDS output is undefined while it is starting up, don't pass this on to
    -- the SPI controller, you have the ready flag to check for that.
    spi_out     <= data_out when dds_ready = '1' else (others => '0');

    -- Best not to leave this floating.
    miso        <= '0';

    -- Always use resets.
    Sequencer: process(clock, reset_n_in)
    begin
        if reset_n_in = '0' then
            -- This is an async reset, which I prefer over sync ones, but it depends on the application.
            counter     <= 0;
            -- enable_out  <= '0'; -- If you had needed this to be a buffer, needs to be reset here.
            data_out    <= (others => '0');
        elsif rising_edge(clock) then
                counter <= counter + 1;
                
                -- Start this clock cycle with the enable being set to zero by default.
                -- Any further calls lower down will override this.
                enable  <= '0';
                
                -- If I see you use an if statement like that again I may need to take drastic action.
                -- There is likely a better way to do this still but fine for now.
                case counter is
                    when 4 =>
                        data_out <= config & dds_input; -- Update the data output here
                    when 5 =>
                        enable <= '1';              -- Latch data to the SPI driver here
                    when seq_clk_div =>
                        -- Usually I'd have this be part of the counter, but this seems fine.
                        counter <= 0;
                    when others => null; -- Always need to include the default case.
                end case;
        end if;
    end process Sequencer;

    -- process(clock) begin
    --     if (rising_edge(clock)) then
    --         counter <= counter + 1;
            
    --         -- I'm sorry. You should be.
    --         if (counter = 1) then
    --             enable_out <= '0';
    --         elsif (counter = 2) then
    --             enable_out <= '0';
    --         elsif (counter = 3) then
    --             enable_out <= '0';
    --         elsif (counter = 4) then
    --             enable_out <= '0';
    --             data_out <= config & dds_input;     -- Update the data output here
    --         elsif (counter = 5) then
    --             enable_out <= '1';                  -- Latch data to the SPI driver here
    --         elsif (counter = 6) then
    --             enable_out <= '0';
    --         elsif (counter = 7) then
    --             enable_out <= '0';
    --         elsif (counter = 8) then
    --             enable_out <= '0';
    --         elsif (counter = 9) then
    --             enable_out <= '0';
    --         elsif (counter = 10) then
    --             enable_out <= '0';
    --         elsif (counter = 11) then
    --             enable_out <= '0';
    --         elsif (counter = 12) then
    --             enable_out <= '0';
    --         elsif (counter = 13) then
    --             enable_out <= '0';
    --         elsif (counter = 14) then
    --             enable_out <= '0';
    --         elsif (counter = 15) then
    --             enable_out <= '0';
    --         elsif (counter = 16) then
    --             enable_out <= '0';
    --         elsif (counter = 17) then
    --             enable_out <= '0';
    --         elsif (counter = 18) then
    --             enable_out <= '0';
    --         elsif (counter = 19) then
    --             enable_out <= '0';
    --         elsif (counter = 20) then
    --             enable_out <= '0';
    --         elsif (counter = 21) then
    --             enable_out <= '0';
    --         elsif (counter = 22) then
    --             enable_out <= '0';
    --         elsif (counter = 23) then
    --             enable_out <= '0';
    --         elsif (counter = 24) then
    --             enable_out <= '0';
    --         elsif (counter = 25) then
    --             enable_out <= '0';
    --             counter <= 0;
    --         end if;
    --     end if;
    -- end process;
end architecture_spi_interface_handler;
