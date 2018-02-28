class CreateUsersWorkersJoinTable < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :users, :workers
  end
end
