-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_Reciprocal.vhd
-- Created: 2021-08-19 15:20:58
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_Reciprocal
-- Source Path: Reciprocal
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_rx_src_OFDMRx_pkg.ALL;

ENTITY ofdm_rx_src_Reciprocal IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        din                               :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En14
        dout                              :   OUT   std_logic_vector(24 DOWNTO 0)  -- ufix25_En15
        );
END ofdm_rx_src_Reciprocal;


ARCHITECTURE rtl OF ofdm_rx_src_Reciprocal IS

  -- Component Declarations
  COMPONENT ofdm_rx_src_Reciprocal_iv
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          ain                             :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En16
          xinit                           :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En19
          inzero                          :   OUT   std_logic;  -- ufix1
          aout                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16_En16
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_Reciprocal_core
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          xin                             :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En19
          ain                             :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En16
          xout                            :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En19
          aout                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16_En16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_rx_src_Reciprocal_iv
    USE ENTITY work.ofdm_rx_src_Reciprocal_iv(rtl);

  FOR ALL : ofdm_rx_src_Reciprocal_core
    USE ENTITY work.ofdm_rx_src_Reciprocal_core(rtl);

  -- Signals
  SIGNAL din_unsigned                     : unsigned(15 DOWNTO 0);  -- ufix16_En14
  SIGNAL in_norm_out1                     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL in_norm_in0                      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL in_norm_in0_1                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL in_norm_in0_2                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL in_norm_in0_3                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL in_norm_cast                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL in_norm_in0_4                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL in_norm_in0_5                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL in_norm_in0_6                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL anorm                            : unsigned(15 DOWNTO 0);  -- ufix16_En16
  SIGNAL dynamicshift                     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL anorm_p                          : unsigned(15 DOWNTO 0);  -- ufix16_En16
  SIGNAL xinit                            : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL inzero                           : std_logic;  -- ufix1
  SIGNAL anorm_p2to3                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL inzero_reg_reg                   : std_logic_vector(0 TO 35);  -- ufix1 [36]
  SIGNAL inzero_p                         : std_logic;  -- ufix1
  SIGNAL anorm_p2to3_unsigned             : unsigned(15 DOWNTO 0);  -- ufix16_En16
  SIGNAL anorm_reg4to5_reg                : vector_of_unsigned16(0 TO 1);  -- ufix16 [2]
  SIGNAL anorm_p4to5                      : unsigned(15 DOWNTO 0);  -- ufix16_En16
  SIGNAL xstage1                          : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL astage1                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL xstage2                          : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL astage2                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL xstage3                          : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL astage3                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL xstage4                          : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL astage4                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL xstage5                          : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL astage5                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL xstage6                          : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL astage6                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL xstage7                          : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL astage7                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL xstage8                          : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL astage8                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL xstage8_signed                   : signed(22 DOWNTO 0);  -- sfix23_En19
  SIGNAL constInf                         : unsigned(22 DOWNTO 0);  -- ufix23_En16
  SIGNAL ds_reg_reg                       : vector_of_unsigned4(0 TO 36);  -- ufix4 [37]
  SIGNAL dynamicshift_p                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL out_denorm_cast                  : unsigned(29 DOWNTO 0);  -- ufix30_En19
  SIGNAL out_denorm_cast_1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL out_denorm_cast_2                : unsigned(29 DOWNTO 0);  -- ufix30_En20
  SIGNAL denormout                        : unsigned(22 DOWNTO 0);  -- ufix23_En16
  SIGNAL rsqrt_out                        : unsigned(22 DOWNTO 0);  -- ufix23_En16
  SIGNAL rsqrt_outp                       : unsigned(22 DOWNTO 0);  -- ufix23_En16
  SIGNAL mul_mul_temp                     : unsigned(45 DOWNTO 0);  -- ufix46_En32
  SIGNAL mul_out                          : unsigned(24 DOWNTO 0);  -- ufix25_En15

BEGIN
  -- Reciprocal Implementation using RecipSqrt Newton Method

  u_iv_stage_inst : ofdm_rx_src_Reciprocal_iv
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              ain => std_logic_vector(anorm_p),  -- ufix16_En16
              xinit => xinit,  -- sfix23_En19
              inzero => inzero,  -- ufix1
              aout => anorm_p2to3  -- ufix16_En16
              );

  u_core_stage1_inst : ofdm_rx_src_Reciprocal_core
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              xin => xinit,  -- sfix23_En19
              ain => std_logic_vector(anorm_p4to5),  -- ufix16_En16
              xout => xstage1,  -- sfix23_En19
              aout => astage1  -- ufix16_En16
              );

  u_core_stage2_inst : ofdm_rx_src_Reciprocal_core
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              xin => xstage1,  -- sfix23_En19
              ain => astage1,  -- ufix16_En16
              xout => xstage2,  -- sfix23_En19
              aout => astage2  -- ufix16_En16
              );

  u_core_stage3_inst : ofdm_rx_src_Reciprocal_core
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              xin => xstage2,  -- sfix23_En19
              ain => astage2,  -- ufix16_En16
              xout => xstage3,  -- sfix23_En19
              aout => astage3  -- ufix16_En16
              );

  u_core_stage4_inst : ofdm_rx_src_Reciprocal_core
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              xin => xstage3,  -- sfix23_En19
              ain => astage3,  -- ufix16_En16
              xout => xstage4,  -- sfix23_En19
              aout => astage4  -- ufix16_En16
              );

  u_core_stage5_inst : ofdm_rx_src_Reciprocal_core
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              xin => xstage4,  -- sfix23_En19
              ain => astage4,  -- ufix16_En16
              xout => xstage5,  -- sfix23_En19
              aout => astage5  -- ufix16_En16
              );

  u_core_stage6_inst : ofdm_rx_src_Reciprocal_core
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              xin => xstage5,  -- sfix23_En19
              ain => astage5,  -- ufix16_En16
              xout => xstage6,  -- sfix23_En19
              aout => astage6  -- ufix16_En16
              );

  u_core_stage7_inst : ofdm_rx_src_Reciprocal_core
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              xin => xstage6,  -- sfix23_En19
              ain => astage6,  -- ufix16_En16
              xout => xstage7,  -- sfix23_En19
              aout => astage7  -- ufix16_En16
              );

  u_core_stage8_inst : ofdm_rx_src_Reciprocal_core
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              xin => xstage7,  -- sfix23_En19
              ain => astage7,  -- ufix16_En16
              xout => xstage8,  -- sfix23_En19
              aout => astage8  -- ufix16_En16
              );

  din_unsigned <= unsigned(din);

  -- Input Normalization
  in_norm_in0 <= din_unsigned(15 DOWNTO 14);
  in_norm_in0_1 <= din_unsigned(13 DOWNTO 12);
  in_norm_in0_2 <= din_unsigned(11 DOWNTO 10);
  in_norm_in0_3 <= din_unsigned(9 DOWNTO 8);
  in_norm_in0_4 <= din_unsigned(7 DOWNTO 6);
  in_norm_in0_5 <= din_unsigned(5 DOWNTO 4);
  in_norm_in0_6 <= din_unsigned(3 DOWNTO 2);
  
  in_norm_out1 <= to_unsigned(16#0#, 4) WHEN (in_norm_in0(1) OR in_norm_in0(0)) = '1' ELSE
      to_unsigned(16#1#, 4) WHEN (in_norm_in0_1(1) OR in_norm_in0_1(0)) = '1' ELSE
      to_unsigned(16#2#, 4) WHEN (in_norm_in0_2(1) OR in_norm_in0_2(0)) = '1' ELSE
      to_unsigned(16#3#, 4) WHEN (in_norm_in0_3(1) OR in_norm_in0_3(0)) = '1' ELSE
      to_unsigned(16#4#, 4) WHEN (in_norm_in0_4(1) OR in_norm_in0_4(0)) = '1' ELSE
      to_unsigned(16#5#, 4) WHEN (in_norm_in0_5(1) OR in_norm_in0_5(0)) = '1' ELSE
      to_unsigned(16#6#, 4) WHEN (in_norm_in0_6(1) OR in_norm_in0_6(0)) = '1' ELSE
      to_unsigned(16#7#, 4);
  in_norm_cast <= resize(in_norm_out1 sll 1, 8);
  anorm <= din_unsigned sll to_integer(in_norm_cast);
  dynamicshift <= in_norm_out1;

  -- Pipeline register
  anorm_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      anorm_p <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        anorm_p <= anorm;
      END IF;
    END IF;
  END PROCESS anorm_reg_process;


  -- Pipeline registers
  inzero_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      inzero_reg_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        inzero_reg_reg(0) <= inzero;
        inzero_reg_reg(1 TO 35) <= inzero_reg_reg(0 TO 34);
      END IF;
    END IF;
  END PROCESS inzero_reg_process;

  inzero_p <= inzero_reg_reg(35);

  anorm_p2to3_unsigned <= unsigned(anorm_p2to3);

  -- Pipeline registers
  anorm_reg4to5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      anorm_reg4to5_reg <= (OTHERS => to_unsigned(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        anorm_reg4to5_reg(0) <= anorm_p2to3_unsigned;
        anorm_reg4to5_reg(1) <= anorm_reg4to5_reg(0);
      END IF;
    END IF;
  END PROCESS anorm_reg4to5_process;

  anorm_p4to5 <= anorm_reg4to5_reg(1);

  xstage8_signed <= signed(xstage8);

  constInf <= to_unsigned(16#7FFFFF#, 23);

  -- Pipeline registers
  ds_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      ds_reg_reg <= (OTHERS => to_unsigned(16#0#, 4));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        ds_reg_reg(0) <= dynamicshift;
        ds_reg_reg(1 TO 36) <= ds_reg_reg(0 TO 35);
      END IF;
    END IF;
  END PROCESS ds_reg_process;

  dynamicshift_p <= ds_reg_reg(36);

  -- Output Denormalization
  out_denorm_cast <= unsigned(resize(xstage8_signed, 30));
  out_denorm_cast_1 <= resize(dynamicshift_p, 8);
  out_denorm_cast_2 <= out_denorm_cast sll to_integer(out_denorm_cast_1);
  
  denormout <= "11111111111111111111111" WHEN (out_denorm_cast_2(29 DOWNTO 27) /= "000") OR ((out_denorm_cast_2(29) = '0') AND (out_denorm_cast_2(26 DOWNTO 4) = "11111111111111111111111")) ELSE
      out_denorm_cast_2(26 DOWNTO 4) + ('0' & out_denorm_cast_2(3));

  -- Zero input logic
  
  rsqrt_out <= constInf WHEN inzero_p = '1' ELSE
      denormout;

  -- Pipeline register
  rsqrt_out_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rsqrt_outp <= to_unsigned(16#000000#, 23);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rsqrt_outp <= rsqrt_out;
      END IF;
    END IF;
  END PROCESS rsqrt_out_reg_process;


  -- Multiply RecipSqrt result by itself
  mul_mul_temp <= rsqrt_outp * rsqrt_outp;
  
  mul_out <= "1111111111111111111111111" WHEN (mul_mul_temp(45 DOWNTO 42) /= "0000") OR ((mul_mul_temp(45) = '0') AND (mul_mul_temp(41 DOWNTO 17) = "1111111111111111111111111")) ELSE
      mul_mul_temp(41 DOWNTO 17) + ('0' & mul_mul_temp(16));

  dout <= std_logic_vector(mul_out);

END rtl;

