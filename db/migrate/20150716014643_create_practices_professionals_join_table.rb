class CreatePracticesProfessionalsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :practices_professionals, :id => false do |t|
      t.integer :practice_id
      t.integer :professional_id
    end

    add_index :practices_professionals, [:practice_id, :professional_id], :name => 'practices_professionals_joins'
  end

  def self.down
    drop_table :practices_professionals
  end
end