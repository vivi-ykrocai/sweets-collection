class AddLikesCountToSweets < ActiveRecord::Migration[5.2]
  def change
    add_column :sweets, :likes_count, :integer
  end
end
