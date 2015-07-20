class Practice < ActiveRecord::Base

	has_and_belongs_to_many :professionals

	def add_professional(professional)
		professionals << professional
	end	

end
