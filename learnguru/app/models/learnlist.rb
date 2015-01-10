class Learnlist < ActiveRecord::Base
  has_many :lesson_learnlists
  has_many :lessons, through: :lesson_learnlists
end
