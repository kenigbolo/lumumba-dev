class OrderItemsController < ApplicationController
	before_action :authenticate_user!
	def create
		item = OrderItem.new(order_item_params)
		order = current_user.orders.where("status = ?", "open").first
		amount = Product.find(params[:product_id]).price * item.quantity

		if order.nil?
			new_order = current_user.orders.create(status: "open")
			item_order_save(item, new_order, amount)
		else
			item_order_save(item, order, amount)
		end
		redirect_to products_path
	end

	def destroy
	  order_item = OrderItem.find(params[:id])
	  if current_user.id == order_item.order.user.id
	  	order = current_user.orders.where("id = ?", order_item.order_id).first
	  	order.sub_total -= (order_item.get_product.price * order_item.quantity)
	  	order.save
	  	order_item.destroy
	  	flash["notice"] = "Item successfully deleted from Cart"
	  else
	  	flash["notice"] = "You do not have the permission to delete this post"	 
	  end
	  redirect_to request.referer
	end


	private
		def order_item_params
			params.require(:order_item).permit(:quantity, :size, :color)
		end

		def item_order_save (item, order, amount)
			item.order_id = order.id
			item.product_id = params[:product_id]
			order.sub_total += amount
			item.save

			if item.persisted?
				flash["notice"] = "Item successfully added to cart"
				order.save
			else
				flash["notice"] = "Item could not be added to your cart, please try again"
			end
		end
end