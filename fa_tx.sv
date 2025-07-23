//========================== Full Adder Transaction Class =========================
class fa_tx extends uvm_sequence_item;
    //----> Randomizable variables for full adder 
    rand bit a;
    rand bit b;
    rand bit cin;
         bit sum;
         bit cout;

    `uvm_object_utils_begin(fa_tx)
        `uvm_field_int(a,    UVM_ALL_ON)
        `uvm_field_int(b,    UVM_ALL_ON)
        `uvm_field_int(cin,  UVM_ALL_ON)
        `uvm_field_int(sum,  UVM_ALL_ON)
        `uvm_field_int(cout, UVM_ALL_ON)
    `uvm_object_utils_end
    
    `NEW_OBJ


endclass    // fa_tx extends uvm_sequence_item;

//===============================================================================
// This file contains the transaction class for the full adder component    
    