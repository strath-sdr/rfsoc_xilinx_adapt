-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_QUAD_MAP_block.vhd
-- Created: 2021-08-19 15:20:58
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_QUAD_MAP_block
-- Source Path: OFDM_Rx_HW/OFDMRx/PhaseTracking_2/CordicRotate/QUAD_MAP
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_QUAD_MAP_block IS
  PORT( Xin                               :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        Yin                               :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        ANG_IN                            :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
        Xout                              :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        Yout                              :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        ANG_OUT                           :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
        QUAD_CTRL_OUT                     :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
        );
END ofdm_rx_src_QUAD_MAP_block;


ARCHITECTURE rtl OF ofdm_rx_src_QUAD_MAP_block IS

  -- Component Declarations
  COMPONENT ofdm_rx_src_QUAD_DETERM1_block
    PORT( ang_in                          :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
          ang_out                         :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
          QUAD                            :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_rx_src_QUAD_DETERM1_block
    USE ENTITY work.ofdm_rx_src_QUAD_DETERM1_block(rtl);

  -- Signals
  SIGNAL ang_out_1                        : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL QUAD                             : std_logic_vector(1 DOWNTO 0);  -- ufix2

BEGIN
  u_QUAD_DETERM1 : ofdm_rx_src_QUAD_DETERM1_block
    PORT MAP( ang_in => ANG_IN,  -- sfix23_En20
              ang_out => ang_out_1,  -- sfix23_En20
              QUAD => QUAD  -- ufix2
              );

  Xout <= Xin;

  Yout <= Yin;

  ANG_OUT <= ang_out_1;

  QUAD_CTRL_OUT <= QUAD;

END rtl;

