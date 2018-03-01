class AddToAdminToHrReps < ActiveRecord::Migration[5.1]
  def change
  		  add_column :hr_reps, :admin, :boolean 
  end
end
