class OrderItemsController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def create
		item = OrderItem.new(order_item_params)
		order = Order.where("status = ?", "open").first
		amount = Product.find(params[:product_id]).price * item.quantity
		if order.nil?
			address = confirm_shipping_info
			new_order = current_user.orders.create(status: "open", total_amount: amount, address_id: address.id)
			item_order_save(item, new_order, amount)
		else
			item_order_save(item, order, amount)
		end
		redirect_to products_path
	end

	def checkout

	end

	private
		def order_item_params
			params.require(:order_item).permit(:quantity, :size, :color)
		end

		def order_params
			params.permit(:id)
		end

		def item_order_save (item, order, amount)
			item.order_id = order.id
			item.product_id = params[:product_id]
			order.total_amount += amount
			order.save
			item.save

			if item.persisted?
				flash["notice"] = "Item successfully added to cart"
			else
				flash["notice"] = "Item could not be added to your cart, please try again"
			end
		end

		def calculate_vat (address)

		end

		def confirm_shipping_info
			address = Address.where("user_id = ?", current_user.id)
			if address.empty?
				address = Address.create(street_address: 'enter details', city: 'enter details', 
					state: 'enter details', country: 'enter details', zip_code: 'enter details')
			else
				address = address.first
			end
		end
end