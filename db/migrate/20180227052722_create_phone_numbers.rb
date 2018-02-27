class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
    	t.string :number
    	t.integer :worker_id
    	t.timestamps null: false
    end
  end
end
