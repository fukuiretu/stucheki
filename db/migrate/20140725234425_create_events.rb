class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :origin_type
      t.string :title
      t.string :description
      t.string :tag
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
