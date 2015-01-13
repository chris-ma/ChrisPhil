class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :update, :destroy, :edit]

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
    @lesson.embedcards.build
    @lesson.quizzes.build
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:success] = 'Page captured and lesson created'
      redirect_to lessons_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private 

  def lesson_params
    params.require(:lesson).permit(
        :name,
        :description,
        {
          embedcards_attributes: [:id, :provider_url, :lesson_id, :_destroy],
          quizzes_attributes: [:id, :name, :lesson_id, :_destroy]
        }
    )
  end


  def find_lesson
    @lesson = Lesson.find params[:id]   
  end



end
