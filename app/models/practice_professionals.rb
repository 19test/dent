class PracticeProfessionals < ActiveRecord::Base

  validates_uniqueness_of :professional_id, :scope => :practice_id
  
end
