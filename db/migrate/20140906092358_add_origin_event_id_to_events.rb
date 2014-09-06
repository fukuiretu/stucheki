class AddOriginEventIdToEvents < ActiveRecord::Migration
  def change
    rename_column :events, :origin_type, :service_type
    add_column :events, :service_event_id, :int
  end
end
