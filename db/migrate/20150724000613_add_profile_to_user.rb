class AddProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic, :string
    add_column :users, :user_name, :string
    add_column :users, :bio, :text
  end
end
