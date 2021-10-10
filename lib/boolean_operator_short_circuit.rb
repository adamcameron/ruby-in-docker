class BooleanOperatorShortCircuit

    def initialize(boolean_returner)
        @boolean_returner = boolean_returner
    end

    def short_circuit_or
        @boolean_returner.return_false || @boolean_returner.return_true || @boolean_returner.return_false
    end

    def short_circuit_and
        @boolean_returner.return_true && @boolean_returner.return_false && @boolean_returner.return_true
    end
end
