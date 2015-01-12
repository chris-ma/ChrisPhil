# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quiz < ActiveRecord::Base
  belongs_to :lessons

  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions

end
