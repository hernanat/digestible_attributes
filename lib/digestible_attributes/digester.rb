module DigestibleAttributes
  module Digester
    extend ActiveSupport::Concern

    def calculate_digest
      OpenSSL::Digest(self.class.digest_algorithm).hexdigest(digestible_string)
    end

    private

    def digestible_string
      attributes.symbolize_keys.
        slice(*self.class.digest_fields).
        map { |field, value| "#{field}\uffef#{value.to_s}" }.
        join("\uffff")
    end
  end
end
