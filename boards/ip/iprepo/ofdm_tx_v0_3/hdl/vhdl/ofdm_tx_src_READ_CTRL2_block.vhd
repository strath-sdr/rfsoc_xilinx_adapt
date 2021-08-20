-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_READ_CTRL2_block.vhd
-- Created: 2021-08-19 15:10:31
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_READ_CTRL2_block
-- Source Path: OFDM_Tx_HW/OFDMTx/SCMapper/DataMapper/READ_CTRL2
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_tx_src_READ_CTRL2_block IS
  PORT( In1                               :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        In2                               :   IN    std_logic;
        Out1                              :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END ofdm_tx_src_READ_CTRL2_block;


ARCHITECTURE rtl OF ofdm_tx_src_READ_CTRL2_block IS

  -- Signals
  SIGNAL Constant_out1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL In1_unsigned                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Switch_out1                      : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  Constant_out1 <= to_unsigned(16#00#, 8);

  In1_unsigned <= unsigned(In1);

  
  Switch_out1 <= Constant_out1 WHEN In2 = '0' ELSE
      In1_unsigned;

  Out1 <= std_logic_vector(Switch_out1);

END rtl;

