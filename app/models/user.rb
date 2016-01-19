class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :username, presence: true, length: {minimum: 4, maximum: 20}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: {maximum: 254},
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
end