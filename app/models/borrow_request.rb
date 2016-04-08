class BorrowRequest < ActiveRecord::Base
	belongs_to :requestedTool, :class_name => "Tool"
	belongs_to :requester, :class_name => "User"

	validates :requester_id, presence: true
	validates :requestedTool_id, presence: true
end

