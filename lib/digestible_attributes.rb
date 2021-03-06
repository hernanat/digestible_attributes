require 'active_support'
require 'digestible_attributes/configuration'
require 'digestible_attributes/railtie'

module DigestibleAttributes
  ActiveSupport.on_load(:active_record) do
    extend DigestibleAttributes::Configuration
  end
end
