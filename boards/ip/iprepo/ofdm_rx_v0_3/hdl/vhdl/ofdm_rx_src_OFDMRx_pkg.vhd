-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_OFDMRx_pkg.vhd
-- Created: 2021-08-19 15:20:58
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE ofdm_rx_src_OFDMRx_pkg IS
  TYPE vector_of_signed22 IS ARRAY (NATURAL RANGE <>) OF signed(21 DOWNTO 0);
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_unsigned6 IS ARRAY (NATURAL RANGE <>) OF unsigned(5 DOWNTO 0);
  TYPE vector_of_unsigned16 IS ARRAY (NATURAL RANGE <>) OF unsigned(15 DOWNTO 0);
  TYPE vector_of_signed23 IS ARRAY (NATURAL RANGE <>) OF signed(22 DOWNTO 0);
  TYPE vector_of_unsigned4 IS ARRAY (NATURAL RANGE <>) OF unsigned(3 DOWNTO 0);
  TYPE vector_of_signed18 IS ARRAY (NATURAL RANGE <>) OF signed(17 DOWNTO 0);
  TYPE vector_of_signed20 IS ARRAY (NATURAL RANGE <>) OF signed(19 DOWNTO 0);
  TYPE vector_of_unsigned2 IS ARRAY (NATURAL RANGE <>) OF unsigned(1 DOWNTO 0);
  TYPE vector_of_unsigned7 IS ARRAY (NATURAL RANGE <>) OF unsigned(6 DOWNTO 0);
  TYPE vector_of_signed2 IS ARRAY (NATURAL RANGE <>) OF signed(1 DOWNTO 0);
  TYPE vector_of_unsigned3 IS ARRAY (NATURAL RANGE <>) OF unsigned(2 DOWNTO 0);
  TYPE vector_of_signed6 IS ARRAY (NATURAL RANGE <>) OF signed(5 DOWNTO 0);
  TYPE vector_of_unsigned8 IS ARRAY (NATURAL RANGE <>) OF unsigned(7 DOWNTO 0);
  TYPE vector_of_unsigned25 IS ARRAY (NATURAL RANGE <>) OF unsigned(24 DOWNTO 0);
  TYPE vector_of_signed25 IS ARRAY (NATURAL RANGE <>) OF signed(24 DOWNTO 0);
END ofdm_rx_src_OFDMRx_pkg;

