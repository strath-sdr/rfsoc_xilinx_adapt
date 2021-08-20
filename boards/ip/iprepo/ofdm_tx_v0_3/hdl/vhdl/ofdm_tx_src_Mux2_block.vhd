-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_Mux2_block.vhd
-- Created: 2021-08-19 15:10:31
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_Mux2_block
-- Source Path: OFDM_Tx_HW/OFDMTx/SCMapper/Mux2
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_tx_src_Mux2_block IS
  PORT( preamb_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        preamb_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        preambVal                         :   IN    std_logic;
        data_re                           :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_im                           :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataVal                           :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END ofdm_tx_src_Mux2_block;


ARCHITECTURE rtl OF ofdm_tx_src_Mux2_block IS

  -- Signals
  SIGNAL preamb_re_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL preamb_im_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_re_signed                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_im_signed                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataOut_re_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataOut_im_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  preamb_re_signed <= signed(preamb_re);

  preamb_im_signed <= signed(preamb_im);

  data_re_signed <= signed(data_re);

  data_im_signed <= signed(data_im);

  Mux2_output : PROCESS (dataVal, data_im_signed, data_re_signed, preambVal, preamb_im_signed,
       preamb_re_signed)
  BEGIN
    IF preambVal = '1' THEN 
      dataOut_re_tmp <= preamb_re_signed;
      dataOut_im_tmp <= preamb_im_signed;
    ELSIF dataVal = '1' THEN 
      dataOut_re_tmp <= data_re_signed;
      dataOut_im_tmp <= data_im_signed;
    ELSE 
      dataOut_re_tmp <= to_signed(16#0000#, 16);
      dataOut_im_tmp <= to_signed(16#0000#, 16);
    END IF;
  END PROCESS Mux2_output;


  dataOut_re <= std_logic_vector(dataOut_re_tmp);

  dataOut_im <= std_logic_vector(dataOut_im_tmp);

END rtl;

