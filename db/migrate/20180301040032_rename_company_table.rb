class RenameCompanyTable < ActiveRecord::Migration[5.1]
  def change
  	rename_table :comapnies, :companies
  end
end
