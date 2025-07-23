// ========================== Full Adder Scoreboard ===========================

class fa_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(fa_scoreboard)
    `NEW_COMP
  fa_tx q[$],tx;
  bit sum_t,cout_t;
    // Analysis port to receive transactions from the monitor
    uvm_analysis_imp #(fa_tx,fa_scoreboard) analysis_imp;

//-------> Build phase to initialize the analysis port
function void build_phase(uvm_phase phase);
        `uvm_info("FA_SBD", "Inside Build_phase of fa_sbd", UVM_HIGH)
        super.build_phase(phase);
        analysis_imp = new("analysis_imp", this);
endfunction

//-------> Run phase to process transactions
task run_phase(uvm_phase phase);
  `uvm_info("FA_SBD","inside run_phase of fa_sbd",UVM_HIGH) 
      forever begin
        wait(q.size()>0);
        tx=new();
        tx=q.pop_front();
        tx.print();
        {cout_t, sum_t} = tx.a + tx.b + tx.cin;

        if(sum_t==tx.sum && cout_t==tx.cout)begin
           matchess++;
        end
        else begin
           `uvm_error("FA_SBD",$sformatf("******************* MISSMATCHES OCCURRED **************\n\t\t sum_t=%0d  sum=%0d  &&  cout =%0d   cout_t=%0d\t\t ",sum_t,tx.sum,cout_t,tx.cout)) 
           missmatchess++;
        end
      end
endtask

//-------> Write method to receive transactions from the monitor
function void write(fa_tx t);
  $cast(tx,t);
  q.push_back(tx);
  
endfunction
endclass // fa_scoreboard extends uvm_scoreboard;

//==================================================================
// This file contains the scoreboard for the full adder component