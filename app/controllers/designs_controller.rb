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
		other_designs = Design.where("user_id = ?", @design.user_id)
		@other_designs = other_designs.where("id != ?", @design.id).page(params[:page]).per(4)

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

	def add_to_competition
		design = Design.where("id = ?", params[:id]).first
		design.competition = true
		design.save
		flash[:notice] = "Your design has been submitted for review"
		redirect_to :back
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

	def upvote
	  design = Design.find(params[:id])
	  unless current_user.voted_for?  design
	  	design.upvote_by current_user
	  	flash[:notice] = "You have successfully voted"
	  end
	  first_vote(design)
	  redirect_to :back
	end 

	private
	  def design_params
	    params.require(:design).permit(:image, :image_desc, :first_garment_desc,:second_garment_desc,
	    	:third_garment_desc,:first_garment_print_design,:second_garment_print_design,:third_garment_print_design,
	    	:first_garment_design,:second_garment_design,:third_garment_design, :first_garment_model_design,
	    	:second_garment_model_design,:third_garment_model_design,:competition, :first_garment_technical_design,
	    	:second_garment_technical_design, :third_garment_technical_design)
	  end

	  def first_vote(design)
	  	if design.get_upvotes.size == 1
	  		UserMailer.first_vote_notification(design).deliver
	  	end
	  end
end
