---------------------------------- MODULE ThreeBitIncrementer -------------------------------
InstHA == INSTANCE HalfAdder
InstTwoBit == INSTANCE TwoBitIncrementer

HA(in1, in2) == InstHA!HalfAdder(in1, in2)
TwoBit(inc, in1, in2) == InstTwoBit!TwoBitIncrementer(inc, in1, in2)

ThreeBitIncrementer(inc, in1, in2, in3) == [sum_0 |-> TwoBit(inc, in1, in2).sum_0,
                                            sum_1 |-> TwoBit(inc, in1, in2).sum_1,
                                            sum_2 |-> HA(TwoBit(inc, in1, in2).carry, in3).sum,
                                            carry |-> HA(TwoBit(inc, in1, in2).carry, in3).carry]
================================================================================================