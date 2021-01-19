class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.text :content,             null: false
      t.integer :price,            null: false
      t.integer :category_id,      foreign_key: true
      t.integer :condition_id,     foreign_key: true
      t.integer :shipping_fee_id,  foreign_key: true
      t.integer :shipping_area_id, foreign_key: true
      t.integer :shipping_date_id, foreign_key: true
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
