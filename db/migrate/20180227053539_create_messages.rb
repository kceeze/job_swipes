class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
    	t.string :subject
    	t.text :body
    	t.integer :to
    	t.string :to_assocation
    	t.integer :from
    	t.string :from_assocation
    	t.timestamps null: false
    end
  end
end
