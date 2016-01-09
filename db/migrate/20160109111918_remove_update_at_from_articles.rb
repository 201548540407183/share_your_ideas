class RemoveUpdateAtFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles,:update_at,:date_time
  end
end
