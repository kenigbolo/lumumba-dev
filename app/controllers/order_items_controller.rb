class OrderItemsController < ApplicationController
	before_action :authenticate_user!
	def create
		item = OrderItem.new(order_item_params)
		order = Order.where("status = ?", "open").first
		amount = Product.find(params[:product_id]).price * item.quantity
		if order.nil?
			new_order = Order.create(user_id: current_user.id, status: "open", total_amount: amount)
			item_order_save(item, new_order, amount)
		else
			item_order_save(item, order, amount)
		end
		byebug
		redirect_to products_path
	end

	private
		def order_item_params
			params.require(:order_item).permit(:quantity, :size, :color)
		end

		def item_order_save (item, order)
			item.order_id = order.id
			item.product_id = params[:product_id]
			order.total_amount += amount
			order.save
			item.save

			if item.persits?
				flash["notice"] = "Item successfully added to cart"
			else
				flash["notice"] = "Item could not be added to your cart, please try again"
			end
		end
end