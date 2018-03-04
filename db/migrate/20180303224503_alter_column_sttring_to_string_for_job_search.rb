class AlterColumnSttringToStringForJobSearch < ActiveRecord::Migration[5.1]
  def change
  	rename_column :job_searches, :search_sttring, :search_string
  end
end
