class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :update, :destroy, :edit]
  before_action :authenticate_user!, except:[:index, :show]
  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
    @lesson.quizzes.build
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      redirect_to @lesson
    else
      flash[:error] = 'Search failed, please try again'
    end
  end

  def edit
  end

  def update
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @lesson }
    end
  end

  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json:   {status: "ok"}
                    }
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(
      :name,
      :description,
      :provider_url,
      {
        learnlist_ids: [],
        quizzes_attributes: [:id, :name, :lesson_id, :_destroy],
        questions_attributes: [:id, :content, :quiz_id, :_destroy]
      }
    )
  end


  def find_lesson
    @lesson = Lesson.find params[:id]
  end



end
