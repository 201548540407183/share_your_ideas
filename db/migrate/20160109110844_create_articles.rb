class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.datetime :created_at
      t.datetime :update_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
