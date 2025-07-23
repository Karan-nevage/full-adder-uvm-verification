//========================== Full Adder Test Library =========================
//==========================> Base_test <====================================
class fa_base_test extends uvm_test;
    `uvm_component_utils(fa_base_test)
    `NEW_COMP

    fa_env env;

    //-----> Allocating Memory for the env
    function void build_phase(uvm_phase phase);
        `uvm_info("fa_base_test", "Building fa_base_test", UVM_HIGH)
        super.build_phase(phase);
        env = fa_env::type_id::create("env", this);
    endfunction

    //-----> End of elaboration phase for printing topology
    function void end_of_elobration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction

    //-----> Report phase for the scoreboard Results
   function void report_phase(uvm_phase phase);
     if( matchess>0 && missmatchess==0)
     `uvm_info("TEST_RPRT_PHSE",$sformatf("SCORBOARD TESTCASE PASSED with matches =%0d missmatches =%0d ",matchess,missmatchess),UVM_NONE)
     else  
       `uvm_error("TEST_RPRT_PHSE","SCORBOARD TESTCASE FAILED")
  endfunction 
   
endclass //base_test extends uvm_test;
//===============================================================================

//================= functional test =========================

class random_10_val_gen extends fa_base_test;
    `uvm_component_utils(random_10_val_gen)
    `NEW_COMP

    task run_phase(uvm_phase phase);
        random_10_val_gen_seq seq;
        seq = random_10_val_gen_seq::type_id::create("random_10_val_gen_seq");
        
        phase.raise_objection(this);
        seq.start(env.agent.sqr);
        //phase.phase_done.set_drain_time(this, 20);
        phase.drop_objection(this);
    endtask
endclass

        //************* Default Sequence ************

class test_default_seq extends fa_base_test;
	`uvm_component_utils(test_default_seq)
	`NEW_COMP

	function void build_phase(uvm_phase phase); 
		super.build_phase(phase);
		uvm_config_db #(uvm_object_wrapper) ::set(this,"env.agent.sqr.run_phase","default_sequence",random_10_val_gen_seq::get_type());
	endfunction
endclass

//=============================================================================================
// This file contains the test library for the full adder component

