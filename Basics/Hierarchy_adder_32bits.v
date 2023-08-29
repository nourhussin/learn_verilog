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
module Hierarchy_adder_32bits(
    input input_carry,
    input[31:0] number1, number2,
    output[31:0] result,
    output c_flag
);

endmodule