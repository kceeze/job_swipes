class Companies < ActiveRecord::Migration[5.1]
  def change
	  create_table :comapnies do |t|
	  	t.string :name
	  	t.string :street
	   	t.string :city
	    t.string :state
	    t.string :zip
	  	t.timestamps null: false
	  end
  end
end
