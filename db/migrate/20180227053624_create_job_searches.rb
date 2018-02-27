class CreateJobSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :job_searches do |t|
    	t.string :search_sttring
    	t.integer :worker_id
    	t.timestamps null: false
    end
  end
end
