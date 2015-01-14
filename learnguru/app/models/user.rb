# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_or_create_from_auth_hash(auth_hash)
  user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
  user.update(
    name: auth_hash.info.name,
    profile_image: auth_hash.info.image,
    token: auth_hash.credentials.token,
    secret: auth_hash.credentials.secret
    )  
  end

  include Gravtastic
  gravtastic

  has_many :learnlists
  has_many :lessons
end



# used for quiz

# def self.new_with_session(params, session)
#   if session["devise.user_attributes"]
#     new(session["devise.user_attributes"], without_protection: true) do |user|
#       user.attributes = params
#       user.valid?
#     end
#   else
#     super && provider.blank?
#   end    
# end