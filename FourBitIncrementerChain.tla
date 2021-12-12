---------------------------------- MODULE FourBitIncrementerChain ------------------------------------
InstHA == INSTANCE HalfAdder
InstThreeBit == INSTANCE ThreeBitIncrementer

HA(in1, in2) == InstHA!HalfAdder(in1, in2)
ThreeBit(inc, i1, i2, i3) == InstThreeBit!ThreeBitIncrementer(inc, i1, i2, i3)

FourBitIncrementer(inc, i1, i2, i3, i4) == [sum_0 |-> ThreeBit(inc, i1, i2, i3).sum_0,
                                            sum_1 |-> ThreeBit(inc, i1, i2, i3).sum_1,
                                            sum_2 |-> ThreeBit(inc, i1, i2, i3).sum_2, 
                                            sum_3 |-> HA(ThreeBit(inc, i1, i2, i3).carry, i4).sum,
                                            carry |-> HA(ThreeBit(inc, i1, i2, i3).carry, i4).carry]
======================================================================================================