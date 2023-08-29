/* Topics: 
    - Module Declaration
    - Input and Output ports
    - Continuous Assignment
*/

module Wire(
    input in,
    output out 
    // ! Attention Please ---> NO comma for the last port
);
    assign out = in ;
endmodule

/*  Many modules can be declared in one file, but it is better to
    organize your files with specific names.

    The following module we will play with some wire :
    a ---> w
    b ---> x
    b ---> y
    c ---> z
*/

module play_with_wires(
    input a,b,c,
    output w,x,y,z
);
    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;
endmodule