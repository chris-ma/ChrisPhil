# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  quiz_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base

  belongs_to :quiz

  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true


end
