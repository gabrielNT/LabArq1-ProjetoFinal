onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /t_processor/the_processor/clock
add wave -noupdate /t_processor/the_processor/state_machine/next_state
add wave -noupdate -group fetch -radix hexadecimal /t_processor/the_processor/enable_program_counter
add wave -noupdate -group fetch -radix hexadecimal /t_processor/the_processor/instruction_address
add wave -noupdate -group fetch -radix hexadecimal /t_processor/the_processor/current_instruction
add wave -noupdate -group fetch /t_processor/the_processor/state_machine/opcode
add wave -noupdate -group fetch -radix hexadecimal /t_processor/the_processor/register1
add wave -noupdate -group fetch -radix hexadecimal /t_processor/the_processor/register2
add wave -noupdate -group fetch -radix hexadecimal /t_processor/the_processor/register3
add wave -noupdate -group fetch -radix hexadecimal /t_processor/the_processor/offset
add wave -noupdate -group fetch -radix hexadecimal /t_processor/the_processor/jump_offset
add wave -noupdate -group decode -radix hexadecimal /t_processor/the_processor/alu_operation
add wave -noupdate -group decode -radix hexadecimal /t_processor/the_processor/register_a
add wave -noupdate -group decode -radix hexadecimal /t_processor/the_processor/register_b
add wave -noupdate -group decode -radix hexadecimal /t_processor/the_processor/offset
add wave -noupdate -group decode -radix hexadecimal /t_processor/the_processor/alu_operand1
add wave -noupdate -group decode -radix hexadecimal /t_processor/the_processor/alu_operand2
add wave -noupdate -group decode -radix hexadecimal /t_processor/the_processor/alu_result
add wave -noupdate -group alu -radix hexadecimal /t_processor/the_processor/enable_alu_output_register
add wave -noupdate -group alu -radix hexadecimal /t_processor/the_processor/source_alu
add wave -noupdate -group alu -radix hexadecimal /t_processor/the_processor/data_from_alu_output_register
add wave -noupdate -group mem -radix hexadecimal /t_processor/the_processor/read_memory
add wave -noupdate -group mem -radix hexadecimal /t_processor/the_processor/write_memory
add wave -noupdate -group mem -radix hexadecimal /t_processor/the_processor/write_register
add wave -noupdate -group mem -radix hexadecimal /t_processor/the_processor/address_to_read
add wave -noupdate -group mem -radix hexadecimal /t_processor/the_processor/address_to_write
add wave -noupdate -group mem -radix hexadecimal /t_processor/the_processor/data_from_memory
add wave -noupdate -group mem -radix hexadecimal /t_processor/the_processor/jump_control
add wave -noupdate -group writeback -radix hexadecimal /t_processor/the_processor/write_register
add wave -noupdate -group writeback -radix hexadecimal /t_processor/the_processor/mem_to_register
add wave -noupdate -group writeback -radix hexadecimal /t_processor/the_processor/reg_dst
add wave -noupdate -group writeback -radix hexadecimal /t_processor/the_processor/destination_register
add wave -noupdate -group writeback -radix hexadecimal /t_processor/the_processor/data_to_write_in_register
add wave -noupdate -group video /t_processor/video_card/row
add wave -noupdate -group video /t_processor/video_card/column
add wave -noupdate -group video -radix hexadecimal /t_processor/video_address
add wave -noupdate -group video -radix hexadecimal /t_processor/video_out
add wave -noupdate -group video -radix hexadecimal /t_processor/pixel
add wave -noupdate -group video -radix hexadecimal /t_processor/video_card/disp_ena
add wave -noupdate -group video -radix hexadecimal /t_processor/video_card/h_sync
add wave -noupdate -group video -radix hexadecimal /t_processor/video_card/v_sync
add wave -noupdate -group video -radix hexadecimal /t_processor/VGA_R
add wave -noupdate -group video -radix hexadecimal /t_processor/VGA_G
add wave -noupdate -group video -radix hexadecimal /t_processor/VGA_B
add wave -noupdate -group video /t_processor/VGA_HS_d
add wave -noupdate -group video /t_processor/VGA_VS_d
add wave -noupdate -group video /t_processor/disp_ena_d
add wave -noupdate -expand -group relatorio9 -radix hexadecimal /t_processor/the_processor/branch_eq
add wave -noupdate -expand -group relatorio9 -radix hexadecimal /t_processor/the_processor/branch_nq
add wave -noupdate -expand -group relatorio9 -radix hexadecimal /t_processor/the_processor/z_flag
add wave -noupdate -expand -group relatorio9 -radix hexadecimal /t_processor/the_processor/branch
add wave -noupdate -expand -group relatorio10 -radix hexadecimal /t_processor/the_processor/addi_control
add wave -noupdate -expand -group relatorio10 -radix hexadecimal /t_processor/the_processor/data_to_write_in_register
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{addi 1} {125000 ps} 1} {{addi 2} {195000 ps} 1} {{beq nao pula} {169697 ps} 1} {{beq pula} {235000 ps} 1}
quietly wave cursor active 4
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {525 ns}