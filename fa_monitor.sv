//========================= Full Adder Monitor ==================================

class fa_monitor extends uvm_monitor;
    `uvm_component_utils(fa_monitor)
    `NEW_COMP

    //-------> Declare the transaction object and virtual interface
    fa_tx tx;
    virtual fa_intf vif;

    //-------> Analysis port Declaration
    uvm_analysis_port #(fa_tx) analysis_port;
    
    //----> Get the virtual interface from the configuration database
    function void build_phase(uvm_phase phase);
        `uvm_info("FA_MONITOR", "Inside Build_phase of FA_Monitor", UVM_HIGH)
        
        super.build_phase(phase);
        analysis_port = new("analysis_port", this);
        void'(uvm_config_db #(virtual fa_intf)::get(this, "", "vif", vif));
    endfunction

    //----> Run phase where the monitor will continuously read the input values from the virtual interface
    task run_phase(uvm_phase phase);
        `uvm_info("FA_MONITOR", "Inside Run_phase of FA_Monitor", UVM_HIGH) 
        forever begin
           #1;
        	tx = fa_tx::type_id::create("tx");
            //----> Read the input values from the virtual interface
            tx.a    = vif.a;
            tx.b    = vif.b;
            tx.cin  = vif.cin;
            //----> Read the output values from the virtual interface
            tx.sum   = vif.sum;
 			tx.cout  = vif.cout;
            //  tx.print();
            
            //----> Write the transaction to the analysis port
            analysis_port.write(tx);
        end
    endtask

endclass

//===============================================================================