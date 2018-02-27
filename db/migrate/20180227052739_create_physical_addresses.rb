class CreatePhysicalAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :physical_addresses do |t|
    	t.string :street
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.integer :worker_id
    	t.timestamps null: false
    end
  end
end
