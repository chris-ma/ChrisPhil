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
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Embedcard < ActiveRecord::Base
  belongs_to :lesson

  validates :provider_url, presence: true

  before_create -> do
    url = provider_url
    client = Tinyembedly::Oembed.new(api_key: ENV['EMBEDLY_API_KEY'])
    embed = client.to_hash(url)
  end
end
