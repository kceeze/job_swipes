class AddDistanceToJobSearches < ActiveRecord::Migration[5.1]
  def change
  		  add_column :job_searches, :distance, :integer 
  end
end
