namespace Bell {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation SetQubitState(desired : Result, q1 : Qubit) : Unit {
        if (desired !=
            M(q1) // Measures q1
        ) {
            X(q1); // Flips q1
        }
    }

    @EntryPoint()
    operation TestBellState(count : Int, initial : Result) : (Int, Int) {
        mutable numOnes = 0;

        using ((q0, q1) = (Qubit(), Qubit())) {
            for (test in 1..count) {
                SetQubitState(initial, q0);
                H(q0);
                let res = M(q0);

                // Count the number of ones we saw:
                if (res == One) {
                    set numOnes += 1;
                }
            }

            SetQubitState(Zero, q0);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>
        Message("Test results (# of 0s, # of 1s): ");
        return (count - numOnes, numOnes);
    }
}
