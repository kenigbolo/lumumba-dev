class DesignsController < ApplicationController

  ARTICLES_PER_PAGE = 4

  before_action :authenticate_user!, except: [:index, :competition]

  def index
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    @design.user = current_user

    if @design.save
      render 'success'
    else
      render 'new'
    end
  end

  def success
  end

  def show
    @design = Design.find(params[:id])
    @other_designs = Design.where.not(id: @design.id).page(params[:page]).per(ARTICLES_PER_PAGE)
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
    unless @design.user == current_user
      redirect_to @design
    end
  end

  def add_to_competition
    design = Design.find(params[:id])
    design.competition = true
    if design.save
      flash[:notice] = 'Your design has been submitted for review!'
    else
      flash[:notice] = 'Sorry, there has been a problem when processing your design.'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @design = Design.find(params[:id])
    if current_user == @design.user
      @design.destroy
      flash['notice'] = 'Successfully deleted.'
    else
      flash['notice'] = 'You do not have the permission to delete this post'
    end
    redirect_to designs_path
  end

  def upvote
    design = Design.find(params[:id])
    if current_user.voted_for? design
      flash[:error] = 'You already liked this design!'
    else
      design.upvote_by current_user
      first_vote(design)
      flash[:notice] = 'Liked'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def design_params
    params.require(:design).permit(:image, :image_desc, :first_garment_desc, :second_garment_desc,
                                   :third_garment_desc, :first_garment_print_design, :second_garment_print_design, :third_garment_print_design,
                                   :first_garment_design, :second_garment_design, :third_garment_design, :first_garment_model_design,
                                   :second_garment_model_design, :third_garment_model_design, :competition, :first_garment_technical_design,
                                   :second_garment_technical_design, :third_garment_technical_design)
  end

  def first_vote(design)
    if design.get_upvotes.size == 1
      UserMailer.first_vote_notification(design).deliver
    end
  end

end
