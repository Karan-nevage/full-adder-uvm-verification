//======================== FULL ADDER AGENT ===================================


class fa_agent extends uvm_agent;
    `uvm_component_utils(fa_agent)
    `NEW_COMP

    fa_driver driver;
    fa_monitor mon;
    fa_coverage cov;
    fa_sqr sqr;

    //------> All the components of the agent are created in build_phase
    function void build_phase(uvm_phase phase);
        `uvm_info("FA_AGENT", "Inside Build_phase of FA_Agent", UVM_HIGH)
        
        super.build_phase(phase);
        driver = fa_driver    :: type_id::create("driver", this);
        mon    = fa_monitor   :: type_id::create("mon", this);
        cov    = fa_coverage  :: type_id::create("cov", this);
        sqr    = fa_sqr :: type_id::create("sqr", this);
    endfunction

    //------> Connect the Sequencer to driver | Coverage to Monitor
    function void connect_phase(uvm_phase phase);
        `uvm_info("FA_AGENT", "Inside Connect_phase of FA_Agent", UVM_HIGH)
        super.connect_phase(phase);
        driver.seq_item_port.connect(sqr.seq_item_export);
        mon.analysis_port.connect(cov.analysis_export);
    endfunction
    
endclass

//===============================================================================