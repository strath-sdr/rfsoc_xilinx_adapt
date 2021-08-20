set rateCeofdm_tx_hw3 ofdm_tx_hw_default_clock_driver/clockdriver_x1/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw3 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw3/Q]] IS_ENABLE]]
set rateCeofdm_tx_hw6 ofdm_tx_hw_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw6 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw6/Q]] IS_ENABLE]]
set rateCeofdm_tx_hw12 ofdm_tx_hw_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsofdm_tx_hw12 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_tx_hw12/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsofdm_tx_hw3 -to $rateCellsofdm_tx_hw3 -setup 3
set_multicycle_path -from $rateCellsofdm_tx_hw3 -to $rateCellsofdm_tx_hw3 -hold 2
set_multicycle_path -from $rateCellsofdm_tx_hw3 -to $rateCellsofdm_tx_hw6 -setup 3
set_multicycle_path -from $rateCellsofdm_tx_hw3 -to $rateCellsofdm_tx_hw6 -hold 2
set_multicycle_path -from $rateCellsofdm_tx_hw3 -to $rateCellsofdm_tx_hw12 -setup 3
set_multicycle_path -from $rateCellsofdm_tx_hw3 -to $rateCellsofdm_tx_hw12 -hold 2
set_multicycle_path -from $rateCellsofdm_tx_hw6 -to $rateCellsofdm_tx_hw3 -setup 3
set_multicycle_path -from $rateCellsofdm_tx_hw6 -to $rateCellsofdm_tx_hw3 -hold 2
set_multicycle_path -from $rateCellsofdm_tx_hw6 -to $rateCellsofdm_tx_hw6 -setup 6
set_multicycle_path -from $rateCellsofdm_tx_hw6 -to $rateCellsofdm_tx_hw6 -hold 5
set_multicycle_path -from $rateCellsofdm_tx_hw6 -to $rateCellsofdm_tx_hw12 -setup 6
set_multicycle_path -from $rateCellsofdm_tx_hw6 -to $rateCellsofdm_tx_hw12 -hold 5
set_multicycle_path -from $rateCellsofdm_tx_hw12 -to $rateCellsofdm_tx_hw3 -setup 3
set_multicycle_path -from $rateCellsofdm_tx_hw12 -to $rateCellsofdm_tx_hw3 -hold 2
set_multicycle_path -from $rateCellsofdm_tx_hw12 -to $rateCellsofdm_tx_hw6 -setup 6
set_multicycle_path -from $rateCellsofdm_tx_hw12 -to $rateCellsofdm_tx_hw6 -hold 5
set_multicycle_path -from $rateCellsofdm_tx_hw12 -to $rateCellsofdm_tx_hw12 -setup 12
set_multicycle_path -from $rateCellsofdm_tx_hw12 -to $rateCellsofdm_tx_hw12 -hold 11
