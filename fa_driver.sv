//========================= Full Adder Driver ==========================================
class fa_driver extends uvm_driver #(fa_tx);
    `uvm_component_utils(fa_driver)
    `NEW_COMP

    fa_tx tx;
    virtual fa_intf vif;

    //----> Get the virtual interface from the configuration database
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_config_db #(virtual fa_intf)::get(this, "", "vif", vif));
    endfunction

    //----> Run phase where the driver will continuously fetch items from the sequencer
    task run_phase(uvm_phase phase);
        `uvm_info("FA_DRIVER", "Inside Run_phase of FA_Driver", UVM_HIGH)
        forever begin
            seq_item_port.get_next_item(tx);
            driver_tx(tx);
          //  tx.print();
            seq_item_port.item_done();
        end
    endtask

    //----> driver task
    task driver_tx(fa_tx tx);
       //functionality for a, b, cin , sum and cout 
            vif.a = tx.a;
            vif.b = tx.b;
            vif.cin = tx.cin;
		    #1;
            tx.sum =  vif.sum;
            tx.cout = vif.cout;     
    endtask  
endclass 

//===============================================================================
// This file contains the driver for the full adder component