-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_complement_re1.vhd
-- Created: 2021-08-19 15:10:31
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_complement_re1
-- Source Path: OFDM_Tx_HW/OFDMTx/DataGenerator/RF Signal Generator/Variable Modulator/QAM1024 Generator/complement_re1
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_tx_src_complement_re1 IS
  PORT( d_in                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        d_out                             :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END ofdm_tx_src_complement_re1;


ARCHITECTURE rtl OF ofdm_tx_src_complement_re1 IS

  -- Signals
  SIGNAL d_in_signed                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Data_Type_Conversion_out1        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bitwise_NOT_out1                 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant1_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Add_out1                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Data_Type_Conversion1_out1       : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  d_in_signed <= signed(d_in);

  Data_Type_Conversion_out1 <= unsigned(d_in_signed);

  Bitwise_NOT_out1 <=  NOT Data_Type_Conversion_out1;

  Constant1_out1 <= to_unsigned(16#0001#, 16);

  Add_out1 <= Bitwise_NOT_out1 + Constant1_out1;

  Data_Type_Conversion1_out1 <= signed(Add_out1);

  d_out <= std_logic_vector(Data_Type_Conversion1_out1);

END rtl;

