class Lesson < ActiveRecord::Base
  has_many :lessons_learnlists
  has_many :lessons, through :lessons_learnlists
end
