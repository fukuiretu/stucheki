class CreateTmpEvents < ActiveRecord::Migration
  def change
    create_table :tmp_events do |t|
      t.integer :service_type
      t.integer :service_event_id
      t.string :title
      t.string :tag
      t.datetime :started_at
      t.datetime :ended_at
      t.string :place
      t.string :link

      t.timestamps
    end
  end
end
