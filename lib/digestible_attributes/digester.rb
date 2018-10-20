module DigestibleAttributes
  module Digester
    extend ActiveSupport::Concern

    NULL_ESCAPE = "\u0000".freeze
    FIELD_ESCAPE = "\uffef".freeze
    FIELD_SEPARATOR = "\uffff".freeze

    def calculate_digest
      OpenSSL::Digest(self.class.digest_algorithm).hexdigest(digestible_string)
    end

    private

    def symbolized_digest_fields
      attributes.symbolize_keys.slice(*self.class.digest_fields)
    end

    def digestible_string
      symbolized_digest_fields.map do |field, value|
        base_str = "#{field}#{FIELD_ESCAPE}"
        if value.nil?
          base_str += NULL_ESCAPE
        else
          base_str += value.to_s
        end
      end.join(FIELD_SEPARATOR)
    end
  end
end
