class CreateSnsAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :sns_authentications do |t|
      t.string      :provider,      null: false
      t.string      :uid,           null: false, unipue: true
      t.text        :token
      t.references  :user,          null: false, foreign_key: true
    end
  end
end
