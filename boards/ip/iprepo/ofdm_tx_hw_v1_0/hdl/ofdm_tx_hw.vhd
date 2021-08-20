-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/Convert To AXI-Stream/Vector Reinterpret
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_vector_reinterpret is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_tx_hw_vector_reinterpret;
architecture structural of ofdm_tx_hw_vector_reinterpret is 
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  convert0_dout_net <= in_1;
  convert1_dout_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_f246d25280 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert0_dout_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_f246d25280 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert1_dout_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/Convert To AXI-Stream/Vector Reinterpret1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_vector_reinterpret1 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_tx_hw_vector_reinterpret1;
architecture structural of ofdm_tx_hw_vector_reinterpret1 is 
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  convert0_dout_net <= in_1;
  convert1_dout_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_f246d25280 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert0_dout_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_f246d25280 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert1_dout_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/Convert To AXI-Stream/Vector2Scalar
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_vector2scalar is
  port (
    i_1 : in std_logic_vector( 16-1 downto 0 );
    i_2 : in std_logic_vector( 16-1 downto 0 );
    o : out std_logic_vector( 32-1 downto 0 )
  );
end ofdm_tx_hw_vector2scalar;
architecture structural of ofdm_tx_hw_vector2scalar is 
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 32-1 downto 0 );
begin
  o <= concat1_y_net;
  reinterpret0_output_port_net <= i_1;
  reinterpret1_output_port_net <= i_2;
  concat1 : entity xil_defaultlib.sysgen_concat_060b189299 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret0_output_port_net,
    y => concat1_y_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/Convert To AXI-Stream/Vector2Scalar1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_vector2scalar1 is
  port (
    i_1 : in std_logic_vector( 16-1 downto 0 );
    i_2 : in std_logic_vector( 16-1 downto 0 );
    o : out std_logic_vector( 32-1 downto 0 )
  );
end ofdm_tx_hw_vector2scalar1;
architecture structural of ofdm_tx_hw_vector2scalar1 is 
  signal concat1_y_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  o <= concat1_y_net;
  reinterpret0_output_port_net <= i_1;
  reinterpret1_output_port_net <= i_2;
  concat1 : entity xil_defaultlib.sysgen_concat_060b189299 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret0_output_port_net,
    y => concat1_y_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/Convert To AXI-Stream
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_convert_to_axi_stream is
  port (
    real_in_1 : in std_logic_vector( 16-1 downto 0 );
    imag_in_1 : in std_logic_vector( 16-1 downto 0 );
    real_in_2 : in std_logic_vector( 16-1 downto 0 );
    imag_in_2 : in std_logic_vector( 16-1 downto 0 );
    data_out : out std_logic_vector( 64-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_tx_hw_convert_to_axi_stream;
architecture structural of ofdm_tx_hw_convert_to_axi_stream is 
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat3_y_net : std_logic_vector( 64-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net_x1 : std_logic_vector( 32-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal imag_1_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal imag_0_y_net : std_logic_vector( 16-1 downto 0 );
  signal concat2_y_net : std_logic_vector( 32-1 downto 0 );
  signal real_1_y_net : std_logic_vector( 16-1 downto 0 );
  signal real_0_y_net : std_logic_vector( 16-1 downto 0 );
begin
  data_out <= concat3_y_net;
  valid_out <= constant1_op_net;
  convert0_dout_net_x0 <= real_in_1;
  convert0_dout_net <= imag_in_1;
  convert1_dout_net <= real_in_2;
  convert1_dout_net_x0 <= imag_in_2;
  vector_reinterpret : entity xil_defaultlib.ofdm_tx_hw_vector_reinterpret 
  port map (
    in_1 => convert0_dout_net_x0,
    in_2 => convert1_dout_net,
    out_1 => reinterpret0_output_port_net,
    out_2 => reinterpret1_output_port_net
  );
  vector_reinterpret1 : entity xil_defaultlib.ofdm_tx_hw_vector_reinterpret1 
  port map (
    in_1 => convert0_dout_net,
    in_2 => convert1_dout_net_x0,
    out_1 => reinterpret0_output_port_net_x0,
    out_2 => reinterpret1_output_port_net_x0
  );
  vector2scalar : entity xil_defaultlib.ofdm_tx_hw_vector2scalar 
  port map (
    i_1 => reinterpret0_output_port_net_x0,
    i_2 => reinterpret1_output_port_net_x0,
    o => concat1_y_net_x0
  );
  vector2scalar1 : entity xil_defaultlib.ofdm_tx_hw_vector2scalar1 
  port map (
    i_1 => reinterpret0_output_port_net,
    i_2 => reinterpret1_output_port_net,
    o => concat1_y_net_x1
  );
  concat1 : entity xil_defaultlib.sysgen_concat_060b189299 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => imag_1_y_net,
    in1 => real_1_y_net,
    y => concat1_y_net
  );
  concat2 : entity xil_defaultlib.sysgen_concat_060b189299 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => imag_0_y_net,
    in1 => real_0_y_net,
    y => concat2_y_net
  );
  concat3 : entity xil_defaultlib.sysgen_concat_d8e82a17fd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => concat1_y_net,
    in1 => concat2_y_net,
    y => concat3_y_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_e1a1db9b3d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  imag_0 : entity xil_defaultlib.ofdm_tx_hw_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => concat1_y_net_x0,
    y => imag_0_y_net
  );
  imag_1 : entity xil_defaultlib.ofdm_tx_hw_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => concat1_y_net_x0,
    y => imag_1_y_net
  );
  real_0 : entity xil_defaultlib.ofdm_tx_hw_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => concat1_y_net_x1,
    y => real_0_y_net
  );
  real_1 : entity xil_defaultlib.ofdm_tx_hw_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => concat1_y_net_x1,
    y => real_1_y_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/FIR Interpolation SSR/Vector Convert
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_vector_convert is
  port (
    i_1 : in std_logic_vector( 31-1 downto 0 );
    i_2 : in std_logic_vector( 31-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_tx_hw_vector_convert;
architecture structural of ofdm_tx_hw_vector_convert is 
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 31-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 31-1 downto 0 );
begin
  o_1 <= convert0_dout_net;
  o_2 <= convert1_dout_net;
  fir_compiler_7_2_m_axis_data_tdata_vect0_net <= i_1;
  fir_compiler_7_2_m_axis_data_tdata_vect1_net <= i_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  convert0 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert0_dout_net
  );
  convert1 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/FIR Interpolation SSR/Vector Convert1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_vector_convert1 is
  port (
    i_1 : in std_logic_vector( 31-1 downto 0 );
    i_2 : in std_logic_vector( 31-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_tx_hw_vector_convert1;
architecture structural of ofdm_tx_hw_vector_convert1 is 
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 31-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 31-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
begin
  o_1 <= convert0_dout_net;
  o_2 <= convert1_dout_net;
  fir_compiler_7_2_m_axis_data_tdata_vect0_net <= i_1;
  fir_compiler_7_2_m_axis_data_tdata_vect1_net <= i_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  convert0 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert0_dout_net
  );
  convert1 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/FIR Interpolation SSR/Vector FIR Imag
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_vector_fir_imag is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo_1 : out std_logic_vector( 31-1 downto 0 );
    tdo_2 : out std_logic_vector( 31-1 downto 0 )
  );
end ofdm_tx_hw_vector_fir_imag;
architecture structural of ofdm_tx_hw_vector_fir_imag is 
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 31-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 31-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal convert6_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal ce_net : std_logic;
begin
  tdo_1 <= fir_compiler_7_2_m_axis_data_tdata_vect0_net;
  tdo_2 <= fir_compiler_7_2_m_axis_data_tdata_vect1_net;
  constant_op_net <= tvi;
  convert6_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_78ce534ebe8f2246e6995289cd5dddb1 
  port map (
    s_axis_data_tvalid => constant_op_net(0),
    s_axis_data_tdata_real => convert6_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_vect1 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    m_axis_data_tdata_vect0 => fir_compiler_7_2_m_axis_data_tdata_vect0_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/FIR Interpolation SSR/Vector FIR Real
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_vector_fir_real is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo_1 : out std_logic_vector( 31-1 downto 0 );
    tdo_2 : out std_logic_vector( 31-1 downto 0 )
  );
end ofdm_tx_hw_vector_fir_real;
architecture structural of ofdm_tx_hw_vector_fir_real is 
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 31-1 downto 0 );
  signal clk_net : std_logic;
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 31-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
begin
  tdo_1 <= fir_compiler_7_2_m_axis_data_tdata_vect0_net;
  tdo_2 <= fir_compiler_7_2_m_axis_data_tdata_vect1_net;
  constant_op_net <= tvi;
  convert3_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_78ce534ebe8f2246e6995289cd5dddb1 
  port map (
    s_axis_data_tvalid => constant_op_net(0),
    s_axis_data_tdata_real => convert3_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_vect1 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    m_axis_data_tdata_vect0 => fir_compiler_7_2_m_axis_data_tdata_vect0_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/FIR Interpolation SSR
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_fir_interpolation_ssr is
  port (
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    real_out_1 : out std_logic_vector( 16-1 downto 0 );
    imag_out_1 : out std_logic_vector( 16-1 downto 0 );
    real_out_2 : out std_logic_vector( 16-1 downto 0 );
    imag_out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_tx_hw_fir_interpolation_ssr;
architecture structural of ofdm_tx_hw_fir_interpolation_ssr is 
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 31-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0 : std_logic_vector( 31-1 downto 0 );
  signal convert0_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0 : std_logic_vector( 31-1 downto 0 );
  signal convert6_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 31-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
begin
  real_out_1 <= convert0_dout_net;
  imag_out_1 <= convert0_dout_net_x0;
  real_out_2 <= convert1_dout_net;
  imag_out_2 <= convert1_dout_net_x0;
  convert3_dout_net <= real_in;
  convert6_dout_net <= imag_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  vector_convert : entity xil_defaultlib.ofdm_tx_hw_vector_convert 
  port map (
    i_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0,
    i_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    o_1 => convert0_dout_net_x0,
    o_2 => convert1_dout_net_x0
  );
  vector_convert1 : entity xil_defaultlib.ofdm_tx_hw_vector_convert1 
  port map (
    i_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    i_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    o_1 => convert0_dout_net,
    o_2 => convert1_dout_net
  );
  vector_fir_imag : entity xil_defaultlib.ofdm_tx_hw_vector_fir_imag 
  port map (
    tvi => constant_op_net,
    tdi => convert6_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tdo_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0,
    tdo_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0
  );
  vector_fir_real : entity xil_defaultlib.ofdm_tx_hw_vector_fir_real 
  port map (
    tvi => constant_op_net,
    tdi => convert3_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tdo_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    tdo_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_e1a1db9b3d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate/FIR Interpolation Single
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_fir_interpolation_single is
  port (
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_3 : in std_logic;
    ce_3 : in std_logic;
    clk_6 : in std_logic;
    ce_6 : in std_logic;
    clk_12 : in std_logic;
    ce_12 : in std_logic;
    real_out : out std_logic_vector( 16-1 downto 0 );
    imag_out : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_tx_hw_fir_interpolation_single;
architecture structural of ofdm_tx_hw_fir_interpolation_single is 
  signal ce_net_x0 : std_logic;
  signal src_ce_net : std_logic;
  signal clk_net : std_logic;
  signal clk_net_x0 : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_stage_2_m_axis_data_tdata_path1_net : std_logic_vector( 31-1 downto 0 );
  signal clk_net_x1 : std_logic;
  signal convert6_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net_x1 : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal fir_stage_1_s_axis_data_tready_net : std_logic;
  signal fir_stage_3_m_axis_data_tdata_path1_net : std_logic_vector( 31-1 downto 0 );
  signal fir_stage_1_m_axis_data_tdata_path0_net : std_logic_vector( 32-1 downto 0 );
  signal fir_stage_3_m_axis_data_tdata_path0_net : std_logic_vector( 31-1 downto 0 );
  signal fir_stage_1_m_axis_data_tvalid_net : std_logic;
  signal fir_stage_1_m_axis_data_tdata_path1_net : std_logic_vector( 32-1 downto 0 );
  signal convert4_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_stage_2_m_axis_data_tdata_path0_net : std_logic_vector( 31-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_stage_3_s_axis_data_tready_net : std_logic;
  signal fir_stage_2_s_axis_data_tready_net : std_logic;
  signal fir_stage_3_m_axis_data_tvalid_net : std_logic;
  signal fir_stage_2_m_axis_data_tvalid_net : std_logic;
begin
  real_out <= convert3_dout_net;
  imag_out <= convert6_dout_net;
  reinterpret_output_port_net <= real_in;
  reinterpret1_output_port_net <= imag_in;
  clk_net_x1 <= clk_1;
  ce_net_x1 <= ce_1;
  clk_net_x0 <= clk_3;
  ce_net_x0 <= ce_3;
  clk_net <= clk_6;
  ce_net <= ce_6;
  src_clk_net <= clk_12;
  src_ce_net <= ce_12;
  convert1 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_stage_2_m_axis_data_tdata_path1_net,
    clk => clk_net_x0,
    ce => ce_net_x0,
    dout => convert1_dout_net
  );
  convert2 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_stage_2_m_axis_data_tdata_path0_net,
    clk => clk_net_x0,
    ce => ce_net_x0,
    dout => convert2_dout_net
  );
  convert3 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_stage_3_m_axis_data_tdata_path1_net,
    clk => clk_net_x1,
    ce => ce_net_x1,
    dout => convert3_dout_net
  );
  convert4 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_stage_1_m_axis_data_tdata_path1_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert4_dout_net
  );
  convert5 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_stage_1_m_axis_data_tdata_path0_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  convert6 : entity xil_defaultlib.ofdm_tx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_stage_3_m_axis_data_tdata_path0_net,
    clk => clk_net_x1,
    ce => ce_net_x1,
    dout => convert6_dout_net
  );
  fir_stage_1 : entity xil_defaultlib.xlfir_compiler_24d8b8a79551a6adf75ce6cba9ea2a3c 
  port map (
    s_axis_data_tdata_path1 => reinterpret_output_port_net,
    s_axis_data_tdata_path0 => reinterpret1_output_port_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    clk => clk_net_x1,
    ce => ce_net_x1,
    clk_6 => clk_net,
    ce_6 => ce_net,
    clk_12 => src_clk_net,
    ce_12 => src_ce_net,
    clk_logic_12 => src_clk_net,
    ce_logic_12 => src_ce_net,
    s_axis_data_tready => fir_stage_1_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_stage_1_m_axis_data_tvalid_net,
    m_axis_data_tdata_path1 => fir_stage_1_m_axis_data_tdata_path1_net,
    m_axis_data_tdata_path0 => fir_stage_1_m_axis_data_tdata_path0_net
  );
  fir_stage_2 : entity xil_defaultlib.xlfir_compiler_c52ad4fec0ed2f858038106c132bb114 
  port map (
    s_axis_data_tdata_path1 => convert4_dout_net,
    s_axis_data_tdata_path0 => convert5_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net_x1,
    ce => ce_net_x1,
    clk_3 => clk_net_x0,
    ce_3 => ce_net_x0,
    clk_6 => clk_net,
    ce_6 => ce_net,
    clk_logic_6 => clk_net,
    ce_logic_6 => ce_net,
    s_axis_data_tready => fir_stage_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_stage_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_path1 => fir_stage_2_m_axis_data_tdata_path1_net,
    m_axis_data_tdata_path0 => fir_stage_2_m_axis_data_tdata_path0_net
  );
  fir_stage_3 : entity xil_defaultlib.xlfir_compiler_cd4154af7096ad455bf8118056f85bde 
  port map (
    s_axis_data_tdata_path1 => convert1_dout_net,
    s_axis_data_tdata_path0 => convert2_dout_net,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    clk => clk_net_x1,
    ce => ce_net_x1,
    clk_3 => clk_net_x0,
    ce_3 => ce_net_x0,
    clk_logic_3 => clk_net_x0,
    ce_logic_3 => ce_net_x0,
    s_axis_data_tready => fir_stage_3_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_stage_3_m_axis_data_tvalid_net,
    m_axis_data_tdata_path1 => fir_stage_3_m_axis_data_tdata_path1_net,
    m_axis_data_tdata_path0 => fir_stage_3_m_axis_data_tdata_path0_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate/interpolate
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_interpolate_x0 is
  port (
    data : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_3 : in std_logic;
    ce_3 : in std_logic;
    clk_6 : in std_logic;
    ce_6 : in std_logic;
    clk_12 : in std_logic;
    ce_12 : in std_logic;
    m_axis_tdata : out std_logic_vector( 64-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_tx_hw_interpolate_x0;
architecture structural of ofdm_tx_hw_interpolate_x0 is 
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal real_slice_y_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal imag_slice_y_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net_x1 : std_logic;
  signal src_ce_net : std_logic;
  signal data_net : std_logic_vector( 32-1 downto 0 );
  signal concat3_y_net : std_logic_vector( 64-1 downto 0 );
  signal ce_net_x0 : std_logic;
  signal src_clk_net : std_logic;
  signal convert0_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net_x0 : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal clk_net_x1 : std_logic;
  signal convert6_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  data_net <= data;
  m_axis_tdata <= concat3_y_net;
  m_axis_tvalid <= constant1_op_net;
  clk_net_x1 <= clk_1;
  ce_net_x1 <= ce_1;
  clk_net_x0 <= clk_3;
  ce_net_x0 <= ce_3;
  clk_net <= clk_6;
  ce_net <= ce_6;
  src_clk_net <= clk_12;
  src_ce_net <= ce_12;
  convert_to_axi_stream : entity xil_defaultlib.ofdm_tx_hw_convert_to_axi_stream 
  port map (
    real_in_1 => convert0_dout_net,
    imag_in_1 => convert0_dout_net_x0,
    real_in_2 => convert1_dout_net,
    imag_in_2 => convert1_dout_net_x0,
    data_out => concat3_y_net,
    valid_out => constant1_op_net
  );
  fir_interpolation_ssr : entity xil_defaultlib.ofdm_tx_hw_fir_interpolation_ssr 
  port map (
    real_in => convert3_dout_net,
    imag_in => convert6_dout_net,
    clk_1 => clk_net_x1,
    ce_1 => ce_net_x1,
    real_out_1 => convert0_dout_net,
    imag_out_1 => convert0_dout_net_x0,
    real_out_2 => convert1_dout_net,
    imag_out_2 => convert1_dout_net_x0
  );
  fir_interpolation_single : entity xil_defaultlib.ofdm_tx_hw_fir_interpolation_single 
  port map (
    real_in => reinterpret_output_port_net,
    imag_in => reinterpret1_output_port_net,
    clk_1 => clk_net_x1,
    ce_1 => ce_net_x1,
    clk_3 => clk_net_x0,
    ce_3 => ce_net_x0,
    clk_6 => clk_net,
    ce_6 => ce_net,
    clk_12 => src_clk_net,
    ce_12 => src_ce_net,
    real_out => convert3_dout_net,
    imag_out => convert6_dout_net
  );
  imag_slice : entity xil_defaultlib.ofdm_tx_hw_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => data_net,
    y => imag_slice_y_net
  );
  real_slice : entity xil_defaultlib.ofdm_tx_hw_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => data_net,
    y => real_slice_y_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_e01da0986a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => real_slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_e01da0986a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => imag_slice_y_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW/interpolate
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_interpolate is
  port (
    data : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_3 : in std_logic;
    ce_3 : in std_logic;
    clk_6 : in std_logic;
    ce_6 : in std_logic;
    clk_12 : in std_logic;
    ce_12 : in std_logic;
    m_axis_tdata : out std_logic_vector( 64-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_tx_hw_interpolate;
architecture structural of ofdm_tx_hw_interpolate is 
  signal ce_net_x1 : std_logic;
  signal concat3_y_net : std_logic_vector( 64-1 downto 0 );
  signal ce_net : std_logic;
  signal src_ce_net : std_logic;
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal src_clk_net : std_logic;
  signal ce_net_x0 : std_logic;
  signal clk_net_x0 : std_logic;
  signal data_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net_x1 : std_logic;
begin
  data_net <= data;
  m_axis_tdata <= concat3_y_net;
  m_axis_tvalid <= constant1_op_net;
  clk_net_x1 <= clk_1;
  ce_net_x1 <= ce_1;
  clk_net_x0 <= clk_3;
  ce_net_x0 <= ce_3;
  clk_net <= clk_6;
  ce_net <= ce_6;
  src_clk_net <= clk_12;
  src_ce_net <= ce_12;
  interpolate : entity xil_defaultlib.ofdm_tx_hw_interpolate_x0 
  port map (
    data => data_net,
    clk_1 => clk_net_x1,
    ce_1 => ce_net_x1,
    clk_3 => clk_net_x0,
    ce_3 => ce_net_x0,
    clk_6 => clk_net,
    ce_6 => ce_net,
    clk_12 => src_clk_net,
    ce_12 => src_ce_net,
    m_axis_tdata => concat3_y_net,
    m_axis_tvalid => constant1_op_net
  );
end structural;
-- Generated from Simulink block OFDM_Tx_HW_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_struct is
  port (
    data : in std_logic_vector( 32-1 downto 0 );
    valid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_3 : in std_logic;
    ce_3 : in std_logic;
    clk_6 : in std_logic;
    ce_6 : in std_logic;
    clk_12 : in std_logic;
    ce_12 : in std_logic;
    m_axis_tdata : out std_logic_vector( 64-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_tx_hw_struct;
architecture structural of ofdm_tx_hw_struct is 
  signal concat3_y_net : std_logic_vector( 64-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal clk_net_x1 : std_logic;
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal valid_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal data_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net_x1 : std_logic;
  signal ce_net_x0 : std_logic;
  signal clk_net_x0 : std_logic;
begin
  data_net <= data;
  m_axis_tdata <= concat3_y_net;
  m_axis_tvalid <= constant1_op_net;
  valid_net <= valid;
  clk_net_x1 <= clk_1;
  ce_net_x1 <= ce_1;
  clk_net_x0 <= clk_3;
  ce_net_x0 <= ce_3;
  clk_net <= clk_6;
  ce_net <= ce_6;
  src_clk_net <= clk_12;
  src_ce_net <= ce_12;
  interpolate : entity xil_defaultlib.ofdm_tx_hw_interpolate 
  port map (
    data => data_net,
    clk_1 => clk_net_x1,
    ce_1 => ce_net_x1,
    clk_3 => clk_net_x0,
    ce_3 => ce_net_x0,
    clk_6 => clk_net,
    ce_6 => ce_net,
    clk_12 => src_clk_net,
    ce_12 => src_ce_net,
    m_axis_tdata => concat3_y_net,
    m_axis_tvalid => constant1_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw_default_clock_driver is
  port (
    ofdm_tx_hw_sysclk : in std_logic;
    ofdm_tx_hw_sysce : in std_logic;
    ofdm_tx_hw_sysclr : in std_logic;
    ofdm_tx_hw_clk1 : out std_logic;
    ofdm_tx_hw_ce1 : out std_logic;
    ofdm_tx_hw_clk3 : out std_logic;
    ofdm_tx_hw_ce3 : out std_logic;
    ofdm_tx_hw_clk6 : out std_logic;
    ofdm_tx_hw_ce6 : out std_logic;
    ofdm_tx_hw_clk12 : out std_logic;
    ofdm_tx_hw_ce12 : out std_logic
  );
end ofdm_tx_hw_default_clock_driver;
architecture structural of ofdm_tx_hw_default_clock_driver is 
begin
  clockdriver_x2 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => ofdm_tx_hw_sysclk,
    sysce => ofdm_tx_hw_sysce,
    sysclr => ofdm_tx_hw_sysclr,
    clk => ofdm_tx_hw_clk1,
    ce => ofdm_tx_hw_ce1
  );
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 3,
    log_2_period => 2
  )
  port map (
    sysclk => ofdm_tx_hw_sysclk,
    sysce => ofdm_tx_hw_sysce,
    sysclr => ofdm_tx_hw_sysclr,
    clk => ofdm_tx_hw_clk3,
    ce => ofdm_tx_hw_ce3
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 6,
    log_2_period => 3
  )
  port map (
    sysclk => ofdm_tx_hw_sysclk,
    sysce => ofdm_tx_hw_sysce,
    sysclr => ofdm_tx_hw_sysclr,
    clk => ofdm_tx_hw_clk6,
    ce => ofdm_tx_hw_ce6
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 12,
    log_2_period => 4
  )
  port map (
    sysclk => ofdm_tx_hw_sysclk,
    sysce => ofdm_tx_hw_sysce,
    sysclr => ofdm_tx_hw_sysclr,
    clk => ofdm_tx_hw_clk12,
    ce => ofdm_tx_hw_ce12
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_tx_hw is
  port (
    data : in std_logic_vector( 32-1 downto 0 );
    valid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    m_axis_tdata : out std_logic_vector( 64-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end ofdm_tx_hw;
architecture structural of ofdm_tx_hw is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "ofdm_tx_hw,sysgen_core_2020_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=4.16667,system_simulink_period=4.16667e-09,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=inf,concat=5,constant=2,convert=10,fir_compiler_v7_2=5,reinterpret=6,slice=6,}";
  signal ce_1_net : std_logic;
  signal clk_3_net : std_logic;
  signal ce_6_net : std_logic;
  signal ce_12_net : std_logic;
  signal clk_1_net : std_logic;
  signal ce_3_net : std_logic;
  signal clk_6_net : std_logic;
  signal clk_12_net : std_logic;
begin
  ofdm_tx_hw_default_clock_driver : entity xil_defaultlib.ofdm_tx_hw_default_clock_driver 
  port map (
    ofdm_tx_hw_sysclk => clk,
    ofdm_tx_hw_sysce => '1',
    ofdm_tx_hw_sysclr => '0',
    ofdm_tx_hw_clk1 => clk_1_net,
    ofdm_tx_hw_ce1 => ce_1_net,
    ofdm_tx_hw_clk3 => clk_3_net,
    ofdm_tx_hw_ce3 => ce_3_net,
    ofdm_tx_hw_clk6 => clk_6_net,
    ofdm_tx_hw_ce6 => ce_6_net,
    ofdm_tx_hw_clk12 => clk_12_net,
    ofdm_tx_hw_ce12 => ce_12_net
  );
  ofdm_tx_hw_struct : entity xil_defaultlib.ofdm_tx_hw_struct 
  port map (
    data => data,
    valid => valid,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    clk_3 => clk_3_net,
    ce_3 => ce_3_net,
    clk_6 => clk_6_net,
    ce_6 => ce_6_net,
    clk_12 => clk_12_net,
    ce_12 => ce_12_net,
    m_axis_tdata => m_axis_tdata,
    m_axis_tvalid => m_axis_tvalid
  );
end structural;
