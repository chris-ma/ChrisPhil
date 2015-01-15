# == Schema Information
#
# Table name: learnlists
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  public      :boolean
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Learnlist < ActiveRecord::Base
  has_many :lesson_learnlists
  has_many :lessons, through: :lesson_learnlists

  belongs_to :user

  extend FriendlyId
  friendly_id :name, use: :slugged

  def slug_candidates
    [
      :name,
      [:user, :name]
    ]
  end

end
