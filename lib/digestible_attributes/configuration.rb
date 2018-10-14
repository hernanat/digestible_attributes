require 'digestible_attributes/errors'

module DigestibleAttributes
  module Configuration
    extend ActiveSupport::Concern

    DIGEST_ALGORITHMS = %i(MD2 MD4 MD5 MDC2 RIPEMD160 SHA1 SHA224 SHA256 SHA384 SHA512)

    cattr_accessor :digest_fields
    cattr_accessor :digest_algorithm
    cattr_accessor :digest_column

    def digestible_attributes(options = {})
      @@digest_fields = options.fetch(:fields, [])
      @@digest_algorithm = options.fetch(:algorithm, :MD5)
      @@digest_column = options.fetch(:digest_column, default_digest_column)

      if configuration_valid?
        include CallbackActions
      end
    end

    def default_digest_column
      "#{@@digest_algorithm.downcase}_digest".to_sym
    end

    def configuration_valid?
      validate_digest_fields! &&
      validate_digest_algorithm! &&
      validate_digest_column!
    end

    def validate_digest_fields!
      if @@digest_fields & symbolized_columns != @@digest_fields
        diff = @@digest_fields - symbolized_columns

        raise Errors::DigestFieldError.new(diff)
      else
        true
      end
    end

    def validate_digest_algorithm!
      if DIGEST_ALGORITHMS.include?(@@digest_algorithm)
        true
      else
        raise Errors::DigestAlgorithmError.new(@@digest_algorithm)
      end
    end

    def validate_digest_column!
      if symbolized_columns.include?(@@digest_column)
        true
      else
        raise Errors::DigestColumnError.new(@@digest_column)
      end
    end

    def symbolized_columns
      self.column_names.map(&:to_sym)
    end
  end
end
