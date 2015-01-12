class EmbedcardsController < ApplicationController

  def index
    @embedcards = Embedcard.order('created_at DESC')
  end

  def new
    @embedcard = Embedcard.new
  end

  def create
    @embedcard = Embedcard.new embedcard_params
    if @embedcard.save
      flash[:success] = 'Page captured and lesson created'
      redirect_to embedcards_path
    else
      render 'new'
    end
  end




  private 

  def embedcard_params
    params.require(:embedcard).permit(:provider_url)
  end

end



