class AddToUserIdToHrReps < ActiveRecord::Migration[5.1]
  def change
  	add_column :hr_reps, :user_id, :boolean 
  end
end
