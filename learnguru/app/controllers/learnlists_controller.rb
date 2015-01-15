class LearnlistsController < ApplicationController

  before_action :find_learnlist, only: [:show, :destroy, :edit]
  before_action :authenticate_user!, except:[:index, :show]
  def index
    # need to make this user specific - will create a search function
    @learnlists = Learnlist.all
  end

  def new
    @learnlist = Learnlist.new
  end

  def create
    @learnlist = Learnlist.create learnlist_params  # @learnlist = current_user.learnlists.new(learnlist_params)
    redirect_to @learnlist
  end

  def edit
  end

  def update
    @learnlist = Learnlist.find params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @learnlist }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @learnlist }
    end
  end

  private

  def learnlist_params
    params.require(:learnlist).permit(:name, :description, :public, :status)
  end

  def find_learnlist
    @learnlist = Learnlist.friendly.find params[:id]
  end


end

#  name        :string
#  description :text
#  public      :boolean
