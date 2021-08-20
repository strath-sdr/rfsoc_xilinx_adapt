-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_Abs2_block.vhd
-- Created: 2021-08-19 15:20:58
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_Abs2_block
-- Source Path: OFDM_Rx_HW/OFDMRx/Synchronisation/SchmidlCoxMetric /Abs2
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_rx_src_OFDMRx_pkg.ALL;

ENTITY ofdm_rx_src_Abs2_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_12_0                        :   IN    std_logic;
        enb_1_12_1                        :   IN    std_logic;
        Abs2In_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        Abs2In_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        Abs2Out                           :   OUT   std_logic_vector(24 DOWNTO 0)  -- ufix25_En23
        );
END ofdm_rx_src_Abs2_block;


ARCHITECTURE rtl OF ofdm_rx_src_Abs2_block IS

  -- Signals
  SIGNAL Abs2In_re_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Abs2In_im_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Complex_to_Real_Imag_out1        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Complex_to_Real_Imag_out1_1      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Complex_to_Real_Imag_out1_2      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_mul_temp                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_out1                     : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL Product_out1_1                   : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL Delay3_bypass_reg                : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL Product_out1_2                   : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL Complex_to_Real_Imag_out2        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Complex_to_Real_Imag_out2_1      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Complex_to_Real_Imag_out2_2      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product1_mul_temp                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product1_out1                    : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL Product1_out1_1                  : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL Delay4_bypass_reg                : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL Product1_out1_2                  : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL Add_out1                         : unsigned(24 DOWNTO 0);  -- ufix25_En23
  SIGNAL delayMatch_reg                   : vector_of_unsigned25(0 TO 1);  -- ufix25 [2]
  SIGNAL Add_out1_1                       : unsigned(24 DOWNTO 0);  -- ufix25_En23

BEGIN
  Abs2In_re_signed <= signed(Abs2In_re);

  delayMatch1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Complex_to_Real_Imag_out1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Complex_to_Real_Imag_out1 <= Abs2In_re_signed;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  Complex_to_Real_Imag_out1_1 <= Complex_to_Real_Imag_out1;

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Complex_to_Real_Imag_out1_2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Complex_to_Real_Imag_out1_2 <= Complex_to_Real_Imag_out1_1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  Product_mul_temp <= Complex_to_Real_Imag_out1_2 * Complex_to_Real_Imag_out1_2;
  Product_out1 <= unsigned(Product_mul_temp(29 DOWNTO 5));

  PipelineRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_out1_1 <= to_unsigned(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Product_out1_1 <= Product_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  Delay3_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_bypass_reg <= to_unsigned(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_1 = '1' THEN
        Delay3_bypass_reg <= Product_out1_1;
      END IF;
    END IF;
  END PROCESS Delay3_bypass_process;

  
  Product_out1_2 <= Product_out1_1 WHEN enb_1_12_1 = '1' ELSE
      Delay3_bypass_reg;

  Abs2In_im_signed <= signed(Abs2In_im);

  delayMatch2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Complex_to_Real_Imag_out2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Complex_to_Real_Imag_out2 <= Abs2In_im_signed;
      END IF;
    END IF;
  END PROCESS delayMatch2_process;


  Complex_to_Real_Imag_out2_1 <= Complex_to_Real_Imag_out2;

  reduced_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Complex_to_Real_Imag_out2_2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Complex_to_Real_Imag_out2_2 <= Complex_to_Real_Imag_out2_1;
      END IF;
    END IF;
  END PROCESS reduced_1_process;


  Product1_mul_temp <= Complex_to_Real_Imag_out2_2 * Complex_to_Real_Imag_out2_2;
  Product1_out1 <= unsigned(Product1_mul_temp(29 DOWNTO 5));

  PipelineRegister1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product1_out1_1 <= to_unsigned(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Product1_out1_1 <= Product1_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister1_process;


  Delay4_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay4_bypass_reg <= to_unsigned(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_1 = '1' THEN
        Delay4_bypass_reg <= Product1_out1_1;
      END IF;
    END IF;
  END PROCESS Delay4_bypass_process;

  
  Product1_out1_2 <= Product1_out1_1 WHEN enb_1_12_1 = '1' ELSE
      Delay4_bypass_reg;

  Add_out1 <= Product_out1_2 + Product1_out1_2;

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg <= (OTHERS => to_unsigned(16#0000000#, 25));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        delayMatch_reg(0) <= Add_out1;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  Add_out1_1 <= delayMatch_reg(1);

  Abs2Out <= std_logic_vector(Add_out1_1);

END rtl;

