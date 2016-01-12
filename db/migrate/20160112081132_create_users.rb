class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name,            null: false
      t.string   :email,           null: false
      t.string   :password_digest, null: false
      t.string   :reset_digest
      t.datetime :reset_sent_at
      t.string   :remember_digest
      t.string   :activation_digest
      t.boolean  :activated,        null: false, default: false
      t.datetime :activated_at

      t.timestamps null: false
    end
    add_index :users, :name, :unique => true
  end
end
