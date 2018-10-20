require "rails_helper"

RSpec.describe DigestibleAttributes::Digester do
  describe "#calculate_digest" do
    let(:model_class) { TestModel.properly_configured }

    it "is the same for records with the same fields values (sanity check)" do
      record_1 = model_class.new(foo: 'a', bar: 'b', baz: 'c')
      record_2 = model_class.new(foo: 'a', bar: 'b', baz: 'c')

      expect(record_1.calculate_digest).to eql(record_2.calculate_digest)
    end

    it "distinguishes between `nil` and the empty string" do
      record_1 = model_class.new(foo: 'a', bar: 'b', baz: '')
      record_2 = model_class.new(foo: 'a', bar: 'b', baz: nil)

      expect(record_1.calculate_digest).not_to eql(record_2.calculate_digest)
    end
  end
end
