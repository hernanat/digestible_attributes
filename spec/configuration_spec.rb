require "rails_helper"

RSpec.describe DigestibleAttributes::Configuration do
  describe ".digestible_attributes" do
    context "with proper configuration" do
      let(:model) { TestModel.properly_configured }

      it "sets the `digest_fields` attribute" do
        expect(model.digest_fields).to match_array([:foo, :bar, :baz])
      end

      it "sets the `digest_algorithm` attribute" do
        expect(model.digest_algorithm).to eql(:MD5)
      end

      it "sets the `digest_column` attribute" do
        expect(model.digest_column).to eql(:md5_digest)
      end
    end

    context "with improper digest field" do
      it "raises DigestibleAttributes::Errors::DigestFieldError" do
        expect { TestModel.with_improper_digest_field }.to(
          raise_error(DigestibleAttributes::Errors::DigestFieldError)
        )
      end
    end

    context "with improper digest algorithm" do
      it "raises DigestibleAttributes::Errors::DigestAlgorithmError" do
        expect { TestModel.with_improper_digest_algorithm }.to(
          raise_error(DigestibleAttributes::Errors::DigestAlgorithmError)
        )
      end
    end

    context "with improper digest column" do
      it "raises DigestibleAttributes::Errors::DigestColumnError" do
        expect { TestModel.with_improper_digest_column }.to(
          raise_error(DigestibleAttributes::Errors::DigestColumnError)
        )
      end
    end

  end
end
