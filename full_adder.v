//=========================== Full Adder Module ===========================
module full_adder (input  a, b, cin,  output reg  sum, cout);

  //---> Full adder logic
  always_comb begin
      {cout, sum} = a + b + cin;
  end

endmodule
//===============================================================================
// This file contains the full adder module definition

