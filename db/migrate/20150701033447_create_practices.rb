class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :name
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
