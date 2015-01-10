class LessonLearnlist < ActiveRecord::Base
  belongs_to :lesson 
  belongs_to :learnlist
end
