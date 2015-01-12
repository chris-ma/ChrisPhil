# == Schema Information
#
# Table name: learnlists
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  public      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Learnlist < ActiveRecord::Base
  has_many :lesson_learnlists
  has_many :lessons, through: :lesson_learnlists
end
