require "boolean_returner"

describe BooleanReturner do

    boolean_returner = BooleanReturner.new

    context "tests for return_true method" do
        it "returns true" do
            expect(boolean_returner.return_true).to be == true
        end
    end

    context "tests for return_false method" do
        it "returns false" do
            expect(boolean_returner.return_false).to be == false
        end
    end
end
