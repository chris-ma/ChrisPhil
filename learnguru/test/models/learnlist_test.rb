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

require 'test_helper'

class LearnlistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
