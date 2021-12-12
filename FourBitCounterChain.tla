---------------------------------- MODULE FourBitCounterChain ------------------------------------
VARIABLES State_0, State_1, State_2, State_3

FF_0 == INSTANCE FlipFlop WITH State <- State_0
FF_1 == INSTANCE FlipFlop WITH State <- State_1
FF_2 == INSTANCE FlipFlop WITH State <- State_2
FF_3 == INSTANCE FlipFlop WITH State <- State_3

InstFourBit == INSTANCE FourBitIncrementerChain
FourBit(inc, i1, i2, i3, i4) == InstFourBit!FourBitIncrementer(inc, i1, i2, i3, i4)

Init_0 == FF_0!Init
Init_1 == FF_1!Init
Init_2 == FF_2!Init
Init_3 == FF_3!Init

Init == /\ Init_0 
        /\ Init_1 
        /\ Init_2 
        /\ Init_3

getState_0 == FF_0!Out
getState_1 == FF_1!Out
getState_2 == FF_2!Out
getState_3 == FF_3!Out

RandomizedInc == CHOOSE I \IN {TRUE, FALSE}

Input_0(i) == FourBit(TRUE, i, getState_1, getState_2, getState_3).sum_0
Input_1(i) == FourBit(TRUE, getState_0, i, getState_2, getState_3).sum_1
Input_2(i) == FourBit(TRUE, getState_0, getState_1, i, getState_3).sum_2
Input_3(i) == FourBit(TRUE, getState_0, getState_1, getState_2, i).sum_3

Next_0 == FF_0!Next(Input_0)
Next_1 == FF_1!Next(Input_1)
Next_2 == FF_2!Next(Input_2)
Next_3 == FF_3!Next(Input_3)

Next == /\ Next_0
        /\ Next_1
        /\ Next_2
        /\ Next_3

Spec == Init /\ [][Next]_<<State_0, State_1, State_2, State_3>>
=======================================================================================================