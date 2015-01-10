class Lesson < ActiveRecord::Base
  has_many :lesson_learnlists
  has_many :learnlists, through: :lesson_learnlists
end
