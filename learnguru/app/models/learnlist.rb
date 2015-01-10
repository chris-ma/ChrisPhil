class Learnlist < ActiveRecord::Base
    has_many: learnlists_lessons
  has_many: learnlists, through :learnlists_lessons
end
