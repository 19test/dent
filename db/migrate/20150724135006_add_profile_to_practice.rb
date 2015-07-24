class AddProfileToPractice < ActiveRecord::Migration
  def change
    add_column :practices, :profile_pic, :string
    add_column :practices, :bio, :text
    add_column :practices, :city, :text
    add_column :practices, :province, :text
    add_column :practices, :postal_code, :text
  end
end
