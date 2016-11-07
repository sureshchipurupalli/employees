class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :dateofbirth
      t.integer :age
      t.string :designation
      t.string :mobile
      t.string :gender
      t.float :salary
      t.string :bloodgroup

      t.timestamps null: false
    end
  end
end
