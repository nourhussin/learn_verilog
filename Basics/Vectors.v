/* Topics:
    - Declaring Vectors
    - Accessing Vector Elements
    - Logical Operators(
        and ---> &&
        or  ---> ||
        not ---> ~ or !
    )
    - Reduction Operators (bitwise but for specific usage)
    - Concatenation and Replication
*/

module Vectors(
    input[7:0] a_8bits, b_8bits,
    input bit,
    output f1,f2,f3,
    output[7:0] y_8bits,
    output[31:0] data_32bits
);
    wire[15:0] data_16bits;
    /* Extra examples:
        wire  [4:1] x;         // 4-bit wire
        output wire [0:0] y;   // 1-bit wire that is also an output port (this is still a vector)
        input wire [3:-2] z;  // 6-bit wire input (negative ranges are allowed)
        output [3:0] a;       // 4-bit output wire. Type is 'wire' unless specified otherwise.
        wire [0:7] b;         // 8-bit wire where b[0] is the most-significant bit.
    */
    assign y_8bits[7:4] = a_8bits[3:0]; // assign the low 4 bits of a_8bits to the high 4 bits of y_8bits
    assign y_8bits[3:0] = b_8bits[3:0]; // assign the low 4 bits of b_8bits to the low  4 bits of y_8bits
    //! assign y_8bits[0:3] = ... Illegal. Vector part-select must match the direction of the declaration
    
    // Reduction
    assign f1 = & a_8bits; // and-ing all 8 bits 
    assign f2 = ~^ b_8bits;// xnor-ing all 8 bits (can be used in parity checking)
    
    // Logical Operation
    assign f3 = a_8bits && b_8bits; // f3 is 1 if (a!=0  and b!=0) it is a logic 
    // Hint: When working with 1 bit wire it doesn't matter using logic or bitwise
    // But it matters when working with vectors or conditions

    // Replication 
    assign data_16bits = {16{bit}}; // the wire 'bit' is repeated 16 time and assigned to 16 bits

    // Concatenation
    assign data_32bits = {data_16bits, a_8bits, b_8bits};

endmodule