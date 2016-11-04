class HomeController < ApplicationController
  DESIGNS_PER_COMPETITION_PAGE = 5

  def index
  end

  def leaderboard
    designs = Design.for_competition
    @designs = designs.first(10).sort { |designA, designB| designB.votes_for.size <=> designA.votes_for.size }
  end

  def competition
    @designs = Design.for_competition.page(params[:page]).per(DESIGNS_PER_COMPETITION_PAGE)
  end

  def contact
    @message = Message.new
  end

  def contact_us
    @message = new_message
    if @message.save
      UserMailer.contact_us(@message).deliver
      redirect_to contact_us_path, notice: 'Message sent successfully'
    else
      render :contact, notice: 'Your message could not be sent, please try again'
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :message)
  end

  def new_message
    Message.new(message_params)
  end
end
