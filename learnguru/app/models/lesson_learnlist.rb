# == Schema Information
#
# Table name: lesson_learnlists
#
#  id           :integer          not null, primary key
#  lesson_id    :integer
#  learnlist_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LessonLearnlist < ActiveRecord::Base
  belongs_to :lesson 
  belongs_to :learnlist
end
