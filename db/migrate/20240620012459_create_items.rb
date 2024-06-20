class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :item_detail, null: false
      t.boolean :is_active, null: false, default: true
      t.integer :price, null: false

      t.timestamps
    end
  end
end
