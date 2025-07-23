//========================= Full Adder Sequence Library ========================= 
//==========================> Base_sequence <====================================
class fa_base_seq extends uvm_sequence #(fa_tx);
	uvm_phase phase;

	`uvm_object_utils(fa_base_seq)
	`NEW_OBJ

	//-------> task to be executed before the sequence starts
	task pre_body();
		phase = get_starting_phase();
		if(phase != null)begin 
			phase.raise_objection(this);
			phase.phase_done.set_drain_time(this,20);
		end
	endtask

	//-------> task to be executed after the sequence ends
	task post_body();
		if(phase != null)begin 
			phase.drop_objection(this);
		end
	endtask
endclass

//=========================> Functional_sequence <=============================
//-----------------------------------------------------------------------------
//----------------------> Sequence random_10_val_gen_seq <---------------------

class random_10_val_gen_seq extends fa_base_seq;
	`uvm_object_utils(random_10_val_gen_seq)
	`NEW_OBJ

	//-------> task to generate random values for a, b, cin
    task body();
		fa_tx tx;
    	repeat (10) begin
			`uvm_do(req)
    	end
	endtask
endclass

//===========================================================================
// This file contains the sequence library for the full adder component