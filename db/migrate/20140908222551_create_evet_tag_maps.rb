class CreateEvetTagMaps < ActiveRecord::Migration
  def change
    create_table :evet_tag_maps do |t|
      t.integer :service_type
      t.integer :service_event_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
