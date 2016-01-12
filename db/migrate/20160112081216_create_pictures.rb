class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :survey,       null: false
      t.integer    :picture_type, null: false
      t.string     :uri

      t.timestamps null: false
    end
    add_index :pictures, :survey_id
    add_index :pictures, :picture_type
    add_foreign_key :pictures, :surveys
  end
end
