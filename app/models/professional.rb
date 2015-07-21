class Professional < ActiveRecord::Base

	belongs_to :user
	has_and_belongs_to_many :practices

	def add_practice(practice)
		self.practices << practice
	end	

  def add_user(user)
    self.users << user
  end 
end
