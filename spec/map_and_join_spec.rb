require "map_and_join"

describe MapAndJoin do
    it "should return the correct string of features" do
        peek = MapAndJoin.new
        features = peek.describe_ruby_features
        expect(features).to eq "Ruby is object-oriented. Ruby is duck-typed. Ruby is productive. Ruby is fun."
    end
end
