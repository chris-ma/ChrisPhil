# == Schema Information
#
# Table name: embedcards
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
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  lesson_id       :integer
#

require 'test_helper'

class EmbedcardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
