class AddressesController < ApplicationController
	before_action :authenticate_user!
	def index
		@address = Address.where("user_id = ?", current_user.id).first
		if @address.nil?
			render 'index'
		else
			render 'edit'
		end
	end

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)
		@address.user_id = current_user.id
		@address.save

		if @address.persisted?
			flash["notice"] = "Address successfully created"
			if request.referer == new_address_path
				redirect_to addresses_path
			else
				redirect_to request.referer
			end
		else
			render 'new'
		end
	end

	def update
		@address = Address.where("user_id = ?", current_user.id)

		if @address.update(address_params)
			flash["notice"] = "Address successfully updated"
			redirect_to addresses_path
		else
			render 'edit'
		end
	end

	def subregion_options
	  render partial: 'subregion_select'
	end
	
	private
	  def address_params
	    params.require(:address).permit(:street_address, :city, :state, :country, :zip_code)
	  end
end
