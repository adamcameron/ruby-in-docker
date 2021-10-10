require "boolean_operator_short_circuit"

describe BooleanOperatorShortCircuit do
    before :each do
        @boolean_returner = instance_spy(BooleanReturner)
        allow(@boolean_returner).to receive(:return_false).and_return false
        allow(@boolean_returner).to receive(:return_true).and_return true

        @sut = BooleanOperatorShortCircuit.new(@boolean_returner)
    end

    context "tests for short_circuit_or method" do
        it "only evaluates until an expression is true" do
            result = @sut.short_circuit_or

            expect(@boolean_returner).to have_received(:return_true).once
            expect(@boolean_returner).to have_received(:return_false).at_most(:once)
            expect(result).to be_truthy
        end
    end

    context "tests for short_circuit_and method" do
        it "only evaluates until an expression is false" do
            result = @sut.short_circuit_and

            expect(@boolean_returner).to have_received(:return_false).once
            expect(@boolean_returner).to have_received(:return_true).at_most(:once)
            expect(result).to be_falsy
        end
    end
end
