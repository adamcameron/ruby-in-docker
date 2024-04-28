require "Greeting"

describe Greeting do
    it "should say \"G'day world\" when we call the greet method" do
        greeting = Greeting.new
        message = greeting.greet
        expect(message).to eq "G'day world!"
    end
end
