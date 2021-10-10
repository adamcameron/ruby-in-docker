describe "Testing facets of RSpec mocking" do

    class MyService
        def initialize(dependency)
            @dependency = dependency
        end

        def calls_instance_method_to_mock_out
            @dependency.instance_method_to_mock_out
        end

        def calls_instance_method_to_not_mock
            @dependency.instance_method_to_not_mock
        end

        def calls_instance_method_to_mock_then_call
            @dependency.instance_method_to_mock_then_call
        end

        class << self
            def set_class_dependency(dependency)
                @@dependency = dependency
            end

            def calls_static_method_to_mock_out
                @@dependency.static_method_to_mock_out
            end

            def calls_static_method_to_not_mock
                @@dependency.static_method_to_not_mock
            end

            def calls_static_method_to_mock_then_call
                @@dependency.static_method_to_mock_then_call
            end
        end
    end

    class SomeDependency
        class << self
            def static_method_to_mock_out
                :THE_ORIGINAL_RETURN_VALUE
            end

            def static_method_to_not_mock
                :THE_ORIGINAL_RETURN_VALUE
            end

            def static_method_to_mock_then_call
                :THE_ORIGINAL_RETURN_VALUE
            end
        end

        def instance_method_to_mock_out
            :THE_ORIGINAL_RETURN_VALUE
        end

        def instance_method_to_not_mock
            :THE_ORIGINAL_RETURN_VALUE
        end

        def instance_method_to_mock_then_call
            :THE_ORIGINAL_RETURN_VALUE
        end
    end

    context("tests of static method mocking") do
        it "mocks-out a static method call" do
            allow(SomeDependency).to receive(:static_method_to_mock_out).and_return(:MOCKED_RETURN_VALUE)

            MyService.set_class_dependency(SomeDependency)

            expect(MyService.calls_static_method_to_mock_out).to be == :MOCKED_RETURN_VALUE
        end

        it "mocks-out one static method call but leaves another untouched" do
            allow(SomeDependency).to receive(:static_method_to_mock_out).and_return(:MOCKED_RETURN_VALUE)

            MyService.set_class_dependency(SomeDependency)

            expect(MyService.calls_static_method_to_not_mock).to be == :THE_ORIGINAL_RETURN_VALUE
        end

        it "expects a mocked method to be called, and then calls its original implementation" do
            allow(SomeDependency).to receive(:static_method_to_mock_then_call).and_call_original

            MyService.set_class_dependency(SomeDependency)

            expect(MyService.calls_static_method_to_not_mock).to be == :THE_ORIGINAL_RETURN_VALUE
            expect(MyService.calls_static_method_to_mock_then_call).to be == :THE_ORIGINAL_RETURN_VALUE
        end
    end

    context("tests of instance method mocking") do
        it "mocks-out an instance method call" do
            dependency = SomeDependency.new
            allow(dependency).to receive(:instance_method_to_mock_out).and_return(:MOCKED_RETURN_VALUE)

            service = MyService.new(dependency)

            expect(service.calls_instance_method_to_mock_out).to be == :MOCKED_RETURN_VALUE
        end

        it "mocks-out one instance method call but leaves another untouched" do
            dependency = SomeDependency.new
            allow(dependency).to receive(:instance_method_to_mock_out).and_return(:MOCKED_RETURN_VALUE)

            service = MyService.new(dependency)

            expect(service.calls_instance_method_to_mock_out).to be == :MOCKED_RETURN_VALUE
            expect(service.calls_instance_method_to_not_mock).to be == :THE_ORIGINAL_RETURN_VALUE
        end

        it "expects a mocked method to be called, and then calls its original implementation" do
            dependency = SomeDependency.new
            allow(dependency).to receive(:instance_method_to_mock_then_call).and_call_original

            service = MyService.new(dependency)

            expect(service.calls_instance_method_to_not_mock).to be == :THE_ORIGINAL_RETURN_VALUE
            expect(service.calls_instance_method_to_mock_then_call).to be == :THE_ORIGINAL_RETURN_VALUE
        end
    end
end
