class CreateUsersProfessionalsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :professionals_users, :id => false do |t|
      t.integer :professional_id
      t.integer :user_id
    end

    add_index :professionals_users, [:professional_id, :user_id]
  end

  def self.down
    drop_table :professionals_users
  end
end