class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.string :employee_name
      t.datetime :start
      t.datetime :finish
      t.integer :break_length
      t.float :hours_worked
      t.float :shift_cost

      t.references :user, index: false

      t.timestamps
    end
  end
end
