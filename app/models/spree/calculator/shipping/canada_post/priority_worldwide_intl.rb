module Spree
  module Calculator::Shipping
    module CanadaPost
      class PriorityWorldwideIntl < Spree::Calculator::Shipping::CanadaPost::Base
        def self.description
          Spree.t("canada_post.priority_worldwide_intl")
        end
      end
    end
  end
end

