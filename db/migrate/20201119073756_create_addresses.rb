class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string        :post_code,         default: "",    null: false
      t.bigint        :shipmentsource_id,                 null: false
      t.string        :city,              default: "",    null: false
      t.string        :house_number,      default: "",    null: false
      t.string        :building_name,     default: ""
      t.string        :phone_number,                      null: false
      t.references    :order,                             null: false, foreign_key: true
      t.timestamps
    end
  end
end