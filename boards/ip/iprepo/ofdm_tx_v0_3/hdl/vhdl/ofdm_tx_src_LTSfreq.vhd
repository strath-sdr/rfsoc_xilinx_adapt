-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_LTSfreq.vhd
-- Created: 2021-08-19 15:10:31
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_LTSfreq
-- Source Path: OFDM_Tx_HW/OFDMTx/DataGenerator/LTSfreq
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_tx_src_OFDMTx_pkg.ALL;

ENTITY ofdm_tx_src_LTSfreq IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_12_0                        :   IN    std_logic;
        enb_1_12_1                        :   IN    std_logic;
        enb                               :   IN    std_logic;
        preambVal                         :   IN    std_logic;
        ltsFreq                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        ltsVal                            :   OUT   std_logic
        );
END ofdm_tx_src_LTSfreq;


ARCHITECTURE rtl OF ofdm_tx_src_LTSfreq IS

  -- Constants
  CONSTANT LTSFreq_data                   : vector_of_signed16(0 TO 63) := 
    (to_signed(16#0000#, 16), to_signed(16#0000#, 16), to_signed(16#0000#, 16), to_signed(16#0000#, 16),
     to_signed(16#0000#, 16), to_signed(16#0000#, 16), to_signed(16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(-16#4000#, 16), to_signed(-16#4000#, 16), to_signed(16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(-16#4000#, 16), to_signed(16#4000#, 16), to_signed(-16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(16#4000#, 16), to_signed(16#4000#, 16), to_signed(16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(16#4000#, 16), to_signed(-16#4000#, 16), to_signed(-16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(16#4000#, 16), to_signed(-16#4000#, 16), to_signed(16#4000#, 16), to_signed(-16#4000#, 16),
     to_signed(16#4000#, 16), to_signed(16#4000#, 16), to_signed(16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(16#0000#, 16), to_signed(16#4000#, 16), to_signed(-16#4000#, 16), to_signed(-16#4000#, 16),
     to_signed(16#4000#, 16), to_signed(16#4000#, 16), to_signed(-16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(-16#4000#, 16), to_signed(16#4000#, 16), to_signed(-16#4000#, 16), to_signed(-16#4000#, 16),
     to_signed(-16#4000#, 16), to_signed(-16#4000#, 16), to_signed(-16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(16#4000#, 16), to_signed(-16#4000#, 16), to_signed(-16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(-16#4000#, 16), to_signed(16#4000#, 16), to_signed(-16#4000#, 16), to_signed(16#4000#, 16),
     to_signed(16#4000#, 16), to_signed(16#4000#, 16), to_signed(16#4000#, 16), to_signed(16#0000#, 16),
     to_signed(16#0000#, 16), to_signed(16#0000#, 16), to_signed(16#0000#, 16), to_signed(16#0000#, 16));  -- sfix16 [64]

  -- Signals
  SIGNAL NOT_out1                         : std_logic;
  SIGNAL HDL_Counter1_out1                : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL HDL_Counter1_out1_1              : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL preambVal_1                      : std_logic;
  SIGNAL AND1_out1                        : std_logic;
  SIGNAL HDL_Counter41_bypass_reg         : std_logic;  -- ufix1
  SIGNAL AND1_out1_1                      : std_logic;
  SIGNAL HDL_Counter4_out1                : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL HDL_Counter4_out1_1              : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL LTSFreq_k                        : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL LTSFreq_out1                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL LTSFreq_out1_1                   : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16_En14

BEGIN
  NOT_out1 <=  NOT preambVal;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 319
  HDL_Counter1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter1_out1 <= to_unsigned(16#000#, 9);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        IF NOT_out1 = '1' THEN 
          HDL_Counter1_out1 <= to_unsigned(16#000#, 9);
        ELSIF preambVal = '1' THEN 
          IF HDL_Counter1_out1 >= to_unsigned(16#13F#, 9) THEN 
            HDL_Counter1_out1 <= to_unsigned(16#000#, 9);
          ELSE 
            HDL_Counter1_out1 <= HDL_Counter1_out1 + to_unsigned(16#001#, 9);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter1_process;


  HDL_Counter1_out1_1 <= HDL_Counter1_out1;

  
  Compare_To_Constant_out1 <= '1' WHEN HDL_Counter1_out1_1 >= to_unsigned(16#100#, 9) ELSE
      '0';

  
  Compare_To_Constant1_out1 <= '1' WHEN HDL_Counter1_out1_1 <= to_unsigned(16#13F#, 9) ELSE
      '0';

  AND_out1 <= Compare_To_Constant_out1 AND Compare_To_Constant1_out1;

  preambVal_1 <= preambVal;

  AND1_out1 <= AND_out1 AND preambVal_1;

  HDL_Counter41_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter41_bypass_reg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_1 = '1' THEN
        HDL_Counter41_bypass_reg <= AND1_out1;
      END IF;
    END IF;
  END PROCESS HDL_Counter41_bypass_process;

  
  AND1_out1_1 <= AND1_out1 WHEN enb_1_12_1 = '1' ELSE
      HDL_Counter41_bypass_reg;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 63
  HDL_Counter4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter4_out1 <= to_unsigned(16#00#, 6);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' AND AND1_out1_1 = '1' THEN
        HDL_Counter4_out1 <= HDL_Counter4_out1 + to_unsigned(16#01#, 6);
      END IF;
    END IF;
  END PROCESS HDL_Counter4_process;


  HDL_Counter4_out1_1 <= HDL_Counter4_out1;

  
  LTSFreq_k <= to_unsigned(16#00#, 6) WHEN HDL_Counter4_out1_1 = to_unsigned(16#00#, 6) ELSE
      to_unsigned(16#3F#, 6) WHEN HDL_Counter4_out1_1 = to_unsigned(16#3F#, 6) ELSE
      HDL_Counter4_out1_1;
  LTSFreq_out1 <= LTSFreq_data(to_integer(LTSFreq_k));

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        LTSFreq_out1_1 <= LTSFreq_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  ltsFreq <= std_logic_vector(LTSFreq_out1_1);

  ltsVal <= AND1_out1;

END rtl;

