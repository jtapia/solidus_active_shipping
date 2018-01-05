module Spree
  module Calculator::Shipping
    module CanadaPost
      class Xpresspost < Spree::Calculator::Shipping::CanadaPost::Base
        def self.description
          Spree.t("canada_post.xpresspost")
        end
      end
    end
  end
end
