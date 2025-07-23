//======================== FULL ADDER COVERAGE =================================
class fa_coverage extends uvm_subscriber #(fa_tx);
    `uvm_component_utils(fa_coverage)
    fa_tx tx;

    // Covergroup to collect coverage data
    // Each coverpoint will create bins for the values of the respective field in fa_tx
    covergroup cg; 
        CHECK_A: coverpoint tx.a {
            option.auto_bin_max = 2;
        }
        CHECK_B: coverpoint tx.b {
            option.auto_bin_max = 2;
        }
        CHECK_CIN: coverpoint tx.cin {
            option.auto_bin_max = 2;
        }
        CHECK_SUM: coverpoint tx.sum {
            option.auto_bin_max = 2;
        }
        CHECK_COUT: coverpoint tx.cout {
            option.auto_bin_max = 2;
        }
    endgroup 

    // Constructor initiallizes the covergroup
    function new(string name="", uvm_component parent); 
        super.new(name, parent);
        cg = new();
    endfunction

    // Report phase to display coverage results
    function void report_phase(uvm_phase phase);
      $display(" |====> overall coverage  ::%0f <====|",$get_coverage());
      $display(" |==> A   signal coverage  ::%0f ",cg.CHECK_A.get_coverage());
      $display(" |==> B   signal coverage  ::%0f ",cg.CHECK_A.get_coverage());
      $display(" |==> Cin signal coverage  ::%0f ",cg.CHECK_A.get_coverage());
    endfunction 

    // Write function to sample the covergroup with the current transaction
    virtual function void write(fa_tx t); 
        $cast(tx, t);
        cg.sample();
    endfunction

endclass

//===============================================================================
// This file contains the coverage class for the full adder component