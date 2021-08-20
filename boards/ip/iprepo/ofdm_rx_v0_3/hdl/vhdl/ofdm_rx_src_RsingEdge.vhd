-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_RsingEdge.vhd
-- Created: 2021-08-19 15:20:58
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_RsingEdge
-- Source Path: OFDM_Rx_HW/OFDMRx/Synchronisation/CoarseFreqCorr/RsingEdge
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_RsingEdge IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_12_0                        :   IN    std_logic;
        In1                               :   IN    std_logic;
        Out1                              :   OUT   std_logic
        );
END ofdm_rx_src_RsingEdge;


ARCHITECTURE rtl OF ofdm_rx_src_RsingEdge IS

  -- Signals
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL Relational_Operator_relop1       : std_logic;

BEGIN
  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        Delay_out1 <= In1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  
  Relational_Operator_relop1 <= '1' WHEN In1 > Delay_out1 ELSE
      '0';

  Out1 <= Relational_Operator_relop1;

END rtl;
