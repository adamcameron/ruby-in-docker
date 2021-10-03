require "show_types"

describe ShowTypes do
    context "make_type_list method" do
        it "should return a list of types" do
            types = ShowTypes.make_type_list([4,4.0,Rational(4/1),(4+4i),"four",true,false,nil,[],{},:MySymbol,ShowTypes,ShowTypes.new])
            expect(types).to eq [Integer,Float,Rational,Complex,String,TrueClass,FalseClass,NilClass,Array,Hash,Symbol,Class,ShowTypes]
        end
    end
    context "get_type method" do
        class TestCase
            attr_accessor :object, :type

            def initialize(object, type)
                @object = object
                @type = type
            end
        end

        test_cases = [
            TestCase.new(4,Integer),
            TestCase.new(4.0,Float),
            TestCase.new(Rational(4/1),Rational),
            TestCase.new((4+4i),Complex),
            TestCase.new("4",String),
            TestCase.new(true,TrueClass),
            TestCase.new(false,FalseClass),
            TestCase.new(nil,NilClass),
            TestCase.new([],Array),
            TestCase.new({},Hash),
            TestCase.new(:MySymbol,Symbol),
            TestCase.new(ShowTypes,Class),
            TestCase.new(ShowTypes.new,ShowTypes),
        ]
        test_cases.each do |test_case|
            it "should return the type #{test_case.type} for object #{test_case.object}" do
                type = ShowTypes.get_type(test_case.object)
                expect(type).to eq test_case.type
            end
        end
    end
end
