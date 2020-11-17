class CreateTodoLists < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_lists do |t|
      t.references  :user,  null: false, foreign_key: true
    end
  end
end
