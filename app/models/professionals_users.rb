class ProfessionalsUsers < ActiveRecord::Base

  validates_uniqueness_of :professional_id, :scope => :user_id
  has_one :user
  
end