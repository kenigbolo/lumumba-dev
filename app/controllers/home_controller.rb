class HomeController < ApplicationController

  def index
  end
  
  def leaderboard
  	designs = Design.where("for_competition = ?", true)
  	@designs = designs.first(10).sort{ |designA, designB| designB.votes_for.size <=> designA.votes_for.size}
  end

	def competition
		@designs = Design.where("for_competition = ?", true).page(params[:page]).per(20)
	end

	def contact
		@message = Message.new
	end

	def contact_us
		@message = Message.new(message_params)
		if @message.save
			UserMailer.contact_us(@message).deliver
			redirect_to contact_us_path, notice: "Message sent successfully"
		else
			render :contact, notice: "Your message could not be sent, please try again"
		end
	end

	private
		def message_params
			params.require(:message).permit(:name, :email, :message)
		end
end
