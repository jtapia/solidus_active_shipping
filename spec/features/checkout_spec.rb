require 'spec_helper'

describe "Checkout", type: :feature do
  include_context 'US stock location'
  include_context 'US package setup'
  include_context 'checkout setup'
  include CheckoutHelper
  include_context 'FedEx setup'

  let!(:valid_address) do
    create(:address, firstname: 'John',
                     lastname: 'Doe',
                     company: 'Company',
                     address1: '4157 Lawnview Ave',
                     city: 'Dallas',
                     state: create(:state_with_autodiscover, state_code: 'TX'),
                     zipcode: '75227',
                     phone: "(555) 555-5555")
  end

  before { order.reload }

  context "with valid shipping address", :vcr do
    it "does not break the per-item shipping method calculator", js: true do
      add_to_cart(mug)

      click_button "Checkout"

      fill_in "order_email", with: "test@example.com"
      click_button "Continue"
      fill_in_address(valid_address)
      click_button "Save and Continue"

      # select default shipping
      click_button "Save and Continue"
      expect(page).to have_content("Shipping total: $100.00")
    end
  end
end
