class AddViewsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :views, :integer,default: 0
  end
end
