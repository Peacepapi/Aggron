class Rating < ActiveRecord::Base
	belongs_to :tool
	belongs_to :reviewer, class_name: 'User'

	validates_presence_of :reviewer_id, :tool_id
	validates_uniqueness_of :reviewer, scope: :tool

	
end