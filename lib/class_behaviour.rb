class ClassBehaviour
    class << self
        def returns_class_name(class_reference)
            class_reference.name
        end
        def call_class_method_on_object
            return :EXPECTED_VALUE
        end
    end
end
