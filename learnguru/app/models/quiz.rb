# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  name       :string
#  lesson_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quiz < ActiveRecord::Base
  belongs_to :lesson

  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions

  has_many :answers, through: :questions
  accepts_nested_attributes_for :answers

end
