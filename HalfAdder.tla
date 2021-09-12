------------------ MODULE HalfAdder ---------------------
InstAnd == INSTANCE And
InstXor == INSTANCE Xor

HalfAdder_Carry(i1, i2) == InstAnd!And_Out(i1, i2)
HalfAdder_Sum(i1, i2) == InstXor!Xor_Out(i1, i2)
===========================================================