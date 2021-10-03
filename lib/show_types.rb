class ShowTypes
    class << self
        def make_type_list(list)
            list.map(&:class)
        end
        def get_type(object)
            object.class
        end
    end
end
