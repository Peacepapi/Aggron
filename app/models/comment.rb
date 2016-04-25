class Comment < ActiveRecord::Base
	belongs_to :commenter, :class_name => "User"
	belongs_to :tool
	
	validates :commenter, presence: true
	validates :body, presence: true, length: {minimum: 5, maximum: 250}
end
