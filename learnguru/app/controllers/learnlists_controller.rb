class LearnlistsController < ApplicationController

  before_action :find_learnlist, only: [:show, :update, :destroy, :edit]

  def index
    # need to make this user specific - will create a search function 
    @learnlists = Learnlist.all
  end

  def new
    @learnlist = Learnlist.new learnlist_params
  end

  def edit
  end

  def update
  end

  def show
  end

  private 

  def learnlist_params
    params.require(:learnlist).permit(:lesson_ids[])
  end

  def find_learnlist
    @learnlist = Learnlist.find params[:id]   
  end


end
