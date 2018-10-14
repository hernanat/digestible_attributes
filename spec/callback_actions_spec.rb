require 'rails_helper'

RSpec.describe DigestibleAttributes::CallbackActions do
  describe "before_save" do
    let(:record) { TestModel.properly_configured.new(foo: 'boop', bar: 'bop', baz: 'beep') }

    it "sets the digest column value" do
      before_save_callbacks = record._save_callbacks.select { |cb| cb.kind == :before }.map(&:filter)

      expect(before_save_callbacks).to include(:set_digest_column)
      expect(record.md5_digest).to be_nil

      record.save

      expect(record.md5_digest).to be_present
    end
  end
end
