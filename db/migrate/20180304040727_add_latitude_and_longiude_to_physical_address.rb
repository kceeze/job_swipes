class AddLatitudeAndLongiudeToPhysicalAddress < ActiveRecord::Migration[5.1]
  def change
  	add_column :physical_addresses, :latitude, :string
  	add_column :physical_addresses, :longitude, :string 
  end
end
