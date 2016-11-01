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

	def destroy
	  address = Address.find(params[:id])
	  if current_user.id == address.user.id
	  	address.destroy
	  	flash["notice"] = "successfully deleted this post"
	  else
	  	flash["notice"] = "You do not hae the permission to delete this post"	 
	  end
	  redirect_to addresses_path
	end
	
	private
	  def address_params
	    params.require(:address).permit(:street_address, :city, :state, :country, :zip_code)
	  end
end
