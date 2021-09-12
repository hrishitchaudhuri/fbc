------------------ MODULE FullAdder ---------------------
InstXor == INSTANCE Xor

Xor_0(i1, i2) == InstXor!Xor_Out(i1, i2)
Xor_1(i1, i2, cin) == InstXor!Xor_Out(InstXor_0(i1, i2), cin)

FullAdder_Sum(i1, i2, cin) == Xor_1(i1, i2, cin)

InstAnd == INSTANCE And

And_0(i1, i2) == InstAnd!And_Out(i1, i2)
And_1(i1, cin) == InstAnd!And_Out(i1, cin)
And_2(i2, cin) == InstAnd!And_Out(i2, cin)

InstOr == INSTANCE Or

Or_0(i1, i2, cin) == InstOr!Or_Out(And_0(i1, i2), And_1(i1, cin))
Or_1(i1, i2, cin) == InstOr!Or_Out(Or_0(i1, i2, cin), And_2(i2, cin))

FullAdder_Carry(i1, i2, cin) == Or_1(i1, i2, cin)
===========================================================