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
    operation HelloQ() : Unit {
        Message("Hello quantum world!");
    }
}
