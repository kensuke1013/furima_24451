class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string        :first_name,            null: false
      t.string        :familiy_name,          null: false
      t.string        :first_mame_kana,       null: false
      t.string        :family_name_kana,      null: false
      t.integer       :post_code,             null: false
      t.integer       :prefecture_code,       null: false, default: 0
      t.string        :city,                  null: false
      t.string        :house_number,          null: false
      t.string        :building_name 
      t.integer       :phone_number,    null: false
      t.references    :user,            null: false, foreign_key: true
    end
  end
end
