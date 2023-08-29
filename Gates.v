/* Topics: 
    - Bitwise Operators(
        and ---> &
        or  ---> |
        not ---> ~
        xor ---> ^
    ) you can combine them together like nand ~(a&b) and so on.
    - Delcaring internal wires
*/

module Gates(
    input a,b,c,
    output f // Remember no comma here
);
    wire e1 ,e2 ;
    
    assign e1 = a & ~b;
    assign e2 = ~(b ^ c);
    assign f  = e1 | e2;

endmodule