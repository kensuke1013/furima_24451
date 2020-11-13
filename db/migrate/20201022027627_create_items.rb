class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string        :name,              null: false
      t.text          :introduction,      null: false
      t.bigint        :genre_id,          null: false
      t.bigint       :itemstatus_id,      null: false
      t.bigint      :deliveryfee_id,       null: false
      t.bigint    :shipmentsource_id,        null: false
      t.bigint    :daystoship_id,           null: false
      t.bigint      :item_price_id,        null: false
      t.timestamps 
    end
  end
end
