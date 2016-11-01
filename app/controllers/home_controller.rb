class HomeController < ApplicationController

  def index
  end
  
  def leaderboard
  	designs = Design.where("for_competition = ?", true)
  	@designs = designs.first(10).sort{ |designA, designB| designB.votes_for.size <=> designA.votes_for.size}
  end

	def competition
		@designs = Design.where("for_competition = ?", true).paginate(:page => params[:page], :per_page => 20)
	end
end
