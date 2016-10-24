class AddressController < ApplicationController
	before_action :authenticate_user!
	def create
		@address = Address.new(address_params)
		@address.user_id = current_user.id
		@address.save

		if @address.persisted?
			flash["notice"] = "Post successfully created"
			redirect_to @address
		else
			render @address
		end
	end

	def edit
		@address = Address.find(params[:id])
		if current_user.id != @address.user.id
			redirect_to @address
		end
	end

	def update
		@address = address.find(params[:id])

		if @address.update(address_params)
			redirect_to @address
		else
			render 'edit'
		end
	end
	
	private
	  def address_params
	    params.require(:address).permit(:street_address, :city, :state, :country, :zip_code)
	  end
end
