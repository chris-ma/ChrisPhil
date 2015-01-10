class Lesson < ActiveRecord::Base
  has_many: learnlists_lessons
  has_many: lessons, through :learnlists_lessons
end
