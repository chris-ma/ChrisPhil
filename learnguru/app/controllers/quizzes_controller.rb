class QuizzesController < ApplicationController

  def index
    @quiz = Quiz.all   
  end

  def new
    @quiz = Quiz.new
    
  end
end
