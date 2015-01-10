class Learnlist < ActiveRecord::Base
  has_many :lessons_learnlists
  has_many :learnlists, through :lessons_learnlists
end
