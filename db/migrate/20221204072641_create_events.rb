class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
