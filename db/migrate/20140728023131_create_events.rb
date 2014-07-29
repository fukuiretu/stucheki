class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :origin_type
      t.string :title
      t.string :description
      t.string :tag
      t.datetime :from_date
      t.datetime :to_date
      t.string :place
      t.string :link

      t.timestamps
    end
  end
end
