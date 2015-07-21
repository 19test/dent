class Practice < ActiveRecord::Base

	has_and_belongs_to_many :professionals

  validates :name, :address, :phone_number, :presence => true



	def add_professional(professional)
		professionals << professional
	end	

end
