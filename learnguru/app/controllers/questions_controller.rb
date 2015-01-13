class QuestionsController < ApplicationController


  def index
    @question = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    
    if @lesson.save
      flash[:success] = 'Page captured and lesson created'
      redirect_to lessons_path
    else
      render 'new'
    end
  end


  private 

  def question_params
    params.require(:question).permit(:content, :quiz_id, answer_attributes: [:question_id, :content, :correct, :_destroy])
  end

  
end
