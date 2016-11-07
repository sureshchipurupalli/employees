class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :status,:default => 0
      t.boolean :deleted,:default => false

      t.timestamps null: false
    end
  end
end
