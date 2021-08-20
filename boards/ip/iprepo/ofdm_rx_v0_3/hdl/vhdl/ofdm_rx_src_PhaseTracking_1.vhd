-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_PhaseTracking_1.vhd
-- Created: 2021-08-19 15:20:58
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_PhaseTracking_1
-- Source Path: OFDM_Rx_HW/OFDMRx/PhaseTracking_1
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_PhaseTracking_1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_12_0                        :   IN    std_logic;
        enb_1_12_1                        :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
        dataIn_im                         :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
        dataValidIn                       :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
        dataOut_im                        :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
        dataValidOut                      :   OUT   std_logic
        );
END ofdm_rx_src_PhaseTracking_1;


ARCHITECTURE rtl OF ofdm_rx_src_PhaseTracking_1 IS

  -- Component Declarations
  COMPONENT ofdm_rx_src_DataArrange
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enb_1_12_1                      :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataIn_im                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataValidIn                     :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataOut_im                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_PilotCtrlGen
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enb_1_12_1                      :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataIn_im                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataOut_im                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          pilotOut_re                     :   OUT   std_logic_vector(1 DOWNTO 0);  -- sfix2
          pilotOut_im                     :   OUT   std_logic_vector(1 DOWNTO 0);  -- sfix2
          pilotEnd                        :   OUT   std_logic;
          dataValid                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_GradientEstimate
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enb_1_12_1                      :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataIn_im                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          pilotIn_re                      :   IN    std_logic_vector(1 DOWNTO 0);  -- sfix2
          pilotIn_im                      :   IN    std_logic_vector(1 DOWNTO 0);  -- sfix2
          PilotEnd                        :   IN    std_logic;
          dataValid                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataOut_im                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          gradientOut                     :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_PhaseErrorEst
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enb_1_12_1                      :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataIn_im                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          gradientIn                      :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
          dataValidIn                     :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataOut_im                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          PhaseOut                        :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_CordicRotate
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_12_0                      :   IN    std_logic;
          enb_1_12_1                      :   IN    std_logic;
          DataInRotate_re                 :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          DataInRotate_im                 :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          PhaseInRotate                   :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
          dataValidIn                     :   IN    std_logic;
          DataOutRotate_re                :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          DataOutRotate_im                :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_rx_src_DataArrange
    USE ENTITY work.ofdm_rx_src_DataArrange(rtl);

  FOR ALL : ofdm_rx_src_PilotCtrlGen
    USE ENTITY work.ofdm_rx_src_PilotCtrlGen(rtl);

  FOR ALL : ofdm_rx_src_GradientEstimate
    USE ENTITY work.ofdm_rx_src_GradientEstimate(rtl);

  FOR ALL : ofdm_rx_src_PhaseErrorEst
    USE ENTITY work.ofdm_rx_src_PhaseErrorEst(rtl);

  FOR ALL : ofdm_rx_src_CordicRotate
    USE ENTITY work.ofdm_rx_src_CordicRotate(rtl);

  -- Signals
  SIGNAL DataArrange_out1_re              : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL DataArrange_out1_im              : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL DataArrange_out2                 : std_logic;
  SIGNAL PilotCtrlGen_out1_re             : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL PilotCtrlGen_out1_im             : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL PilotCtrlGen_out2_re             : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL PilotCtrlGen_out2_im             : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL PilotCtrlGen_out3                : std_logic;
  SIGNAL PilotCtrlGen_out4                : std_logic;
  SIGNAL GradientEstimate_out1_re         : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL GradientEstimate_out1_im         : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL GradientEstimate_out2            : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL GradientEstimate_out3            : std_logic;
  SIGNAL PhaseErrorEst_out1_re            : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL PhaseErrorEst_out1_im            : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL PhaseErrorEst_out2               : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL PhaseErrorEst_out3               : std_logic;
  SIGNAL CordicRotate_out1_re             : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL CordicRotate_out1_im             : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL CordicRotate_out2                : std_logic;

BEGIN
  -- Phase Tracking Stage 1: Track linear phase error which occurs due to sampling phase/frequency offsets. The implemented 
  -- algorithm
  -- estimates the gradient of the linear phase error using pilot sub-carriers. 

  u_DataArrange : ofdm_rx_src_DataArrange
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1,
              dataIn_re => dataIn_re,  -- sfix18_En15
              dataIn_im => dataIn_im,  -- sfix18_En15
              dataValidIn => dataValidIn,
              dataOut_re => DataArrange_out1_re,  -- sfix18_En15
              dataOut_im => DataArrange_out1_im,  -- sfix18_En15
              dataValidOut => DataArrange_out2
              );

  u_PilotCtrlGen : ofdm_rx_src_PilotCtrlGen
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1,
              dataIn_re => DataArrange_out1_re,  -- sfix18_En15
              dataIn_im => DataArrange_out1_im,  -- sfix18_En15
              validIn => DataArrange_out2,
              dataOut_re => PilotCtrlGen_out1_re,  -- sfix18_En15
              dataOut_im => PilotCtrlGen_out1_im,  -- sfix18_En15
              pilotOut_re => PilotCtrlGen_out2_re,  -- sfix2
              pilotOut_im => PilotCtrlGen_out2_im,  -- sfix2
              pilotEnd => PilotCtrlGen_out3,
              dataValid => PilotCtrlGen_out4
              );

  u_GradientEstimate : ofdm_rx_src_GradientEstimate
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1,
              dataIn_re => PilotCtrlGen_out1_re,  -- sfix18_En15
              dataIn_im => PilotCtrlGen_out1_im,  -- sfix18_En15
              pilotIn_re => PilotCtrlGen_out2_re,  -- sfix2
              pilotIn_im => PilotCtrlGen_out2_im,  -- sfix2
              PilotEnd => PilotCtrlGen_out3,
              dataValid => PilotCtrlGen_out4,
              dataOut_re => GradientEstimate_out1_re,  -- sfix18_En15
              dataOut_im => GradientEstimate_out1_im,  -- sfix18_En15
              gradientOut => GradientEstimate_out2,  -- sfix23_En20
              dataValidOut => GradientEstimate_out3
              );

  u_PhaseErrorEst : ofdm_rx_src_PhaseErrorEst
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1,
              dataIn_re => GradientEstimate_out1_re,  -- sfix18_En15
              dataIn_im => GradientEstimate_out1_im,  -- sfix18_En15
              gradientIn => GradientEstimate_out2,  -- sfix23_En20
              dataValidIn => GradientEstimate_out3,
              dataOut_re => PhaseErrorEst_out1_re,  -- sfix18_En15
              dataOut_im => PhaseErrorEst_out1_im,  -- sfix18_En15
              PhaseOut => PhaseErrorEst_out2,  -- sfix23_En20
              dataValidOut => PhaseErrorEst_out3
              );

  u_CordicRotate : ofdm_rx_src_CordicRotate
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enb_1_12_0 => enb_1_12_0,
              enb_1_12_1 => enb_1_12_1,
              DataInRotate_re => PhaseErrorEst_out1_re,  -- sfix18_En15
              DataInRotate_im => PhaseErrorEst_out1_im,  -- sfix18_En15
              PhaseInRotate => PhaseErrorEst_out2,  -- sfix23_En20
              dataValidIn => PhaseErrorEst_out3,
              DataOutRotate_re => CordicRotate_out1_re,  -- sfix18_En15
              DataOutRotate_im => CordicRotate_out1_im,  -- sfix18_En15
              dataValidOut => CordicRotate_out2
              );

  dataOut_re <= CordicRotate_out1_re;

  dataOut_im <= CordicRotate_out1_im;

  dataValidOut <= CordicRotate_out2;

END rtl;

