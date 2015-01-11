# == Schema Information
#
# Table name: youtubes
#
#  id         :integer          not null, primary key
#  link       :string
#  title      :string
#  author     :string
#  duration   :string
#  likes      :integer
#  dislikes   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uid        :string
#

require 'test_helper'

class YoutubeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
