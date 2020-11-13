class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.references	:user,  null: false, foreign_key:true
    end
  end
end
