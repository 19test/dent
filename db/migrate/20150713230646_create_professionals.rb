class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
    	t.string :name
    	t.string :phone_number
    	t.string :email
    	t.text :bio
    end
  end
end
