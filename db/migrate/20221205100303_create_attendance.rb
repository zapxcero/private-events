class CreateAttendance < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.integer :attendee_id, foreign_key: true
      t.integer :attended_event_id, foreign_key: true

      t.timestamps
    end
    add_index :attendances, :attendee_id
    add_index :attendances, :attended_event_id
  end
end
