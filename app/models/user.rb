class User < ActiveRecord::Base
	has_many :borrowRequests, 	:class_name => "BorrowRequest", :foreign_key => "requester_id"
	has_many :tools, 			:class_name => "Tool", 			:foreign_key => "owner_id"
	has_many :borrowedTools,	:class_name => "Tool", 			:foreign_key => "borrower_id"
	has_many :comments

 	has_many :conversations, 									:foreign_key => "sender_id"

	has_attached_file :profile_pic, styles: { medium: "200x200>",
											small: "56x46>" }
	validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

	before_save { self.email = email.downcase }
	validates :username, presence: true, length: {minimum: 5, maximum: 20}
	validates :password, presence: true, length: {minimum: 7, maximum: 50}
  	validates :password_confirmation, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 254},
                  uniqueness: { case_sensitive: false },
                  format: { with: VALID_EMAIL_REGEX }
                  
  has_secure_password

    def display_name
    	self.username.capitalize
    end
end