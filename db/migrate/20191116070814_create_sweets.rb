class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.date :visit_day, null: false
      t.string :shop_name, null: false
      t.string :shop_area, null: false
      t.string :menu, null: false
      t.integer :rate
      t.text :comment, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
