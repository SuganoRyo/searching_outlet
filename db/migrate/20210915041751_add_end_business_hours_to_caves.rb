class AddEndBusinessHoursToCaves < ActiveRecord::Migration[6.1]
  def change
    add_column :caves, :end_business_hours, :time, after: :business_hours
  end
end
