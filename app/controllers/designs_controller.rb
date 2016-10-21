class DesignsController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	
	def index
	end

	def new
		@design = Design.new
	end

	def create
		@design = Design.new(design_params)
		@design.user_id = current_user.id
		@design.save

		if @design.persisted?
			flash["notice"] = "Design successfully saved"
			redirect_to @design
		else
			render 'new'
		end
	end

	def show
		@design = Design.find(params[:id])
	end

	def update
		@design = Design.find(params[:id])

		if @design.update(design_params)
			redirect_to @design
		else
			render 'edit'
		end
	end

	def edit
		@design = Design.find(params[:id])
		if current_user.id != @design.user.id
			redirect_to @design
		end
	end

	def destroy
	  @design = Design.find(params[:id])
	  if current_user.id == @design.user.id
	  	@design.destroy
	  else
	  	flash["notice"] = "You do not hae the permission to delete this post"	 
	  end
	  redirect_to designs_path
	end

	private
	  def design_params
	    params.require(:design).permit(:image, :image_desc)
	  end
end
