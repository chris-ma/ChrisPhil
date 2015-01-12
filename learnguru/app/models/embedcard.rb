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
    embeddetails = Tinyembedly::Oembed.new(key: 'c264ffa553bb4ee7b6af988140467f3a', url: url)
    embed = embeddetails.to_hash

    self.description = embed['description']
    self.title = embed['title']
    self.html = embed['html']
    self.thumbnail_url = embed['thumbnail_url']
    self.author_name = embed['author_name']
    self.thumbnail_width = embed['embed_width']
    self.provider_url = embed['provider_url']
    self.duration = embed['duration']
    self.media = embed['type']

    if self.media == 'video' then
      response = HTTParty.get("http://api.embed.ly/1/extract?key=c264ffa553bb4ee7b6af988140467f3a&url="+url)
      self.duration = response['media']['duration']
    end
  end
end

