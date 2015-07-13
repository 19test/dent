class AssociateUsersAndProfessionals < ActiveRecord::Migration
  def change
  	add_reference :professionals, :users, index: true, foreign_key: true
  	add_reference :users, :professionals, index: true, foreign_key: true
  end
end
