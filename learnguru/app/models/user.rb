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
#  name                   :string
#

class User < ActiveRecord::Base


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessible :email, :password, :password_confirmation, :remember_me, :username


  validates_presence_of :username


  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
        end
      else
        super
    end    
  end


  def email_required?
    super && provider.blank?
  end

  def password_required?
    super && provider.blank?
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
