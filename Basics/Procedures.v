/* Topics:
   - Always blocks(combinational and clocked)
   - If statement
   - Case statement
   - Conditional ternary operator
   - Avoiding unwanted latches

*/

module Procedures(
    input clk, a,b,c,d, selector, in1,in2,
    output out1, selected_signal_1,
    output reg out2, out3 , selected_signal_2, selected_signal_3// define them as registers 
);
    // Remember: we used the following statement before
    assign out1 = (a & b) | (c ^ d);

    // We can do it using always block (Combinational)
    always @(a,b,c,d) /* Sensitivity list ---> always block works only if 
    any of the signals inside the sensitivity list is changed 
    not like continuous assignment which is working continuously*/
    begin
        out2 = (a & b) | (c ^ d);
        /* Without defining out2 as reg , it will give me an error. Why?
        always block works based on its sensitivity list, if I'm working with many
        inputs and I forgot writing them in the sensitivity list {always @(a,b)}
        in this case if c or d changed the always block will not work, but
        it has to save the previous value(Saving previous value means Registers)*/
    end
    //! Hint: If I don't know my sensitivity list or it contains many signals I can use the following:
    // always @(*) begin .......... end

    // Always block (clocked)
    always @(posedge clk) // works only in the positive edge of the clock
    begin
        out3 = (a & b) | (c ^ d);
        /* out3 is not the same as out2, it seems they are the same assignment, but
        the main difference is out3 only assigned at the positive edge of the clock,
        while out2 is assigned if any of a,b,c,d signals is changed. */

        //! If Statment
        if (selector == 1'b0) // 1'b0 means zero
        begin
            selected_signal_2 = in1;
        end
        else if (selector == 1'b1) // 1'b1 means one
        begin
            selected_signal_2 = in2;
        end
        else
        begin
            selected_signal_2 = 1'b0; // in the next lesson we will learn how to write numbers 
        end

        //! Case statment
        case(selector) /* Use casez if you want to use high impeadence conditions
        and use casex if you want to use don't care conditions which is useful in building 
        Priority Encoders */
        1'b0:   
                selected_signal_3 = in1;
        1'b1:
                selected_signal_3 = in2;
        default:
                selected_signal_3 = 1'b0;
        endcase
    end

    //! Ternary Operator
    assign selected_signal_1 = (selector)? in2 : in1;

    //! Avoiding Unwanted Latches
    // - All outputs must be assigned a value in all possible conditions
    // - Make default values for your outputs
    // - Use else condition if using if
    // - Use defalaut condition if using case

/* Important Notes:
    - Use wire type for continous assignments
    - Use reg type for assignemtns inside procedures(blocking and non-blocking in the following lesson)
    - procedures : always block and initial block (we'll use initial block in writing testbenches in following lessons)
    - If and Case statments is used inside procedures
    - Ternary operator is not used inside procedures
*/
endmodule