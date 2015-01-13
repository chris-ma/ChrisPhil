class EmbedcardsController < ApplicationController
  before_action :find_embedcards, only: [:show, :update, :destroy, :edit]

  def index
    @embedcards = Embedcard.order('created_at DESC')
  end

  def new
    @embedcard = Embedcard.new
  end

  def edit
  end

  def update
  end

  def show
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
    params.require(:embedcard).permit(:provider_url, :lesson_id)
  end

  def find_embedcards
    @embedcard = Embedcard.find params[:id]   
  end

end



