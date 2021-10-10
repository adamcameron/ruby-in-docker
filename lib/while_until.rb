class WhileUntil
    class << self
        def while_block
            a = []
            i = 1
            while i <= 5
                a.push(i)
                i += 1
            end
            return a
        end

        def while_expression
            a = []
            i = 0
            a.push(i+=1) while i < 5
            return a
        end

        def until_block
            a = []
            i = 1
            until i > 5
                a.push(i)
                i += 1
            end
            return a
        end

        def until_expression
            a = []
            i = 0
            a.push(i+=1) until i >= 5
            return a
        end
    end
end
