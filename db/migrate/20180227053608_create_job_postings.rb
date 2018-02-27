class CreateJobPostings < ActiveRecord::Migration[5.1]
  def change
    create_table :job_postings do |t|
    	t.string :subject
    	t.text :description
    	t.integer :company_id
    	t.timestamps null: false
    end
  end
end
