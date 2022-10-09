class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :date
      t.text :body

      t.timestamps
    end
    add_index :notes, :date
  end
end
