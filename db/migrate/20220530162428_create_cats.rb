class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
