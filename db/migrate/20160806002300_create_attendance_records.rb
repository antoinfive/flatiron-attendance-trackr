class CreateAttendanceRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :attendance_records do |t|
      t.references :student, index: true       
      t.references :schedule, index: true
      t.datetime :date
      t.boolean :arrived

      t.timestamps
    end
  end
end
