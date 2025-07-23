// ======================= top tb =================================

module tb;
//-----> Interface declaration
  fa_intf pif();

//-----> Test File Instantiation
full_adder dut(
  	.a  (pif.a),
    .b  (pif.b),
    .cin(pif.cin),
    .sum(pif.sum),
    .cout(pif.cout)
);

//-----> Setting up the interface in configuration database
initial begin
    uvm_config_db #(virtual fa_intf)::set(null, "*", "vif", pif);
end

//-----> Running the test
initial begin
    // update before executing ⚠️⚠️⚠️⚠️
    run_test("");
end
  
//-----> Dumping the waveform
initial begin
    $dumpfile("fa.vcd");
    $dumpvars();
end
endmodule 

//================================================================
// This file contains the top-level testbench for the full adder component