class MapAndJoin

    def describe_ruby_features
        properties = ["object-oriented", "duck-typed", "productive", "fun"]
        properties
            .map { |feature| "Ruby is #{feature}."}
            .join(" ")
    end

 end
