class CreateHrRepsUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :hr_reps, :users
  end
end
