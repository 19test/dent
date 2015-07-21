class ProfessionalsUsers < ActiveRecord::Base

  validates_uniqueness_of :professional_id, :scope => :user_id
  
end