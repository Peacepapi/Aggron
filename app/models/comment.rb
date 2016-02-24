class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :tool
	validates :user_id, presence: true
	validates :body, presence: true, length: {minimum: 5, maximum: 250}
end
