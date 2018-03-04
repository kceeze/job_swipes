class ChangeColumnUserIdFromBooleanToInteger < ActiveRecord::Migration[5.1]
  def change
  	change_column :hr_reps, :user_id, :integer
  end
end
