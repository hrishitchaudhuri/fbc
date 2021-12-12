---------------------------------- MODULE TwoBitIncrementer -------------------------------
InstHA == INSTANCE HalfAdder

HA(i1, i2) == InstHA!HalfAdder(i1, i2)

TwoBitSum_0_Out(inc, in) == HA(inc, in).sum
TwoBitCarry_0_Out(inc, in) == HA(inc, in).carry

TwoBitSum_1_Out(inc, in1, in2) == HA(TwoBitCarry_0_Out(inc, in1), in2).sum
TwoBitCarry_1_Out(inc, in1, in2) == HA(TwoBitCarry_0_Out(inc, in1), in2).carry

TwoBitIncrementer(inc, in1, in2) == [sum_0 |-> TwoBitSum_0_Out(inc, in1),
                                     sum_1 |-> TwoBitSum_1_Out(inc, in1, in2),
                                     carry |-> TwoBitCarry_1_Out(inc, in1, in2)]
============================================================================================