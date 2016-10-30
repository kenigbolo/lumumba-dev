class OrderItemsController < ApplicationController

	def create
		item = OrderItem.new(order_item_params)
		order = Order.where("status = ?", "open").first
		if order.nil?
			new_order = Order.create(user_id: current_user.id, status: "open")
			item.order_id = new_order.id
			item.save
		else
			item.order_id = order.id
			item.save
		end
		flash["notice"] = "Item successfully added to cart"
		redirect_to products_path
	end

	private
		def order_item_params
			params.require(:order_item).permit(:quantity, :size, :color, :product_id)
		end
end