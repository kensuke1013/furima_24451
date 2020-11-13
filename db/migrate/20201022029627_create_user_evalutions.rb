class CreateUserEvalutions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_evalutions do |t|
      t.text          :review,      null: false
      t.references    :user,        null: false, foreign_key: true
      t.references    :item,        null: false, foreign_key: true
    end
  end
end
