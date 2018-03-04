class AddLatitudeAndLongiudeToCompany < ActiveRecord::Migration[5.1]
  def change
  	add_column :companies, :latitude, :string
  	add_column :companies, :longitude, :string 
  end
end
