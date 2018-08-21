class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :type
      t.datetime :start_time

      t.timestamps
    end
  end
end
