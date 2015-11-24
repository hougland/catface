class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :color
      t.integer :tail_length
      t.string :personality
      t.boolean :outdoor
      t.string :occupation
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
