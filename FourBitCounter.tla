------------------------------ MODULE FourBitCounter ------------------------------------
VARIABLES State_0, State_1, State_2, State_3

FF_0 == INSTANCE FlipFlop WITH State <- State_0
FF_1 == INSTANCE FlipFlop WITH State <- State_1
FF_2 == INSTANCE FlipFlop WITH State <- State_2
FF_3 == INSTANCE FlipFlop WITH State <- State_3

Init_0 == FF_0!Init
Init_1 == FF_1!Init
Init_2 == FF_2!Init
Init_3 == FF_3!Init

Init == Init_0 /\ Init_1 /\ Init_2 /\ Init_3

FourBitInc == INSTANCE FourBitIncrementer

FBI_OneInput_0(i) == FourBitInc!Out_0(TRUE, i)
Next_0 == FF_0!Next(FBI_OneInput_0)

FBI_OneInput_1(i) == FourBitInc!Out_1(TRUE, FF_0!Out, i)
Next_1 == FF_1!Next(FBI_OneInput_1)

FBI_OneInput_2(i) == FourBitInc!Out_2(TRUE, FF_0!Out, FF_1!Out, i)
Next_2 == FF_2!Next(FBI_OneInput_2)

FBI_OneInput_3(i) == FourBitInc!Out_3(TRUE, FF_0!Out, FF_1!Out, FF_2!Out, i)
Next_3 == FF_3!Next(FBI_OneInput_3)

Next == Next_0 /\ Next_1 /\ Next_2 /\ Next_3

Spec == Init /\ [][Next]_<<State_0, State_1, State_2, State_3>>
=========================================================================================