class OrderItemsController < ApplicationController

  before_action :authenticate_user!

  def create
    item = OrderItem.new(order_item_params)
    order = current_user.orders.open.first
    amount = Product.find(params[:product_id]).price * item.quantity

    if order
      save_item_and_order(item, order, amount)
    else
      new_order = current_user.orders.create(status: Order::OPEN)
      save_item_and_order(item, new_order, amount)
    end
    redirect_to products_path
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    if current_user.id == order_item.order.user.id
      begin
        ActiveRecord::Base.transaction do
          order = current_user.orders.find_by!(id: order_item.order_id)
          order.sub_total -= (order_item.get_product.price * order_item.quantity)
          order.save!
          order_item.destroy!
          flash['notice'] = 'Item successfully deleted from Cart.'
        end
      rescue
        flash['notice'] = 'Sorry, we encountered an error while deleting the item from the Cart.'
      end
    else
      flash['notice'] = 'You do not have the permission to delete this item.'
    end
    redirect_to request.referer
  end

  private

  def save_item_and_order(item, order, amount)
    item.order_id = order.id
    item.product_id = params[:product_id]
    order.sub_total += amount

    begin
      ActiveRecord::Base.transaction do
        item.save!
        order.save!
        flash['notice'] = 'Item successfully added to the Cart.'
      end
    rescue
      flash['notice'] = 'Item could not be added to your cart, please try again.'
    end
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :size, :color)
  end

end
