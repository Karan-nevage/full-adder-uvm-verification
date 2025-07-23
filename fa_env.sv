// ========================== Full Adder Envoirment ============================

class fa_env extends uvm_env;
    `uvm_component_utils(fa_env)
    `NEW_COMP

    // Declare the agent and scoreboard components
    fa_agent agent;
    fa_scoreboard sbd;

    //----> Allocate memory for the agent and scoreboard components
    function void build_phase(uvm_phase phase); 
        `uvm_info("FA_ENV", "Inside Build_phase of FA_Environment", UVM_HIGH)
        super.build_phase(phase);
        agent  = fa_agent ::type_id ::create("agent", this);
       sbd    = fa_scoreboard ::type_id ::create("sbd", this);
    endfunction 

    //----> Connect the scoreboard to the agent
    function void connect_phase(uvm_phase phase); 
        `uvm_info("FA_ENV", "Inside Connect_phase of FA_Environment", UVM_HIGH)
       agent.mon.analysis_port.connect(sbd.analysis_imp);
    endfunction

endclass // fa_env extends uvm_env;

//===============================================================================
// This file contains the environment for the full adder component