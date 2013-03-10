class User < ActiveRecord::Base
  attr_accessible :email, :fixlinephone, :mobilephone, :username, :password, :password_confirmation

  has_secure_password

  before_save { |user| user.email.downcase! }

  validates :username, presence: true, length: {in: 3..50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
  									uniqueness: {case_sensitive: false}
  validates :mobilephone, presence: true, length: {is: 11}, numericality: {:only_integer => true}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
end
