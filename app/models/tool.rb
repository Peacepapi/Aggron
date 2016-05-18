class Tool < ActiveRecord::Base
	belongs_to :owner, :class_name => "User" 
	belongs_to :borrower, :class_name =>"User"
	belongs_to :tooltype
	has_many :borrowRequests, :class_name => "BorrowRequest", :foreign_key => "requestedTool_id"
	has_many :comments

	has_attached_file :tool_pic, styles: { medium: "360x205>",
											large: "600x400>" }
  	validates_attachment_content_type :tool_pic, content_type: /\Aimage\/.*\Z/

	validates :owner_id, presence: true
	validates :tooltype_id, presence: true
	validates :name, presence: true, length: {minimum: 4, maximum: 100}
	validates :description, presence: true, length: {minimum: 10, maximum: 254}

end
