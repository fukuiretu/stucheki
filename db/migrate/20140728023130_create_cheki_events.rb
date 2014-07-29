class CreateChekiEvents < ActiveRecord::Migration
  def change
    create_table :cheki_events do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :cheki_status

      t.timestamps
    end
  end
end
