class AddArrivedAtToAttendanceRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :attendance_records, :arrived_at, :datetime
  end
end
