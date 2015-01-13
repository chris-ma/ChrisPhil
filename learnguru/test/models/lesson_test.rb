# == Schema Information
#
# Table name: lessons
#
#  id              :integer          not null, primary key
#  provider_url    :string
#  description     :string
#  title           :string
#  author_name     :string
#  height          :integer
#  width           :integer
#  html            :string
#  thumbnail_width :integer
#  provider_name   :string
#  duration        :string
#  thumbnail_url   :string
#  media           :string
#  author_url      :string
#  public          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
