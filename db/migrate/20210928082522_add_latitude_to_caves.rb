class AddLatitudeToCaves < ActiveRecord::Migration[6.1]
  def change
    add_column :caves, :latitude, :float
    add_column :caves, :longitude, :float
  end
end
