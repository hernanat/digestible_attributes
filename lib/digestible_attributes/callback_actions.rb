require 'digestible_attributes/digester'

module DigestibleAttributes
  module CallbackActions
    extend ActiveSupport::Concern
    include Digester

    included do
      before_save :set_digest_column
    end

    private

    def set_digest_column
      send("#{self.class.digest_column}=".to_sym, calculate_digest)
    end
  end
end
