class CreateItemImgs < ActiveRecord::Migration[6.0]
  def change
    create_table :item_imgs do |t|
      t.references  :item,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
