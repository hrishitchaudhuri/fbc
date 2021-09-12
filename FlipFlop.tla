------------------ MODULE FlipFlop ----------------------
VARIABLES State

Init == State = TRUE

Next(CLC(_)) == State' = CLC(State)

Out == State
=========================================================