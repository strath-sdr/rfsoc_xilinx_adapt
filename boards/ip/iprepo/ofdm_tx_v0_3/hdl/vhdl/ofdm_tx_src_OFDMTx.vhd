-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_OFDMTx.vhd
-- Created: 2021-08-19 15:10:31
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 4.16667e-09
-- Target subsystem base rate: 4.16667e-09
-- Explicit user oversample request: 12x
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        5e-08
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- data                          ce_out        5e-08
-- valid                         ce_out        5e-08
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_OFDMTx
-- Source Path: OFDM_Tx_HW/OFDMTx
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_tx_src_OFDMTx_pkg.ALL;

ENTITY ofdm_tx_src_OFDMTx IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        modScheme                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        enable                            :   IN    std_logic;
        gain                              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        ce_out                            :   OUT   std_logic;
        data                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        valid                             :   OUT   std_logic
        );
END ofdm_tx_src_OFDMTx;


ARCHITECTURE rtl OF ofdm_tx_src_OFDMTx IS

  -- Component Declarations
  COMPONENT ofdm_tx_src_OFDMTx_tc
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          enb                             :   OUT   std_logic;
          enb_1_12_0                      :   OUT   std_logic;
          enb_1_12_1                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_ControlSignalGenerator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enable                          :   IN    std_logic;
          dataValid                       :   OUT   std_logic;
          preambleValid                   :   OUT   std_logic;
          dataReady                       :   OUT   std_logic;
          PilotValid                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_DataGenerator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enb_1_12_1                      :   IN    std_logic;
          enb                             :   IN    std_logic;
          modScheme                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          dataValid                       :   IN    std_logic;
          preambleValid                   :   IN    std_logic;
          dataReady                       :   IN    std_logic;
          pilotValid                      :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          preambValOut                    :   OUT   std_logic;
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_SCMapper
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enb_1_12_1                      :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          preambValid                     :   IN    std_logic;
          dataValid                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          preambValidOut                  :   OUT   std_logic;
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_IFFT
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enb_1_12_1                      :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          preambleValidIn                 :   IN    std_logic;
          dataValidIn                     :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          preambValidOut                  :   OUT   std_logic;
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_CPAdd
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enb_1_12_1                      :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          preambValid                     :   IN    std_logic;
          dataValid                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_tx_src_OFDMTx_tc
    USE ENTITY work.ofdm_tx_src_OFDMTx_tc(rtl);

  FOR ALL : ofdm_tx_src_ControlSignalGenerator
    USE ENTITY work.ofdm_tx_src_ControlSignalGenerator(rtl);

  FOR ALL : ofdm_tx_src_DataGenerator
    USE ENTITY work.ofdm_tx_src_DataGenerator(rtl);

  FOR ALL : ofdm_tx_src_SCMapper
    USE ENTITY work.ofdm_tx_src_SCMapper(rtl);

  FOR ALL : ofdm_tx_src_IFFT
    USE ENTITY work.ofdm_tx_src_IFFT(rtl);

  FOR ALL : ofdm_tx_src_CPAdd
    USE ENTITY work.ofdm_tx_src_CPAdd(rtl);

  -- Signals
  SIGNAL enb_1_12_0                       : std_logic;
  SIGNAL enb_1_12_1                       : std_logic;
  SIGNAL enb                              : std_logic;
  SIGNAL Bit_Slice_out1                   : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion2_out1       : std_logic;
  SIGNAL ControlSignalGenerator_out1      : std_logic;
  SIGNAL ControlSignalGenerator_out2      : std_logic;
  SIGNAL ControlSignalGenerator_out3      : std_logic;
  SIGNAL ControlSignalGenerator_out4      : std_logic;
  SIGNAL data_re                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL data_im                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL DataGenerator_out2               : std_logic;
  SIGNAL DataGenerator_out3               : std_logic;
  SIGNAL dataOut_re                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dataOut_im                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL SCMapper_out2                    : std_logic;
  SIGNAL SCMapper_out3                    : std_logic;
  SIGNAL IFFT_out1_re                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL IFFT_out1_im                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL IFFT_out2                        : std_logic;
  SIGNAL IFFT_out3                        : std_logic;
  SIGNAL dataOut_re_1                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dataOut_im_1                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dataOut_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_C2ReIm_C2ReIm_B          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL gain_unsigned                    : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL delayMatch_reg                   : vector_of_unsigned32(0 TO 5);  -- ufix32 [6]
  SIGNAL gain_1                           : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL gain_2                           : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Data_Type_Conversion3_out1       : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL Data_Type_Conversion3_out1_1     : unsigned(31 DOWNTO 0);  -- ufix32_En31
  SIGNAL Product1_cast                    : signed(32 DOWNTO 0);  -- sfix33_En31
  SIGNAL Product1_mul_temp                : signed(48 DOWNTO 0);  -- sfix49_En45
  SIGNAL Product_Im                       : signed(47 DOWNTO 0);  -- sfix48_En45
  SIGNAL dataOut_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_C2ReIm_C2ReIm_A          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_cast                     : signed(32 DOWNTO 0);  -- sfix33_En31
  SIGNAL Product_mul_temp                 : signed(48 DOWNTO 0);  -- sfix49_En45
  SIGNAL Product_Re                       : signed(47 DOWNTO 0);  -- sfix48_En45
  SIGNAL Product_Im_1                     : signed(47 DOWNTO 0);  -- sfix48_En45
  SIGNAL Product_Im_2                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Data_Type_Conversion1_out1       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Product_Re_1                     : signed(47 DOWNTO 0);  -- sfix48_En45
  SIGNAL Product_Re_2                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Data_Type_Conversion_out1        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Concat_out1                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL t_bypass_reg                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL Bit_Concat_out1_1                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(0 TO 6);  -- ufix1 [7]
  SIGNAL Constant_out1_1                  : std_logic;

BEGIN
  -- Generate random integers, M-QAM symbol mapping and sub-carrier 
  -- mapping. 
  -- 
  -- Add Cyclic Prefix 
  -- 
  -- Create OFDM symbols using 
  -- IFFT

  u_OFDMTx_tc : ofdm_tx_src_OFDMTx_tc
    PORT MAP( clk => clk,
              reset => reset,
              clk_enable => clk_enable,
              enb => enb,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1
              );

  u_ControlSignalGenerator : ofdm_tx_src_ControlSignalGenerator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              enable => Data_Type_Conversion2_out1,
              dataValid => ControlSignalGenerator_out1,
              preambleValid => ControlSignalGenerator_out2,
              dataReady => ControlSignalGenerator_out3,
              PilotValid => ControlSignalGenerator_out4
              );

  u_DataGenerator : ofdm_tx_src_DataGenerator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1,
              enb => enb,
              modScheme => modScheme,  -- uint32
              dataValid => ControlSignalGenerator_out1,
              preambleValid => ControlSignalGenerator_out2,
              dataReady => ControlSignalGenerator_out3,
              pilotValid => ControlSignalGenerator_out4,
              dataOut_re => data_re,  -- sfix16_En14
              dataOut_im => data_im,  -- sfix16_En14
              preambValOut => DataGenerator_out2,
              dataValidOut => DataGenerator_out3
              );

  u_SCMapper : ofdm_tx_src_SCMapper
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1,
              enb => enb,
              dataIn_re => data_re,  -- sfix16_En14
              dataIn_im => data_im,  -- sfix16_En14
              preambValid => DataGenerator_out2,
              dataValid => DataGenerator_out3,
              dataOut_re => dataOut_re,  -- sfix16_En14
              dataOut_im => dataOut_im,  -- sfix16_En14
              preambValidOut => SCMapper_out2,
              dataValidOut => SCMapper_out3
              );

  u_IFFT : ofdm_tx_src_IFFT
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1,
              enb => enb,
              dataIn_re => dataOut_re,  -- sfix16_En14
              dataIn_im => dataOut_im,  -- sfix16_En14
              preambleValidIn => SCMapper_out2,
              dataValidIn => SCMapper_out3,
              dataOut_re => IFFT_out1_re,  -- sfix16_En14
              dataOut_im => IFFT_out1_im,  -- sfix16_En14
              preambValidOut => IFFT_out2,
              dataValidOut => IFFT_out3
              );

  u_CPAdd : ofdm_tx_src_CPAdd
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1,
              enb => enb,
              dataIn_re => IFFT_out1_re,  -- sfix16_En14
              dataIn_im => IFFT_out1_im,  -- sfix16_En14
              preambValid => IFFT_out2,
              dataValid => IFFT_out3,
              dataOut_re => dataOut_re_1,  -- sfix16_En14
              dataOut_im => dataOut_im_1  -- sfix16_En14
              );

  Bit_Slice_out1 <= enable;

  
  Data_Type_Conversion2_out1 <= '1' WHEN Bit_Slice_out1 /= '0' ELSE
      '0';

  dataOut_im_signed <= signed(dataOut_im_1);

  HwModeRegister2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_C2ReIm_C2ReIm_B <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Product_C2ReIm_C2ReIm_B <= dataOut_im_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister2_process;


  gain_unsigned <= unsigned(gain);

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg <= (OTHERS => to_unsigned(0, 32));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        delayMatch_reg(0) <= gain_unsigned;
        delayMatch_reg(1 TO 5) <= delayMatch_reg(0 TO 4);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  gain_1 <= delayMatch_reg(5);

  gain_2 <= gain_1;

  Data_Type_Conversion3_out1 <= gain_2;

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Data_Type_Conversion3_out1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Data_Type_Conversion3_out1_1 <= Data_Type_Conversion3_out1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  Product1_cast <= signed(resize(Data_Type_Conversion3_out1_1, 33));
  Product1_mul_temp <= Product_C2ReIm_C2ReIm_B * Product1_cast;
  Product_Im <= Product1_mul_temp(47 DOWNTO 0);

  dataOut_re_signed <= signed(dataOut_re_1);

  HwModeRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_C2ReIm_C2ReIm_A <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Product_C2ReIm_C2ReIm_A <= dataOut_re_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  Product_cast <= signed(resize(Data_Type_Conversion3_out1_1, 33));
  Product_mul_temp <= Product_C2ReIm_C2ReIm_A * Product_cast;
  Product_Re <= Product_mul_temp(47 DOWNTO 0);

  PipelineRegister1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_Im_1 <= to_signed(0, 48);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Product_Im_1 <= Product_Im;
      END IF;
    END IF;
  END PROCESS PipelineRegister1_process;


  
  Product_Im_2 <= X"7FFF" WHEN ((Product_Im_1(47) = '0') AND (Product_Im_1(46) /= '0')) OR ((Product_Im_1(47) = '0') AND (Product_Im_1(46 DOWNTO 31) = X"7FFF")) ELSE
      X"8000" WHEN (Product_Im_1(47) = '1') AND (Product_Im_1(46) /= '1') ELSE
      Product_Im_1(46 DOWNTO 31) + ('0' & (Product_Im_1(30) AND (( NOT Product_Im_1(47)) OR (Product_Im_1(29) OR Product_Im_1(28) OR Product_Im_1(27) OR Product_Im_1(26) OR Product_Im_1(25) OR Product_Im_1(24) OR Product_Im_1(23) OR Product_Im_1(22) OR Product_Im_1(21) OR Product_Im_1(20) OR Product_Im_1(19) OR Product_Im_1(18) OR Product_Im_1(17) OR Product_Im_1(16) OR Product_Im_1(15) OR Product_Im_1(14) OR Product_Im_1(13) OR Product_Im_1(12) OR Product_Im_1(11) OR Product_Im_1(10) OR Product_Im_1(9) OR Product_Im_1(8) OR Product_Im_1(7) OR Product_Im_1(6) OR Product_Im_1(5) OR Product_Im_1(4) OR Product_Im_1(3) OR Product_Im_1(2) OR Product_Im_1(1) OR Product_Im_1(0)))));

  Data_Type_Conversion1_out1 <= unsigned(Product_Im_2);

  PipelineRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_Re_1 <= to_signed(0, 48);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Product_Re_1 <= Product_Re;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  
  Product_Re_2 <= X"7FFF" WHEN ((Product_Re_1(47) = '0') AND (Product_Re_1(46) /= '0')) OR ((Product_Re_1(47) = '0') AND (Product_Re_1(46 DOWNTO 31) = X"7FFF")) ELSE
      X"8000" WHEN (Product_Re_1(47) = '1') AND (Product_Re_1(46) /= '1') ELSE
      Product_Re_1(46 DOWNTO 31) + ('0' & (Product_Re_1(30) AND (( NOT Product_Re_1(47)) OR (Product_Re_1(29) OR Product_Re_1(28) OR Product_Re_1(27) OR Product_Re_1(26) OR Product_Re_1(25) OR Product_Re_1(24) OR Product_Re_1(23) OR Product_Re_1(22) OR Product_Re_1(21) OR Product_Re_1(20) OR Product_Re_1(19) OR Product_Re_1(18) OR Product_Re_1(17) OR Product_Re_1(16) OR Product_Re_1(15) OR Product_Re_1(14) OR Product_Re_1(13) OR Product_Re_1(12) OR Product_Re_1(11) OR Product_Re_1(10) OR Product_Re_1(9) OR Product_Re_1(8) OR Product_Re_1(7) OR Product_Re_1(6) OR Product_Re_1(5) OR Product_Re_1(4) OR Product_Re_1(3) OR Product_Re_1(2) OR Product_Re_1(1) OR Product_Re_1(0)))));

  Data_Type_Conversion_out1 <= unsigned(Product_Re_2);

  Bit_Concat_out1 <= Data_Type_Conversion1_out1 & Data_Type_Conversion_out1;

  t_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      t_bypass_reg <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_1 = '1' THEN
        t_bypass_reg <= Bit_Concat_out1;
      END IF;
    END IF;
  END PROCESS t_bypass_process;

  
  Bit_Concat_out1_1 <= Bit_Concat_out1 WHEN enb_1_12_1 = '1' ELSE
      t_bypass_reg;

  data <= std_logic_vector(Bit_Concat_out1_1);

  Constant_out1 <= '1';

  delayMatch1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch1_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        delayMatch1_reg(0) <= Constant_out1;
        delayMatch1_reg(1 TO 6) <= delayMatch1_reg(0 TO 5);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  Constant_out1_1 <= delayMatch1_reg(6);

  ce_out <= enb_1_12_1;

  valid <= Constant_out1_1;

END rtl;
