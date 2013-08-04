class Chunk < ActiveRecord::Base
	belongs_to :user
	
	default_scope -> { order('created_at ASC') }
	validates :user_id, presence: true
	validates :short_desc, presence: true, length: { maximum: 256 }
end
