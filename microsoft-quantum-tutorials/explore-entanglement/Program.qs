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

        using (qubit = Qubit()) {
            for (test in 1..count) {
                SetQubitState(initial, qubit);
                H(qubit);
                let res = M(qubit);

                // Count the number of ones we saw:
                if (res == One) {
                    set numOnes += 1;
                }
            }

            SetQubitState(Zero, qubit);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>
        Message("Test results (# of 0s, # of 1s): ");
        return (count - numOnes, numOnes);
    }
}
