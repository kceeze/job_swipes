class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
    	
    	t.timestamps null: false
    end
  end
end
