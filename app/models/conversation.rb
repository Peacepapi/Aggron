class Conversation < ActiveRecord::Base
	belongs_to :sender, class_name: 'User'
	belongs_to :recipient, class_name: 'User'

	has_many :messages
	#validate sender with specify scope of recipient, limit uniqueness with sender and recipient
	validates :sender_id, uniqueness: { scope: :recipient_id}
	#make sure convo is with sender and recipient, sender is also recipient (back and forth)
	scope :with, -> (sender_id, recipient_id) do
		where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR
			   (conversations.sender_id = ? AND conversations.recipient_id = ?)",
			   sender_id, recipient_id, recipient_id, sender_id)
	end
	
end