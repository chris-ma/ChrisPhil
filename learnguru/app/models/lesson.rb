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

class Lesson < ActiveRecord::Base

  has_many :lesson_learnlists
  has_many :learnlists, through: :lesson_learnlists

  has_many :quizzes, dependent: :destroy
  accepts_nested_attributes_for :quizzes, allow_destroy: true

  validates :provider_url, presence: true

  before_create -> do
    url = provider_url
    key = ENV['EMBEDLY_API_KEY']
    embeddetails = Tinyembedly::Oembed.new(key: key, url: url)
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
    self.author_url = embed['author_url']

    if self.media == 'video' || 'rich' then
      response = HTTParty.get('http://api.embed.ly/1/extract?key='+key+'&url='+url)
      self.duration = response['media']['duration']
    end
  end




end
