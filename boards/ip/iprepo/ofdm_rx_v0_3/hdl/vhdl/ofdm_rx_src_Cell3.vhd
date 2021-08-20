-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_Cell3.vhd
-- Created: 2021-08-19 15:20:58
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_Cell3
-- Source Path: OFDM_Rx_HW/OFDMRx/PhaseTracking_1/CordicRotate/Cell3
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_Cell3 IS
  PORT( X_in_0                            :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        Y_in_0                            :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        Ang_in_0                          :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
        X_out_0                           :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        Y_out_0                           :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        Ang_out_0                         :   OUT   std_logic_vector(22 DOWNTO 0)  -- sfix23_En20
        );
END ofdm_rx_src_Cell3;


ARCHITECTURE rtl OF ofdm_rx_src_Cell3 IS

  -- Signals
  SIGNAL Ang_in_0_signed                  : signed(22 DOWNTO 0);  -- sfix23_En20
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL X_in_0_signed                    : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Y_in_0_signed                    : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Shift_Arithmetic1_out1           : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Add1_out1                        : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Add4_out1                        : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Switch_out1                      : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Shift_Arithmetic_out1            : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Add3_out1                        : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Add2_out1                        : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Switch1_out1                     : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL ANGLE_out1                       : signed(22 DOWNTO 0);  -- sfix23_En20
  SIGNAL Add6_out1                        : signed(22 DOWNTO 0);  -- sfix23_En20
  SIGNAL Add5_out1                        : signed(22 DOWNTO 0);  -- sfix23_En20
  SIGNAL Switch2_out1                     : signed(22 DOWNTO 0);  -- sfix23_En20

BEGIN
  Ang_in_0_signed <= signed(Ang_in_0);

  
  Compare_To_Constant_out1 <= '1' WHEN Ang_in_0_signed < to_signed(16#000000#, 23) ELSE
      '0';

  X_in_0_signed <= signed(X_in_0);

  Y_in_0_signed <= signed(Y_in_0);

  Shift_Arithmetic1_out1 <= SHIFT_RIGHT(Y_in_0_signed, 3);

  Add1_out1 <= X_in_0_signed - Shift_Arithmetic1_out1;

  Add4_out1 <= X_in_0_signed + Shift_Arithmetic1_out1;

  
  Switch_out1 <= Add1_out1 WHEN Compare_To_Constant_out1 = '0' ELSE
      Add4_out1;

  X_out_0 <= std_logic_vector(Switch_out1);

  Logical_Operator1_out1 <=  NOT Compare_To_Constant_out1;

  Shift_Arithmetic_out1 <= SHIFT_RIGHT(X_in_0_signed, 3);

  Add3_out1 <= Y_in_0_signed - Shift_Arithmetic_out1;

  Add2_out1 <= Y_in_0_signed + Shift_Arithmetic_out1;

  
  Switch1_out1 <= Add3_out1 WHEN Logical_Operator1_out1 = '0' ELSE
      Add2_out1;

  Y_out_0 <= std_logic_vector(Switch1_out1);

  ANGLE_out1 <= to_signed(16#01FD5C#, 23);

  Add6_out1 <= Ang_in_0_signed - ANGLE_out1;

  Add5_out1 <= Ang_in_0_signed + ANGLE_out1;

  
  Switch2_out1 <= Add6_out1 WHEN Compare_To_Constant_out1 = '0' ELSE
      Add5_out1;

  Ang_out_0 <= std_logic_vector(Switch2_out1);

END rtl;
