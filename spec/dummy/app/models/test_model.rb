class TestModel < ApplicationRecord
  def self.properly_configured
    digestible_attributes fields: [:foo, :bar, :baz], algorithm: :MD5, digest_column: :md5_digest
    self
  end

  def self.with_improper_digest_field
    digestible_attributes fields: [:foo, :bar, :biz]
    self
  end

  def self.with_improper_digest_algorithm
    digestible_attributes fields: [:foo, :bar, :baz], algorithm: :MD6
    self
  end

  def self.with_improper_digest_column
    digestible_attributes fields: [:foo, :bar, :baz], digest_column: :kanye
    self
  end
end
