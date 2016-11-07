class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :description
      t.string :project_name
      t.integer :status,:default => 0
      t.boolean :deleted,:default => false

      t.timestamps null: false
    end
  end
end
