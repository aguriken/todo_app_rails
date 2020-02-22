class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.date :deadline
      t.text :description
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
