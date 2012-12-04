class AddPoetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :poet, :boolean, default: false
  end
end
