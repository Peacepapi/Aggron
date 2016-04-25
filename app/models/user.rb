class User < ActiveRecord::Base
	has_many :borrowRequests, :class_name => "BorrowRequest", :foreign_key => "requester_id"
	has_many :tools, :class_name => "Tool", :foreign_key => "owner_id"
	has_many :borrowedTools, :class_name => "Tool", :foreign_key => "borrower_id"
	has_many :comments


	before_save { self.email = email.downcase }
	validates :username, presence: true, length: {minimum: 4, maximum: 20}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: {maximum: 254},
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
    has_secure_password

end