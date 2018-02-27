class CreateEmailAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :email_addresses do |t|
    	t.string :email
    	t.integer :worker_id
    	t.timestamps null: false
    end
  end
end
