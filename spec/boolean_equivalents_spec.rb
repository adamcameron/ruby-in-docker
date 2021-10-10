require "boolean_equivalents"

describe BooleanEquivalents do
    context "tests for get_zero method" do
        it "interprets zero as true" do
            expect(BooleanEquivalents.get_zero).to be_truthy
        end

        it "interprets nil as false" do
            expect(BooleanEquivalents.get_nil).to be_falsey
        end
    end
end
