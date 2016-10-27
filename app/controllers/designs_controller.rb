class DesignsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :competition]
	
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
			render 'success'
		else
			render 'new'
		end
	end

	def success
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

	def competition
		@designs = Design.where("for_competition = ?", true).paginate(:page => params[:page], :per_page => 20)
	end

	def upvote
		byebug
	  design = Design.find(params[:id])
	  unless current_user.voted_for?  design
	  	design.upvote_by current_user
	  	flash["notice"] = "Your"
	  end
	  redirect_to :back
	end 

	private
	  def design_params
	    params.require(:design).permit(:image, :image_desc, :first_garment_desc,:second_garment_desc,
	    	:third_garment_desc,:first_garment_print_design,:second_garment_print_design,:third_garment_print_design,
	    	:first_garment_design,:second_garment_design,:third_garment_design, :first_garment_model_design,
	    	:second_garment_model_design,:third_garment_model_design,:compeition)
	  end
end
