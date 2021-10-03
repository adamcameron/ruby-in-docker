class IfUnless
    class << self
        def compare_pre_and_post_fix_if(conditional)
            result_of_prefix = "default"
            result_of_postfix = "default"

            if conditional
                result_of_prefix = "set"
            end
            result_of_prefix = "set" if conditional

            return result_of_prefix, result_of_prefix
        end
        def compare_pre_and_post_fix_unless(conditional)
            result_of_prefix = "default"
            result_of_postfix = "default"

            unless conditional
                result_of_prefix = "set"
            end
            result_of_prefix = "set" unless conditional

            return result_of_prefix, result_of_prefix
        end
    end
end
