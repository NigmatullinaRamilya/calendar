class AddPlaceColumnToMeetings < ActiveRecord::Migration
  def change
  	add_column :meetings, :place, :string
  end
end
