class AddImageAttachmentForTool < ActiveRecord::Migration
  def change
	add_attachment :tools, :tool_pic
  end
end
