require "while_until"

describe WhileUntil do

    expected = [1,2,3,4,5]

    context "while_block method" do
        it "uses a while block to populate the array" do
            array = WhileUntil.while_block

            expect(array).to eq expected
        end
    end

    context "while_expression method" do
        it "uses a while expression to populate the array" do
            array = WhileUntil.while_expression

            expect(array).to eq expected
        end
    end

    context "until_block method" do
        it "uses an until block to populate the array" do
            array = WhileUntil.until_block

            expect(array).to eq expected
        end
    end

    context "until_expression method" do
        it "uses an until expression to populate the array" do
            array = WhileUntil.until_expression

            expect(array).to eq expected
        end
    end
end
