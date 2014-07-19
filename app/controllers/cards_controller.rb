class CardsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @card = current_user.cards.build(card_params)
    if @card.save
      flash[:success] = "Card created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @card.destroy
    redirect_to root_url
  end

  private

    def card_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @card = current_user.cards.find_by(id: params[:id])
      redirect_to root_url if @card.nil?
    end
end