class Tool < ActiveRecord::Base
	belongs_to :owner, :class_name => "User" 
	belongs_to :tooltype
	has_many :borrowRequests, :class_name => "BorrowRequest", :foreign_key => "requestedTool_id"
	has_many :comments

	validates :user_id, presence: true
	validates :tooltype_id, presence: true
	validates :name, presence: true, length: {minimum: 4, maximum: 100}
	validates :description, presence: true, length: {minimum: 10, maximum: 254}
end
