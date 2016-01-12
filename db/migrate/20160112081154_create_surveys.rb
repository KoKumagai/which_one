class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :user,            null: false
      t.string     :first_word,      null: false
      t.string     :second_word,     null: false
      t.string     :comparison_word, null: false
      t.integer    :sentence_type,   null: false
      t.integer    :category,        null: false

      t.timestamps null: false
    end
    add_index :surveys, :user_id
    add_foreign_key :surveys, :users
  end
end
