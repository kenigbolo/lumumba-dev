class OrdersController < ApplicationController
	before_action :authenticate_user!
	def index
		@order = current_user.orders.where("status = ?", "open").first
	end

	def show
		@order = current_user.orders.find(params[:id])
		@addresses = current_user.addresses
		@address = Address.new
	end

	def shipping
		address = Address.find(params[:id])
		order = current_user.orders.where("status = ?", "open").first
		tax = calculate_tax(address, order)
		shipping_cost = calculate_shipping(address)
		save_order(order, tax, shipping_cost, address)

		redirect_to request.referer
	end

	def checkout

	end

	private
		def calculate_tax(address, order)
			country = Tax.find_by country: address.country
			tax_rate = 0.0
			if country != nil
				rate = country.vat_rate
				tax_rate = rate * order.sub_total
			end
			return tax_rate
		end

		def calculate_shipping(address)
			shipping_address_rate = Tax.find_by country: address.country
			shipping_cost = 15.00
			if shipping_address_rate != nil
				if shipping_address_rate.country == "ES"
					shipping_cost = 5.0
				else
					shipping_cost = 10.0
				end
			end
			return shipping_cost
		end

		def save_order(order, tax, shipping_cost, address)
			order.vat = tax
			order.shipping_cost = shipping_cost
			order.shipping = address.id.to_i
			order.total_amount = order.sub_total + order.shipping_cost + order.vat
			order.save
		end
end
