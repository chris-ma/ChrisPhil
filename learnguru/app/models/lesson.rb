# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  public      :boolean
#  length      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lesson < ActiveRecord::Base

  has_many :embedcards, dependent: :destroy
  accepts_nested_attributes_for :embedcards, allow_destroy: true

  has_many :lesson_learnlists
  has_many :learnlists, through: :lesson_learnlists

  has_many :quizzes, dependent: :destroy
  accepts_nested_attributes_for :quizzes, allow_destroy: true
end
