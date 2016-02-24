class Tool < ActiveRecord::Base
	belongs_to :user
	belongs_to :tooltype
	has_many :comments
	validates :user_id, presence: true
	validates :tooltype_id, presence: true
	validates :name, presence: true, length: {minimum: 4, maximum: 100}
	validates :description, presence: true, length: {minimum: 10, maximum: 254}
end
