class AddColumnsToMeetings < ActiveRecord::Migration
  def change
  	add_column :meetings, :end_time, :datetime
  	add_column :meetings, :description, :text
  end
end
