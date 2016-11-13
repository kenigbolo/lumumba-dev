require 'rails_helper'
require 'spec_helper'

describe 'Adding an item to cart', js: true do

  context "Signed in" do

    sign_as

    let!(:product){ FactoryGirl.create :product }

    it "works" do

      visit product_path(product.slug)

      # these two are not ideal (because of the `visible: false`), but otherwise I cannot get it to work locally AND in Codeship
      find('#order_item_size_l', visible: false).click
      find('#order_item_color_blue', visible: false).click

      find("#order_item_quantity option[value='#{3}']").select_option

      expect {
        find('#new_order_item input[type=submit]').click
        sleep 3
      }.to change {
        OrderItem.count
      }.by(1)

      order_item = OrderItem.last
      expect(order_item.color).to eq 'blue'
      expect(order_item.size).to eq 'L'
      expect(order_item.quantity).to eq 3

      expect(page).to have_content("Item successfully added to the Cart")

    end

  end

end
