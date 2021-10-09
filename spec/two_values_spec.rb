require "two_values"

describe TwoValues do
    context "return_two_values" do
        it "returns two values" do
            first_value, second_value = TwoValues.return_two_values("first", "second")

            expect(first_value).to eq "first"
            expect(second_value).to eq "second"
        end
    end
end
