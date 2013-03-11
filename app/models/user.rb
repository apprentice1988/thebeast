class User < ActiveRecord::Base
  attr_accessible :email, :fixlinephone, :mobilephone, :username, :password, :password_confirmation, :subscription, :province,
                  :city, :zone, :address, :postcode

  has_secure_password

  before_save { |user| user.email.downcase! }
  before_save :create_remember_token

  validates :username, presence: true, length: {in: 3..50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
  									uniqueness: {case_sensitive: false}
  validates :mobilephone, presence: true, length: {is: 11}, numericality: {:only_integer => true}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  private
    def create_remember_token 
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
