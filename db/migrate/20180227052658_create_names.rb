class CreateNames < ActiveRecord::Migration[5.1]
  def change
    create_table :names do |t|
    	t.string :first_name, null: false
    	t.string :middle_name
    	t.string :last_name, null: false
    	t.integer :worker_id, null: false
    	t.timestamps null: false
    end
  end
end
