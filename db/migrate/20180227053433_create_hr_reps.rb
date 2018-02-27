class CreateHrReps < ActiveRecord::Migration[5.1]
  def change
    create_table :hr_reps do |t|
    	t.integer :company_id

    	t.timestamps null: false
    end
  end
end
