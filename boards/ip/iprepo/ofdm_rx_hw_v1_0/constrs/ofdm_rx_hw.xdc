set rateCeofdm_rx_hw4 ofdm_rx_hw_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_rx_hw4 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_rx_hw4/Q]] IS_ENABLE]]
set rateCeofdm_rx_hw12 ofdm_rx_hw_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_rx_hw12 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_rx_hw12/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsofdm_rx_hw4 -to $rateCellsofdm_rx_hw4 -setup 4
set_multicycle_path -from $rateCellsofdm_rx_hw4 -to $rateCellsofdm_rx_hw4 -hold 3
set_multicycle_path -from $rateCellsofdm_rx_hw4 -to $rateCellsofdm_rx_hw12 -setup 4
set_multicycle_path -from $rateCellsofdm_rx_hw4 -to $rateCellsofdm_rx_hw12 -hold 3
set_multicycle_path -from $rateCellsofdm_rx_hw12 -to $rateCellsofdm_rx_hw4 -setup 4
set_multicycle_path -from $rateCellsofdm_rx_hw12 -to $rateCellsofdm_rx_hw4 -hold 3
set_multicycle_path -from $rateCellsofdm_rx_hw12 -to $rateCellsofdm_rx_hw12 -setup 12
set_multicycle_path -from $rateCellsofdm_rx_hw12 -to $rateCellsofdm_rx_hw12 -hold 11
