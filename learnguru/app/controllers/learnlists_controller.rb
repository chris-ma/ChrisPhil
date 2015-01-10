class LearnlistsController < ApplicationController
  def index
    @learnlists = Learnlist.all
  end
end
