class AddressesController < ApplicationController

  before_action :authenticate_user!

  def index
    @address = Address.find_by(user: current_user)
    if @address
      render 'edit'
    else
      render 'index'
    end
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user

    if @address.save
      flash['notice'] = 'Address successfully created'
      if request.referer == new_address_path
        redirect_to addresses_path
      else
        redirect_to(request.referer.presence || addresses_path)
      end
    else
      render 'new'
    end
  end

  def update
    @address = Address.find_by!(user: current_user)

    if @address.update(address_params)
      flash['notice'] = 'Address successfully updated'
      redirect_to addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    address = Address.find(params[:id])
    if current_user.id == address.user.id
      address.destroy
      flash['notice'] = 'successfully deleted this post'
    else
      flash['notice'] = 'You do not hae the permission to delete this post'
    end
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:street_address, :city, :state, :country, :zip_code)
  end

end
