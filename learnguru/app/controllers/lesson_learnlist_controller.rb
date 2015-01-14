class LessonLearnlistController < ApplicationController
  def index
    @lessonlearnlists = LessonLearnlist.all
  end
end
