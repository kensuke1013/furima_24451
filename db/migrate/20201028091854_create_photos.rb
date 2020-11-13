class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string      :photo,      null: false
      t.bigint      :item,    null: false, foreign_key: true
      t.bigint      :draft,   null: false, foreign_key: true
    end
  end
end
