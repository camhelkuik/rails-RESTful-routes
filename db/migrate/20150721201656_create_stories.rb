class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |s|
      s.string :title
      s.integer :user_id
    end
  end
end
