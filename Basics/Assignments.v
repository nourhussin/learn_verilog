/* Topics:
    - Blocking VS Non-blocking
    - Writing Numbers
*/

module Assignments(
    input a,b,c,
    output reg x1,x2,x3,x4,
    output[31:0] number1,number2,number3,number4,
    output signed[31:0] number5
);

    // Blocking assignments
    always @(a, b, c)
    begin
        x1 = a;
        x1 = x1 ^ b; // it is (a ^ b) because x1 here is equal to a
        x1 = x1 | c; // it is (a^b)|c because x1 here is equal to a^b
    end
    
    // Nonblocking assignments
    always @(a, b, c)
    begin
        x2 <= a;
        x2 <= x2 ^ b;
        x2 <= x2 | c; /* Only the last one will be considered 
        x2 is feedback or gate with c*/
    end    

    // Changing the order of blocking assignments
    always @(a, b, c)
    begin
        x3 = a;
        x3 = x3| c; // it is (a | c) because here x3 is equal to a
        x3 = x3 ^ b;// it is (a|c)^b because here x3 is equal to (a|c)
    end

    // Changing the order of nonblocking assignments
    always @(a, b, c)
    begin
        x4 <= a;
        x4 <= x4 | c;
        x4 <= x4 ^ b; /* Only the last one will be considered 
        x4 is feedback xor gate with b*/
    end  


    /* Important Notes:
        - In a combinational always block, use blocking assignments 
        - In a clocked always block, use non-blocking assignments
    */

    //! Writing Numbers: (You need not revise number systems and 2's complement)
    /* (-) (Size) ' (s) (Base) (Value)
     Default ---> positive unsigned (if you but - before the number or 
     you but s after the comma, this number will be treated as signed)
        Base:   
            b---> binary (0,1)
            o---> octal  (0,1,2,3,4,5,6,7)
            d---> decimal (0,1,2,3,4,5,6,7,8,9)
            h---> hexadecimal (0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f)
            

    if the value is smaller than the size the MSBs (Most Significant Bits) will be
    filled with 1's or 0's based on it is singed or not signed numbers

    if the value is grater than the size the MSBs will be trancuated (ingored)
    */  

    assign number1 = 20'h256ae;

    assign number2 = 32'd5200;

    assign number3 =  9'o555;

    assign number4 = -6'b10100; /*010100 is 20 in decimal but I want -20 here
    so it will be 2's complement 101100, this value is 6 bits but I'm saving it in 32 bits variable
    so it will be filled in this case with ones (111111...101100) but number4 is defined as unsigned
    so the value inside it will be 4294967284 in decimal*/

    assign number5 = -6'b10100; /* Same as number4, but here I'm saving the value 
    (11111...101100) inside signed variable, so the value in decidmal will be -20*/
endmodule