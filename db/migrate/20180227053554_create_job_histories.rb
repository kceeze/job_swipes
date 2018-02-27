class CreateJobHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :job_histories do |t|
    	t.integer :company_id
    	t.integer :worker_id
    	t.timestamps null: false
    end
  end
end
