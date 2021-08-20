-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_Random_Generator.vhd
-- Created: 2021-08-19 15:10:31
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_Random_Generator
-- Source Path: OFDM_Tx_HW/OFDMTx/DataGenerator/RF Signal Generator/Random Generator
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_tx_src_Random_Generator IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_12_0                        :   IN    std_logic;
        Reset_1                           :   IN    std_logic;
        Enable                            :   IN    std_logic;
        Data                              :   OUT   std_logic_vector(9 DOWNTO 0)  -- ufix10
        );
END ofdm_tx_src_Random_Generator;


ARCHITECTURE rtl OF ofdm_tx_src_Random_Generator IS

  -- Component Declarations
  COMPONENT ofdm_tx_src_Subsystem
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          LFSR1                           :   OUT   std_logic;
          LFSR2                           :   OUT   std_logic;
          LFSR3                           :   OUT   std_logic;
          LFSR4                           :   OUT   std_logic;
          LFSR5                           :   OUT   std_logic;
          LFSR6                           :   OUT   std_logic;
          LFSR7                           :   OUT   std_logic;
          LFSR8                           :   OUT   std_logic;
          LFSR9                           :   OUT   std_logic;
          LFSR10                          :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_tx_src_Subsystem
    USE ENTITY work.ofdm_tx_src_Subsystem(rtl);

  -- Signals
  SIGNAL Reset_2                          : std_logic;
  SIGNAL Subsystem_out1                   : std_logic;
  SIGNAL Subsystem_out2                   : std_logic;
  SIGNAL Subsystem_out3                   : std_logic;
  SIGNAL Subsystem_out4                   : std_logic;
  SIGNAL Subsystem_out5                   : std_logic;
  SIGNAL Subsystem_out6                   : std_logic;
  SIGNAL Subsystem_out7                   : std_logic;
  SIGNAL Subsystem_out8                   : std_logic;
  SIGNAL Subsystem_out9                   : std_logic;
  SIGNAL Subsystem_out10                  : std_logic;
  SIGNAL Bit_Concat1_out1                 : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay_iv                         : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay_delOut                     : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay_ectrl                      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay_toDelay                    : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay_bypassIn                   : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay_out1                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay_last_value                 : unsigned(9 DOWNTO 0);  -- ufix10

BEGIN
  u_Subsystem : ofdm_tx_src_Subsystem
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Reset_1 => Reset_2,
              Enable => Enable,
              LFSR1 => Subsystem_out1,
              LFSR2 => Subsystem_out2,
              LFSR3 => Subsystem_out3,
              LFSR4 => Subsystem_out4,
              LFSR5 => Subsystem_out5,
              LFSR6 => Subsystem_out6,
              LFSR7 => Subsystem_out7,
              LFSR8 => Subsystem_out8,
              LFSR9 => Subsystem_out9,
              LFSR10 => Subsystem_out10
              );

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Reset_2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Reset_2 <= Reset_1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  Bit_Concat1_out1 <= unsigned'(Subsystem_out1 & Subsystem_out2 & Subsystem_out3 & Subsystem_out4 & Subsystem_out5 & Subsystem_out6 & Subsystem_out7 & Subsystem_out8 & Subsystem_out9 & Subsystem_out10);

  Delay_iv <= to_unsigned(16#000#, 10);

  
  Delay_ectrl <= Delay_delOut WHEN Enable = '0' ELSE
      Bit_Concat1_out1;

  
  Delay_toDelay <= Delay_ectrl WHEN Reset_2 = '0' ELSE
      Delay_iv;

  Delay_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_delOut <= to_unsigned(16#000#, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Delay_delOut <= Delay_toDelay;
      END IF;
    END IF;
  END PROCESS Delay_lowered_process;


  
  Delay_bypassIn <= Delay_delOut WHEN Reset_2 = '0' ELSE
      Delay_iv;

  Delay_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_last_value <= to_unsigned(16#000#, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Delay_last_value <= Delay_out1;
      END IF;
    END IF;
  END PROCESS Delay_bypass_process;


  
  Delay_out1 <= Delay_last_value WHEN Enable = '0' ELSE
      Delay_bypassIn;

  Data <= std_logic_vector(Delay_out1);

END rtl;

