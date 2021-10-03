require "if_unless"

describe IfUnless do
    context "compare_pre_and_post_fix_if method" do
        it "handles pre- and post-fix true if expressions" do
            result_of_prefix, result_of_postfix = IfUnless.compare_pre_and_post_fix_if(true)

            expect(result_of_prefix).to eq "set"
            expect(result_of_postfix).to eq "set"
        end

        it "handles pre- and post-fix false if expressions" do
            result_of_prefix, result_of_postfix = IfUnless.compare_pre_and_post_fix_if(false)

            expect(result_of_prefix).to eq "default"
            expect(result_of_postfix).to eq "default"
        end
    end

    context "compare_pre_and_post_fix_unless method" do
        it "handles pre- and post-fix true unless expressions" do
            result_of_prefix, result_of_postfix = IfUnless.compare_pre_and_post_fix_unless(true)

            expect(result_of_prefix).to eq "default"
            expect(result_of_postfix).to eq "default"
        end

        it "handles pre- and post-fix false unless expressions" do
            result_of_prefix, result_of_postfix = IfUnless.compare_pre_and_post_fix_unless(false)

            expect(result_of_prefix).to eq "set"
            expect(result_of_postfix).to eq "set"
        end
    end
end
