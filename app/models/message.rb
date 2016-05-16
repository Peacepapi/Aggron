class Message < ActiveRecord::Base

	belongs_to :conversation
	belongs_to :user

	validates :body, presence: true
	validates :user_id, presence: true
	validates :conversation_id, presence: true

	def formatted_time
		created_at.strftime("%m/%d/%Y at %I:%M:%S %p")
	end

end
