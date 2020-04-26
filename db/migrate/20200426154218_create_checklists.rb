class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.integer :memberID
      t.integer :plantID
      t.string :plantName
      t.boolean :checklistFlag
      t.date :nextWatered
      t.date :lastWatered

      t.timestamps
    end
  end
end
