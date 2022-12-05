# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.integer :attendee_id, null: false, foreign_key: true
      t.integer :attended_event_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
