require "class_behaviour"

describe ClassBehaviour do
    context "tests for returns_class_name method" do

        class SomeThing
        end

        it "returns the class name of a passed-in class" do
            expect(ClassBehaviour.returns_class_name(SomeThing)).to be == "SomeThing"
        end
    end

    context "tests for call_class_method_on_object method" do

        it "can call a class method on an instance of the class" do
            class_behaviour = ClassBehaviour.new
            expect(class_behaviour.class.call_class_method_on_object).to be == :EXPECTED_VALUE
        end
    end
end
