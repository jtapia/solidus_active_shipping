require_dependency 'spree/calculator'

module Spree
  module Calculator::Shipping
    module Fedex
      class InternationalEconomyFreight < Spree::Calculator::Shipping::Fedex::Base
        def self.description
          Spree.t("fedex.intl_economy_freight")
        end
      end
    end
  end
end
