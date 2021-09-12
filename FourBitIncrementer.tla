------------------------------ MODULE FourBitIncrementer ------------------------------------
And_Inst == INSTANCE And
Xor_Inst == INSTANCE Xor

And_0(inc, i1) == And_Inst!And_Out(inc, i1)
Xor_0(inc, i1) == Xor_Inst!Xor_Out(inc, i1)

Out_0(inc, i1) == Xor_0(inc, i1)

And_1(inc, i1, i2) == And_Inst!And_Out(And_0(inc, i1), i2)
Xor_1(inc, i1, i2) == Xor_Inst!Xor_Out(And_0(inc, i1), i2)

Out_1(inc, i1, i2) == Xor_1(inc, i1, i2)

And_2(inc, i1, i2, i3) == And_Inst!And_Out(And_1(inc, i1, i2), i3)
Xor_2(inc, i1, i2, i3) == Xor_Inst!Xor_Out(And_1(inc, i1, i2), i3)

Out_2(inc, i1, i2, i3) == Xor_2(inc, i1, i2, i3)

And_3(inc, i1, i2, i3, i4) == And_Inst!And_Out(And_2(inc, i1, i2, i3), i4)
Xor_3(inc, i1, i2, i3, i4) == Xor_Inst!Xor_Out(And_2(inc, i1, i2, i3), i4)

Out_3(inc, i1, i2, i3, i4) == Xor_3(inc, i1, i2, i3, i4)

Carry_Out(inc, i1, i2, i3, i4) == And_3(inc, i1, i2, i3, i4)
=============================================================================================