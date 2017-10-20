class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.date :due_date, null: false
      t.boolean :status, null: false, default: false
      t.references :tasklist, foreign_key: true, null: false
      t.timestamps
    end
  end
end
