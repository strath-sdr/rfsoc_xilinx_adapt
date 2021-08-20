-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_LookUpTableGen.vhd
-- Created: 2021-08-19 15:20:58
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_LookUpTableGen
-- Source Path: OFDM_Rx_HW/OFDMRx/Synchronisation/CoarseFreqCorr/NCO HDL Optimized/WaveformGen/LookUpTableGen
-- Hierarchy Level: 5
-- 
-- Look Up Table Generation Component
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_rx_src_OFDMRx_pkg.ALL;

ENTITY ofdm_rx_src_LookUpTableGen IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_12_0                        :   IN    std_logic;
        lutaddr                           :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        lutoutput                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END ofdm_rx_src_LookUpTableGen;


ARCHITECTURE rtl OF ofdm_rx_src_LookUpTableGen IS

  -- Constants
  CONSTANT Lookup_Table1_table_data       : vector_of_signed16(0 TO 255) := 
    (to_signed(16#0000#, 16), to_signed(16#0065#, 16), to_signed(16#00C9#, 16), to_signed(16#012E#, 16),
     to_signed(16#0192#, 16), to_signed(16#01F7#, 16), to_signed(16#025B#, 16), to_signed(16#02C0#, 16),
     to_signed(16#0324#, 16), to_signed(16#0388#, 16), to_signed(16#03ED#, 16), to_signed(16#0451#, 16),
     to_signed(16#04B5#, 16), to_signed(16#051A#, 16), to_signed(16#057E#, 16), to_signed(16#05E2#, 16),
     to_signed(16#0646#, 16), to_signed(16#06AA#, 16), to_signed(16#070E#, 16), to_signed(16#0772#, 16),
     to_signed(16#07D6#, 16), to_signed(16#0839#, 16), to_signed(16#089D#, 16), to_signed(16#0901#, 16),
     to_signed(16#0964#, 16), to_signed(16#09C7#, 16), to_signed(16#0A2B#, 16), to_signed(16#0A8E#, 16),
     to_signed(16#0AF1#, 16), to_signed(16#0B54#, 16), to_signed(16#0BB7#, 16), to_signed(16#0C1A#, 16),
     to_signed(16#0C7C#, 16), to_signed(16#0CDF#, 16), to_signed(16#0D41#, 16), to_signed(16#0DA4#, 16),
     to_signed(16#0E06#, 16), to_signed(16#0E68#, 16), to_signed(16#0ECA#, 16), to_signed(16#0F2B#, 16),
     to_signed(16#0F8D#, 16), to_signed(16#0FEE#, 16), to_signed(16#1050#, 16), to_signed(16#10B1#, 16),
     to_signed(16#1112#, 16), to_signed(16#1173#, 16), to_signed(16#11D3#, 16), to_signed(16#1234#, 16),
     to_signed(16#1294#, 16), to_signed(16#12F4#, 16), to_signed(16#1354#, 16), to_signed(16#13B4#, 16),
     to_signed(16#1413#, 16), to_signed(16#1473#, 16), to_signed(16#14D2#, 16), to_signed(16#1531#, 16),
     to_signed(16#1590#, 16), to_signed(16#15EE#, 16), to_signed(16#164C#, 16), to_signed(16#16AB#, 16),
     to_signed(16#1709#, 16), to_signed(16#1766#, 16), to_signed(16#17C4#, 16), to_signed(16#1821#, 16),
     to_signed(16#187E#, 16), to_signed(16#18DB#, 16), to_signed(16#1937#, 16), to_signed(16#1993#, 16),
     to_signed(16#19EF#, 16), to_signed(16#1A4B#, 16), to_signed(16#1AA7#, 16), to_signed(16#1B02#, 16),
     to_signed(16#1B5D#, 16), to_signed(16#1BB8#, 16), to_signed(16#1C12#, 16), to_signed(16#1C6C#, 16),
     to_signed(16#1CC6#, 16), to_signed(16#1D20#, 16), to_signed(16#1D79#, 16), to_signed(16#1DD3#, 16),
     to_signed(16#1E2B#, 16), to_signed(16#1E84#, 16), to_signed(16#1EDC#, 16), to_signed(16#1F34#, 16),
     to_signed(16#1F8C#, 16), to_signed(16#1FE3#, 16), to_signed(16#203A#, 16), to_signed(16#2091#, 16),
     to_signed(16#20E7#, 16), to_signed(16#213D#, 16), to_signed(16#2193#, 16), to_signed(16#21E8#, 16),
     to_signed(16#223D#, 16), to_signed(16#2292#, 16), to_signed(16#22E7#, 16), to_signed(16#233B#, 16),
     to_signed(16#238E#, 16), to_signed(16#23E2#, 16), to_signed(16#2435#, 16), to_signed(16#2488#, 16),
     to_signed(16#24DA#, 16), to_signed(16#252C#, 16), to_signed(16#257E#, 16), to_signed(16#25CF#, 16),
     to_signed(16#2620#, 16), to_signed(16#2671#, 16), to_signed(16#26C1#, 16), to_signed(16#2711#, 16),
     to_signed(16#2760#, 16), to_signed(16#27AF#, 16), to_signed(16#27FE#, 16), to_signed(16#284C#, 16),
     to_signed(16#289A#, 16), to_signed(16#28E7#, 16), to_signed(16#2935#, 16), to_signed(16#2981#, 16),
     to_signed(16#29CE#, 16), to_signed(16#2A1A#, 16), to_signed(16#2A65#, 16), to_signed(16#2AB0#, 16),
     to_signed(16#2AFB#, 16), to_signed(16#2B45#, 16), to_signed(16#2B8F#, 16), to_signed(16#2BD8#, 16),
     to_signed(16#2C21#, 16), to_signed(16#2C6A#, 16), to_signed(16#2CB2#, 16), to_signed(16#2CFA#, 16),
     to_signed(16#2D41#, 16), to_signed(16#2D88#, 16), to_signed(16#2DCF#, 16), to_signed(16#2E15#, 16),
     to_signed(16#2E5A#, 16), to_signed(16#2E9F#, 16), to_signed(16#2EE4#, 16), to_signed(16#2F28#, 16),
     to_signed(16#2F6C#, 16), to_signed(16#2FAF#, 16), to_signed(16#2FF2#, 16), to_signed(16#3034#, 16),
     to_signed(16#3076#, 16), to_signed(16#30B8#, 16), to_signed(16#30F9#, 16), to_signed(16#3139#, 16),
     to_signed(16#3179#, 16), to_signed(16#31B9#, 16), to_signed(16#31F8#, 16), to_signed(16#3236#, 16),
     to_signed(16#3274#, 16), to_signed(16#32B2#, 16), to_signed(16#32EF#, 16), to_signed(16#332C#, 16),
     to_signed(16#3368#, 16), to_signed(16#33A3#, 16), to_signed(16#33DF#, 16), to_signed(16#3419#, 16),
     to_signed(16#3453#, 16), to_signed(16#348D#, 16), to_signed(16#34C6#, 16), to_signed(16#34FF#, 16),
     to_signed(16#3537#, 16), to_signed(16#356E#, 16), to_signed(16#35A5#, 16), to_signed(16#35DC#, 16),
     to_signed(16#3612#, 16), to_signed(16#3648#, 16), to_signed(16#367D#, 16), to_signed(16#36B1#, 16),
     to_signed(16#36E5#, 16), to_signed(16#3718#, 16), to_signed(16#374B#, 16), to_signed(16#377E#, 16),
     to_signed(16#37B0#, 16), to_signed(16#37E1#, 16), to_signed(16#3812#, 16), to_signed(16#3842#, 16),
     to_signed(16#3871#, 16), to_signed(16#38A1#, 16), to_signed(16#38CF#, 16), to_signed(16#38FD#, 16),
     to_signed(16#392B#, 16), to_signed(16#3958#, 16), to_signed(16#3984#, 16), to_signed(16#39B0#, 16),
     to_signed(16#39DB#, 16), to_signed(16#3A06#, 16), to_signed(16#3A30#, 16), to_signed(16#3A59#, 16),
     to_signed(16#3A82#, 16), to_signed(16#3AAB#, 16), to_signed(16#3AD3#, 16), to_signed(16#3AFA#, 16),
     to_signed(16#3B21#, 16), to_signed(16#3B47#, 16), to_signed(16#3B6D#, 16), to_signed(16#3B92#, 16),
     to_signed(16#3BB6#, 16), to_signed(16#3BDA#, 16), to_signed(16#3BFD#, 16), to_signed(16#3C20#, 16),
     to_signed(16#3C42#, 16), to_signed(16#3C64#, 16), to_signed(16#3C85#, 16), to_signed(16#3CA5#, 16),
     to_signed(16#3CC5#, 16), to_signed(16#3CE4#, 16), to_signed(16#3D03#, 16), to_signed(16#3D21#, 16),
     to_signed(16#3D3F#, 16), to_signed(16#3D5B#, 16), to_signed(16#3D78#, 16), to_signed(16#3D93#, 16),
     to_signed(16#3DAF#, 16), to_signed(16#3DC9#, 16), to_signed(16#3DE3#, 16), to_signed(16#3DFC#, 16),
     to_signed(16#3E15#, 16), to_signed(16#3E2D#, 16), to_signed(16#3E45#, 16), to_signed(16#3E5C#, 16),
     to_signed(16#3E72#, 16), to_signed(16#3E88#, 16), to_signed(16#3E9D#, 16), to_signed(16#3EB1#, 16),
     to_signed(16#3EC5#, 16), to_signed(16#3ED8#, 16), to_signed(16#3EEB#, 16), to_signed(16#3EFD#, 16),
     to_signed(16#3F0F#, 16), to_signed(16#3F20#, 16), to_signed(16#3F30#, 16), to_signed(16#3F40#, 16),
     to_signed(16#3F4F#, 16), to_signed(16#3F5D#, 16), to_signed(16#3F6B#, 16), to_signed(16#3F78#, 16),
     to_signed(16#3F85#, 16), to_signed(16#3F91#, 16), to_signed(16#3F9C#, 16), to_signed(16#3FA7#, 16),
     to_signed(16#3FB1#, 16), to_signed(16#3FBB#, 16), to_signed(16#3FC4#, 16), to_signed(16#3FCC#, 16),
     to_signed(16#3FD4#, 16), to_signed(16#3FDB#, 16), to_signed(16#3FE1#, 16), to_signed(16#3FE7#, 16),
     to_signed(16#3FEC#, 16), to_signed(16#3FF1#, 16), to_signed(16#3FF5#, 16), to_signed(16#3FF8#, 16),
     to_signed(16#3FFB#, 16), to_signed(16#3FFD#, 16), to_signed(16#3FFF#, 16), to_signed(16#4000#, 16));  -- sfix16 [256]
  CONSTANT Lookup_Table2_table_data       : vector_of_unsigned4(0 TO 63) := 
    (to_unsigned(16#0#, 4), to_unsigned(16#3#, 4), to_unsigned(16#6#, 4), to_unsigned(16#9#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#3#, 4), to_unsigned(16#6#, 4), to_unsigned(16#9#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#3#, 4), to_unsigned(16#6#, 4), to_unsigned(16#9#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#3#, 4), to_unsigned(16#6#, 4), to_unsigned(16#9#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#3#, 4), to_unsigned(16#6#, 4), to_unsigned(16#9#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#3#, 4), to_unsigned(16#6#, 4), to_unsigned(16#8#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#3#, 4), to_unsigned(16#5#, 4), to_unsigned(16#8#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#2#, 4), to_unsigned(16#5#, 4), to_unsigned(16#7#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#2#, 4), to_unsigned(16#4#, 4), to_unsigned(16#7#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#2#, 4), to_unsigned(16#4#, 4), to_unsigned(16#6#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#2#, 4), to_unsigned(16#3#, 4), to_unsigned(16#5#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#1#, 4), to_unsigned(16#3#, 4), to_unsigned(16#4#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#1#, 4), to_unsigned(16#2#, 4), to_unsigned(16#4#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#1#, 4), to_unsigned(16#2#, 4), to_unsigned(16#3#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#1#, 4), to_unsigned(16#1#, 4), to_unsigned(16#2#, 4),
     to_unsigned(16#0#, 4), to_unsigned(16#0#, 4), to_unsigned(16#1#, 4), to_unsigned(16#1#, 4));  -- ufix4 [64]

  -- Signals
  SIGNAL lutaddr_unsigned                 : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL lutaddrInReg                     : unsigned(9 DOWNTO 0) := to_unsigned(16#000#, 10);  -- ufix10
  SIGNAL lut1addr                         : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Lookup_Table1_k                  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL lut1out                          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL lut2addrp1                       : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL lut2addrp2                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL lut2addr                         : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Lookup_Table2_k                  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL lut2out                          : unsigned(3 DOWNTO 0);  -- ufix4_En4
  SIGNAL lut1out_reg                      : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16_En14
  SIGNAL lut2out_reg                      : unsigned(3 DOWNTO 0) := to_unsigned(16#0#, 4);  -- ufix4_En4
  SIGNAL lut2out_extend                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL lut2out_sf                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL adder_add_cast                   : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL adder_add_cast_1                 : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL adder_add_temp                   : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL addlutouts                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL lutoutput_tmp                    : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  lutaddr_unsigned <= unsigned(lutaddr);

  -- Look up table address input register
  LUTaddrRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        lutaddrInReg <= lutaddr_unsigned;
      END IF;
    END IF;
  END PROCESS LUTaddrRegister_process;


  -- Lookup table 1 address
  lut1addr <= lutaddrInReg(9 DOWNTO 2);

  -- Quarter sine wave table-Part1
  
  Lookup_Table1_k <= to_unsigned(16#00#, 8) WHEN lut1addr = to_unsigned(16#00#, 8) ELSE
      to_unsigned(16#FF#, 8) WHEN lut1addr = to_unsigned(16#FF#, 8) ELSE
      lut1addr;
  lut1out <= Lookup_Table1_table_data(to_integer(Lookup_Table1_k));

  lut2addrp1 <= lutaddrInReg(9 DOWNTO 6);

  lut2addrp2 <= lutaddrInReg(1 DOWNTO 0);

  -- Lookup table 2 address
  lut2addr <= lut2addrp1 & lut2addrp2;

  -- Quarter Sine Wave Table-Part2
  
  Lookup_Table2_k <= to_unsigned(16#00#, 6) WHEN lut2addr = to_unsigned(16#00#, 6) ELSE
      to_unsigned(16#3F#, 6) WHEN lut2addr = to_unsigned(16#3F#, 6) ELSE
      lut2addr;
  lut2out <= Lookup_Table2_table_data(to_integer(Lookup_Table2_k));

  -- Lookup table1 output register
  LUT1outRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        lut1out_reg <= lut1out;
      END IF;
    END IF;
  END PROCESS LUT1outRegister_process;


  -- Lookup table2 output register
  LUT2outRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        lut2out_reg <= lut2out;
      END IF;
    END IF;
  END PROCESS LUT2outRegister_process;


  lut2out_extend <= signed(resize(lut2out_reg & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 16));

  -- Shift look up table 2 outputs
  lut2out_sf <= lut2out_extend srl 7;

  -- Compute look up table output
  adder_add_cast <= resize(lut1out_reg, 17);
  adder_add_cast_1 <= resize(lut2out_sf, 17);
  adder_add_temp <= adder_add_cast + adder_add_cast_1;
  
  addlutouts <= X"7FFF" WHEN (adder_add_temp(16) = '0') AND (adder_add_temp(15) /= '0') ELSE
      X"8000" WHEN (adder_add_temp(16) = '1') AND (adder_add_temp(15) /= '1') ELSE
      adder_add_temp(15 DOWNTO 0);

  -- Look up table output register
  LUToutRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      lutoutput_tmp <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_12_0 = '1' THEN
        lutoutput_tmp <= addlutouts;
      END IF;
    END IF;
  END PROCESS LUToutRegister_process;


  lutoutput <= std_logic_vector(lutoutput_tmp);

END rtl;

