class QuizzesController < ApplicationController

  def index
    @quiz = Quiz.all   
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  def show
    @quiz = Quiz.find params[:id]
    
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, :id)
    
  end


end
