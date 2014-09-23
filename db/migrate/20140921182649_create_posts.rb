class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text #you may want this to be a text object => t.text :text since it could be larger than 255 hars
      t.integer :user_id

      t.timestamps
    end
  end
end
