class QuizzesController < ApplicationController
  before_action :find_quiz, only: [:show, :update, :destroy, :edit]

  def index
    @quizzes = Quiz.all   
  end

  def new

    @quiz = Quiz.new
    3.times { @quiz.questions.build }
    
  end

  def create
    @quiz = Quiz.new quiz_params 
    if @quiz.save
      redirect_to quiz_path @quiz
    else
      render :new
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: "Quiz deleted"
  end

  private

  def quiz_params
    params.require(:quiz).permit(:id, :name)
  end

  def find_quiz
    @quiz = Quiz.find params[:id]    
  end

  def question_params
    params.require(:quiz).permit(
        :name,
        :lesson_id,
        {
          questions_attributes: [:id, :content, :quiz_id, :_destroy]
        }
    )
  end

end
