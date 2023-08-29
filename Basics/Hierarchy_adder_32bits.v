/* Topics:
    - Modules Hierarchy ( we will build half-adder and use it 
    to build full-adder and then use the full-adder to build
    32 bits full_adder)
    - Modules Instantiation (order or name)

    Hint: you can use the same concept to build MUXs and other staff,
    and in advaced level the hierarchy is very important.
*/
/*-------------------------------------------------------------------------------------------------------*/
module half_adder(
    input first_bit, second_bit,
    output sum, carry
);

    assign sum  =  first_bit ^ second_bit;
    assign carry = first_bit & second_bit;

endmodule
/*-------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------------------*/
module full_adder(
    input first_bit_FA, second_bit_FA, input_carry,
    output sum_FA, output_carry
);
    // Inernal signals is needed here
    wire first_stage_sum, first_stage_carry, second_stage_carry;

    // Instantiating 2 half-adders
    // If I remember the order of the ports:
    half_adder HA1(
        first_bit_FA,
        second_bit_FA,
        first_stage_sum,
        first_stage_carry
    );
    // if I don't remember the order (using this method is better even if I remember)
    half_adder HA2(
        .first_bit(input_carry),
        .second_bit(first_stage_sum),
        .sum(sum_FA),
        .carry(second_stage_carry)
    );

    assign output_carry = first_stage_carry | second_stage_carry;

endmodule
/*-------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------------------*/
// Indroduce Paramaterization Concept and generate statement
module Hierarchy_adder_32bits #(parameter N = 32)(
    input[N-1:0] number1, number2,
    output[N-1:0] result,
    output c_flag
);
    wire[N-1:0] carry;
    assign c_flag = carry[N-1];
    
    generate
        genvar i;
        for(i=0; i<N; i=i+1)
        begin
            if(i==0)
                half_adder HA(
                    .first_bit(number1[0]),
                    .second_bit(number2[0]),
                    .sum(result[0]),
                    .carry(carry[0])
                );
            else
                full_adder FA(
                    .first_bit_FA(number1[i]),
                    .second_bit_FA(number2[i]),
                    .input_carry(carry[i-1]),
                    .sum_FA(result[i]),
                    .output_carry(carry[i])
                );
        end
    endgenerate

endmodule