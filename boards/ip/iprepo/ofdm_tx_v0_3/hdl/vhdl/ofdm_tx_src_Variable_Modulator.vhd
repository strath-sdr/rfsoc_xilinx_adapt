-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_Variable_Modulator.vhd
-- Created: 2021-08-19 15:10:31
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_Variable_Modulator
-- Source Path: OFDM_Tx_HW/OFDMTx/DataGenerator/RF Signal Generator/Variable Modulator
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_tx_src_Variable_Modulator IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_12_0                        :   IN    std_logic;
        Select_rsvd                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Reset_1                           :   IN    std_logic;
        Enable                            :   IN    std_logic;
        Data                              :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        Q_symbols                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        I_symbols                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END ofdm_tx_src_Variable_Modulator;


ARCHITECTURE rtl OF ofdm_tx_src_Variable_Modulator IS

  -- Component Declarations
  COMPONENT ofdm_tx_src_QPSK_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Q_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_8PSK_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Q_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_QAM16_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Q_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_QAM32_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Q_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_QAM64_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Q_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_QAM128_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Q_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_QAM256_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Q_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_QAM512_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Q_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_QAM1024_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Q_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_BPSK_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          Data                            :   IN    std_logic;  -- ufix1
          Reset_1                         :   IN    std_logic;
          Enable                          :   IN    std_logic;
          I_symbols                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_tx_src_QPSK_Generator
    USE ENTITY work.ofdm_tx_src_QPSK_Generator(rtl);

  FOR ALL : ofdm_tx_src_8PSK_Generator
    USE ENTITY work.ofdm_tx_src_8PSK_Generator(rtl);

  FOR ALL : ofdm_tx_src_QAM16_Generator
    USE ENTITY work.ofdm_tx_src_QAM16_Generator(rtl);

  FOR ALL : ofdm_tx_src_QAM32_Generator
    USE ENTITY work.ofdm_tx_src_QAM32_Generator(rtl);

  FOR ALL : ofdm_tx_src_QAM64_Generator
    USE ENTITY work.ofdm_tx_src_QAM64_Generator(rtl);

  FOR ALL : ofdm_tx_src_QAM128_Generator
    USE ENTITY work.ofdm_tx_src_QAM128_Generator(rtl);

  FOR ALL : ofdm_tx_src_QAM256_Generator
    USE ENTITY work.ofdm_tx_src_QAM256_Generator(rtl);

  FOR ALL : ofdm_tx_src_QAM512_Generator
    USE ENTITY work.ofdm_tx_src_QAM512_Generator(rtl);

  FOR ALL : ofdm_tx_src_QAM1024_Generator
    USE ENTITY work.ofdm_tx_src_QAM1024_Generator(rtl);

  FOR ALL : ofdm_tx_src_BPSK_Generator
    USE ENTITY work.ofdm_tx_src_BPSK_Generator(rtl);

  -- Signals
  SIGNAL Select_unsigned                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Bit_Slice3_out1                  : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Bit_Slice3_out1_1                : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Constant1_out1                   : std_logic;  -- ufix1
  SIGNAL Constant1_out1_dtc               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Data_unsigned                    : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Bit_Slice1_out1                  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL QPSK_Generator_out1              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QPSK_Generator_out2              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QPSK_Generator_out2_signed       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Bit_Slice2_out1                  : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL alpha8PSK_Generator_out1         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL alpha8PSK_Generator_out2         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL alpha8PSK_Generator_out2_signed  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Bit_Slice4_out1                  : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL QAM16_Generator_out1             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM16_Generator_out2             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM16_Generator_out2_signed      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Bit_Slice6_out1                  : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL QAM32_Generator_out1             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM32_Generator_out2             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM32_Generator_out2_signed      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Bit_Slice5_out1                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL QAM64_Generator_out1             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM64_Generator_out2             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM64_Generator_out2_signed      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Bit_Slice8_out1                  : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL QAM128_Generator_out1            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM128_Generator_out2            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM128_Generator_out2_signed     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Bit_Slice7_out1                  : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL QAM256_Generator_out1            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM256_Generator_out2            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM256_Generator_out2_signed     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Bit_Slice9_out1                  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL QAM512_Generator_out1            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM512_Generator_out2            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM512_Generator_out2_signed     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL QAM1024_Generator_out1           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM1024_Generator_out2           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL QAM1024_Generator_out2_signed    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Multiport_Switch1_out1           : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Bit_Slice_out1                   : std_logic;  -- ufix1
  SIGNAL BPSK_Generator_out1              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL BPSK_Generator_out1_signed       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL QPSK_Generator_out1_signed       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL alpha8PSK_Generator_out1_signed  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL QAM16_Generator_out1_signed      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL QAM32_Generator_out1_signed      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL QAM64_Generator_out1_signed      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL QAM128_Generator_out1_signed     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL QAM256_Generator_out1_signed     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL QAM512_Generator_out1_signed     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL QAM1024_Generator_out1_signed    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Multiport_Switch_out1            : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  u_QPSK_Generator : ofdm_tx_src_QPSK_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => std_logic_vector(Bit_Slice1_out1),  -- ufix2
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => QPSK_Generator_out1,  -- sfix16_En14
              Q_symbols => QPSK_Generator_out2  -- sfix16_En14
              );

  u_8PSK_Generator : ofdm_tx_src_8PSK_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => std_logic_vector(Bit_Slice2_out1),  -- ufix3
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => alpha8PSK_Generator_out1,  -- sfix16_En14
              Q_symbols => alpha8PSK_Generator_out2  -- sfix16_En14
              );

  u_QAM16_Generator : ofdm_tx_src_QAM16_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => std_logic_vector(Bit_Slice4_out1),  -- ufix4
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => QAM16_Generator_out1,  -- sfix16_En14
              Q_symbols => QAM16_Generator_out2  -- sfix16_En14
              );

  u_QAM32_Generator : ofdm_tx_src_QAM32_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => std_logic_vector(Bit_Slice6_out1),  -- ufix5
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => QAM32_Generator_out1,  -- sfix16_En14
              Q_symbols => QAM32_Generator_out2  -- sfix16_En14
              );

  u_QAM64_Generator : ofdm_tx_src_QAM64_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => std_logic_vector(Bit_Slice5_out1),  -- ufix6
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => QAM64_Generator_out1,  -- sfix16_En14
              Q_symbols => QAM64_Generator_out2  -- sfix16_En14
              );

  u_QAM128_Generator : ofdm_tx_src_QAM128_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => std_logic_vector(Bit_Slice8_out1),  -- ufix7
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => QAM128_Generator_out1,  -- sfix16_En14
              Q_symbols => QAM128_Generator_out2  -- sfix16_En14
              );

  u_QAM256_Generator : ofdm_tx_src_QAM256_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => std_logic_vector(Bit_Slice7_out1),  -- uint8
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => QAM256_Generator_out1,  -- sfix16_En14
              Q_symbols => QAM256_Generator_out2  -- sfix16_En14
              );

  u_QAM512_Generator : ofdm_tx_src_QAM512_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => std_logic_vector(Bit_Slice9_out1),  -- ufix9
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => QAM512_Generator_out1,  -- sfix16_En14
              Q_symbols => QAM512_Generator_out2  -- sfix16_En14
              );

  u_QAM1024_Generator : ofdm_tx_src_QAM1024_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => Data,  -- ufix10
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => QAM1024_Generator_out1,  -- sfix16_En14
              Q_symbols => QAM1024_Generator_out2  -- sfix16_En14
              );

  u_BPSK_Generator : ofdm_tx_src_BPSK_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              Data => Bit_Slice_out1,  -- ufix1
              Reset_1 => Reset_1,
              Enable => Enable,
              I_symbols => BPSK_Generator_out1  -- sfix16_En14
              );

  Select_unsigned <= unsigned(Select_rsvd);

  Bit_Slice3_out1 <= Select_unsigned(3 DOWNTO 0);

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Bit_Slice3_out1_1 <= to_unsigned(16#0#, 4);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Bit_Slice3_out1_1 <= Bit_Slice3_out1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  Constant1_out1 <= '0';

  Constant1_out1_dtc <= signed(resize(unsigned'(Constant1_out1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0'), 16));

  Data_unsigned <= unsigned(Data);

  Bit_Slice1_out1 <= Data_unsigned(1 DOWNTO 0);

  QPSK_Generator_out2_signed <= signed(QPSK_Generator_out2);

  Bit_Slice2_out1 <= Data_unsigned(2 DOWNTO 0);

  alpha8PSK_Generator_out2_signed <= signed(alpha8PSK_Generator_out2);

  Bit_Slice4_out1 <= Data_unsigned(3 DOWNTO 0);

  QAM16_Generator_out2_signed <= signed(QAM16_Generator_out2);

  Bit_Slice6_out1 <= Data_unsigned(4 DOWNTO 0);

  QAM32_Generator_out2_signed <= signed(QAM32_Generator_out2);

  Bit_Slice5_out1 <= Data_unsigned(5 DOWNTO 0);

  QAM64_Generator_out2_signed <= signed(QAM64_Generator_out2);

  Bit_Slice8_out1 <= Data_unsigned(6 DOWNTO 0);

  QAM128_Generator_out2_signed <= signed(QAM128_Generator_out2);

  Bit_Slice7_out1 <= Data_unsigned(7 DOWNTO 0);

  QAM256_Generator_out2_signed <= signed(QAM256_Generator_out2);

  Bit_Slice9_out1 <= Data_unsigned(8 DOWNTO 0);

  QAM512_Generator_out2_signed <= signed(QAM512_Generator_out2);

  QAM1024_Generator_out2_signed <= signed(QAM1024_Generator_out2);

  
  Multiport_Switch1_out1 <= Constant1_out1_dtc WHEN Bit_Slice3_out1_1 = to_unsigned(16#0#, 4) ELSE
      QPSK_Generator_out2_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#1#, 4) ELSE
      alpha8PSK_Generator_out2_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#2#, 4) ELSE
      QAM16_Generator_out2_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#3#, 4) ELSE
      QAM32_Generator_out2_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#4#, 4) ELSE
      QAM64_Generator_out2_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#5#, 4) ELSE
      QAM128_Generator_out2_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#6#, 4) ELSE
      QAM256_Generator_out2_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#7#, 4) ELSE
      QAM512_Generator_out2_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#8#, 4) ELSE
      QAM1024_Generator_out2_signed;

  Q_symbols <= std_logic_vector(Multiport_Switch1_out1);

  Bit_Slice_out1 <= Data_unsigned(0);

  BPSK_Generator_out1_signed <= signed(BPSK_Generator_out1);

  QPSK_Generator_out1_signed <= signed(QPSK_Generator_out1);

  alpha8PSK_Generator_out1_signed <= signed(alpha8PSK_Generator_out1);

  QAM16_Generator_out1_signed <= signed(QAM16_Generator_out1);

  QAM32_Generator_out1_signed <= signed(QAM32_Generator_out1);

  QAM64_Generator_out1_signed <= signed(QAM64_Generator_out1);

  QAM128_Generator_out1_signed <= signed(QAM128_Generator_out1);

  QAM256_Generator_out1_signed <= signed(QAM256_Generator_out1);

  QAM512_Generator_out1_signed <= signed(QAM512_Generator_out1);

  QAM1024_Generator_out1_signed <= signed(QAM1024_Generator_out1);

  
  Multiport_Switch_out1 <= BPSK_Generator_out1_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#0#, 4) ELSE
      QPSK_Generator_out1_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#1#, 4) ELSE
      alpha8PSK_Generator_out1_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#2#, 4) ELSE
      QAM16_Generator_out1_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#3#, 4) ELSE
      QAM32_Generator_out1_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#4#, 4) ELSE
      QAM64_Generator_out1_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#5#, 4) ELSE
      QAM128_Generator_out1_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#6#, 4) ELSE
      QAM256_Generator_out1_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#7#, 4) ELSE
      QAM512_Generator_out1_signed WHEN Bit_Slice3_out1_1 = to_unsigned(16#8#, 4) ELSE
      QAM1024_Generator_out1_signed;

  I_symbols <= std_logic_vector(Multiport_Switch_out1);

END rtl;

