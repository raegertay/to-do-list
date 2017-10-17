class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.date :due_date
      t.string :status
      t.references :tasklist, foreign_key: true, null: false
      t.timestamps
    end
  end
end
