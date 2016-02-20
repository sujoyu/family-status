class Status < ActiveRecord::Base
	before_create :set_created_to_now
	def set_created_to_now
		self.created = Time.now
	end
end