/***********************************************************************
 * A gate level 1 bit adder model.
 **********************************************************************/

module gate2_adder
(input  wire a, b, ci,
 output wire sum, co);
  timeunit 1ns; timeprecision 1ns;

  wire  n1, n2, n3;

  xor    g1 (n1, a, b);
  xor #2 g2 (sum, nl, ci);
  and    g3 (n2, a, b, c);
  and    g4 (n3, n1, ci);
  or  #2 g5 (co, n2, n3);

endmodule
